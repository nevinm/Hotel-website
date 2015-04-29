from django.http import HttpResponse, HttpResponseNotAllowed, HttpResponseRedirect
from api.models import *
import json as simplejson
import logging 
import settings
from decorators import *
from libraries import validate_zipcode, validate_phone, card
import paypalrestsdk
from datetime import datetime

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
def redeem_gift_card(request, data, user):
    try:
        code = data["code"].strip()
        try:
            gift_card = user.gift_cards.get(code=code)
        except Exception as e:
            return custom_error("Invalid gift card code entered.")
        else:
            credits = gift_card.credits
            user.credits = user.credits + credits
            user.gift_cards.remove(gift_card)
            user.save()
            gift_card.delete()
        return json_response({"status":1, "message": " Success, $"+str(credits) +" have been added to your credits."})
    except Exception as e:
        log.error("Redeem gift card error : " + e.message)
        return custom_error("Failed to redeem gift card ")

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
        order = Order.objects.get(pk=data['order_id'], cart__cartitem__meal__pk=meal_id, cart__user=user)
        if order.status != 4:
            custom_error("The order is not complete. Please complete the order before rating.")
        rating = MealRating()
        rating.order = order
        rating.rating = data['rating']
        rating.comment = data['comment'].strip()
        rating.save()
        return json_response({"status":1, "message":"Successfully added rating.", "order_id":data['order_id'], "meal_id":meal_id})
    except Exception as e:
        log.error("Add review" + e.message)
        return custom_error("Your are not authorized rate this meal/order.")

@check_input('POST')
def get_meal_details(request, data, user, meal_id):
    try:
        meal = Meal.objects.get(pk=meal_id, is_deleted=False)
        rating_list = []
        for rating in  meal.mealrating.all():
            rating_list.append({
                "rating:":rating.rating,
                "review":rating.comment,
                "user_first_name":rating.order.cart.user.first_name,
                "user_last_name":rating.order.cart.user.last_name,
                "user_image": settings.DEFAULT_USER_IMAGE if not rating.order.cart.user.profile_image else rating.order.cart.user.profile_image.thumb.url,
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
            "chef_image" : settings.DEFAULT_USER_IMAGE if not meal.chef or not meal.chef.image else {
                "id":meal.chef.image.id,
                "url":meal.chef.image.thumb.url,
                },
            "user_to_do" : "" if meal.user_to_do.strip() == "" else simplejson.loads(meal.user_to_do),
            "preparation_time" : meal.preparation_time,

            "finished_preparation" : "" if meal.finished_preparation.strip() == "" else simplejson.loads(meal.finished_preparation),
            "saved_time" : meal.saved_time,

            "pre_requisites" : "" if meal.pre_requisites == "" else simplejson.loads(meal.pre_requisites),
            "pre_requisites_image" : settings.DEFAULT_MEAL_IMAGE if meal.pre_requisites_image is None else {
                    "id":meal.pre_requisites_image.id,
                    "url":meal.pre_requisites_image.image.url,
                    },

            "nutrients" : "" if meal.nutrients == "" else simplejson.loads(meal.nutrients),
            "ingredients" : "" if meal.ingredients == "" else simplejson.loads(meal.ingredients),
            "ingredients_image" : settings.DEFAULT_MEAL_IMAGE if meal.ingredients_image is None else {
                                                        "id" : meal.ingredients_image.id,
                                                        "url" : meal.ingredients_image.image.url
                                                        },
            "tips" : tips_list,
            "allergy_notice" : meal.allergy_notice,
            "images" : image_list,
            "ratings" : rating_list,
            "main_image" : settings.DEFAULT_MEAL_IMAGE if not meal.main_image else {
                "id":meal.main_image.id,
                "url":meal.main_image.image.url,
            }
        })
    except Exception as e:
        log.error("get_meal details : " + e.message)
        return custom_error("Failed to get the meal details.")

@check_input('POST')
def list_credit_cards(request, data, user):
    try:
        cards_list = []
        for card in CreditCardDetails.objects.filter(user=user):
            cards_list.append({
                "id": card.id,
                "card_id" : card.card_id,
                "number" : card.number,
                "expire_month" : card.expire_month,
                "expire_year" : card.expire_year,
            })
        return json_response({"status":1, "cards":cards_list})
    except Exception as e:
        log.error("List CC: user"+str(user.id) + " : "+ e.message)
        return custom_error("Failed to list credit cards.")
         
@check_input('POST')
def save_credit_card(request, data, user):
    try:
        num = int(str(data["number"]).strip())
        exp_month = int(str(data["exp_month"]).strip())
        exp_year = int(str(data["exp_year"]).strip())
        cvv2 = int(str(data["cvv2"]).strip())
        fname = str(data["first_name"]).strip()
        lname = str(data["last_name"]).strip()
        
        # Create a card
        cc = card.Card(
            number=num,
            month=exp_month,
            year=exp_year,
            cvc=cvv2,
            holder = fname
        )

        if not cc.is_valid or cc.is_expired:
            log.error("User : " + user.email + ": Credit Card : valid? "+str(cc.is_valid) + " , expired? "+str(cc.is_expired))
            return custom_error("Please enter valid card details.")
        
        credit_card = paypalrestsdk.CreditCard({
            "type": cc.brand,
            "number": num,
            "expire_month": exp_month,
            "expire_year": exp_year,
            "cvv2": cvv2,
            "first_name": fname,
            "last_name": lname
            })
        credit_card.create()
        if credit_card.get("status") != 'ok':
            return custom_error("Failed to save credit card details.")

        c_card = CreditCardDetails()
        c_card.user = user
        c_card.card_id = credit_card.id
        c_card.number = credit_card.number
        c_card.cvv2 = credit_card.cvv2
        c_card.card_type = credit_card.type
        c_card.save()
    except Exception as e:
        log.error("Save CC: user"+str(user.id) + " : "+ e.message)
        return custom_error("Failed to save credit card details.")

@check_input('POST')
def delete_credit_card(request, data, user, id):
    try:
        card = CreditCardDetails.objects.get(pk=id)
        card_id = card.card_id
    except Exception as e:
        log.error("Delete CC: user"+str(user.id) + " : "+ e.message)
        return custom_error("Failed to delete credit card details.")
