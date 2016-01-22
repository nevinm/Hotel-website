'''
CMS Order related view
'''

from datetime import datetime
from django.conf import settings
from django.contrib.sessions.backends.db import SessionStore
from django.core.paginator import Paginator
from django.db.models import Q
from django.http.response import HttpResponseRedirect
from django.template.loader import render_to_string
import logging

from cms.views.decorators import check_input
from libraries import json_response, custom_error, get_time_past,\
    create_address_text_from_model, export_csv
from meisterdish_server.models import Order, CartItem
from settings import ROLE_USER
from twilio.rest import TwilioRestClient


log = logging.getLogger(__name__)


@check_input('POST', settings.ROLE_ADMIN)
def delete_order(request, data, user, order_id):
    '''
    API to delete an order
    :param request:
    :param data:
    :param user:
    :param order_id:
    '''
    try:
        order = Order.objects.get(pk=order_id, is_deleted=False)
        order.is_deleted = True
        order.save()
        return json_response({
            "status": 1,
            "message": "The order has been deleted",
            "id": order_id + "."})
    except Exception as error:
        log.error("Delete order." + error.message)
        return custom_error("Failed to delete the order.")


@check_input('POST')
def update_order(request, data, user, order_id):
    '''
    API to update an order
    :param request:
    :param data:
    :param user:
    :param order_id:
    '''
    try:
        order = Order.objects.get(
            pk=order_id, is_deleted=False, cart__completed=True)
        if "produced_meals" in data and isinstance(
                data["produced_meals"],
                list) and len(data['produced_meals']):
            try:
                st = int(data['meal_status'])
                if st < 0 or st > 4:
                    log.error("Invalid meal status: " + str(st))
                    return custom_error("Invalid order status")
            except:
                return custom_error("Invalid order status.")
            # if user.role.id != settings.ROLE_KITCHEN:
            # return custom_error("Only the kitchen staff is authorized to do
            # this operation.")

            for cart_item in order.cart.cartitem_set.all():
                if cart_item.meal.id in data["produced_meals"]:
                    cart_item.status = st

                cart_item.save()

        if "status" in data:
            if not user.role.id in(settings.ROLE_DELIVERY,
                                   settings.ROLE_ADMIN):
                return custom_error(
                    "You are not authorized to change the order status.")
            status = int(data['status'])
            if status < 0 or status > 4:
                log.error("Invalid order status: " + str(status))
            order.status = status
            order.save()

            if status != 4:
                order.cart.completed = True
                order.cart.save()
            order.session_key = request.META.get('HTTP_SESSION_KEY', None)
            if status == 2:  # Dispatched
                need_boiling = CartItem.objects.filter(
                    cart__order=order, meal__need_boiling_water=True).exists()
                sent = send_sms_notification({
                    "order_num": order.order_num, "mobile": order.phone,
                    "status": status, "need_boiling": need_boiling,
                    "delivery_type": order.delivery_type})
                if not sent:
                    log.error("Failed to send order dispatched notification")

        return json_response({
            "status": 1, "message": "The order has been updated",
            "id": str(order_id) + "."})
    except Exception as error:
        log.error("Update order status : " + error.message)
        return custom_error("Failed to update the order.")


