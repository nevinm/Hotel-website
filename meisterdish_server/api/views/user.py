from django.http import HttpResponse, HttpResponseNotAllowed, HttpResponseRedirect
from meisterdish_server.models import *
import json as simplejson
import logging 
import settings
from api.views.decorators import *
from libraries import validate_zipcode, validate_phone, check_delivery_area, validate_email, mail, add_to_mailing_list,\
    send_referel_mail
import stripe
from datetime import datetime, timedelta
from django.template.loader import render_to_string
from django.utils.html import escape

stripe.api_key = settings.STRIPE_SECRET_KEY
log = logging.getLogger(__name__)

@check_input('POST')
def add_address(request, data, user):
    try:
        fname = escape(data["first_name"]).strip()
        lname = escape(data["last_name"]).strip()
        street = escape(data["street"]).strip()
        building = escape(data["building"]).strip()
        city_id = data["city_id"]
        state_id = data["state_id"]
        zip = data["zip"].strip()
        phone = data["phone"].strip()
        email = data.get("email", False)

        if not check_delivery_area(zip):
            return custom_error("Delivery is not available at this location. Please choose a different zip code.")
        
        is_primary = False
        if "is_primary" in data and data["is_primary"]:
            is_primary = True
        elif not Address.objects.filter(user=user, is_primary=True).exists():
            is_primary = True
        
        is_business = False
        if "is_business" in data and str(data["is_business"]) != '':
            is_business = True
            company = data['company'].strip()
        
        if not validate_zipcode(zip):
            return custom_error("Please provide a valid zip code.")
        elif not validate_phone(phone):
            return custom_error("Please provide a valid phone number.")
        elif email and email.strip() == "" or not validate_email(email):
            return custom_error("Invalid email address.")

        add = Address()
        add.is_primary = is_primary
        add.is_business = is_business
        if add.is_business:
            add.company = company
        add.user = user
        
        add.first_name = fname
        add.last_name = lname
        add.street = street
        add.building = building
        add.city = city_id.strip().title()
        add.state = State.objects.get(pk=state_id)
        add.zip = zip
        add.phone = phone
        if email:
            add.email = email
        elif user.role == settings.ROLE_USER:
            add.email = user.email
        else:
            return custom_error("Please enter email.")
        add.save()
        
        if add.id and is_primary:
            try:
                primary = Address.objects.exclude(id=add.id).get(user=user, is_primary=True)
            except:
                pass
            else:
                primary.is_primary = False
                primary.save()
        return json_response({"status":1, "message":"Added Address", "id":add.id})
    except Exception as e:
        log.error("Add address failed: " + e.message)
        return custom_error("Failed to add address : " + e.message)

@check_input('POST')
def update_address(request, data, user, address_id):
    try:
        try:
            add = Address.objects.get(id=address_id, user=user)
        except Exception as e:
            log.error("Updated address " + e.message)
            return custom_error("You are not authorized to modify this address.")
        
        if 'first_name' in data:
            fname = data["first_name"].strip()
            lname = data["last_name"].strip()
            street = data["street"].strip()
            building = data["building"].strip()
            
            city_id = data["city_id"].strip().title()
            state_id = data["state_id"]

            zip = data["zip"].strip()
            phone = data["phone"].strip()
            email = data["email"].strip()
            
            if not validate_zipcode(zip):
                return custom_error("Please provide a valid zip code.")
            elif not validate_phone(phone):
                return custom_error("Please provide a valid phone number.")
            elif not validate_email(email):
                return custom_error("Please provide a valid email.")

            add.first_name = fname
            add.last_name = lname
            add.street = street
            add.building = building
            add.city = city_id
            add.state = State.objects.get(id=state_id)
            add.zip = zip
            add.phone = phone
            add.email = email
            
        if "is_primary" in data and data["is_primary"]:
            add.is_primary = True
        elif not Address.objects.exclude(id=add.id).filter(user=user, is_primary=True).exists():
            add.is_primary = True
        else:
            add.is_primary = False

        if "is_business" in data and str(data['is_business']) != '':
            add.is_business = bool(data['is_business'])
            add.company = data['company'].strip()
        
        add.save()
        
        if add.id and add.is_primary:
            try:
                primary = Address.objects.exclude(id=add.id).get(user=user, is_primary=True)
            except:
                pass
            else:
                primary.is_primary = False
                primary.save()
                
        return json_response({"status":1, "message":"Updated Address", "id":add.id})
    except Exception as e:
        log.error("update address failed : " + e.message)
        return custom_error("Failed to update address. ")
    except Exception as e:
        log.error("update address failed: " + e.message)
        return custom_error("Failed to update address : " + e.message)

