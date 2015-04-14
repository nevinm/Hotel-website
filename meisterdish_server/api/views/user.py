from django.http import HttpResponse, HttpResponseNotAllowed, HttpResponseRedirect
from api.models import *
import json as simplejson
import logging 
import settings
from decorators import *
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
def get_categories(request, data, user):
    try:
        cats = Category.objects.filter(is_hidden=False, is_deleted=False)
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
    