@check_input('POST')
def get_orders(request, data, user):
    '''
    API to get orders list
    :param request:
    :param data:
    :param user:
    '''
    try:
        limit = data.get('perPage', settings.PER_PAGE)
        page = data.get("nextPage", 1)

        order_list = []
        orders = Order.objects.filter(is_deleted=False)

        total_count = orders.count()

        q = Q()
        # Filter
        if "num" in data and str(data['num']).strip() != "":
            q &= Q(order_num=str(data['num']))

        if "user_id" in data and str(data['user_id']).strip() != "":
            q &= Q(cart__user__pk=data['user_id'])

        if "search" in data and str(data['search']).strip() != "":
            q &= Q(
                cart__user__full_name__istartswith=str(data['search']).strip())

        if "status" in data and str(data['status']).strip() != "":
            q |= Q(status=int(data['status']))

        if "phone" in data and str(data["phone"]).strip() != "":
            try:
                q &= Q(phone__startswith=str(int(data['phone'])).strip())
            except:
                return custom_error("Please enter valid phone number")

        if "amount" in data and str(data["amount"]).strip() != "":
            try:
                q &= Q(grand_total=float(data['amount']))
            except:
                return custom_error("Please search with a valid order amount")

        if "date" in data and str(data["date"]).strip() != "":
            # %H:%M:%S")
            date_obj = datetime.strptime(data['date'], "%m/%d/%Y")
            q &= Q(delivery_time__year=date_obj.year) & Q(
                delivery_time__month=date_obj.month) & Q(
                delivery_time__day=date_obj.day)

        orders = orders.filter(q)

        # End filter
        orders = orders.order_by("-id")

        actual_count = orders.count()

        try:
            paginator = Paginator(orders, limit)
            if page < 1 or page > paginator.page_range:
                page = 1
            orders = paginator.page(page)
        except Exception as error:
            log.error("order list pagination : " + error.message)
            custom_error("There was an error listing orders.")

        # Format response
        for order in orders:
            meals = []
            for cart_item in CartItem.objects.filter(cart__order=order,
                                                     cart__completed=True):
                meals.append(
                    {
                        "id": cart_item.meal.id,
                        "name": cart_item.meal.name,
                        "description": cart_item.meal.description,
                        "image": (settings.DEFAULT_MEAL_IMAGE
                                  if cart_item.meal.main_image is None
                                  else cart_item.meal.main_image.thumb.url),
                        "available": 1 if cart_item.meal.available else 0,
                        "category": (cart_item.meal.category.name.title()
                                     if cart_item.meal.category else ""),
                        "price": cart_item.meal.price,
                        "tax": cart_item.meal.price * cart_item.meal.tax / 100,
                        "quantity": cart_item.quantity,
                    })

            order_list.append({
                "id": order.id,
                "minutes": get_time_past(order.created),
                "grand_total": order.grand_total,
                "user_first_name": (
                    order.cart.user.first_name
                    if order.cart.user.role.pk == settings.ROLE_USER
                    else 'Guest(' + str(order.email) + ')'),
                "user_last_name": order.cart.user.last_name,
                "status": dict(settings.ORDER_STATUS)[order.status],
                "status_id": order.status,
                "delivery_time": order.delivery_time.strftime(
                    "%m-%d-%Y %H:%M:%S"),
                "order_num": order.order_num,
                "meals": meals,
                "delivery_type": order.delivery_type.title(),
                "phone": order.phone,
                "email": order.email,
                "delivery_address": {
                    "id": order.delivery_address.id,
                    "first_name": order.delivery_address.first_name,
                    "last_name": order.delivery_address.last_name,
                    "street": order.delivery_address.street,
                    "building": order.delivery_address.building,
                    "city": order.delivery_address.city.title(),
                    "state": order.delivery_address.state.name,
                    "zip": order.delivery_address.zip,
                    "phone": order.delivery_address.phone,
                } if order.delivery_address else "",
                "billing_address": {
                    "id": order.billing_address.id,
                    "first_name": order.billing_address.first_name,
                    "last_name": order.billing_address.last_name,
                    "street": order.billing_address.street,
                    "building": order.billing_address.building,
                    "city": order.billing_address.city.title(),
                    "state": order.billing_address.state.name,
                    "zip": order.billing_address.zip,
                    "phone": order.billing_address.phone,
                } if order.billing_address else "",
            })

        # End format response
        return json_response({"status": 1,
                              "aaData": order_list,
                              "total_count": total_count,
                              "actual_count": actual_count,
                              "num_pages": paginator.num_pages,
                              "page_range": paginator.page_range,
                              "current_page": page,
                              "per_page": limit,
                              })
    except Exception as error:
        log.error("Failed to list orders." + error.message)
        return custom_error("Failed to get orders list.")