@check_input('POST')
def remove_address(request, data, user):
    try:
        address_id = data['id']
        add = Address.objects.get(id=address_id)
        if add.user.id != user.id:
            return custom_error("You are not auhorized to delete this address")
        add.delete()

        adds = Address.objects.filter(user=user, is_primary=False)
        if adds.count() > 0:
            adds[0].is_primary = True
            adds[0].save()
        return json_response({"status":1, "message":"Successfully Deleted Address.", "id":address_id})
    except Exception as e:
        log.error("Failed to delete Address : " + e.message)
        return custom_error("Failed to remove address")

@check_input('POST')
def get_categories(request, data):
    try:
        cats = Category.objects.filter(is_hidden=False, is_deleted=False).order_by("name")
        cat_list = [{"id":cat.id, "name":cat.name.title()} for cat in cats]
        
        # Meal Types / Filters
        types = MealType.objects.filter(is_hidden=False, is_deleted=False)
        type_list = [{"id":type.id, "name":type.name.title()} for type in types]
        
        return json_response({"status":1, "categories":cat_list, "meal_types":type_list})
    except Exception as e:
        log.error("get categories +filters: " + e.message)
        return custom_error("Failed to list categories and meal filters")
    
@check_input('POST')
def add_rating(request, data, user, meal_id):
    try:
        order = Order.objects.get(id=data['order_id'], cart__cartitem__meal__pk=meal_id, cart__user=user)
        
        if order.created < datetime.now() - timedelta(days=30):
            custom_error("You cannot add reviews after 30 days from the date of order.")

        if not order.cart.completed or order.status < 4:
            custom_error("You cannot add reviews to an order that is not complete.")
        try:
            rating = MealRating.objects.get(order=order, meal__pk=meal_id)
            return custom_error("You have already added rating for this meal")
        except MealRating.DoesNotExist:
            if data.has_key('rating'):                
                rating = MealRating()
                rating.meal = Meal.objects.get(pk=meal_id)
                rating.order = order
                rating.rating = data['rating']
                rating.comment = escape(data['comment']).strip()
                rating.save()
                return json_response({"status":1, "message":"Successfully added rating.", "order_id":data['order_id'], "meal_id":meal_id})
            else:
                return custom_error("Please rate this meal from 1 to 5 stars")
    except Exception as e:
        log.error("Add rating " + e.message)
        return custom_error("You are not authorized rate this meal/order.")
         
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
                description="meisterdish_user_" + str(user.id)
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
            c_card.number = '#### #### #### ' + str(card.last4)
            c_card.funding = card.funding
            c_card.expire_year = card.exp_year
            c_card.expire_month = card.exp_month
            c_card.card_type = card.brand
            c_card.save()
            return json_response({"status":1, "message":"Successfully saved credit card details.", "id":c_card.id})
        else:
            return custom_error("Failed to save card details.")
    except Exception as e:
        log.error("Save CC: user" + str(user.id) + " : " + e.message)
        return custom_error("Failed to save credit card details.")

         
