from django.http import HttpResponse
from api.models import *
import logging 
import settings
from datetime import datetime
from django.db.models import Q
from django.template.loader import render_to_string
from decorators import *
from django.core.paginator import Paginator
from django.core.files.uploadedfile import UploadedFile
log = logging.getLogger('cms_api')

def home(request):
    return HttpResponse("Welcome to Meisterdish CMS")

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
        users = User.objects.filter(deleted=False)
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
                              "profile_image" : "Not Available" if user.profile_image is None else user.profile_image.image.url,
                              "profile_image_thumb" : "Not Available" if user.profile_image is None else user.profile_image.thumb.url,
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

@check_input('POST')
def get_meals(request, data, user):
    try:
        limit = data.get('perPage', settings.PER_PAGE)
        page = data.get("nextPage",1)
                    
        meal_list = []
        meals = Meal.objects.filter(is_deleted=False)
        total_count = meals.count()
         
        if "search" in data and data['search'].strip() != '':
            search = data["search"]
            meals = meals.filter(Q(name__istartswith=search)| Q(description__istartswith=search))
        
        if "category_id" in data and str(data['category_id']) != '':
            meals = meals.filter(category__id=data["category_id"])
            
        if "type_ids" in data and len(data['type_ids']) >0:
            meals = meals.filter(types__id__in=data['type_ids'])
            
        actual_count = meals.count()
        try:
            paginator = Paginator(meals, limit)
            if page <1 or page > paginator.page_range:
                page = 1
            meals = paginator.page(page)
        except Exception as e:
            log.error("meal list pagination : " + e.message)
            custom_error("There was an error listing meals.")
        
        for meal in meals.object_list:
            meal_images = []
            for img in meal.images.all():
                meal_images.append({
                                    "id":img.id,
                                    "url":img.image.url,
                                    "thumb_url" : "Not Available" if not img.thumb else img.thumb.url,
                                    })
            ingredients = []
            for ing in meal.ingredients.all():
                ingredients.append({
                                    "id":ing.id,
                                    "name":ing.name.title()
                                    })
            meal_types = []
            for ty in meal.types.all():
                meal_types.append({
                                    "id":ty.id,
                                    "name":ty.name.title()
                                    })

            meal_list.append({
                              "id":meal.id,
                              "name":meal.name,
                              "description":meal.description,
                              "images":meal_images,
                              "available":1 if meal.available else 0,
                              "category":meal.category.name.title(),
                              "meal_types":meal_types,
                              "preparation_time":meal.preparation_time,
                              "price":meal.price,
                              "tax":meal.tax,
                              "ingredients":ingredients,
                              
                              })
        return json_response({"status":1, 
                              "aaData":meal_list,
                              "total_count":total_count,
                              "actual_count":actual_count,
                              "num_pages" : paginator.num_pages,
                              "page_range" : paginator.page_range,
                              "current_page":page,
                              "per_page" : limit,
                              })
    except Exception as e:
        log.error("Failed to list meals : "+e.message)
        return custom_error("Failed to list meals")
    
@check_input('POST', True)
def create_meal(request, data, user):
    try:
        name = data['name'].strip()
        desc = data['description'].strip()
        
        price = data['price'].strip()
        tax = data['tax'].strip()
        available = data['available']
        
        pre_req = data.get('pre_requisites', '').strip()
        user_to_do = data.get('user_to_do', '').strip()
        preparation_time = data.get('preparation_time', '').strip()
        finished_preparation = data.get('finished_preparation', '').strip()
        saved_time = data.get('preparation_time', '').strip()
        tips_and_tricks = data.get('tips_and_tricks', '').strip()

        
        if len(name) < 4 or len(desc)<10 or float(price) <=0 or float(tax) <0 :
            return custom_error("Please enter valid details.")
        
        try:
            meal = Meal.objects.get(is_deleted=False, pk=data["edit_id"])
            log.info("EDITING MEAL :"+str(data['edit_id']))
            edit=True
        except Exception as e:
            edit=False
            log.info("CREATING MEAL : "+e.message)
            meal = Meal()

        meal.name = name.title()
        meal.description = desc
        
        meal.price = price
        meal.tax = tax
        meal.available = bool(available)
        
        meal.pre_requisites = pre_req
        meal.user_to_do = user_to_do
        meal.preparation_time = preparation_time
        meal.finished_preparation = finished_preparation
        meals.saved_time = saved_time

        try:
            meal.category=Category.objects.get(is_hidden=False, is_deleted=False, pk=data['category_id'])
        except:
            return custom_error("The selected category does not exist, or is not available.")
        
        try:
            meal.type = MealType.objects.get(is_hidden=False, is_deleted=False, pk=data['filter_id'])
        except:
            return custom_error("The selected Meal Filter does not exist, or is not available.")
        
        if not edit:
            meal.save()
        else:
            meal.nutrients = []
            meal.ingredients = []
            if "remove_images" in data and len(data["remove_images"].strip()) !=0:
                try:
                    remove_images = data['remove_images'].strip().split(",")
                    for ri in remove_images:
                        meal.images.remove(ri)
                except Exception as e:
                    log.error("Edit meal : Failed to remove image" + e.message)
                    
        if 'nutrients' in data:
            for nut in data.getlist("nutrients"):
                try:
                    meal.nutrients.add(Nutrient.get(pk=int(nut)))
                except:
                    meal.delete()
                    return custom_error("Some nutrients are currently unavailable")
        
        if 'ingredients' in data:
            for ing in data.getlist('ingredients'):
                try:
                    meal.ingredients.add(Ingredient.get(pk=int(ing)))
                except:
                    meal.delete() 
                    return custom_error("Some ingredients are currently unavailable")
        
        for f in request.FILES.getlist('files'):
            wrapped_file = UploadedFile(f)
            filename = wrapped_file.name
            file_size = wrapped_file.file.size
            log.info ('meal image upload : "'+str(filename)+'"')
    
            image = Image()
            image.title=str(filename)
            image.image=f
            image.save()
            log.info('Meal image saved')
            meal.images.add(image)
        meal.save()
        return json_response({"status":1, "message":"The meal has been successfully created.", "id":meal.id})
    except IOError as e:
        log.error("Failed to create meals : "+e.message)
        return custom_error("Failed to create meal. Please try again later.")
    
@check_input('POST', True)
def delete_meal(request, data, user, meal_id):
    try:
        meal = Meal.objects.get(is_deleted=False, pk=meal_id)
        meal.is_deleted=True
        meal.save()
        return json_response({"status":1, "message":"Deleted Meal", "id":meal_id})
    except Exception as e:
        log.error("Failed to delete meal : "+e.message)
        return json_response({"status":-1, "message":"Failed to delete meal. Does that exist?"})