@check_input('POST')
def get_order_details(request, data, user, order_id):
    '''
    API to get order details
    :param request:
    :param data:
    :param user:
    :param order_id:
    '''
    try:
        if user.role.pk == settings.ROLE_ADMIN:
            order = Order.objects.get(pk=order_id, is_deleted=False)
        else:
            order = Order.objects.get(
                pk=order_id, is_deleted=False, cart__user=user)
        meals = []
        for cart_item in CartItem.objects.filter(cart__order=order,
                                                 cart__completed=True):
            meals.append(
                {
                    "id": cart_item.meal.id,
                    "name": cart_item.meal.name,
                    "description": cart_item.meal.description,
                    "image": (settings.DEFAULT_MEAL_IMAGE
                              if cart_item.meal.main_image is None
                              else cart_item.meal.main_image.thumb.url),
                    "available": 1 if cart_item.meal.available else 0,
                    "category": cart_item.meal.category.name.title(),
                    "price": cart_item.meal.price,
                    "tax": cart_item.meal.price * cart_item.meal.tax / 100,
                    "quantity": cart_item.quantity,
                })
        order_details = {
            "id": order.id,
            "minutes": get_time_past(order.created),
            "total_amount": order.total_amount,
            "total_tax": order.total_tax,
            "tip": order.tip,
            "delivery_charge": settings.SHIPPING_CHARGE,
            "grand_total": order.grand_total,
            "user_first_name": order.cart.user.first_name,
            "user_last_name": order.cart.user.last_name,
            "user_id": order.cart.user.id,
            "user_image": (settings.DEFAULT_USER_IMAGE
                           if not order.cart.user.profile_image
                           else order.cart.user.profile_image.thumb.url),
            "meals": meals,
            "status": dict(settings.ORDER_STATUS)[order.status],
            "status_id": order.status,
            "delivery_time": order.delivery_time.strftime("%m-%d-%Y %H:%M:%S"),
            "email": order.email,
            "phone": order.phone,
            "delivery_type": order.delivery_type.title(),
            "payment_date": (
                order.payment.created.strftime("%m-%d-%Y %H:%M:%S")
                if order.payment else "Not Available"),
            "transaction_id": (order.payment.transaction_id
                               if order.payment else "Not Available"),
            "order_num": order.order_num,

            "delivery_address": {
                "id": order.delivery_address.id,
                "first_name": order.delivery_address.first_name,
                "last_name": order.delivery_address.last_name,
                "is_business": ("Yes" if order.delivery_address.is_business
                                else "No"),
                "company": order.delivery_address.company,
                "street": order.delivery_address.street,
                "building": order.delivery_address.building,
                "city": order.delivery_address.city.title(),
                "state": (order.delivery_address.state.name
                          if order.delivery_address.state else ""),
                "zip": order.delivery_address.zip,
                "phone": order.delivery_address.phone,
                "email": order.delivery_address.email,
            } if order.delivery_address else "",
        }
        return json_response({"status": 1, "order": order_details})
    except Exception as error:
        log.error("get order details." + error.message)
        return custom_error("Failed to list order details.")


def send_sms_notification(dic):
    '''
    API to send sms notification
    :param dic:
    '''
    try:
        if not dic["mobile"]:
            log.error("No mobile number available to send SMS.")
            return False
        if dic["status"] == 2:  # Dispatched
            txt = render_to_string('order_dispatched_sms_template.html', dic)

        client = TwilioRestClient(
            settings.TWILIO_ACCOUNT_SID, settings.TWILIO_AUTH_TOKEN)

        country_code = "+1"
        if str(dic["mobile"]).strip() in settings.INDIAN_NUMBERS:
            country_code = "+91"
        number = country_code + str(dic["mobile"]).strip()

        message = client.messages.create(body=txt,
                                         to=number,
                                         from_=settings.TWILIO_NUMBER)

        if message:
            log.info("Sent SMS to " + number)
            return True
        else:
            log.error("Failed to send SMS to " + number)
            return False

    except Exception as error:
        log.error(
            "Failed to send order SMS to : " + number + " : " + error.message)
        return False