@check_input('POST')
def update_credit_card(request, data, user, card_id):
    try:
        
        if user.stripe_customer_id and str(user.stripe_customer_id).strip() != "":
            customer = stripe.Customer.retrieve(user.stripe_customer_id)
        else:
            return custom_error("You have no cards saved in your account.")
        
        card_obj = CreditCardDetails.objects.get(pk=card_id)
        card = customer.sources.retrieve(card_obj.card_id)

        if "name" in data and data["name"].strip() != "":
            card.name = data["name"].strip()

        if "exp_month" in data:
            card.exp_month = data["exp_month"]
            card_obj.expire_month = data["exp_month"]
        if "exp_year" in data:
            card.exp_year = data["exp_year"]
            card_obj.expire_year = data["exp_year"]

        if card.save():
            card_obj.save()
            return json_response({"status":1, "message":"Successfully updated credit card details.", "id":card_obj.id})
        else:
            return custom_error("Failed to update card details.")
    except Exception as e:
        log.error("Save CC: user" + str(user.id) + " : " + e.message)
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
            return json_response({"status":1, "message":"Successfully deleted saved card."})
        else:
            return custom_error("Failed to delete card details. Please try again later.")
    except Exception as e:
        log.error("Delete CC: user " + str(user.id) + " : " + e.message)
        return custom_error("Failed to delete credit card details.")

@check_input('POST')
def get_saved_cards(request, data, user):
    try:
        cards_list = []

        cards = CreditCardDetails.objects.filter(user=user)
        if "card_id" in data and data["card_id"]:
            cards = cards.filter(pk=data["card_id"])
            
        for card in cards:
            cards_list.append({
                "id": card.id,
                "card_id" : card.card_id,
                "number" : card.number,
                "expire_month" : card.expire_month,
                "expire_year" : card.expire_year,
                "type" : card.card_type,
                "logo" : settings.STATIC_URL + "default/" + card.card_type.lower().replace(" ", "_") + ".png",
                })
        return json_response({"cards":cards_list, "status":1})
    except Exception as e:
        log.error("List CC: user " + str(user.id) + " : " + e.message)
        return custom_error("Failed to list saved cards.")

@check_input('POST')
def get_user_reviews(request, data, user):
    try:
        orders = Order.objects.filter(cart__user__pk=user.pk, status=3, created__gte=datetime.now() - timedelta(days=30)).order_by('created')
        if 'order_id' in data:
            orders = orders.filter(pk=data['order_id'])

        rating_list = []
        meals_list = []
        for order in orders:
            meals = Meal.objects.filter(cartitem__cart__order=order)
            for meal in meals:
                try:
                    rating = MealRating.objects.get(meal=meal, order=order, is_deleted=False)
                except Exception as e:
                    log.error("Rating list error :" + e.message)
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
                    if meal.id not in [i['meal_id'] for i in rating_list]:
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
        log.error("List user reviews: user " + str(user.id) + " : " + e.message)
        return custom_error("Failed to list user reviews.")

@check_input('POST')
def share_via_email(request, data, user):
    try:
        if user.role.id != ROLE_USER:
            return custom_error("Please Sign up to get free credits by sharing.")

        email = data["email"].strip()
        if not validate_email(email):
            return custom_error("The email is invalid.")

        sub = "Start cooking with Meisterdish"
        dic = {
            "link" : settings.SITE_URL + 'share/' + user.referral_code + '/',
            "amount" : int(Configuration.objects.get(key="REFERRAL_BONUS").value) / 2,
            "to_email" : email,
            "site_url":settings.SITE_URL,
        }
        msg = render_to_string('referral_email.html', dic)
        send_referel_mail([email], sub, msg)

        return json_response({"status":1, "message":"Email has been sent to " + email})
    except Exception as e:
        log.error("Share via email " + str(user.id) + " : " + e.message)
        return custom_error("An error has occurred while sending e-mail. Please try again later.")        


@check_input('POST')
def save_email(request, data):
    try:
        email = data["email"].strip()
        zip = str(data["zipcode"]).strip()  
        if not validate_email(email):
            return custom_error("Please enter a valid email.")
        elif not validate_zipcode(zip):
            return custom_error("Please enter a valid zip code.")
        added = add_to_mailing_list(email, zip)
        if added:
            log.info("Added email to list")
        else:
            log.info("Failed to add email to list")
        return json_response({"status":1, "message":"Your email has been recorded. You will be notified when delivery becomes available at your location."})
    except mailchimp.ListAlreadySubscribedError:
        log.info("Email already added to list")
        return json_response({"status":1, "message":"Your email has already been recorded. You will be notified when delivery becomes available at your location."})
    except KeyError as e:
        log.error("Save email :" + e.message)
        return custom_error("An error has occurred. Please try again later.")
    except Exception as e:        
        return custom_error(e.message)
    
