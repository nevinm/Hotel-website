from django.http import HttpResponse, HttpResponseNotAllowed
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

log = logging.getLogger('cms_api')


def home(request):
    return HttpResponse("Welcome to Meisterdish CMS")

@check_input('POST', True)
def get_categories(request, data):
    try:
        if 'search' in data:
            search = str(data['search']).strip()
            cats = Category.objects.filter(name__startswith=search)
        else:
            cats = Category.objects.all()
        
        cat_list = []
        for cat in cats:
            cat_list.append({"id":cat.id, "name":cat.name})
        
        if not len(cat_list):
            return json_response({"status":-1, "message":"There are no categories to list."})
        return json_response({"status":1, "message":"Category list", "categories":cat_list})
    except Exception as e:
        log.error("Failed to return category list : "+e.message)
        return json_response({"status":-1, "message":"Failed to retrieve category list"})

@check_input('POST', True)
def add_category(request, data):
    try:
        cat_name = data['category'].strip()
        try:
            cat = Category.objects.get(name__iexact=cat)
        except:
            cat = Category()
            cat.name = cat_name
            cat.save()

        return json_response({"status":1, "message":"Added Category", "id":cat.id})
    except Exception as e:
        log.error("Failed to add category : "+e.message)
        return json_response({"status":-1, "message":"Failed to add category"})

@check_input('POST', True)
def remove_category(request, data):
    try:
        if "category" in data:
            cat = Category.objects.get(name__iexact=str(data['category']).strip())
        elif "id" in data:
            cat = Category.objects.get(id=str(data['id']).strip())
            
        cat.delete()
        return json_response({"status":1, "message":"Removed Category"})
    except Exception as e:
        log.error("Failed to remove category : "+e.message)
        return json_response({"status":-1, "message":"Failed to remove category"})

@check_input('POST', True)
def get_users(request, data):
    try:
        limit = settings.PER_PAGE
        
        user_list = []
        users = User.objects.all()
        total_count = users.count()
         
        if "search" in data:
            search = data["search"]
            users = users.filter(Q(first_name__istartswith=search)| Q(last_name__istartswith=search))
        
        display_count = users.count()
        
        for user in users:
            user_list.append({
                              "id" : user.id,
                              "name" : (user.last_name + " "+ user.first_name).title(),
                              "email" : user.email,
                              "mobile" : user.mobile,
                              "profile_image" : settings.MEDIA_URL + str(user.profile_image),
                              "is_admin":True if user.role.id == 1 else False,
                              "credits" : user.credits,
                              })
        
        return json_response({
                              "aaData":user_list, 
                              "iTotalRecords":total_count, 
                              "iTotalDisplayRecords":display_count,
                              "sEcho":"",
                              
                              })
    except Exception as e:
        log.error("User list "+ e.message)
        return json_response({"aaData":[], 
                              "iTotalRecords":0, 
                              "iTotalDisplayRecords":0,
                              "sEcho":"",})
    
def json_response(response, wrap=False):
    if (wrap == True):
        final_response = {"data" : response}
    else:
        final_response = response
    header_res = HttpResponse(simplejson.dumps(final_response))
    return header_res

def custom_error(message):
    return json_response({'status' : -1, 'message' : message})


