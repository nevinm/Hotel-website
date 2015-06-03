from django.http import HttpResponse, HttpResponseNotAllowed, HttpResponseRedirect
from api.models import *
import json as simplejson
import logging 
import settings
from decorators import *
from libraries import validate_zipcode, validate_phone, check_delivery_area
import stripe
from datetime import datetime, timedelta

stripe.api_key = settings.STRIPE_SECRET_KEY
log = logging.getLogger('api_user')

@check_input('POST')
def add_address(request, data, user):
    try:
        fname = data["first_name"].strip()
        lname = data["last_name"].strip()
        street = data["street"].strip()
        building = data["building"].strip()
        city_id = data["city_id"]
        zip = data["zip"].strip()

        if "checkout" in data and data["checkout"] == 1:
            if not check_delivery_area(zip):
                return custom_error("Delivery is not available at this location. Please choose a different Zip code.")

        phone = data["phone"].strip()
        is_primary = False
        if "is_primary" in data and data["is_primary"]:
            is_primary = True
        
        if not validate_zipcode(zip):
            return custom_error("Please provide a valid zip code.")
        elif not validate_phone(phone):
            return custom_error("Please provide a valid phone number.")
        add = Address()
        add.user = user
        add.first_name = fname
        add.last_name = lname
        add.is_primary = is_primary
        add.street = street
        add.building = building
        add.city = City.objects.get(id=city_id)
        add.zip = zip
        add.phone = phone
        add.save()
        
        if add.id and is_primary:
            try:
                primary = Address.objects.exclude(id=add.id).get(user=user, is_primary=True)
            except:
                pass
            else:
                primary.is_primary=False
                primary.save()
        return json_response({"status":1, "message":"Added Address", "id":add.id})
    except KeyError as e:
        log.error("Add address failed : "+e.message)
        return custom_error("Failed to add address. ")
    except Exception as e:
        log.error("Add address failed: "+e.message)
        return custom_error("Failed to add address : "+e.message)

@check_input('POST')
def update_address(request, data, user, address_id):
    try:
        try:
            add = Address.objects.get(id=address_id, user=user)
            add.user = user
        except Exception as e:
            log.error("Updated address "+e.message)
            return custom_error("You are not authorized to modify this address.")
        
        if 'first_name' in data:
            fname = data["first_name"].strip()
            lname = data["last_name"].strip()
            street = data["street"].strip()
            building = data["building"].strip()
            city_id = data["city_id"]
            zip = data["zip"].strip()
            phone = data["phone"].strip()
            
            if not validate_zipcode(zip):
                return custom_error("Please provide a valid zip code.")
            elif not validate_phone(phone):
                return custom_error("Please provide a valid phone number.")

            add.first_name = fname
            add.last_name = lname
            add.street = street
            add.building = building
            add.city = City.objects.get(id=city_id)
            add.zip = zip
            add.phone = phone
            
        if "is_primary" in data and data["is_primary"]:
            add.is_primary = True
        else:
            add.is_primary = False
        add.save()
        
        if add.id and add.is_primary:
            try:
                primary = Address.objects.exclude(id=add.id).get(user=user, is_primary=True)
            except:
                pass
            else:
                primary.is_primary=False
                primary.save()
                
        return json_response({"status":1, "message":"Updated Address", "id":add.id})
    except KeyError as e:
        log.error("Add address failed : "+e.message)
        return custom_error("Failed to update address. ")
    except Exception as e:
        log.error("Add address failed: "+e.message)
        return custom_error("Failed to update address : "+e.message)

@check_input('POST')
def remove_address(request, data, user):
    try:
        address_id = data['id']
        add = Address.objects.get(id=address_id)
        if add.user.id != user.id:
            return custom_error("You are not auhorized to delete this address")
        add.delete()
        return json_response({"status":1, "message":"Successfully Deleted Address.", "id":address_id})
    except Exception as e:
        log.error("Failed to delete Address : "+e.message)
        return custom_error("Failed to remove address")

@check_input('POST')
def get_categories(request, data):
    try:
        cats = Category.objects.filter(is_hidden=False, is_deleted=False).order_by("name")
        cat_list = []
        for cat in cats:
            cat_list.append({
                             "id":cat.id,
                             "name":cat.name.title()
                             })
        
        types = MealType.objects.filter(is_hidden=False, is_deleted=False)
        
        #Meal Types / Filters
        type_list = []
        for type in types:
            type_list.append({
                             "id":type.id,
                             "name":type.name.title()
                             })
    
        return json_response({"status":1, "categories":cat_list, "meal_types":type_list})
    except Exception as e:
        log.error("get categories +filters: " + e.message)
        return custom_error("Failed to list categories and meal filters")
    
