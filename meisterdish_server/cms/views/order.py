from meisterdish_server.models import *
import json as simplejson
import logging 
import settings
from cms.views.decorators import *
from datetime import datetime
from django.core.paginator import Paginator
from libraries import mail, mail_order_confirmation, check_delivery_area, validate_phone, validate_email, create_address_text_from_model, export_csv
from django.db.models import Q
from django.template.loader import render_to_string
from twilio.rest import TwilioRestClient

log = logging.getLogger('cms')

@check_input('POST', settings.ROLE_ADMIN)
def delete_order(request, data, user, order_id):
    try:
        order = Order.objects.get(pk=order_id, is_deleted=False)
        order.is_deleted = True
        order.save()
        return json_response({"status":1, "message":"The order has been deleted", "id":order_id+"."})
    except Exception as e:
        log.error("Delete order." + e.message)
        return custom_error("Failed to delete the order.")

@check_input('POST', settings.ROLE_ADMIN)
def update_order(request, data, user, order_id):
    try:
        order = Order.objects.get(pk=order_id, is_deleted=False, cart__completed=True)
        if "produced_meals" in data and len(data["produced_meals"]):
            """ TODO
            if user.role.id != settings.ROLE_KITCHEN:
                return custom_error("Only the kitchen staff is authorized to do this operation.")
            """
            for order_meal in data["meals"]:
                cart_item = order.cart.cartitem_set.filter(meals__pk=order_meal["id"])
                cart_item.produced = True
                cart_item.save()

        if "status" in data:
            status = int(data['status'])
            if status < 0 or status > 4:
                log.error("Invalid order status: " + str(status))
            order.status = status
            order.save()
        
            if status >=1:
                order.cart.completed=True
                order.cart.save()
            order.session_key = request.META.get('HTTP_SESSION_KEY', None)
            
            if int(status) == 2: #Confirmed
                sent = send_order_confirmation_notification(order)
                if not sent:
                    log.error("Failed to send order confirmation notification")
            elif int(status) == 4: #Delivered
                sent = send_order_complete_notification(order)
                if not sent:
                    log.error("Failed to send order complete notification")

        return json_response({"status":1, "message":"The order has been updated", "id":str(order_id)+"."})
    except Exception as e:
        log.error("Update order status : " + e.message)
        return custom_error("Failed to update the order.")

