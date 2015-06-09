from django.http import HttpResponse
from meisterdish_server.models import *
import logging 
import settings
from datetime import datetime
from django.db.models import Q
from decorators import *
from django.core.paginator import Paginator

log = logging.getLogger('cms')

def home(request):
    return HttpResponse("Welcome to Meisterdish CMS")
    
@check_input('POST', True)
def get_categories(request, data, user=None):
    try:
        limit = settings.PER_PAGE
        page = 1
        if "nextPage" in data and int(data["nextPage"]) >0:
            page = data["nextPage"]
            
        cats = Category.objects.filter(is_deleted=False).order_by("name")
        total_count = cats.count()
        
        if 'search' in data:
            search = str(data['search']).strip()
            cats = cats.filter(name__startswith=search)
        
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
        return custom_error("Failed to retrieve category list")

@check_input('POST', True)
def add_category(request, data, user):
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
def remove_category(request, data, user):
    try:
        if "category" in data:
            cat = Category.objects.get(name__iexact=str(data['category']).strip())
        elif "id" in data:
            cat = Category.objects.get(id=str(data['id']).strip())
            
        cat.is_deleted=True
        cat.save()
        return json_response({"status":1, "message":"Removed Category"})
    except Exception as e:
        log.error("Failed to remove category : "+e.message)
        return json_response({"status":-1, "message":"Failed to remove category"})

@check_input('POST', True)
def update_category(request, data, user):
    try:
        name = data["category"].strip()
        id = data["id"]
        try:
            cat = Category.objects.get(name__iexact=name)
            return custom_error("Category name already exists")
        except:
            cat = Category.objects.get(id=id)
            cat.name = name
            cat.save()
            return json_response({"status":1, "message":"Updated Category"})
    except Exception as e:
        log.error("Failed to update category : "+e.message)
        return json_response({"status":-1, "message":"Failed to update category"})
    
@check_input('POST', True)
def get_users(request, data, user):
    try:
        limit = settings.PER_PAGE
        
        page = data.get("nextPage", 1)
        user_list = []
        users = User.objects.exclude(role__pk=settings.ROLE_GUEST).filter(deleted=False)
        total_count = users.count()
         
        if "search" in data:
            search = data["search"]
            users = users.filter(Q(first_name__istartswith=search)| Q(last_name__istartswith=search))
        
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
                              "mobile" : "Not Available" if not user.mobile or str(user.mobile).strip() == "" else user.mobile,
                              "profile_image" : settings.DEFAULT_USER_IMAGE if user.profile_image is None else user.profile_image.image.url,
                              "profile_image_thumb" : settings.DEFAULT_USER_IMAGE if user.profile_image is None else user.profile_image.thumb.url,
                              "is_admin": "Yes" if user.role.id == 1 else "No",
                              "credits" : "$ "+str(user.credits),
                              "is_active": user.is_active,
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

@check_input('POST', True)
def delete_user(request, data, session_user):
    try:
        user = User.objects.get(id=str(data['id']).strip())
        user.deleted = True
        user.save()
        return json_response({"status":1, "message":"Deleted user"})
    except Exception as e:
        log.error("Failed to remove user : "+e.message)
        return custom_error("Failed to delete user")
    
@check_input('POST', True)
def update_user(request, data, session_user):
    try:
        id = data['id']
        mobile = data['mobile'].strip()
        first_name = data['first_name'].strip()
        last_name = data['last_name'].strip()
        
        user = User.objects.get(id=id)
        user.first_name = first_name
        user.last_name = last_name
        user.mobile = mobile
        user.save()
        return json_response({"status":1, "message":"Updated user"})
    except Exception as e:
        log.error("Failed to update user : "+e.message)
        return custom_error("Failed to update user")

@check_input('POST', True)
def change_user_status(request, data, session_user):
    try:
        id = data['id']
        status = data['is_active']
        user_status = True if status == 1 else False
        user = User.objects.get(id=id)
        user.is_active = user_status
        user.save()
        msg = "Activated user" if user.is_active else "Deactivated user."
        return json_response({"status":1, "is_active":user.is_active, "message" : msg})
    except Exception as e:
        log.error("Failed to change user status : "+e.message)
        return custom_error("Failed to change user status")

@check_input('POST', True)
def delete_image(request, data, user, pk):
    try:
        image = Image.objects.get(pk=pk).delete()
        return json_response({"status":1, "message":"Deleted image", "id":pk})
    except Exception as e:
        log.error("Failed to delete image " + e.message)
        return custom_error("Failed to delete image. Please try again later.")
