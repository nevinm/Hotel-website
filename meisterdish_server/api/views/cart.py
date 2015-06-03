from django.http import HttpResponse, HttpResponseNotAllowed, HttpResponseRedirect
from api.models import *
import json as simplejson
import logging 
import settings
from decorators import *
from django.core.paginator import Paginator
from datetime import datetime, timedelta
from libraries import get_request_user, create_guest_user, validate_zipcode

log = logging.getLogger('cart')

@check_input('POST')
def get_cart_items(request, data, user):
    try:
      cart_list = []
      for cart_item in CartItem.objects.filter(cart__user=user, cart__completed=False):
            cart_list.append(
            {
              "id" : cart_item.meal.id,
              "name": cart_item.meal.name,
              "description": cart_item.meal.description,
              "image": settings.DEFAULT_MEAL_IMAGE if cart_item.meal.main_image is None else cart_item.meal.main_image.thumb.url,
              "available": 1 if cart_item.meal.available else 0,
              "category": cart_item.meal.category.name.title() if cart_item.meal.category else "Not Available",
              "price": cart_item.meal.price,
              "tax": cart_item.meal.tax,
              "quantity":cart_item.quantity,
            }
      )

      if not len(cart_list):
          return custom_error("There are not items in cart.")
      else:
          return json_response({"status":1, 
                              "aaData":cart_list,
                              "total_count":len(cart_list),
                              "delivery_time" : "" if not cart_item.cart.delivery_time else cart_item.cart.delivery_time.strftime("%m-%d-%Y %H:%M:%S"),
                              "delivery_address" : False if not cart_item.cart.delivery_address else cart_item.cart.delivery_address.id,
                              })
    except Exception as e:
    	log.error("Failed to list cart items." + e.message)
    	return custom_error("Failed to get cart items.")

@check_input('POST')
def add_to_cart(request, data):
    try:
        user = get_request_user(request)
        if not user:
            (user, session_key) = create_guest_user(request)
        else:
            session_key = None

        if user is None:
            return custom_error("An error has occured. Please try again later.")

        meal_id = data['meal_id']
        quantity = data.get('quantity', 1)

        if int(quantity) < 1:
           return custom_error("Invalid quantity.")

        try:
          meal = Meal.objects.get(pk=meal_id, available=True, is_deleted=False)
        except:
          log.error("Trying to add a deleted or non-existing meal?")
          return custom_error("Sorry, this meal is currently not available.")
        
        carts = Cart.objects.filter(user=user, completed=False)
        if not carts.exists():
           cart = Cart()
           cart.user = user
           cart.save()
        else:
          cart = carts[0]
        
        try:
           cart_item = CartItem.objects.get(cart=cart, meal=meal)
           cart_item.quantity = cart_item.quantity+quantity
        except CartItem.DoesNotExist:
           cart_item = CartItem()
           cart_item.cart = cart
           cart_item.meal = meal
           cart_item.quantity = quantity
        cart_item.save()
        
        response = {"status":1, "message":meal.name.title() + " has been added to the cart."}
        if session_key:
          response["session_key"] = session_key
        return json_response(response)
        
    except Exception as e:
        log.error("Add to cart : "+e.message)
        return custom_error("Failed to add to cart. Please try again later.")

@check_input('POST')
def update_cart(request, data, user):
    try:
        meal_id = data['meal_id']
        qty = data['quantity']
        
        if int(qty) < 1:
            return custom_error("Please provide a valid quantity for each meal.")

        try:
          meal = Meal.objects.get(pk=meal_id, available=True, is_deleted=False)
        except:
          return custom_error("Sorry, meal #" +str(meal_id)+ " is currently not available.")

        carts = Cart.objects.filter(user=user, completed=False)
        if not carts.exists():
           cart = Cart()
           cart.user = user
           cart.save()
        else:
          cart = carts[0]
        
        
        try:
           cart_item = CartItem.objects.get(cart=cart, meal__pk=meal_id)
        except CartItem.DoesNotExist:
           cart_item = CartItem()
           cart_item.cart = cart
           cart_item.meal = meal
        cart_item.quantity = qty
        cart_item.save()

        cart_list = []
        for cart_item in CartItem.objects.filter(cart__user=user, cart__completed=False):
              cart_list.append(
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
              }
        )
        return json_response({"status":1, 
                              "aaData":cart_list,
                              "messge" : "The cart has been updated",
                              "total_count":len(cart_list),
                              "delivery_time" : "" if not cart_item.cart.delivery_time else cart_item.cart.delivery_time.strftime("%m-%d-%Y %H:%M:%S"),
                              "delivery_address" : False if not cart_item.cart.delivery_address else cart_item.cart.delivery_address.id
                              }) 
        
    except Exception as e:
        log.error("Update cart : "+e.message)
        return custom_error("Failed to update cart. Please try again later.")

