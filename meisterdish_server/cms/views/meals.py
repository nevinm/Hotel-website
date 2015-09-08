from meisterdish_server.models import *
import json as simplejson
import logging, settings

from django.db.models import Q
from django.template.loader import render_to_string
from cms.views.decorators import *
from django.core.paginator import Paginator
from django.core.files.uploadedfile import UploadedFile
from libraries import get_request_user

log = logging.getLogger(__name__)

@check_input('POST', settings.ROLE_ADMIN)
def get_meals(request, data, user):
    try:
        user = get_request_user(request)

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
            
        if "type_ids" in data and len(data['type_ids']) >0 and str(data['type_ids']) != '':
            meals = meals.filter(types__id__in=data['type_ids'])
        
        meals = meals.order_by("order", 'name')

        actual_count = meals.count()
        try:
            paginator = Paginator(meals, limit)
            if page <1 or page > paginator.page_range:
                page = 1
            meals = paginator.page(page)
        except Exception as e:
            log.error("meal list pagination : " + e.message)
            custom_error("There was an error listing meals.")
        
        try:
            home_meal = Configuration.objects.get(key='home_meal_id').value
        except Configuration.DoesNotExist:
            home_meal = None

        for meal in meals:
            """
            meal_images = []
            for img in meal.images.all():
                meal_images.append({
                                    "id":img.id,
                                    "url":img.image.url,
                                    "thumb_url" : settings.DEFAULT_MEAL_IMAGE if not img.thumb else img.thumb.url,
                                    })

                                    
            """
            ings = [ingredient for ingredient in meal.ingredients.all() if len(meal.ingredients.all()) > 0]
            ing_list = []
            for ingredient in ings:
                ing_list.append({
                    "id":ingredient.id,
                    "name":ingredient.name,
                    "image_id":ingredient.image_id,
                    })

            
            meal_types = [{"id":ty.id, "name":ty.name.title()} for ty in meal.types.all()]

            meal_list.append({
                              "id":meal.id,
                              "name":meal.name,
                              "sub":meal.sub,
                              "description":meal.description,
                              #"images":meal_images,
                              "main_image" : settings.DEFAULT_MEAL_IMAGE if not meal.main_image else meal.main_image.thumb.url,
                              "available":1 if meal.available else 0,
                              "sold_out":1 if meal.sold_out else 0,
                              "locked" : 1 if meal.locked else 0,
                              "category":"Not Available" if not meal.category else meal.category.name.title(),
                              "meal_types":meal_types,
                              "preparation_time":meal.preparation_time,
                              "price":meal.price,
                              "tax":meal.price * meal.tax/100,
                              "ingredients":ing_list,
                              "in_cart" : 1 if user and CartItem.objects.filter(cart__user=user, cart__completed=False, meal__pk=meal.id).exists() else 0,
                              "order":meal.order,
                              "primary_meal" : 1 if str(meal.id) == str(home_meal) else 0,
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
    
@check_input('POST', settings.ROLE_ADMIN)
def create_meal(request, data, user):
    try:
        edit=False
        name = data['name'].strip()
        sub = data['sub'].strip()
        desc = data['description'].strip()
        
        price = float(data['price'])
        tax = float(data['tax'])
        available = data['available']
        if 'sold_out' in data:
            sold_out = data['sold_out']
        else:
            sold_out = "0"
        
        if 'locked' in data:
            locked = data['locked']
        else:
            locked = "0"

        if len(name) < 3 or len(desc)<5 or float(price) <=0 or float(tax) <0 :
            log.error("name, desc, price or tax invalid")
            return custom_error("Please enter valid details.")
        
        try:
            meal = Meal.objects.get(is_deleted=False, pk=data["edit_id"])
            log.info("EDITING MEAL :"+str(data['edit_id']))
            edit=True
            if meal.locked:
                return custom_error("Sorry, this meal is locked. Please unlock the meal to edit.")
        except Exception as e:
            log.info("CREATING MEAL : "+e.message)
            meal = Meal()
        
        meal.name = name
        meal.sub = sub
        meal.description = desc
        
        if "need_boiling_water" in data and data['need_boiling_water'] != '':
            meal.need_boiling_water = bool(str(data['need_boiling_water']))

        meal.price = price
        meal.tax = tax
        meal.available = True if str(available) == "1" else False
        meal.sold_out = True if str(sold_out) == "1" else False
        meal.locked = True if str(locked) == "1" else False
        
        if "main_image" not in data:
            if 'images' in data and len(data['images']) > 0:
                main_img_id = data['images'][0]
            else:
                main_img_id = None
        else:
            main_img_id = data['main_image']

        if main_img_id:
            meal.main_image = Image.objects.get(pk=int(main_img_id))

        chef_id = False
        if 'chef_id' in data:
            chef_id = data['chef_id']
            chef = Chef.objects.get(pk=int(data['chef_id']))
            meal.chef = chef
        if 'chef_name' in data and 'chef_image' in data and data['chef_name'].strip() != '':
            if not chef_id:
                chef = Chef()
            chef.name = data['chef_name'].strip()
            chef.image = Image.objects.get(pk=int(data['chef_image']))
            chef.save()
            meal.chef = chef
        if 'chef_comments' in data and data["chef_comments"].strip() != "":
            meal.chef_comments = data["chef_comments"].strip()
        if 'cat_id' in data:
            try:
                meal.category=Category.objects.get(is_hidden=False, is_deleted=False, pk=data['cat_id'])
            except:
                return custom_error("The selected category does not exist, or is not available.")
        
        if 'filter_ids' in data:
            if not edit:
                meal.save()
            else:
                meal.types = []

            for fid in data['filter_ids']:
                try:
                    if fid in ['0', 0]:
                        continue
                    mt = MealType.objects.get(is_hidden=False, is_deleted=False, pk=int(fid))
                    if mt not in meal.types.all():
                        meal.types.add(mt)
                except Exception as e:
                    log.error("getting filter " + e.message)
                    return custom_error("The selected Meal Filter does not exist, or is not available.")
        
        if not meal.id:
            meal.save()

        if edit:
            meal.images = []

        if 'images' in data and len(data['images']) > 0:
            for img in data['images']:
                meal.images.add(Image.objects.get(pk=int(img)))

        if 'pre_requisites' in data and len(data['pre_requisites']) > 0:
            meal.pre_requisites = simplejson.dumps(data["pre_requisites"])
        elif not 'pre_requisites' in data:
            meal.pre_requisites = None

        if 'pre_requisites_image' in data:
            meal.pre_requisites_image = Image.objects.get(pk=int(data['pre_requisites_image']))

        if 'user_to_do' in data and len(data['user_to_do']) > 0:
            meal.user_to_do = simplejson.dumps(data["user_to_do"])
        elif not 'user_to_do' in data:
            meal.user_to_do = None

        if 'preparation_time' in data and data['preparation_time'].strip() != '':
            meal.preparation_time = data['preparation_time'].strip()

        if 'finished_preparation' in data and len(data['finished_preparation']) > 0:
            meal.finished_preparation = simplejson.dumps(data["finished_preparation"])
        elif not 'finished_preparation' in data:
            meal.finished_preparation = None

        if 'saved_time' in data and data['saved_time'].strip() != '':
            meal.saved_time = data['saved_time'].strip()
        
        if "calories" in data:
            meal.calories = data["calories"]

        my_tip_ids = []
        if "tips" in data and len(data['tips']) > 0:
            for tip in data['tips']:
                if 'id' not in tip or str(tip["id"]).strip() == "":
                    tip_obj = Tips()
                else:
                    try:
                        tip_obj = Tips.objects.get(pk=int(tip['id']))
                    except:
                        tip_obj = Tips()
                tip_obj.title = tip['title'].strip().title()
                tip_obj.description = simplejson.dumps(tip['description'])
                
                if "image" in tip:
                    tip_obj.image = Image.objects.get(pk=int(tip['image']))
                
                if "image_url" in tip:
                    tip_obj.video_url = tip['image_url'].strip()

                if "video_url" in tip:
                    tip_obj.video_url = tip['video_url'].strip()
                
                tip_obj.save()
                my_tip_ids.append(tip_obj.id)
                
                if tip_obj not in meal.tips.all():
                    meal.tips.add(tip_obj)
                    meal.save()
        try:
            meal.tips.exclude(id__in=my_tip_ids).delete()
            
        except Exception as e:
            log.error("Cannot delete meal tips : "+e.message)

        if 'ingredients' in data and len(data['ingredients']) > 0:
            for ing in data['ingredients']:
                meal.ingredients.add(Ingredient.objects.get(pk=int(ing)))
        elif not 'ingredients' in data:
            meal.ingredients = None

        if 'nutrients' in data and len(data['nutrients']) > 0:
            meal.nutrients = simplejson.dumps(data['nutrients'])
        elif not 'nutrients' in data:
            meal.nutrients = None

#         if 'ingredients_image' in data:
#             meal.ingredients_image = Image.objects.get(pk=int(data['ingredients_image']))
        

        if 'allergy_notice' in data and data['allergy_notice'].strip() != '':
            meal.allergy_notice = data['allergy_notice'].strip()
        
        meal.save()
        action = "update" if edit else "create"
        return json_response({"status":1, "message":"The meal has been successfully "+action+"d.", "id":meal.id})
    except Exception as e:
        #if not edit and meal.id:
        #    meal.delete()
        log.error("Failed to create meals : "+e.message)
        action = "update" if edit else "create"
        return custom_error("Failed to "+action+" meal. Please try again later.")
    
@check_input('POST', settings.ROLE_ADMIN)
def delete_meal(request, data, user, meal_id):
    try:
        meal = Meal.objects.get(is_deleted=False, pk=meal_id)
        meal.is_deleted=True
        meal.save()
        return json_response({"status":1, "message":"Deleted Meal", "id":meal_id})
    except Exception as e:
        log.error("Failed to delete meal : "+e.message)
        return json_response({"status":-1, "message":"Failed to delete meal. Does that exist?"})

@check_input('POST')
def get_meal_details(request, data, user, meal_id):
    try:
        session_key = request.META.get('HTTP_SESSION_KEY', None)
        session = SessionStore(session_key=session_key)
        
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
                "image_url1":"" if tips.image_url is None else tips.image_url,
                })
        
        return json_response({
            "status":1,
            "id" : meal.id,
            "name" : meal.name,
            "sub":meal.sub,
            "description" : meal.description,
            "price":meal.price,
            "tax":meal.price* meal.tax/100,
            "need_boiling_water":meal.need_boiling_water,
            "tax_percentage" : meal.tax,
            "available" : 1 if meal.available else 0,
            "sold_out":1 if meal.sold_out else 0,
            "locked":1 if meal.locked else 0,
            "calories" : meal.calories,
            "filters" : [{"id": ty.id, "image_id": ty.image.id, "image_url":ty.image.image.url, "meal_type_name":ty.name } for ty in meal.types.all()],
            "default_meal_type_image": settings.DEFAULT_MEAL_TYPE_IMAGE,
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
            "pre_requisites_image" : settings.DEFAULT_PRE_REQ_IMAGE if meal.pre_requisites_image is None else {
                    "id":meal.pre_requisites_image.id,
                    "url":meal.pre_requisites_image.image.url,
                    },

            "nutrients" : "" if not meal.nutrients or meal.nutrients == ""  else simplejson.loads(meal.nutrients),
            "ingredients" : [{"id":ing.id, "name":ing.name,"image_id":ing.image_id} for ing in meal.ingredients.all()],
            #"" if not meal.ingredients else simplejson.loads(meal.ingredients),
#            #Edit here "ingredients_image" : settings.DEFAULT_INGREDIENTS_IMAGE if meal.ingredients_image is None else {
#                                                         "id" : meal.ingredients_image.id,
#                                                         "url" : meal.ingredients_image.image.url
#                                                         },
            "tips" : tips_list,
            "allergy_notice" : meal.allergy_notice,
            "images" : image_list,
            "ratings" : rating_list,
            "avg_rating" : rating_sum/rating_count if int(rating_count) != 0 else 0,
            "ratings_count" : rating_count,
            "main_image" : {"url":settings.DEFAULT_MEAL_IMAGE, "id":""} if not meal.main_image else {
                "id":meal.main_image.id,
                "url":meal.main_image.image.url,
            },
            "in_cart" : 1 if user and CartItem.objects.filter(cart__user=user, meal__pk=meal.id).exists() else 0,
        })
    except Exception as e:
        log.error("get_meal details : " + e.message)
        return custom_error("Failed to get the meal details.")