@check_input('POST')
def export_orders(request, data):
    '''
    API to export all orders to csv
    :param request:
    :param data:
    '''
    try:
        session_key = data.get('session_key', None)
        if session_key:
            session = SessionStore(session_key=session_key)
            if session and 'user' in session:
                orders = Order.objects.filter(
                    is_deleted=False).exclude(status=4)

                q = Q()
                # Filter

                if "user_id" in data and str(data['user_id']).strip() != "":
                    q &= Q(cart__user__pk=data['user_id'])

                if "status" in data and str(data['status']).strip() != "":
                    q |= Q(status=int(data['status']))

                if "date" in data and str(data["date"]).strip() != "":
                    # %H:%M:%S")
                    date_obj = datetime.strptime(data['date'], "%Y-%m-%d")
                    q &= Q(delivery_time__year=date_obj.year) & Q(
                        delivery_time__month=date_obj.month) & Q(
                        delivery_time__day=date_obj.day)

                orders = orders.filter(q)
                # End filter
                orders = orders.order_by("-id")
                export_list = [[
                    'Order Number',
                    'Order Date',
                    'Name',
                    "Email",
                    'Phone',
                    'Delivery Address',
                    "Zip Code",
                    "Price",
                    "Tax",
                    "Tip",
                    "Discount",
                    "Credits Used",
                    'Grand Total',
                    "Delivery Type",
                    "Driver Instructions",
                    'Delivery Date',
                    "Status"
                ]]

                for order in orders:
                    export_list.append([
                        str(order.order_num),
                        order.created.strftime("%m-%d-%Y %H:%M:%S"),
                        order.cart.user.first_name.title() + " " +
                        order.cart.user.last_name.title(
                        ) if order.cart.user.role.id == ROLE_USER else "Guest",
                        order.email,
                        str(order.phone),
                        create_address_text_from_model(
                            order.delivery_address, order.phone),
                        (order.delivery_address.zip if order.delivery_address
                         else "Pick up"),
                        "{0:.2f}".format(order.total_amount),
                        "{0:.2f}".format(order.total_tax),
                        "{0:.2f}".format(order.tip),
                        "{0:.2f}".format(order.discount),
                        "{0:.2f}".format(order.credits),
                        "{0:.2f}".format(order.grand_total),
                        order.delivery_type.title(),
                        order.driver_instructions,
                        order.delivery_time.strftime("%m-%d-%Y %H:%M:%S"),
                        dict(settings.ORDER_STATUS)[order.status],
                    ])
                return export_csv(export_list, "orders_list.csv")
        log.error("Failed to export orders : Invalid session")
        return HttpResponseRedirect(
            settings.SITE_URL + "views/admin/orderlist.html")
    except Exception as error:
        log.error("Failed to export orders." + error.message)
        return HttpResponseRedirect(
            settings.SITE_URL + "views/admin/orderlist.html")