@check_input('POST')
def add_rating(request, data, user, meal_id):
    try:
        order = Order.objects.get(id=data['order_id'], cart__cartitem__meal__pk=meal_id, cart__user=user)
        
        if order.created < datetime.now()-timedelta(days=30):
            custom_error("You cannot add reviews after 30 days from the date of order.")

        if not order.cart.completed or order.status < 4:
            custom_error("You cannot add reviews to an order that is not complete.")
        try:
            rating = MealRating.objects.get(order=order, meal__pk=meal_id)
            return custom_error("You have already added rating for this meal")
        except MealRating.DoesNotExist:
            rating = MealRating()
            rating.meal = Meal.objects.get(pk=meal_id)
            rating.order = order
            rating.rating = data['rating']
            rating.comment = data['comment'].strip()
            rating.save()
            return json_response({"status":1, "message":"Successfully added rating.", "order_id":data['order_id'], "meal_id":meal_id})
    except Exception as e:
        log.error("Add rating " + e.message)
        return custom_error("You are not authorized rate this meal/order.")

@check_input('POST')
def get_meal_details(request, data, meal_id):
    try:
        session_key = request.META.get('HTTP_SESSION_KEY', None)
        session = SessionStore(session_key=session_key)
        if session and 'user' in session :
            try:
                user = User.objects.get(pk=session['user']['id'])
            except Exception as e:
                user = None
        else:
            user=None

        meal = Meal.objects.get(pk=meal_id, is_deleted=False)
        rating_list = []
        rating_sum = 0.0
        rating_count = 0
        for rating in  meal.mealrating.all():
            rating_sum += rating.rating
            rating_count += 1
            rating_list.append({
                "rating":rating.rating,
                "review":rating.comment,
                "user_first_name":rating.order.cart.user.first_name,
                "user_last_name":rating.order.cart.user.last_name,
                "user_image": settings.DEFAULT_USER_IMAGE if not rating.order.cart.user.profile_image else rating.order.cart.user.profile_image.thumb.url,
                "date" : rating.created.strftime("%m-%d-%Y %H:%M:%S"),
                })

        image_list = []
        for img in meal.images.all():
            image_list.append({
                "id":img.id,
                "image_url" : img.image.url,
                "thumb_url" : img.thumb.url,
                })
        
        tips_list = []
        for tips in meal.tips.all():
            tips_list.append({
                "id":tips.id,
                "title" : tips.title,
                "description" : "" if tips.description.strip() == "" else simplejson.loads(tips.description),
                "image_url" : settings.DEFAULT_MEAL_IMAGE if tips.image is None else tips.image.image.url,
                "video_url" : "" if tips.video_url is None else tips.video_url,
                })
        
        return json_response({
            "status":1,
            "id" : meal.id,
            "name" : meal.name.title(),
            "sub":meal.sub,
            "description" : meal.description,
            "price":meal.price,
            "tax":meal.tax,
            "available" : 1 if meal.available else 0,
            "filters" : [type.id for type in meal.types.all()],
            "cat_id" : 'Not Available' if not meal.category else {
                "id":meal.category.id,
                "name":meal.category.name.title(),
                },
            "chef_id" : "Not available"  if not meal.chef else meal.chef.id,
            "chef_name" : "Not available"  if not meal.chef else meal.chef.name.title(),
            "chef_image" : {"url":settings.DEFAULT_USER_IMAGE, "id":""} if not meal.chef or not meal.chef.image else {
                "id":meal.chef.image.id,
                "url":meal.chef.image.thumb.url,
                },
            "chef_comments": meal.chef_comments,
            "user_to_do" : "" if not meal.user_to_do or meal.user_to_do.strip() == "" else simplejson.loads(meal.user_to_do),
            "preparation_time" : meal.preparation_time,

            "finished_preparation" : "" if not meal.finished_preparation or meal.finished_preparation.strip() == "" else simplejson.loads(meal.finished_preparation),
            "saved_time" : meal.saved_time,

            "pre_requisites" : "" if not meal.pre_requisites or meal.pre_requisites == "" else simplejson.loads(meal.pre_requisites),
            "pre_requisites_image" : settings.DEFAULT_MEAL_IMAGE if meal.pre_requisites_image is None else {
                    "id":meal.pre_requisites_image.id,
                    "url":meal.pre_requisites_image.image.url,
                    },

            "nutrients" : "" if not meal.nutrients or meal.nutrients == ""  else simplejson.loads(meal.nutrients),
            "ingredients" : "" if not meal.ingredients or meal.ingredients == "" else simplejson.loads(meal.ingredients),
            "ingredients_image" : settings.DEFAULT_MEAL_IMAGE if meal.ingredients_image is None else {
                                                        "id" : meal.ingredients_image.id,
                                                        "url" : meal.ingredients_image.image.url
                                                        },
            "tips" : tips_list,
            "allergy_notice" : meal.allergy_notice,
            "images" : image_list,
            "ratings" : rating_list,
            "avg_rating" : rating_sum/rating_count if int(rating_count) != 0 else 0,
            "main_image" : {"url":settings.DEFAULT_MEAL_IMAGE, "id":""} if not meal.main_image else {
                "id":meal.main_image.id,
                "url":meal.main_image.image.url,
            },
            "in_cart" : 1 if user and CartItem.objects.filter(cart__user=user, meal__pk=meal.id).exists() else 0,
        })
    except KeyError as e:
        log.error("get_meal details : " + e.message)
        return custom_error("Failed to get the meal details.")
         