@check_input('GET')
def import_meals(request, data):
    return HttpResponse("Not Done Via Web Interface")

@check_input('POST', settings.ROLE_ADMIN)
def create_attribute(request, data, user):
    try:
        attribute_id = False
        if 'attribute_id' in data:
            attribute_id = str(data['attribute_id']).strip()
            if attribute_id == '':
                attribute_id = False
            else:
                attribute = MealType.objects.get(pk=attribute_id)
            
        if 'attribute_name' in data and 'attribute_image' in data and data['attribute_name'].strip() != '':
            if not attribute_id:
                try:
                    attribute = MealType.objects.get(name__iexact=str(data['attribute_name']).strip())
                except MealType.DoesNotExist:
                    attribute = MealType()
            elif MealType.objects.filter(name__iexact=data['attribute_name'].strip()).exclude(id=attribute_id).exists():
                return custom_error("Another Meal Type exists with the same name.")
            attribute.name = data['attribute_name'].strip()
            attribute.image = Image.objects.get(pk=int(data['attribute_image']))
            attribute.save()
            return json_response({"status":1, "message":"Attribute saved successfully."})
        else:
            return custom_error("No name/image found for the attribute.")
    except Exception as e:
        log.error("create_attribute details : " + e.message)
        return custom_error("Failed to create/update attribute")