@check_input('POST', settings.ROLE_KITCHEN)
def get_kitchen_orders(request, data, user):
    '''
    API to get kitchen orders
    :param request:
    :param data:
    :param user:
    '''
    try:
        limit = data.get('perPage', settings.PER_PAGE)
        page = data.get("nextPage", 1)

        order_list = []
        orders = Order.objects.filter(is_deleted=False, status__lt=4)

        total_count = orders.count()

        q = Q()
        # Filter
        if "num" in data and str(data['num']).strip() != "":
            q &= Q(order_num=str(data['num']))

        if "user_id" in data and str(data['user_id']).strip() != "":
            q &= Q(cart__user__pk=data['user_id'])

        if "search" in data and str(data['search']).strip() != "":
            q &= Q(
                cart__user__full_name__istartswith=str(data['search']).strip())

        if "status" in data and str(data['status']).strip() != "":
            q |= Q(status=int(data['status']))

        if "phone" in data and str(data["phone"]).strip() != "":
            try:
                q &= Q(phone__startswith=str(int(data['phone'])).strip())
            except:
                return custom_error("Please enter valid phone number")

        if "amount" in data and str(data["amount"]).strip() != "":
            try:
                q &= Q(grand_total=float(data['amount']))
            except:
                return custom_error("Please search with a valid order amount")

        if "date" in data and str(data["date"]).strip() != "":
            # %H:%M:%S")
            date_obj = datetime.strptime(data['date'], "%m/%d/%Y")
            q &= Q(delivery_time__year=date_obj.year) & Q(
                delivery_time__month=date_obj.month) & Q(
                delivery_time__day=date_obj.day)

        orders = orders.filter(q)

        # End filter
        orders = orders.order_by("delivery_time", "created")

        actual_count = orders.count()

        try:
            paginator = Paginator(orders, limit)
            if page < 1 or page > paginator.page_range:
                page = 1
            orders = paginator.page(page)
        except Exception as error:
            log.error("order list pagination : " + error.message)
            custom_error("There was an error listing orders.")

        # Format response
        for order in orders:
            meals = []
            for cart_item in CartItem.objects.filter(cart__order=order,
                                                     cart__completed=True):
                meals.append(
                    {
                        "id": cart_item.meal.id,
                        "name": cart_item.meal.name,
                        "description": cart_item.meal.description,
                        "image": (
                            settings.DEFAULT_MEAL_IMAGE
                            if cart_item.meal.main_image is None
                            else cart_item.meal.main_image.thumb.url),
                        "available": 1 if cart_item.meal.available else 0,
                        "category": (cart_item.meal.category.name.title()
                                     if cart_item.meal.category else ""),
                        "price": cart_item.meal.price,
                        "tax": cart_item.meal.price * cart_item.meal.tax / 100,
                        "quantity": cart_item.quantity,
                        "status_id": int(cart_item.status),
                    })

            order_list.append({
                "id": order.id,
                "order_num": order.order_num,
                "minutes": get_time_past(order.created),
                "zip": (order.delivery_address.zip
                        if order.delivery_address else ""),
                "grand_total": order.grand_total,
                "user_first_name": (
                    order.cart.user.first_name
                    if order.cart.user.role.pk == settings.ROLE_USER
                    else 'Guest(' + str(order.email) + ')'),
                "user_last_name": order.cart.user.last_name,
                "status": dict(settings.ORDER_STATUS)[order.status],
                "status_id": order.status,
                "delivery_time": order.delivery_time.strftime(
                    "%m-%d-%Y %H:%M:%S"),
                "meals": meals,
                "delivery_type": order.delivery_type.title(),
                "phone": order.phone,
                "email": order.email,
                "delivery_address": {
                    "id": order.delivery_address.id,
                    "first_name": order.delivery_address.first_name,
                    "last_name": order.delivery_address.last_name,
                    "street": order.delivery_address.street,
                    "is_business": (
                        1 if order.delivery_address.is_business else 0),
                    "company": order.delivery_address.company,
                    "building": order.delivery_address.building,
                    "city": order.delivery_address.city.title(),
                    "state": order.delivery_address.state.name,
                    "zip": order.delivery_address.zip,
                    "phone": order.delivery_address.phone,
                } if order.delivery_address else "",
            })

        # End format response
        return json_response({"status": 1,
                              "aaData": order_list,
                              "total_count": total_count,
                              "actual_count": actual_count,
                              "num_pages": paginator.num_pages,
                              "page_range": paginator.page_range,
                              "current_page": page,
                              "per_page": limit,
                              })
    except Exception as error:
        log.error("Failed to list orders." + error.message)
        return custom_error("Failed to get orders list.")


@check_input('POST', settings.ROLE_KITCHEN)
def export_kitchen_orders(equest, data, user):
    '''
    API to export  kitchen orders as CSV
    :param request:
    :param data:
    :param user:
    '''
    try:
        if "status_limit" in data and str(data["status_limit"]) != "":
            status = int(data["status"])
        else:
            status = 3
        export_list = [[
            'Order Number',
                       'Quantity',
                       'Meal',
                       'Delivery Time',
                       'Zip',
                       'Name',
                       'Phone',
                       'Status',
                       ]]
        orders = Order.objects.filter(is_deleted=False, status__lte=status)

        orders = orders.order_by("delivery_time", "created")

        # Format response
        for order in orders:
            for cart_item in CartItem.objects.filter(cart__order=order,
                                                     cart__completed=True):
                export_list.append([
                                   str(order.order_num),
                                   str(cart_item.quantity),
                                   cart_item.meal.name,
                                   order.delivery_time.strftime(
                                       "%m-%d-%Y %H:%M:%S"),
                                   (order.delivery_address.zip
                                    if order.delivery_address
                                       else "Pick up"),
                                   (order.cart.user.first_name.title() + " " +
                                    order.cart.user.last_name.title(
                                   ) if order.cart.user.role.id == ROLE_USER
                                       else "Guest"),
                                   str(order.phone),
                                   dict(settings.ORDER_STATUS)[order.status],
                                   ])
            export_list.append([
                '',
                '',
                '',
                '',
                '',
                '',
                '',
                '',
            ])
        # End format response
        return export_csv(export_list, 'kitchen-orders.csv')
    except Exception as error:
        log.error("Failed to list orders." + error.message)
        return custom_error("Failed to get orders list.")


