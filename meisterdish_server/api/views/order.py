from django.http import HttpResponse, HttpResponseNotAllowed, HttpResponseRedirect
from api.models import *
import json as simplejson
import logging 
import settings
from decorators import *
log = logging.getLogger('order')

#Admin only
@check_input('POST', True)
def get_orders(request, data, user):
    try:
    	limit = data.get('perPage', settings.PER_PAGE)
        page = data.get("nextPage",1)
                    
        order_list = []
        orders = Order.objects.filter(is_deleted=False)
        total_count = orders.count()

        #Filter
        if "order_num" in data and str(data['order_num']).strip() != "":
            orders = orders.filter(order__num=data['order_num'])
        
        if "user_id" in data and str(data['user_id']).strip() != "":
            orders = orders.filter(order__cart__user__pk=data['user_id'])
        
        # End filter
        actual_count = orders.count()
        try:
            paginator = Paginator(orders, limit)
            if page <1 or page > paginator.page_range:
                page = 1
            meals = paginator.page(page)
        except Exception as e:
            log.error("order list pagination : " + e.message)
            custom_error("There was an error listing orders.")

        #Format response


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
        amount = 0
        total_price = 0.0
        total_tax = 0.0
        
        delivery_time = data['delivery_time']
        driver_instructions = data['driver_instructions']
        tip = int(data['tip'])
        if tip < 5:
            return custom_error("Miniumum tip amount is $5.") 

        if 'delivery_address' in data:
            address = Address.get(user=user, pk=data['delivery_address'])
        else:
            address = user.user_address.get(is_primary=True).id
        
        if 'billing_address' in data:
            address = Address.get(user=user, pk=data['billing_address'])
        else:
            address = user.user_address.get(is_primary=True).id
        
        items = CartItem.objects.filter(cart__user=user)
        for item in items:
            if not item.meal.available:
                return custom_error("Sorry, The meal "+item.meal.name + " has gone out of stock. Please add another meals or continue checkout with out it.")
            
            amount += item.quantity
            total_price += item.meal.total_price
            total_tax += item.meal.tax
        
        order = Order()
        order.cart = item.cart
        order.delivery_address = address
        order.billing_address = address
        order.tip = tip
        order.delivery_time = delivery_time
        order.driver_instructions = driver_instructions
        


    except Exception as e:
        log.error("Failed to update order." + e.message)
        return custom_error("Failed to update order.")

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