@check_input('POST', settings.ROLE_ADMIN)
def list_attributes(request, data, user):
    try:
        if 'attribute_id' in data:
            attributes = [{"id":attr.id, "name":attr.name.title(), "image": attr.image.image.url, "image_id": attr.image.id} for attr in MealType.objects.get(pk=int(data['attribute_id']))]
        else:
            attributes = [{"id":attr.id, "name":attr.name.title(), "image": attr.image.image.url, "image_id":attr.image.id} for attr in MealType.objects.all()]
        return json_response({"status":1, 
                              "aaData":attributes,
                              })
    except Exception as e:
        log.error("list_attributes details : " + e.message)
        return custom_error("Failed to fetch attribute list")

@check_input('POST', settings.ROLE_ADMIN)
def get_attribute_details(request, data, user, attribute_id):
    try:
        attribute = MealType.objects.get(is_deleted=False, pk=attribute_id)
        return json_response({"status":1, 
                              "id":attribute.id,
                              "name":attribute.name,
                              "image":attribute.image,
                              })
    except Exception as e:
        log.error("get_attribute_details : " + e.message)
        return custom_error("Failed to fetch attribute details")


@check_input('POST', settings.ROLE_ADMIN)
def delete_attribute(request, data, user, attribute_id):
    try:
        attribute = MealType.objects.get(is_deleted=False, pk=attribute_id)
        attribute.delete()

        return json_response({"status":1, "message":"Deleted Attribute", "id":attribute_id})
    except Exception as e:
        log.error("Failed to delete attribute : "+e.message)
        return custom_error("Failed to delete attribute. Does that exist?")