@check_input('POST')
def remove_from_cart(request, data, user):
    try:
        meal_id = data['meal_id']
        meal = Meal.objects.get(pk=meal_id)
        CartItem.objects.get(cart__user=user, cart__completed=False, meal__pk=meal_id).delete()
        return json_response({"status":1, "message": meal.name.title() + " has been successfully removed from cart."})
    except Exception as e:
        log.error("Remove from cart : "+e.message)
        return custom_error("Failed to remove meal from cart. Please try again later.")

@check_input('POST')
def delete_cart(request, data, user):
    try:
        cart = Cart.objects.get(user=user, completed=False)
        cart.completed=True
        cart.save()
        return json_response({"status":1, "message":"The cart has been cleared."})
    except Exception as e:
        log.error("Delete cart : "+e.message)
        return custom_error("Failed to clear cart. Please try again later.")

@check_input('POST')
def get_cart_items_count(request, data, user):
    try:
      count = 0
      items = CartItem.objects.filter(cart__user=user, cart__completed=False)
      for item in items:
          count += item.quantity
      return json_response({"status":1, "count":count})
    except Exception as e:
      return custom_error("Failed to clear cart. Please try again later.")

@check_input('POST')
def save_delivery_time(request, data, user):
    try:
        cart = Cart.objects.get(user=user, completed=False)
        if "delivery_time" in data:
            del_time = data['delivery_time'].strip()
            delivery_time = datetime.strptime(del_time,"%m-%d-%Y %H:%M:%S")
            if delivery_time < datetime.now() - timedelta(hours=settings.ORDER_DELIVERY_WINDOW):
                return custom_error("Sorry, the delivery time should be at least "+str(settings.ORDER_DELIVERY_WINDOW) + " hours from now.")
            cart.delivery_time = delivery_time
            field = "time"
        
        if "delivery_address" in data:
            cart.delivery_address = Address.objects.get(pk=int(data["delivery_address"]))
            field = "address"

        cart.save()

        return json_response({"status":1, "message":"Successfully updated delivery " + field + "."})
    except Exception as e:
        log.error("Save delivery time/address " + e.message)
        return custom_error("Failed to update delivery " + field + ". Please try again later.")

@check_input('POST')
def check_delivery(request, data, user=None):
    try:
        zip = data["zip"].strip()
        if DeliveryArea.objects.filter(zip=zip).exists():
           return json_response({"status":1, "message":"Delivery is available for this location."})
        return custom_error("Delivery is not available for this location.")
    except Exception as e:
        log.error("Check delivery by ZIP error : " + e.message)
        return custom_error("An error has occurred. Please try again later.")

@check_input('POST', True)
def get_delivery_areas(request, data, user):
    try:
        limit = data.get('perPage', settings.PER_PAGE)
        page = data.get("nextPage",1)

        if "search" in data and data["search"].strip() != "":
          areas = DeliveryArea.objects.filter(zip__startswith=data["search"].strip())
        else:
          areas = DeliveryArea.objects.all()
        areas = areas.order_by("-id")
        actual_count = areas.count()

        try:
            paginator = Paginator(areas, limit)
            if page <1 or page > paginator.page_range:
                page = 1
            areas = paginator.page(page)

        except Exception as e:
            log.error("Delivery area list pagination : " + e.message)
            custom_error("There was an error listing delivery areas.")

        area_list = [{"id":area.id, "zip":str(area.zip)} for area in areas]
        return json_response({"status":1, 
                              "aaData":area_list,
                              "actual_count":actual_count,
                              "num_pages" : paginator.num_pages,
                              "page_range" : paginator.page_range,
                              "current_page":page,
                              "per_page" : limit,
                              })
    except Exception as e:
        log.error("Get Delivery areas : " + e.message)
        return custom_error("An error has occurred. Please try again later.")

@check_input('POST', True)
def manage_delivery_area(request, data, user):
    try:
        
        if "edit_id" in data and str(data["edit_id"]).strip() != "":
            zip = data['zip'].strip()
            if not validate_zipcode(zip):
                return custom_error("Please enter a valid zipcode.")

            action = "Updat"
            if DeliveryArea.objects.exclude(pk=data["edit_id"]).filter(zip=zip).exists():
                return custom_error("Zipcode already exists.")
            area = DeliveryArea.objects.get(pk=data["edit_id"])
        elif "delete_id" in data and data["delete_id"]:
            zip_obj = DeliveryArea.objects.get(pk=data["delete_id"])
            zip = zip_obj.zip
            zip_obj.delete()
            return json_response({"status":1, "id":data["delete_id"], "message": "Deleted "+zip, "zip":zip})

        else:
            zip = data['zip'].strip()
            if not validate_zipcode(zip):
                return custom_error("Please enter a valid zipcode.")
            if DeliveryArea.objects.filter(zip=zip).exists():
                return custom_error("Zipcode already exists.")
            action = "Add"
            area = DeliveryArea()
        
        area.zip = zip
        area.save()
        return json_response({"status":1, "id":area.id, "message": action + "ed "+zip, "zip":zip})
      
    except Exception as e:
        log.error("Manage delivery area error : " + e.message)
        return custom_error("An error has occurred. Please try again later.")