@check_input('POST')
def get_orders(request, data, user):
    try:
        limit = data.get('perPage', settings.PER_PAGE)
        page = data.get("nextPage",1)
                    
        order_list = []
        orders = Order.objects.filter(is_deleted=False).exclude(status=0)
        
        total_count = orders.count()

        q = Q()
        #Filter
        if "num" in data and str(data['num']).strip() != "":
            q &= Q(order_num=str(data['num']))
        
        if "user_id" in data and str(data['user_id']).strip() != "":
            q &= Q(cart__user__pk=data['user_id'])

        if "search" in data and str(data['search']).strip() != "":
            
            for term in str(data['search']).strip().split():
                q &= Q(cart__user__first_name__istartswith=term) | Q(cart__user__last_name__istartswith=term)

        if "status" in data and str(data['status']).strip() != "":
             q |= Q(status=int(data['status']))

        if "phone" in data and str(data["phone"]).strip() != "":
            try:
                q &= Q(delivery_address__phone__startswith=str(int(data['phone'])).strip())
            except:
                return custom_error("Please enter valid phone number")

        if "amount" in data and str(data["amount"]).strip() != "":
            try:
                q &= Q(grand_total=float(data['amount']))
            except:
                return custom_error("Please search with a valid order amount")

        if "date" in data and str(data["date"]).strip() != "":
            date_obj = datetime.strptime(data['date'], "%m/%d/%Y")# %H:%M:%S")
            q &= Q(delivery_time__year=date_obj.year) & Q(delivery_time__month=date_obj.month) & Q(delivery_time__day=date_obj.day)            

        orders = orders.filter(q)

        # End filter
        orders = orders.order_by("-id")

        actual_count = orders.count()

        try:
            paginator = Paginator(orders, limit)
            if page <1 or page > paginator.page_range:
                page = 1
            orders = paginator.page(page)
        except Exception as e:
            log.error("order list pagination : " + e.message)
            custom_error("There was an error listing orders.")

        #Format response
        for order in orders:
            meals = []
            for cart_item in CartItem.objects.filter(cart__order=order, cart__completed=True):
                meals.append(
                {
                  "id" : cart_item.meal.id,
                  "name": cart_item.meal.name,
                  "description": cart_item.meal.description,
                  "image": settings.DEFAULT_MEAL_IMAGE if cart_item.meal.main_image is None else cart_item.meal.main_image.thumb.url,
                  "available": 1 if cart_item.meal.available else 0,
                  "category": cart_item.meal.category.name.title() if cart_item.meal.category else "",
                  "price": cart_item.meal.price,
                  "tax": cart_item.meal.tax,
                  "quantity":cart_item.quantity,
                })

            order_list.append({
                "id":order.id,
                "grand_total" : order.grand_total,
                "user_first_name" : order.cart.user.first_name  if order.cart.user.role.pk == settings.ROLE_USER else 'Guest('+ str(order.email)+')',
                "user_last_name" : order.cart.user.last_name,
                "status":dict(settings.ORDER_STATUS)[order.status],
                "status_id" : order.status,
                "delivery_time" : order.delivery_time.strftime("%m-%d-%Y %H:%M:%S"),
                "order_num" : order.order_num,
                "meals":meals,
                "delivery_type":order.delivery_type.title(),
                "phone": order.phone,
                "email":order.email,
                "delivery_address" : {
                     "id":order.delivery_address.id ,
                     "first_name":order.delivery_address.first_name,
                     "last_name":order.delivery_address.last_name,
                     "street":order.delivery_address.street,
                     "building":order.delivery_address.building,
                     "city":order.delivery_address.city.name,
                     "state":order.delivery_address.city.state.name,
                     "zip":order.delivery_address.zip,
                     "phone":order.delivery_address.phone,  
                    } if order.delivery_address else "",
                "billing_address" : {
                     "id":order.billing_address.id,
                     "first_name":order.billing_address.first_name,
                     "last_name":order.billing_address.last_name,
                     "street":order.billing_address.street,
                     "building":order.billing_address.building,
                     "city":order.billing_address.city.name,
                     "state":order.billing_address.city.state.name,
                     "zip":order.billing_address.zip,
                     "phone":order.billing_address.phone,
                    } if order.billing_address else "",
                })

        #End format response
        return json_response({"status":1, 
                              "aaData":order_list,
                              "total_count":total_count,
                              "actual_count":actual_count,
                              "num_pages" : paginator.num_pages,
                              "page_range" : paginator.page_range,
                              "current_page":page,
                              "per_page" : limit,
                              })
    except Exception as e:
        log.error("Failed to list orders." + e.message)
        return custom_error("Failed to get orders list.")

