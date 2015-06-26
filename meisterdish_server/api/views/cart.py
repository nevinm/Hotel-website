from django.http import HttpResponse
from meisterdish_server.models import *
import logging 
import settings
from api.views.decorators import *
from django.core.paginator import Paginator
from datetime import datetime, timedelta
from libraries import get_request_user, create_guest_user, validate_zipcode

log = logging.getLogger('cart')

@check_input('POST')
def get_cart_items(request, data, user):
    try:
      cart_list = []
      items_count = 0
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
            })
            items_count += cart_item.quantity

      coupon = None
      if items_count > 0:
          cart = cart_item.cart
          if cart.promo_code:
              if cart.promo_code.expiry_date <= datetime.now():
                  cart.promo_code = None
                  cart.save()
              coupon = {
                "code" : cart.promo_code.code,
                "amount":cart.promo_code.amount,
                "message":"Discount of $ "+str(cart.promo_code.amount) + " has been applied to your cart."
              }
          elif cart.gift_cards.all().count():
              gc = cart.gift_cards.all()[0]
              coupon = {
                "code" : gc.code,
                "amount":gc.amount,
                "message":"Discount of $ "+str(gc.amount) + " has been applied to your cart."
              }

      if not len(cart_list):
          return custom_error("There are not items in cart.")
      else:
          return json_response({"status":1, 
                              "aaData":cart_list,
                              "total_count":items_count,
                              "delivery_time" : "" if not cart_item.cart.delivery_time else cart_item.cart.delivery_time.strftime("%m-%d-%Y %H:%M:%S"),
                              "delivery_address" : False if not cart_item.cart.delivery_address else cart_item.cart.delivery_address.id,
                              "coupon" : coupon,
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
        items_count = 0
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
              })
              items_count += cart_item.quantity
        return json_response({"status":1, 
                              "aaData":cart_list,
                              "messge" : "The cart has been updated",
                              "total_count":items_count,
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
def get_cart_items_count(request, data):
    try:
      user = get_request_user(request)
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
        field = ""
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

