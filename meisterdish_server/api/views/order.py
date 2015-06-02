from django.http import HttpResponse, HttpResponseNotAllowed, HttpResponseRedirect
from django.contrib.sessions.backends.db import SessionStore
from api.models import *
import json as simplejson
import logging 
import settings
from decorators import *
from datetime import datetime
from django.core.paginator import Paginator
from libraries import mail, check_delivery_area
from django.db.models import Q
import string, random
from urllib import unquote
from django.template.loader import render_to_string
from twilio.rest import TwilioRestClient


log = logging.getLogger('order')

#Admin and User
@check_input('POST')
def get_orders(request, data, user=None):
    try:
    	limit = data.get('perPage', settings.PER_PAGE)
        page = data.get("nextPage",1)
                    
        order_list = []
        orders = Order.objects.filter(is_deleted=False).exclude(status=0)
        
        #If user, list only his orders
        if user.role.pk == settings.ROLE_USER:
            orders = orders.filter(cart__user=user)

        total_count = orders.count()

        q = Q()
        #Filter
        if "num" in data and str(data['num']).strip() != "":
            q &= Q(order_num__istartswith=data['num'])
        
        if "user_id" in data and str(data['user_id']).strip() != "":
            q &= Q(cart__user__pk=data['user_id'])

        if "search" in data and str(data['search']).strip() != "":
            qs = Q()
            for term in str(data['search']).strip().split():
                qs |= Q(cart__user__first_name__icontains=term) | Q(cart__user__last_name__icontains=term)
            q &= qs

        if "status" in data and str(data['status']).strip() != "":
             q |= Q(status=int(data['status']))

        if "phone" in data and str(data["phone"]).strip() != "":
            q &= Q(billing_address__phone=str(data['phone']).strip())

        if "amount" in data and str(data["amount"]).strip() != "":
            q &= Q(grand_total=float(data['amount']))

        if "date" in data and str(data["date"]).strip() != "":
            date_obj = datetime.strptime(data['date'], "%Y-%m-%d")# %H:%M:%S")
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
                  "category": cart_item.meal.category.name.title(),
                  "price": cart_item.meal.price,
                  "tax": cart_item.meal.tax,
                  "quantity":cart_item.quantity,
                })
            
            order_list.append({
                "id":order.id,
                #"total_amount": order.total_amount,
                #"total_tax" : order.total_tax,
                #"tip" : order.tip,
                "grand_total" : order.grand_total,
                "user_first_name" : order.cart.user.first_name,
                "user_last_name" : order.cart.user.last_name,
                #"user_id" : order.cart.user.id,
                #"user_image" : settings.DEFAULT_USER_IMAGE if not order.cart.user.profile_image else order.cart.user.profile_image.thumb.url,
                "status":dict(settings.ORDER_STATUS)[order.status],
                "status_id" : order.status,
                "delivery_time" : order.delivery_time.strftime("%m-%d-%Y %H:%M:%S"),
                "order_num" : order.order_num,
                "meals":meals,
                "delivery_address" : {
                     "id":order.delivery_address.id,
                     "first_name":order.delivery_address.first_name,
                     "last_name":order.delivery_address.last_name,
                     "street":order.delivery_address.street,
                     "building":order.delivery_address.building,
                     "city":order.delivery_address.city.name,
                     "state":order.delivery_address.city.state.name,
                     "zip":order.delivery_address.zip,
                     "phone":order.delivery_address.phone,
                    },
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
                    }
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
def create_order(request, data, user):
    try:
        quantity = 0
        total_price = 0.0
        total_tax = 0.0
        paid = False
        
        del_type = data["delivery_type"].strip()

        try:
            del_time = data['delivery_time'].strip()
            delivery_time = datetime.strptime(del_time,"%m/%d/%Y %H:%M:%S")
        except Exception as e:
            log.error("Invalid delivery time : "+e.message)
            return custom_error("Please provide a valid delivery time.")

        tip = int(data.get('tip', 5))
        if tip < 5:
            return custom_error("Miniumum tip amount is $5.") 

        if del_type == "delivery":
            driver_instructions = data.get('driver_instructions', "")
            if 'delivery_address' in data:
                del_address = Address.objects.get(user=user, pk=data['delivery_address'])
            else:
                try:
                    del_address = user.user_address.get(is_primary=True)
                except:
                    return custom_error("Please choose a valid delivery address.")
            
        items = CartItem.objects.filter(cart__user=user, cart__completed=False)
        if not items.exists():
            return custom_error("There are no items in your cart.")
        
        for item in items:
            if not item.meal.available:
                return custom_error("Sorry, The meal "+ item.meal.name.title() + " has gone out of stock.")
            
            quantity += item.quantity
            total_price += item.meal.price
            total_tax += item.meal.tax

        total_amount = total_price + total_tax
        
        order = Order()
        order.order_num = "MD_ORDER_" + ''.join(random.SystemRandom().choice(string.ascii_uppercase + string.digits) for _ in range(12))
        order.cart = item.cart
        
        if del_type == "delivery":
            order.delivery_address = del_address
            #order.billing_address = bil_address
            order.driver_instructions = driver_instructions

        order.delivery_time = delivery_time
        
        order.total_amount = total_price
        order.total_tax = total_tax
        order.tip = tip

        #Payment

        token = data["stripeToken"].strip()
        payment = make_payment(total_amount, order.order_num, data.get("save_card"), user)
            
        if type(payment) == False:
            return custom_error("An error has occurred while paying with Credit Card. Please try agian.")
        elif type(payment) == str:
            return custom_error(payment)
        else:
            paid = True
            log.info("Order payment (CC) success.Payment id :"+str(payment.id))        
            
        if paid:
            order.payment = payment
            order.status = 1
            order.save()

            if not order.cart.completed:
                order.cart.completed=True
                order.cart.save()
        
            return json_response({"status":1, "message":"The Order has been placed successully."})
        else:
            return custom_error("An error has occurred. Please try again later.")
    except KeyError as e:
        log.error("Failed to create order." + e.message)
        return custom_error("Failed to place order.")

#Admin only
@check_input('POST', True)
def delete_order(request, data, user, order_id):
    try:
    	order = Order.objects.get(pk=order_id, is_deleted=False)
        order.is_deleted = True
        order.save()
        return json_response({"status":1, "message":"The order has been deleted", "id":order_id+"."})
    except Exception as e:
    	log.error("Delete order." + e.message)
    	return custom_error("Failed to delete the order.")

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
            
            "delivery_type" : order.get_delivery_type_display(),
            "payment_date" : order.payment.created.strftime("%m-%d-%Y %H:%M:%S") if order.payment else "Not Available",
            "transaction_id":order.transaction_id,
            "order_num" : order.order_num,
            
            "delivery_address" : {
                     "id":order.delivery_address.id,
                     "first_name":order.delivery_address.first_name,
                     "last_name":order.delivery_address.last_name,
                     "street":order.delivery_address.street,
                     "building":order.delivery_address.building,
                     "city":order.delivery_address.city.name,
                     "state":order.delivery_address.city.state.name,
                     "zip":order.delivery_address.zip,
                     "phone":order.delivery_address.phone,
                    },
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
                    }
        }
        return json_response({"status":1, "order":order_details})
    except Exception as e:
        log.error("get order details." + e.message)
        return custom_error("Failed to list order details.")