@check_input('POST')
def get_order_details(request, data, user, order_id):
    try:
        if user.role.pk == settings.ROLE_ADMIN:
            order = Order.objects.get(pk=order_id, is_deleted=False)
        else:
            order = Order.objects.get(pk=order_id, is_deleted=False, cart__user=user)
        meals = []
        for cart_item in CartItem.objects.filter(cart__order=order, cart__completed=True):
            meals.append(
            {
              "id" : cart_item.meal.id,
              "name": cart_item.meal.name,
              "description": cart_item.meal.description,
              "image": settings.DEFAULT_MEAL_IMAGE if cart_item.meal.main_image is None else cart_item.meal.main_image.thumb.url,
              "available": 1 if cart_item.meal.available else 0,
              "category": cart_item.meal.category.name.title(),
              "price": cart_item.meal.price,
              "tax": cart_item.meal.tax,
              "quantity":cart_item.quantity,
            })
        order_details = {
            "id": order.id,
            "total_amount": order.total_amount,
            "total_tax" : order.total_tax,
            "tip" : order.tip,
            "delivery_charge":settings.SHIPPING_CHARGE,
            "grand_total" : order.grand_total,
            "user_first_name" : order.cart.user.first_name,
            "user_last_name" : order.cart.user.last_name,
            "user_id" : order.cart.user.id,
            "user_image" : settings.DEFAULT_USER_IMAGE if not order.cart.user.profile_image else order.cart.user.profile_image.thumb.url,
            "meals":meals,
            "status":dict(settings.ORDER_STATUS)[order.status],
            "status_id" : order.status,
            "delivery_time" : order.delivery_time.strftime("%m-%d-%Y %H:%M:%S"),
            "email" : order.email,
            "phone": order.phone,
            "delivery_type" : order.get_delivery_type_display(),
            "payment_date" : order.payment.created.strftime("%m-%d-%Y %H:%M:%S") if order.payment else "Not Available",
            "transaction_id":order.payment.transaction_id if order.payment else "Not Available",
            "order_num" : order.order_num,
            
            "delivery_address" : {
                     "id":order.delivery_address.id,
                     "first_name":order.delivery_address.first_name,
                     "last_name":order.delivery_address.last_name,
                     "street":order.delivery_address.street,
                     "building":order.delivery_address.building,
                     "city":order.delivery_address.city.name if order.delivery_address.city else "",
                     "state":order.delivery_address.city.state.name if order.delivery_address.city else "",
                     "zip":order.delivery_address.zip,
                     "phone":order.delivery_address.phone,
                     "email":order.delivery_address.email,
                    } if order.delivery_address else "",
        }
        return json_response({"status":1, "order":order_details})
    except Exception as e:
        log.error("get order details." + e.message)
        return custom_error("Failed to list order details.")

def send_order_confirmation_notification(order):
    try:
        meals = Meal.objects.filter(cartitem__cart__order=order).values_list('name', 'price', 'tax')
        user = order.cart.user
        to_email = order.email
        day = order.delivery_time.day
        if 4 <= day <= 20 or 24 <= day <= 30:
            suffix = "th"
        else:
            suffix = ["st", "nd", "rd"][day % 10 - 1]
        dic = {
               "order_num" : order.order_num,
               "mobile" : order.delivery_address.phone if order.delivery_address else order.phone,
               "transaction_id" : order.payment.transaction_id if order.payment else "Not Available",
               "date": order.updated.strftime("%B %d, %Y"),
               "time" : order.updated.strftime("%I %M %p"),
               "delivery_time" : order.delivery_time.strftime("%A, %B %d"+suffix+", %Y"),
               "total_amount":order.total_amount,
               "discount" : order.discount,
               "tax" : order.total_tax,
               "shipping" : settings.SHIPPING_CHARGE,
               "tip":order.tip,
               "grand_total":order.grand_total,
               "first_name" : user.first_name.title() if user.role.id == settings.ROLE_USER else "Guest",
               "last_name" : user.last_name.title() if user.role.id == settings.ROLE_USER else "",
               "status":order.status,
               "delivery_type":order.delivery_type,
               "review_link":settings.SITE_URL + 'views/reviews.html?sess=' + order.session_key + '&oi=' + str(order.id),
               "to_email":to_email,
               "site_url":settings.SITE_URL,
               "delivery_hr": str(order.delivery_time.hour) + "-" + str(order.delivery_time.hour +1)+"PM",
               "referral_code":order.cart.user.referral_code,
               "referral_bonus":Configuration.objects.get(key="REFERRAL_BONUS").value,
               "cart_items":order.cart.cartitem_set.all(),
               }
        if order.deliy_type == "pickup":
            dic["delivery_name"] = order.delivery_address.first_name.title() + " "+order.delivery_address.last_name.title()
            dic["delivery_add1"] = order.delivery_address.building + ", "+order.delivery_address.street
            dic["delivery_add2"] = order.delivery_address.city.name + " "+ order.delivery_address.city.state.name + order.delivery_address.zip
        
        msg = render_to_string('order_confirmation_email_template.html', dic)
        sub = 'Your order at Meisterdish is confirmed '
        
        if mail_order_confirmation([to_email], sub, msg, order):
            log.info("Send order confirmation mail to "+to_email)
        else:
            log.error("Failed to send order confirmation mail to "+to_email)

        if user.need_sms_notification:
            if not send_sms_notification(dic):
                return False
        return True

    except KeyError as e:
        log.error("Send confirmation mail : " + e.message)
        return False

