from django.http import HttpResponse, HttpResponseNotAllowed, HttpResponseRedirect
from django.contrib.sessions.backends.db import SessionStore
from api.models import *
import json as simplejson
import md5
import logging 
import settings
from datetime import datetime
from django.db.models import Q
from django.template.loader import render_to_string
from decorators import *

log = logging.getLogger('api_user')

@check_input('POST')
def add_address(request, data):
    try:
        session = SessionStore(session_key=request.META['HTTP_SESSION_KEY'])
        user = User.objects.get(pk=session['user']['id'])
    
        name = data["name"].strip()
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
        add.name = name
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
def update_address(request, data, id):
    try:
        session = SessionStore(session_key=request.META['HTTP_SESSION_KEY'])
        user = User.objects.get(pk=session['user']['id'])
    
        name = data["name"].strip()
        street = data["street"].strip()
        building = data["building"].strip()
        city_id = data["city_id"]
        zip = data["zip"].strip()
        phone = data["phone"].strip()
        is_primary = False
        if "is_primary" in data and data["is_primary"]:
            is_primary = True
        
        try:
            add = Address.objects.get(id=id, user=user)
            add.user = user
        except Exception as e:
            log.error("Updated address "+e.message)
            return custom_error("You are not authorized to modify this address.")
        
        add.name = name
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
def remove_address(request, data):
    try:
        session = SessionStore(session_key=request.META['HTTP_SESSION_KEY'])
        
        address_id = data['id']
        add = Address.objects.get(id=address_id)
        if add.user.id != session['user']['id']:
            return custom_error("You are not auhorized to delete this address")
        add.delete()
        return json_response({"status":1, "message":"Deleted Address and related entries."})
    except Exception as e:
        log.error("Failed to delete Address : "+e.message)
        return custom_error("Failed to remove address")

def custom_error(message):
    return json_response({'status' : -1, 'message' : message})
