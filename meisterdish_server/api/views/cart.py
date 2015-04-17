from django.http import HttpResponse, HttpResponseNotAllowed, HttpResponseRedirect
from api.models import *
import json as simplejson
import logging 
import settings
from decorators import *
log = logging.getLogger('order')

@check_input('POST')
def get_cart_items(request, data, user):
    try:
      cart_list = []
      for cart_item in CartItems.objects.filter(cart__user=user, completed=False):
            cart_list.append(
            {
              "id" : cart_item.meal.id,
              "name": cart_item.meal.name,
              "description": cart_item.meal.description,
              "image": "Not available" if cart_item.meal.main_image is None else cart_item.meal.main_image.thumb.url,
              "available": 1 if cart_item.meal.available else 0,
              "category": cart_item.meal.category.name.title(),
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
                              })
    except Exception as e:
    	log.error("Failed to list cart items." + e.message)
    	return custom_error("Failed to get cart items.")

@check_input('POST')
def add_to_cart(request, data, user):
    try:
        meal_id = data['meal_id']
        quantity = data.get('quantity', 1)

        if int(quantity) < 1:
           return custom_error("Invalid quantity.")

        try:
          meal = Meal.objects.get(pk=meal_id, available=True, is_deleted=True)
        except:
          return custom_error("Sorry, this meal is currently not available.")
        
        carts = Cart.objects.filter(user=user, completed=False)
        if not carts.exists():
           cart = Cart()
           cart.user = user
           cart.save()
        else:
          cart = carts[0]
        
        try:
           cart_item = CartItem.get(cart=cart, meal=meal)
           cart_item.quantity = cart_item.quantity+quantity
        except CartItem.DoesNotExist:
           cart_item = CartItem()
           cart_item.cart = cart
           cart_item.meal = meal
           cart_item.quantity = quantity
        cart_item.save()
        return json_response({"status":1, "message":"The meal has been added to the cart."})
        
    except Exception as e:
        return custom_error("Failed to add to cart. Please try again later.")

@check_input('POST')
def update_cart(request, data, user):
    try:
        meal_ids = data['meals']
        meals = []
        for meal_id, qty in meal_ids:
            if int(qty) < 1:
                return custom_error("Please provide a valid quantity for each meal.")

            try:
              meal = Meal.objects.get(pk=meal_id, available=True, is_deleted=True)
            except:
              return custom_error("Sorry, meal #" +str(meal_id)+ " is currently not available.")
            meals.append({"meal":meal, "qty":qty})

        carts = Cart.objects.filter(user=user, completed=False)
        if not carts.exists():
           cart = Cart()
           cart.user = user
           cart.save()
        else:
          cart = carts[0]
        
        for meal in meals:
          try:
             cart_item = CartItem.get(cart=cart, meal=meal['meal'])
             cart_item.quantity = meal['qty']
          except CartItem.DoesNotExist:
             cart_item = CartItem()
             cart_item.cart = cart
             cart_item.meal = meal['meal']
             cart_item.quantity = meal['qty']
          cart_item.save()
        return json_response({"status":1, "message":"The cart has been updated."})
        
    except Exception as e:
        return custom_error("Failed to update cart. Please try again later.")

@check_input('POST')
def remove_from_cart(request, data, user):
    try:
        meal_id = data['meal_id']
        CartItem.objects.get(cart__user=user, meal__pk=meal_id).delete()
        return json_response({"status":1, "message":"The meal has been successfully removed from cart."})
    except Exception as e:
        return custom_error("Failed to remove meal from cart. Please try again later.")

@check_input('POST')
def delete_cart(request, data, user):
    try:
        Cart.get(user=user).delete()
        return json_response({"status":1, "message":"The cart has been cleared."})
    except Exception as e:
        return custom_error("Failed to clear cart. Please try again later.")