@check_input('POST', settings.ROLE_ADMIN)
def update_meal_order(request, data, user, meal_id):
    try:
        order = int(str(data['order']).strip())
        if order <1 or order > 999999:
            return custom_error("Invalid Order.")
        meal = Meal.objects.get(is_deleted=False, pk=meal_id)
        meal.order = order
        meal.save()

        return json_response({"status":1, "message":"Updated meal order", "order":order})
    except Exception as e:
        log.error("Failed to update meal order : "+e.message)
        return custom_error("Failed to save meal order.")

@check_input('POST', settings.ROLE_ADMIN)
def update_home_meal(request, data, user):
    try:
        meal_id = data['meal_id']
        meal = Meal.objects.get(pk=int(meal_id), is_deleted=False, available=True)
        try:
            conf = Configuration.objects.get(key='home_meal_id')
        except Configuration.DoesNotExist:
            conf = Configuration()
            conf.key = 'home_meal_id'
        conf.value= meal_id
        conf.save()

        return json_response({"status":1, "message":"Updated home meal"})
    except Exception as e:
        log.error("Failed to update home meal. : "+e.message)
        return custom_error("Failed to update home meal. Please make sure whether the meal is available and not deleted.")

@check_input('POST', settings.ROLE_ADMIN)
def get_home_meal(request, data, user):
    try:
        try:
            conf = Configuration.objects.get(key='home_meal_id')
            return json_response({"status":1, "meal_id":conf.value})
        except Configuration.DoesNotExist:
            return custom_error("No home meal is set.")

    except Exception as e:
        log.error("Failed to get home meal. : "+e.message)
        return custom_error("Failed to get the home meal.")

