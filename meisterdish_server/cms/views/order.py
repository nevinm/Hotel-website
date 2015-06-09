from meisterdish_server.models import *
import json as simplejson
import logging 
import settings
from cms.views.decorators import *
from datetime import datetime
from django.core.paginator import Paginator
from libraries import mail, check_delivery_area, validate_phone, validate_email
from django.db.models import Q
from django.template.loader import render_to_string

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