@check_input('POST', settings.ROLE_DELIVERY)
def get_delivery_orders(request, data, user):
    '''
    API to get delivery orders
    :param request:
    :param data:
    :param user:
    '''
    try:
        limit = data.get('perPage', settings.PER_PAGE)
        page = data.get("nextPage", 1)

        order_list = []
        orders = Order.objects.filter(status__lte=3, is_deleted=False)

        total_count = orders.count()

        q = Q()
        # Filter
        if "num" in data and str(data['num']).strip() != "":
            q &= Q(order_num=str(data['num']))

        if "search" in data and str(data['search']).strip() != "":
            q &= Q(
                cart__user__full_name__istartswith=str(data['search']).strip())

        if "phone" in data and str(data["phone"]).strip() != "":
            try:
                q &= Q(phone__startswith=str(int(data['phone'])).strip())
            except:
                return custom_error("Please enter valid phone number")

        if "amount" in data and str(data["amount"]).strip() != "":
            try:
                q &= Q(grand_total=float(data['amount']))
            except:
                return custom_error("Please search with a valid order amount")

        if "date" in data and str(data["date"]).strip() != "":
            # %H:%M:%S")
            date_obj = datetime.strptime(data['date'], "%m/%d/%Y")
            q &= Q(delivery_time__year=date_obj.year) & Q(
                delivery_time__month=date_obj.month) & Q(
                delivery_time__day=date_obj.day)

        orders = orders.filter(q)

        # End filter
        orders = orders.order_by("delivery_time", "created")

        actual_count = orders.count()

        try:
            paginator = Paginator(orders, limit)
            if page < 1 or page > paginator.page_range:
                page = 1
            orders = paginator.page(page)
        except Exception as error:
            log.error("order list pagination : " + error.message)
            custom_error("There was an error listing orders.")

        # Format response
        for order in orders:
            meals = []
            for cart_item in CartItem.objects.filter(cart__order=order,
                                                     cart__completed=True):
                meals.append(
                    {
                        "id": cart_item.meal.id,
                        "name": cart_item.meal.name,
                        "description": cart_item.meal.description,
                        "image": (
                            settings.DEFAULT_MEAL_IMAGE
                            if cart_item.meal.main_image is None
                            else cart_item.meal.main_image.thumb.url),
                        "available": 1 if cart_item.meal.available else 0,
                        "category": (
                            cart_item.meal.category.name.title()
                            if cart_item.meal.category else ""),
                        "price": cart_item.meal.price,
                        "tax": cart_item.meal.price * cart_item.meal.tax / 100,
                        "quantity": cart_item.quantity,
                        "status_id": cart_item.status,
                    })
            order_list.append({
                "id": order.id,
                "order_num": order.order_num,
                "minutes": get_time_past(order.created),
                "zip": (order.delivery_address.zip
                        if order.delivery_address else ""),
                "grand_total": order.grand_total,
                "user_first_name": (
                    order.cart.user.first_name
                    if order.cart.user.role.pk == settings.ROLE_USER
                    else 'Guest(' + str(order.email) + ')'),
                "user_last_name": order.cart.user.last_name,
                "status": dict(settings.ORDER_STATUS)[order.status],
                "status_id": order.status,
                "delivery_time": order.delivery_time.strftime(
                    "%m-%d-%Y %H:%M:%S"),
                "delivery_type": order.delivery_type,
                "phone": order.phone,
                "email": order.email,
                "driver_instructions": order.driver_instructions,
                "meals": meals,
                "delivery_address": {
                    "id": order.delivery_address.id,
                    "first_name": order.delivery_address.first_name,
                    "last_name": order.delivery_address.last_name,
                    "is_business": (
                        1 if order.delivery_address.is_business else 0),
                    "company": order.delivery_address.company,
                    "street": order.delivery_address.street,
                    "building": order.delivery_address.building,
                    "city": order.delivery_address.city.title(),
                    "state": order.delivery_address.state.name,
                    "zip": order.delivery_address.zip,
                    "phone": order.delivery_address.phone,
                } if order.delivery_address else "",
            })

        # End format response
        return json_response({"status": 1,
                              "aaData": order_list,
                              "total_count": total_count,
                              "actual_count": actual_count,
                              "num_pages": paginator.num_pages,
                              "page_range": paginator.page_range,
                              "current_page": page,
                              "per_page": limit,
                              })
    except Exception as error:
        log.error("Failed to list orders." + error.message)
        return custom_error("Failed to get orders list.")
