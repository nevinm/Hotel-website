from meisterdish_server.models import *
import logging, md5, settings 
from datetime import datetime, date as dt
from django.db.models import Q
from decorators import *
from django.core.paginator import Paginator
from libraries import export_csv, manage_image_upload
log = logging.getLogger('cms')

def home(request):
    return HttpResponse("Welcome to Meisterdish CMS")

@check_input('POST')
def login(request, data):
    try:
        email = data['username'].strip()
        valid = False
        
        
        password = data['password'].strip()
        remember = str(data['remember']).strip()
        if email == '' or password == '':
            log.error("Empty email or password.")
            raise Exception("Invalid email or password")
        
        user = User.objects.get(email__iexact=email, deleted=False)
            
        if md5.new(password).hexdigest() == user.password:
            valid = True
            if user.role.id in [settings.ROLE_GUEST, settings.ROLE_USER]:
                return custom_error("You are not authorized to login here.")
            elif not user.is_active:
                return custom_error("The user is not active")
        else:
            return custom_error("Invalid email or password.")
                
        
        if valid:
            log.info(user.email + "logged in at admin panel")
            
                
            user_dic = {"id":user.id,
                              "email":user.email,
                              "first_name":user.first_name.title(),
                              "last_name":user.last_name.title(),
                              "role" : user.role.id,
                              }
            
            session_key = request.META.get('HTTP_SESSION_KEY', None)
            if session_key :
                session = SessionStore(session_key=session_key)
                log.info("Logging in to guest session")
            else:
                session = SessionStore()
            
            session["user"] = user_dic
            if str(remember) == "1":
                session.set_expiry = 0
            else:
                session.set_expiry = settings.SESSION_EXPIRY
            session.save()

            log.info(email+" logged in ..")
            return json_response({"status":1, "message": "Logged in succesfully", "user":user_dic, "session_key":session.session_key, "role_name":user.role.name.upper()})
        else:
            log.error("Login failed")
            raise Exception("Login failed. Please try again later.")
    
    except Exception as e:
        log.error("Login : " + e.message)
        return json_response({"status":-1, "message": "Login failed. Please try again later."})

@check_input('POST')
def logout(request, data):
    if 'HTTP_SESSION_KEY' not in request.META:
        log.error("API:logout, Invalid session.")
        response = {'status': -1, "message": "Invalid session."}
    else:
        session = SessionStore(session_key=request.META['HTTP_SESSION_KEY'])
        if 'user' in session:
            del session['user']
        session.flush()
        log.info("API:logout, success")
        response = {'status': 1, "message" : "Successfully logged out"}
    return json_response(response)

@check_input('POST', True)
def get_categories(request, data, user):
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
        
        cat_list = [{"id":cat.id, "name":cat.name} for cat in cats.object_list]
        
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

@check_input('POST')
def get_categories_filters(request, data, user):
    try:
        cats = Category.objects.filter(is_hidden=False, is_deleted=False).order_by("name")
        cat_list = [{"id":cat.id, "name":cat.name.title()} for cat in cats]
        
        #Meal Types / Filters
        types = MealType.objects.filter(is_hidden=False, is_deleted=False)
        type_list = [{"id":type.id, "name":type.name.title()} for type in types]
        
        return json_response({"status":1, "categories":cat_list, "meal_types":type_list})
    except Exception as e:
        log.error("get categories +filters: " + e.message)
        return custom_error("Failed to list categories and meal filters")

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
        
    except Exception as e:
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

@check_input('POST', settings.ROLE_ADMIN)
def upload_image(request, data, user):
    try:
        response = manage_image_upload(request)
        if response is None:
            return custom_error("There was an error uploading image. Please try again later.")

        return json_response(response)
    except Exception as e:
        log.error("Failed to upload image : " + e.message)
        return custom_error("Failed to upload image. Please try again later.")

@check_input('POST', True)
def delete_image(request, data, user, pk):
    try:
        image = Image.objects.get(pk=pk).delete()
        return json_response({"status":1, "message":"Deleted image", "id":pk})
    except Exception as e:
        log.error("Failed to delete image " + e.message)
        return custom_error("Failed to delete image. Please try again later.")

@check_input('POST', settings.ROLE_ADMIN)
def export_users(request, data, user):
    try:
        users = User.objects.exclude(role__pk=settings.ROLE_GUEST).filter(deleted=False)
        
        if "new" in data and data["new"]==1:
            today = dt.today()
            users = users.filter(created__year=today.year, created__month=today.month, created__day=today.day)

        if "search" in data:
            search = data["search"]
            users = users.filter(Q(first_name__istartswith=search)| Q(last_name__istartswith=search))
        users = users.order_by('-id')
        users_list = [[
            'Name',
            "Role",
            'Email',
            'Mobile',
            'Credits',
            'Activation Status',
        ]]
        for user in users:
            users_list.append([
                (user.first_name + " "+ user.last_name).title(),
                settings.ROLE_DIC[user.role.pk],
                user.email,
                "Not Available" if not user.mobile or str(user.mobile).strip() == "" else user.mobile,
                "$ "+str(user.credits),
                "Active" if user.is_active else "Inactive",
            ])
        return export_csv(users_list, "users_list.csv")
    except Exception as e:
        log.error("Export User list "+ e.message)
        return HttpResponseRedirect(settings.SITE_URL + "views/admin/userlist.html")
