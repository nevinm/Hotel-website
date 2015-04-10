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
        return json_response({"staus":1, 
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

#Admin only
@check_input('POST', True)
def update_order(request, data, user, order_id):
    try:
    	order = Order.objects.get(pk=order_id)

    except Exception as e:
    	log.error("Failed to update order." + e.message)
    	return custom_error("Failed to update order.")