@check_input('POST')
def save_credit_card(request, data, user):
    try:
        token = data["stripeToken"].strip()

        if user.stripe_customer_id and str(user.stripe_customer_id).strip() != "":
            customer = stripe.Customer.retrieve(user.stripe_customer_id)
            card = customer.sources.create(source=token)
        else:
            customer = stripe.Customer.create(
                source=token,
                description="meisterdish_user_"+str(user.id)
            )
            user.stripe_customer_id = customer.id
            user.save()
            cards = customer.sources.all(object="card")
            if cards:
                card = cards.data[0]
            else:
                card = None
        
        if card:
    	    c_card = CreditCardDetails()
            c_card.user = user
            c_card.card_id = card.id
            c_card.number = '#### #### #### '+str(card.last4)
            c_card.funding = card.funding
            c_card.expire_year = card.exp_year
            c_card.expire_month = card.exp_month
            c_card.card_type = card.brand
            c_card.save()
            return json_response({"message":"Successfully saved credit card details.", "id":c_card.id})
        else:
            return custom_error("Failed to save card details.")
    except Exception as e:
        log.error("Save CC: user"+str(user.id) + " : "+ e.message)
        return custom_error("Failed to save credit card details.")

@check_input('POST')
def delete_credit_card(request, data, user, card_id):
    try:
        card = CreditCardDetails.objects.get(pk=card_id)
        c_id = card.card_id

        customer = stripe.Customer.retrieve(user.stripe_customer_id)
        response = customer.sources.retrieve(c_id).delete()
        
        log.info("Delete card from stripe: response below")
        log.info(response)
        
        if response["deleted"] == True:
            card.delete()
            return json_response({"message":"Successfully deleted credit card.", "id":c_card.id})
        else:
            return custom_error("Failed to delete card details. Please try again later.")
    except Exception as e:
        log.error("Delete CC: user "+str(user.id) + " : "+ e.message)
        return custom_error("Failed to delete credit card details.")

@check_input('POST')
def get_saved_cards(request, data, user):
    try:
        cards_list = []
        cards = CreditCardDetails.objects.filter(user=user)
        for card in cards:
            cards_list.append({
                "id": card.id,
                "card_id" : card.card_id,
                "number" : card.number,
                "expire_month" : card.expire_month,
                "expire_year" : card.expire_year,
                "type" : card.card_type,
                "logo" : settings.STATIC_URL + "default/"+card.card_type+".png",
                })
        return json_response({"cards":cards_list, "status":1})
    except Exception as e:
        log.error("List CC: user "+str(user.id) + " : "+ e.message)
        return custom_error("Failed to list saved cards.")

@check_input('POST')
def get_user_reviews(request, data, user):
    try:
        orders = Order.objects.filter(cart__user__pk=user.pk, status__gte=1, created__gte=datetime.now()-timedelta(days=30))
        if 'order_id' in data:
            orders = orders.filter(pk=data['order_id'])

        rating_list = []
        meals_list = []
        for order in orders:
            meals = Meal.objects.filter(cartitem__cart__order=order)
            for meal in meals:
                try:
                    rating = MealRating.objects.get(meal=meal, order=order)
                except Exception as e:
                    log.error("Rating list error :"+e.message)
                    rating = False
                if rating :    
                    rating_list.append({
                        "rating":rating.rating,
                        "review":rating.comment,
                        "date" : rating.created.strftime("%m-%d-%Y %H:%M:%S"),
                        "meal_name" : rating.meal.name,
                        "meal_image":rating.meal.main_image.image.url if meal.main_image else settings.DEFAULT_MEAL_IMAGE,
                        "meal_id":rating.meal.id,
                        "order_id":rating.order.id,
                    })
                else:
                    rating_list.append({
                        "rating":0,
                        "review":"",
                        "date" : "",
                        "meal_name" : meal.name,
                        "meal_image":meal.main_image.image.url if meal.main_image else settings.DEFAULT_MEAL_IMAGE,
                        "meal_id":meal.id,
                        "order_id":order.id,
                    })
        return json_response({"status":1, "reviews":rating_list})
    except Exception as e:
        log.error("List user reviews: user "+str(user.id) + " : "+ e.message)
        return custom_error("Failed to list user reviews.")