@check_input('POST', settings.ROLE_ADMIN)
def add_ingredient(request, data, user):
    try:
        name = data['ingredient']
        img = data['image_id']
        try:
            ing = Ingredient.objects.get(name__iexact=name)
            return custom_error(name + " Already exists.")
        except Ingredient.DoesNotExist:
            ing = Ingredient()
            ing.name = name
            ing.image = Image.objects.get(pk=img)
            ing.save()
            return json_response({"status":1, "message" :"Added "+name, "id":ing.id, "name":ing.name, "image_id":ing.image.id, "image_url":ing.image.image.url})
    except Exception as e:
        log.error("Failed to add ingredient. : "+e.message)
        return custom_error("Failed to add ingredient.")

@check_input('POST', settings.ROLE_ADMIN)
def update_ingredient(request, data, user, ing_id):
    try:
        ing = Ingredient.objects.get(pk=ing_id)
        if "ingredient" in data and data["ingredient"].strip() != "":
            name = data['ingredient']
            if Ingredient.objects.exclude(pk=ing_id).filter(name__iexact=name).exists():
                return custom_error("Another ingredient exists with name : "+name)
            ing.name = name
        
        if "image_id" in data:
            ing.image = Image.objects.get(pk=int(data["image_id"]))
        
        ing.save()
        return json_response({"status":1, "message" :"Updated Ingredient", "id":ing.id, "name":ing.name, "image_id":ing.image.id, "image_url":ing.image.image.url})
    except Exception as e:
        log.error("Failed to update ingredient. : "+e.message)
        return custom_error("Failed to update ingredient.")

@check_input('POST', settings.ROLE_ADMIN)
def delete_ingredient(request, data, user, ing_id):
    try:
        ing = Ingredient.objects.get(pk=ing_id).delete()
         
        return json_response({"status":1, "message" :"Deleted Ingredient", "id":ing_id})
    except Exception as e:
        log.error("Failed to delete ingredient. : "+e.message)
        return custom_error("Failed to delete ingredient.")

@check_input('POST', settings.ROLE_ADMIN)
def list_ingredients(request, data, user):
    try:
        limit = settings.PER_PAGE
        page = 1
        if "nextPage" in data and int(data["nextPage"]) >0:
            page = data["nextPage"]
            
        ings = Ingredient.objects.all().order_by("name")
        total_count = ings.count()
        
        if 'search' in data:
            search = str(data['search']).strip()
            ings = ings.filter(name__startswith=search)
        
        actual_count = ings.count()
        if actual_count == 0:
            return custom_error("There are no ingredients to list.")
        
        try:
            paginator = Paginator(ings, limit)
            if page <1 or page > paginator.page_range:
                page = 1
            ings = paginator.page(page)
        except Exception as e:
            log.error("ingredients list pagination : " + e.message)
            custom_error("There was an error listing ingredients.")
        
        ing_list = [{"id":ing.id, "name":ing.name, "image_id":ing.image.id, "image_url":ing.image.image.url} for ing in ings.object_list]
        
        return json_response({
                              "status":1,
                              "aaData": ing_list,
                              "total_count":total_count,
                              "actual_count":actual_count,
                              "num_pages" : paginator.num_pages,
                              "page_range" : paginator.page_range,
                              "current_page":page,
                              "per_page" : limit,
                              })
    except Exception as e:
        log.error("Failed to list ingredients : "+e.message)
        return custom_error("Failed to retrieve ingredients")
