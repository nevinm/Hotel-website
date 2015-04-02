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
from django.core.paginator import Paginator
log = logging.getLogger('cms_api')


def home(request):
    return HttpResponse("Welcome to Meisterdish CMS")

@check_input('POST', True)
def get_categories(request, data):
    try:
        limit = settings.PER_PAGE
        page = 1
        if "nextPage" in data and type(data["nextPage"]) == type(2):
            page = data["nextPage"]
            
        cats = Category.objects
        total_count = cats.count()
        
        if 'search' in data:
            search = str(data['search']).strip()
            cats = cats.filter(name__startswith=search)
        else:
            cats = cats.all()
            
        actual_count = cats.count()
        if actual_count == 0:
            return custom_error("There are no categories to list.")
        
        try:
            paginator = Paginator(cats, limit)
            if page <1 or page > paginator.page_range:
                page = 1
            cats = paginator.page(page)
        except Exception as e:
            log.error("category list pagination : " + e.message)
            custom_error("There was an error listing categories.")
        
        cat_list = []
        for cat in cats.object_list:
            cat_list.append({"id":cat.id, "name":cat.name})
        
        return json_response({
                              "status":1,
                              "aaData": cat_list,
                              "total_count":total_count,
                              "actual_count":actual_count,
                              "num_pages" : paginator.num_pages,
                              "page_range" : paginator.page_range,
                              "current_page":page,
                              "per_page" : limit,
                              })
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
        page = 1
        if "nextPage" in data and type(data["nextPage"]) == type(2):
            page = data["nextPage"]
                    
        user_list = []
        users = User.objects
        total_count = users.count()
         
        if "search" in data:
            search = data["search"]
            users = users.filter(Q(first_name__istartswith=search)| Q(last_name__istartswith=search))
        else:
            users = users.all()
        actual_count = users.count()
        try:
            paginator = Paginator(users, limit)
            if page <1 or page > paginator.page_range:
                page = 1
            users = paginator.page(page)
        except Exception as e:
            log.error("user list pagination : " + e.message)
            custom_error("There was an error listing users.")
        
        for user in users.object_list:
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
                              "status":1,
                              "aaData": user_list,
                              "total_count":total_count,
                              "actual_count":actual_count,
                              "num_pages" : paginator.num_pages,
                              "page_range" : paginator.page_range,
                              "current_page":page,
                              "per_page" : limit,
                              })
        
    except KeyError as e:
        log.error("User list "+ e.message)
        return custom_error("Failed to retrieve users list.")

#For data table
@check_input('POST', True)
def get_users_2(request, data):
    try:
        limit = settings.PER_PAGE
        page = 1
        if "nextPage" in data and type(data["nextPage"]) == type(2):
            page = data["nextPage"]
                    
        user_list = []
        users = User.objects
        total_count = users.count()
         
        if "search" in data:
            search = data["search"]
            users = users.filter(Q(first_name__istartswith=search)| Q(last_name__istartswith=search))
        else:
            users = users.all()
        actual_count = users.count()
        try:
            paginator = Paginator(users, limit)
            if page <1 or page > paginator.page_range:
                page = 1
            users = paginator.page(page)
        except Exception as e:
            log.error("user list pagination : " + e.message)
            custom_error("There was an error listing users.")
        
        for user in users.object_list:
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
                              "aaData": user_list,
                              "iTotalRecords":total_count,
                              "iTotalDisplayRecords":actual_count,
                              "sEcho":"",
                              #"status":1,
                              #"total_count":total_count,
                              #"actual_count":actual_count,
                              #"num_pages" : paginator.num_pages,
                              #"page_range" : paginator.page_range,
                              #"current_page":page,
                              #"per_page" : limit,
                              
                              })
        
    except KeyError as e:
        log.error("User list "+ e.message)
        return custom_error("Failed to retrieve users list.")
    
def json_response(response, wrap=False):
    if (wrap == True):
        final_response = {"data" : response}
    else:
        final_response = response
    header_res = HttpResponse(simplejson.dumps(final_response))
    return header_res

def custom_error(message):
    return json_response({'status' : -1, 'message' : message})