def send_order_complete_notification(order):
    try:
        meals = Meal.objects.filter(cartitem__cart__order=order).values_list('name', 'price', 'tax')
        user = order.cart.user
        to_email = order.email

        dic = {
               "order_num" : order.order_num,
               "mobile" : order.delivery_address.phone if order.delivery_address else order.phone,
               "transaction_id" : order.payment.transaction_id if order.payment else "",
               "date": order.updated.strftime("%B %d, %Y"),
               "time" : order.updated.strftime("%I %M %p"),
               "grand_total":order.grand_total,
               "first_name" : user.first_name.title() if user.role.id == settings.ROLE_USER else "Guest",
               "last_name" : user.last_name.title() if user.role.id == settings.ROLE_USER else "",
               "status":order.status,
               "delivery_type":order.delivery_type,
               "review_link":settings.SITE_URL + 'views/reviews.html?sess=' + order.session_key + '&oi=' + str(order.id),
               "to_email":to_email,
               "site_url":settings.SITE_URL,
               }
        
        msg = render_to_string('order_complete_email_template.html', dic)
        sub = 'Your order at Meisterdish is complete'
        
        mail([to_email], sub, msg )

        if user.need_sms_notification:
            if not send_sms_notification(dic):
                return False
        return True
    except KeyError as e:
        log.error("Send order completion mail : " + e.message)
        return False

def send_sms_notification(dic):
    try:
        if not dic["mobile"]:
            log.error("No mobile number available to send SMS.")
            return False
        if dic["status"] == 2: #Confirmed
            txt = render_to_string('order_confirmation_sms_template.html', dic)
        else: #Complete
            txt = render_to_string('order_complete_sms_template.html', dic)
        
        client = TwilioRestClient(settings.TWILIO_ACCOUNT_SID, settings.TWILIO_AUTH_TOKEN)

        country_code = "+1" if settings.Live else "+91"
        number = country_code + str(dic["mobile"]).strip()

        message = client.messages.create(body=txt,
                to= number,
                from_=settings.TWILIO_NUMBER)
        if message:
            log.info("Sent SMS to " + number)
            return True
        else:
            log.error("Failed to send SMS to " + number)
            return False

    except KeyError as e:
        log.error("Failed to send order SMS to : " + number + " : "+e.message)
        return False

@check_input('POST')
def export_orders(request, data, user):
    try:
        orders = Order.objects.filter(is_deleted=False).exclude(status=0)
        
        q = Q()
        #Filter
        
        if "user_id" in data and str(data['user_id']).strip() != "":
            q &= Q(cart__user__pk=data['user_id'])

        if "status" in data and str(data['status']).strip() != "":
             q |= Q(status=int(data['status']))

        if "date" in data and str(data["date"]).strip() != "":
            date_obj = datetime.strptime(data['date'], "%Y-%m-%d")# %H:%M:%S")
            q &= Q(delivery_time__year=date_obj.year) & Q(delivery_time__month=date_obj.month) & Q(delivery_time__day=date_obj.day)            

        orders = orders.filter(q)
        # End filter
        orders = orders.order_by("-id")
        export_list = [[
                'Order Number', 
                'Order Date',
                'Name',
                'Phone',
                'Delivery Address',
                'Amount',
                'Delivery Date',
                "Status"
            ]]
        
        for order in orders:
            export_list.append([
                order.order_num,
                order.created.strftime("%m-%d-%Y %H:%M:%S"),
                order.cart.user.first_name.title() + " " + order.cart.user.last_name.title(),
                order.cart.phone,
                create_address_text_from_model(order.delivery_address),
                order.grand_total,
                order.delivery_time.strftime("%m-%d-%Y %H:%M:%S"),
                dict(settings.ORDER_STATUS)[order.status],
            ])
    except Exception as e:
        log.error("Failed to export orders." + e.message)
        return HttpResponseRedirect(settings.SITE_URL + "views/admin/orderlist.html")
    else:
        return export_csv(export_list, "orders_list.csv")