#Admin only
@check_input('POST', True)
def update_order(request, data, user, order_id):
    try:
        status = int(data['status'])
        if status < 0 or status > 4:
            log.error("Invalid order status: " + str(status))
        order = Order.objects.get(pk=order_id, is_deleted=False)

        order.status = status
        order.save()
        if status >=1:
            order.cart.completed=True
            order.cart.save()
        order.session_key = request.META.get('HTTP_SESSION_KEY', None)
        if status == 2: #Confirmed
            sent = send_order_confirmation_notification(order)
            if not sent:
                log.error("Failed to send order confirmation notification")
        elif status == 4: #Delivered
            sent = send_order_complete_notification(order)
            if not sent:
                log.error("Failed to send order complete notification")

        return json_response({"status":1, "message":"The order has been updated", "id":order_id+"."})
    except Exception as e:
        log.error("Update order status : " + e.message)
        return custom_error("Failed to update the order.")

def get_cart_total(cart):
    try:
        amount = 0.0
        tax = 0.0
        for ci in CartItem.objects.filter(cart=cart, cart__completed=False):
            amount += ci.meal.price * ci.quantity
            tax += ci.meal.tax * ci.quantity
        
    except Exception as e:
        log.error("Error getting cart total: " + e.message)
    return (amount, tax)

def save_payment_data(data):
    try:
        payment =Payment()
        payment.response = json.dumps(data)
        payment.transaction_id
        payment.verified = True
        payment.amount = data["amount"]
        payment.save()
        return payment
    except Exception as e:
        log.error("Failed to save payment data " + e.message)
        return False

def send_order_confirmation_notification(order):
    try:
        meals = Meal.objects.filter(cartitem__cart__order=order).values_list('name', 'price', 'tax')
        user = order.cart.user
        dic = {
               "order_num" : order.order_num,
               "mobile" : order.cart.user.mobile if order.cart.user.mobile else None,
               "transaction_id" : order.transaction_id,
               "date": order.updated.strftime("%B %d, %Y"),
               "time" : order.updated.strftime("%I %M %p"),
               "grand_total":order.grand_total,
               "name" : user.last_name + " " + user.first_name,
               "status":order.status,
               "delivery_type":order.delivery_type,
               "review_link":settings.SITE_URL + 'views/reviews.html?sess=' + order.session_key + '&oi=' + order_id
               }
        
        msg = render_to_string('order_confirmation_email_template.html', dic)
        sub = 'Your order at Meisterdish is confirmed '
        to_email = user.email
        
        mail([to_email], sub, msg )

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
        dic = {
               "order_num" : order.order_num,
               "mobile" : order.cart.user.mobile if order.cart.user.mobile else None,
               "transaction_id" : order.transaction_id,
               "date": order.updated.strftime("%B %d, %Y"),
               "time" : order.updated.strftime("%I %M %p"),
               "grand_total":order.grand_total,
               "name" : user.last_name + " " + user.first_name,
               "status":order.status,
               "delivery_type":order.delivery_type,
               "review_link":settings.SITE_URL + 'views/reviews.html?sess=' + order.session_key + '&oi=' + order_id,
               }
        
        msg = render_to_string('order_complete_email_template.html', dic)
        sub = 'Your order at Meisterdish is complete'
        to_email = user.email
        
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
