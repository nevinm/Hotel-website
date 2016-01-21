'''
CMS Meal related view
'''
from django.contrib.sessions.backends.db import SessionStore
from django.core.paginator import Paginator, EmptyPage
from django.db.models import Q
from django.http.response import HttpResponse
import logging

from cms.views.decorators import check_input
import json as simplejson
from libraries import get_request_user, custom_error, json_response
from meisterdish_server.models import Meal, Configuration, CartItem, Image, \
    Category, MealType, Tips, Ingredient, MealRating, Chef
import settings


log = logging.getLogger(__name__)


@check_input('POST', settings.ROLE_ADMIN)
def get_meals(request, data, user):
    '''
    API to get all meals with pagination
    :param request:
    :param data:
    :param user:
    '''
    try:
        user = get_request_user(request)
        meal_list = []
        meals = Meal.objects.filter(is_deleted=False)
        total_count = meals.count()

        if "search" in data and data['search'].strip() != '':
            search = data["search"]
            meals = meals.filter(
                Q(name__istartswith=search) | Q(
                    description__istartswith=search))

        if "category_id" in data and str(data['category_id']) != '':
            meals = meals.filter(category__id=data["category_id"])

        if "type_ids" in data and len(data['type_ids']) > 0 and str(
                data['type_ids']) != '':
            meals = meals.filter(types__id__in=data['type_ids'])

        meals = meals.order_by("order", 'name')

        actual_count = meals.count()
        try:
            home_meal = Configuration.objects.get(key='home_meal_id').value
        except Configuration.DoesNotExist:
            home_meal = None

        for meal in meals:
            ings = [ingredient for ingredient in meal.ingredients.all() if len(
                meal.ingredients.all()) > 0]
            ing_list = []
            for ingredient in ings:
                ing_list.append({
                    "id": ingredient.id,
                    "name": ingredient.name,
                    "image_url": ingredient.image.image.url,
                })

            meal_types = [{"id": ty.id, "name": ty.name.title()}
                          for ty in meal.types.all()]

            meal_list.append({
                "id": meal.id,
                "name": meal.name,
                "sub": meal.sub,
                "description": meal.description,
                "main_image": (
                    settings.DEFAULT_MEAL_IMAGE
                    if not meal.main_image else meal.main_image.thumb.url),
                "available": meal.available,
                "sold_out": 1 if meal.sold_out else 0,
                "locked": 1 if meal.locked else 0,
                "category": ("Not Available" if not meal.category
                             else meal.category.name.title()),
                "meal_types": meal_types,
                "preparation_time": meal.preparation_time,
                "price": meal.price,
                "tax": meal.price * meal.tax / 100,
                "ingredients": ing_list,
                "in_cart": (
                    1 if user and CartItem.objects.filter(
                        cart__user=user,
                        cart__completed=False,
                        meal__pk=meal.id).exists()
                    else 0),
                "order": meal.order,
                "primary_meal": 1 if str(meal.id) == str(home_meal) else 0,
            })
        return json_response({"status": 1,
                              "aaData": meal_list,
                              "total_count": total_count,
                              "actual_count": actual_count,
                              })
    except Exception as error:
        log.error("Failed to list meals : " + error.message)
        return custom_error("Failed to list meals")


@check_input('POST', settings.ROLE_ADMIN)
def create_meal(request, data, user):
    '''
    API to create a new meal
    :param request:
    :param data:
    :param user:
    '''
    try:
        edit = False
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

        if len(name) < 3 or len(desc) < 5 or \
                float(price) <= 0 or float(tax) < 0:
            log.error("name, desc, price or tax invalid")
            return custom_error("Please enter valid details.")

        try:
            meal = Meal.objects.get(is_deleted=False, pk=data["edit_id"])
            log.info("EDITING MEAL :" + str(data['edit_id']))
            edit = True
            if meal.locked:
                return custom_error(
                    "Sorry, this meal is locked. \
                    Please unlock the meal to edit.")
        except Exception as error:
            log.info("CREATING MEAL : " + error.message)
            meal = Meal()

        meal.name = name
        meal.sub = sub
        meal.description = desc

        if "need_boiling_water" in data and data['need_boiling_water'] != '':
            meal.need_boiling_water = bool(str(data['need_boiling_water']))

        meal.price = price
        meal.tax = tax
        meal.available = available
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
        if 'chef_name' in data and 'chef_image' in data and \
                data['chef_name'].strip() != '':
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
                meal.category = Category.objects.get(
                    is_hidden=False, is_deleted=False, pk=data['cat_id'])
            except:
                return custom_error(
                    "The selected category does not exist, \
                    or is not available.")

        if 'filter_ids' in data:
            if not edit:
                meal.save()
            else:
                meal.types = []

            for fid in data['filter_ids']:
                try:
                    if fid in ['0', 0]:
                        continue
                    mt = MealType.objects.get(
                        is_hidden=False, is_deleted=False, pk=int(fid))
                    if mt not in meal.types.all():
                        meal.types.add(mt)
                except Exception as error:
                    log.error("getting filter " + error.message)
                    return custom_error(
                        "The selected Meal Filter does not exist, \
                        or is not available.")

        if not meal.id:
            meal.save()

        if edit:
            meal.images = []
            meal.ingredients = []

        if 'images' in data and len(data['images']) > 0:
            for img in data['images']:
                meal.images.add(Image.objects.get(pk=int(img)))

        if 'pre_requisites' in data and len(data['pre_requisites']) > 0:
            meal.pre_requisites = simplejson.dumps(data["pre_requisites"])
        elif 'pre_requisites' not in data:
            meal.pre_requisites = None

        if 'pre_requisites_image' in data:
            meal.pre_requisites_image = Image.objects.get(
                pk=int(data['pre_requisites_image']))

        if 'user_to_do' in data and len(data['user_to_do']) > 0:
            meal.user_to_do = simplejson.dumps(data["user_to_do"])
        elif 'user_to_do' not in data:
            meal.user_to_do = None

        if 'preparation_time' in data and \
                data['preparation_time'].strip() != '':
            meal.preparation_time = data['preparation_time'].strip()

        if 'finished_preparation' in data and \
                len(data['finished_preparation']) > 0:
            meal.finished_preparation = simplejson.dumps(
                data["finished_preparation"])
        elif 'finished_preparation' not in data:
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

        except Exception as error:
            log.error("Cannot delete meal tips : " + error.message)

        if 'ingredients' in data and len(data['ingredients']) > 0:
            for ing in data['ingredients']:
                meal.ingredients.add(Ingredient.objects.get(pk=int(ing)))
        elif 'ingredients' not in data:
            meal.ingredients = None

        if 'nutrients' in data and len(data['nutrients']) > 0:
            meal.nutrients = simplejson.dumps(data['nutrients'])
        elif 'nutrients' not in data:
            meal.nutrients = None
        if 'allergy_notice' in data and data['allergy_notice'].strip() != '':
            meal.allergy_notice = data['allergy_notice'].strip()

        meal.save()
        action = "update" if edit else "create"
        return json_response({
            "status": 1,
            "message": "The meal has been successfully " + action + "d.",
            "id": meal.id})
    except Exception as error:
        log.error("Failed to create meals : " + error.message)
        action = "update" if edit else "create"
        return custom_error(
            "Failed to " + action + " meal. Please try again later.")


@check_input('POST', settings.ROLE_ADMIN)
def delete_meal(request, data, user, meal_id):
    '''
    API to delete a meal
    :param request:
    :param data:
    :param user:
    :param meal_id:
    '''
    try:
        meal = Meal.objects.get(is_deleted=False, pk=meal_id)
        meal.is_deleted = True
        meal.save()
        return json_response({
            "status": 1,
            "message": "Deleted Meal",
            "id": meal_id})
    except Exception as error:
        log.error("Failed to delete meal : " + error.message)
        return json_response({
            "status": -1,
            "message": "Failed to delete meal. Does that exist?"})


@check_input('POST')
def get_meal_details(request, data, user, meal_id):
    '''
    API to get meal details
    :param request:
    :param data:
    :param user:
    :param meal_id:
    '''
    try:
        session_key = request.META.get('HTTP_SESSION_KEY', None)
        session = SessionStore(session_key=session_key)

        meal = Meal.objects.get(pk=meal_id, is_deleted=False)
        rating_list = []
        rating_sum = 0.0
        rating_count = 0
        for rating in meal.mealrating.all():
            rating_sum += rating.rating
            rating_count += 1
            rating_list.append({
                "rating": rating.rating,
                "review": rating.comment,
                "user_first_name": rating.order.cart.user.first_name,
                "user_last_name": rating.order.cart.user.last_name,
                "user_image": (
                    settings.DEFAULT_USER_IMAGE
                    if not rating.order.cart.user.profile_image
                    else rating.order.cart.user.profile_image.thumb.url),
                "date": rating.created.strftime("%m-%d-%Y %H:%M:%S"),
            })

        image_list = []
        for img in meal.images.all():
            image_list.append({
                "id": img.id,
                "image_url": img.image.url,
                "thumb_url": img.thumb.url,
            })

        tips_list = []
        for tips in meal.tips.all():
            tips_list.append({
                "id": tips.id,
                "title": tips.title,
                "description": (
                    "" if tips.description.strip() == ""
                    else simplejson.loads(tips.description)),
                "image_url": (
                    settings.DEFAULT_MEAL_IMAGE if tips.image is None
                    else tips.image.image.url),
                "video_url": "" if tips.video_url is None else tips.video_url,
                "image_url1": "" if tips.image_url is None else tips.image_url,
            })

        return json_response({
            "status": 1,
            "id": meal.id,
            "name": meal.name,
            "sub": meal.sub,
            "description": meal.description,
            "price": meal.price,
            "tax": meal.price * meal.tax / 100,
            "need_boiling_water": meal.need_boiling_water,
            "tax_percentage": meal.tax,
            "available": meal.available,
            "sold_out": 1 if meal.sold_out else 0,
            "locked": 1 if meal.locked else 0,
            "calories": meal.calories,
            "filters": [{
                "id": ty.id,
                "image_id": ty.image.id,
                "image_url": ty.image.image.url,
                "meal_type_name": ty.name} for ty in meal.types.all()],
            "default_meal_type_image": settings.DEFAULT_MEAL_TYPE_IMAGE,
            "cat_id": 'Not Available' if not meal.category else {
                "id": meal.category.id,
                "name": meal.category.name.title(),
            },
            "chef_id": "Not available" if not meal.chef else meal.chef.id,
            "chef_name": (
                "Not available" if not meal.chef
                else meal.chef.name.title()),
            "chef_image": {
                "url": settings.DEFAULT_USER_IMAGE,
                "id": ""} if not meal.chef or not meal.chef.image else {
                "id": meal.chef.image.id,
                "url": meal.chef.image.thumb.url,
            },
            "chef_comments": meal.chef_comments,
            "user_to_do": (
                    "" if not meal.user_to_do or meal.user_to_do.strip() == ""
                    else simplejson.loads(meal.user_to_do)),
            "preparation_time": meal.preparation_time,

            "finished_preparation": (
                "" if not (
                    meal.finished_preparation or
                    meal.finished_preparation.strip() == "")
                else simplejson.loads(meal.finished_preparation)),
            "saved_time": meal.saved_time,

            "pre_requisites": (
                "" if not (meal.pre_requisites or meal.pre_requisites == "")
                else simplejson.loads(meal.pre_requisites)),
            "pre_requisites_image": (
                settings.DEFAULT_PRE_REQ_IMAGE
                if meal.pre_requisites_image is None
                else {
                    "id": meal.pre_requisites_image.id,
                    "url": meal.pre_requisites_image.image.url,
                }),

            "nutrients": (
                    "" if not meal.nutrients or meal.nutrients == ""
                else simplejson.loads(meal.nutrients)),
            "ingredients": [{
                "id": ing.id,
                "name": ing.name,
                "image_url": ing.image.image.url}
                for ing in meal.ingredients.all()],
            "tips": tips_list,
            "allergy_notice": meal.allergy_notice,
            "images": image_list,
            "ratings": rating_list,
            "avg_rating": (
                    rating_sum / rating_count if int(rating_count) != 0
                    else 0),
            "ratings_count": rating_count,
            "main_image": {
                    "url": settings.DEFAULT_MEAL_IMAGE,
                    "id": ""} if not meal.main_image else {
                "id": meal.main_image.id,
                "url": meal.main_image.image.url,
            },
            "in_cart": 1 if user and CartItem.objects.filter(
                cart__user=user, meal__pk=meal.id).exists() else 0,
        })
    except Exception as error:
        log.error("get_meal details : " + error.message)
        return custom_error("Failed to get the meal details.")


@check_input('GET')
def import_meals(request, data):
    '''
    API to import meals
    :param request:
    :param data:
    '''
    return HttpResponse("Not Done Via Web Interface")


@check_input('POST', settings.ROLE_ADMIN)
def create_attribute(request, data, user):
    '''
    API to create a new attribute
    :param request:
    :param data:
    :param user:
    '''
    try:
        attribute_id = False
        if 'attribute_id' in data:
            attribute_id = str(data['attribute_id']).strip()
            if attribute_id == '':
                attribute_id = False
            else:
                attribute = MealType.objects.get(pk=attribute_id)

        if 'attribute_name' in data and 'attribute_image' in data and \
                data['attribute_name'].strip() != '':
            if not attribute_id:
                try:
                    attribute = MealType.objects.get(
                        name__iexact=str(data['attribute_name']).strip())
                except MealType.DoesNotExist:
                    attribute = MealType()
            elif MealType.objects.filter(
                name__iexact=data['attribute_name'].strip()).exclude(
                    id=attribute_id).exists():
                return custom_error(
                    "Another Meal Type exists with the same name.")
            attribute.name = data['attribute_name'].strip()
            attribute.image = Image.objects.get(
                pk=int(data['attribute_image']))
            attribute.save()
            return json_response({
                "status": 1,
                "message": "Attribute saved successfully."})
        else:
            return custom_error("No name/image found for the attribute.")
    except Exception as error:
        log.error("create_attribute details : " + error.message)
        return custom_error("Failed to create/update attribute")


@check_input('POST', settings.ROLE_ADMIN)
def list_attributes(request, data, user):
    '''
    API to list all attributes
    :param request:
    :param data:
    :param user:
    '''
    try:
        if 'attribute_id' in data:
            attributes = [{
                "id": attr.id, "name": attr.name.title(),
                "image": attr.image.image.url,
                "image_id": attr.image.id}
                for attr in MealType.objects.get(pk=int(data['attribute_id']))]
        else:
            attributes = [{
                "id": attr.id, "name": attr.name.title(
                ), "image": attr.image.image.url, "image_id": attr.image.id}
                for attr in MealType.objects.all()]
        return json_response({"status": 1,
                              "aaData": attributes,
                              })
    except Exception as error:
        log.error("list_attributes details : " + error.message)
        return custom_error("Failed to fetch attribute list")


@check_input('POST', settings.ROLE_ADMIN)
def get_attribute_details(request, data, user, attribute_id):
    '''
    API to get attribute details
    :param request:
    :param data:
    :param user:
    :param attribute_id:
    '''
    try:
        attribute = MealType.objects.get(is_deleted=False, pk=attribute_id)
        return json_response({"status": 1,
                              "id": attribute.id,
                              "name": attribute.name,
                              "image": attribute.image,
                              })
    except Exception as error:
        log.error("get_attribute_details : " + error.message)
        return custom_error("Failed to fetch attribute details")


@check_input('POST', settings.ROLE_ADMIN)
def delete_attribute(request, data, user, attribute_id):
    '''
    API to delete attribute deatils
    :param request:
    :param data:
    :param user:
    :param attribute_id:
    '''
    try:
        attribute = MealType.objects.get(is_deleted=False, pk=attribute_id)
        attribute.delete()

        return json_response({
            "status": 1, "message": "Deleted Attribute",
            "id": attribute_id})
    except Exception as error:
        log.error("Failed to delete attribute : " + error.message)
        return custom_error("Failed to delete attribute. Does that exist?")


@check_input('POST', settings.ROLE_ADMIN)
def update_meal_order(request, data, user, meal_id):
    '''
    API to update meal order
    :param request:
    :param data:
    :param user:
    :param meal_id:
    '''
    try:
        order = int(str(data['order']).strip())
        if order < 1 or order > 999999:
            return custom_error("Invalid Order.")
        meal = Meal.objects.get(is_deleted=False, pk=meal_id)
        meal.order = order
        meal.save()

        return json_response({
            "status": 1,
            "message": "Updated meal order",
            "order": order})
    except Exception as error:
        log.error("Failed to update meal order : " + error.message)
        return custom_error("Failed to save meal order.")


@check_input('POST', settings.ROLE_ADMIN)
def update_meal_availablity(request, data, user, meal_id):
    '''
    API to update meal availability
    :param request:
    :param data:
    :param user:
    :param meal_id:
    '''
    try:
        available = int(str(data['available']).strip())
        if available < 0:
            return custom_error(
                "Invalid Input .\
                Please enter a value greater than or equal to 0")
        meal = Meal.objects.get(is_deleted=False, pk=meal_id)
        meal.available = available
        meal.save()

        return json_response({
            "status": 1,
            "message": "Updated meal availability",
            "availablity": available})
    except Exception as error:
        log.error("Failed to update meal availablity : " + error.message)
        return custom_error("Failed to save meal availablity.")


@check_input('POST', settings.ROLE_ADMIN)
def update_home_meal(request, data, user):
    '''
    API to update home meal
    :param request:
    :param data:
    :param user:
    '''
    try:
        meal_id = data['meal_id']
        meal = Meal.objects.get(
            pk=int(meal_id), is_deleted=False, available__gt=0)
        try:
            conf = Configuration.objects.get(key='home_meal_id')
        except Configuration.DoesNotExist:
            conf = Configuration()
            conf.key = 'home_meal_id'
        conf.value = meal_id
        conf.save()

        return json_response({"status": 1, "message": "Updated home meal"})
    except Exception as error:
        log.error("Failed to update home meal. : " + error.message)
        return custom_error(
            "Failed to update home meal. \
            Please make sure whether the meal is available and not deleted.")


@check_input('POST', settings.ROLE_ADMIN)
def get_home_meal(request, data, user):
    '''
    API to get home meal id
    :param request:
    :param data:
    :param user:
    '''
    try:
        try:
            conf = Configuration.objects.get(key='home_meal_id')
            return json_response({"status": 1, "meal_id": conf.value})
        except Configuration.DoesNotExist:
            return custom_error("No home meal is set.")

    except Exception as error:
        log.error("Failed to get home meal. : " + error.message)
        return custom_error("Failed to get the home meal.")


@check_input('POST', settings.ROLE_ADMIN)
def add_ingredient(request, data, user):
    '''
    API to add ingredients
    :param request:
    :param data:
    :param user:
    '''
    try:
        name = data['ingredient']
        img = data['image_id']
        if img == "":
            return custom_error("Please upload a valid image.")
        try:
            ing = Ingredient.objects.get(name__iexact=name)
            return custom_error(name + " Already exists.")
        except Ingredient.DoesNotExist:
            ing = Ingredient()
            ing.name = name
            ing.image = Image.objects.get(pk=img)
            ing.save()
            return json_response({
                "status": 1,
                "message": "Added " + name,
                "id": ing.id,
                "name": ing.name,
                "image_id": ing.image.id,
                "image_url": ing.image.image.url})
    except Exception as error:
        log.error("Failed to add ingredient. : " + error.message)
        return custom_error("Failed to add ingredient.")


@check_input('POST', settings.ROLE_ADMIN)
def update_ingredient(request, data, user, ing_id):
    '''
    API to update ingredient info
    :param request:
    :param data:
    :param user:
    :param ing_id:
    '''
    try:
        ing = Ingredient.objects.get(pk=ing_id)
        if "ingredient" in data and data["ingredient"].strip() != "":
            name = data['ingredient']
            if Ingredient.objects.exclude(
                    pk=ing_id).filter(name__iexact=name).exists():
                return custom_error(
                    "Another ingredient exists with name : " + name)
            ing.name = name

        if "image_id" in data:
            ing.image = Image.objects.get(pk=int(data["image_id"]))

        ing.save()
        return json_response({
            "status": 1,
            "message": "Updated Ingredient",
            "id": ing.id,
            "name": ing.name,
            "image_id": ing.image.id,
            "image_url": ing.image.image.url})
    except Exception as error:
        log.error("Failed to update ingredient. : " + error.message)
        return custom_error("Failed to update ingredient.")


@check_input('POST', settings.ROLE_ADMIN)
def delete_ingredient(request, data, user, ing_id):
    '''
    API to delete ingredient
    :param request:
    :param data:
    :param user:
    :param ing_id:
    '''
    try:
        Ingredient.objects.get(pk=ing_id).delete()

        return json_response({
            "status": 1,
            "message": "Deleted Ingredient",
            "id": ing_id})
    except Exception as error:
        log.error("Failed to delete ingredient. : " + error.message)
        return custom_error("Failed to delete ingredient.")


@check_input('POST', settings.ROLE_ADMIN)
def list_ingredients(request, data, user):
    '''
    API to get a lit of ingredints
    :param request:
    :param data:
    :param user:
    '''
    try:
        list_all = False
        limit = settings.PER_PAGE
        page = 1
        if "nextPage" in data and int(data["nextPage"]) > 0:
            page = data["nextPage"]
        else:
            list_all = True

        ings = Ingredient.objects.all().order_by("name")
        total_count = ings.count()

        if 'search' in data:
            search = str(data['search']).strip()
            ings = ings.filter(name__startswith=search)

        actual_count = ings.count()
        if actual_count == 0:
            return custom_error("There are no ingredients to list.")

        ings_all = ings
        try:
            paginator = Paginator(ings, limit)
            if page < 1 or page > paginator.page_range:
                page = 1
            ings = paginator.page(page)
        except Exception as error:
            log.error("ingredients list pagination : " + error.message)
            custom_error("There was an error listing ingredients.")

        if list_all:
            ing_list = [{
                "id": ing.id,
                "name": ing.name,
                "image_id": ing.image.id,
                "image_url": ing.image.image.url}
                for ing in ings_all]
            return json_response({
                "status": 1,
                "aaData": ing_list,
                "total_count": total_count,
                "actual_count": actual_count,
                "num_pages": 1,
                "current_page": page,
            })
        else:
            ing_list = [{
                "id": ing.id,
                "name": ing.name,
                "image_id": ing.image.id,
                "image_url": ing.image.image.url}
                for ing in ings.object_list]
            return json_response({
                "status": 1,
                "aaData": ing_list,
                "total_count": total_count,
                "actual_count": actual_count,
                "num_pages": paginator.num_pages,
                "page_range": paginator.page_range,
                "current_page": page,
                "per_page": limit,
            })
    except Exception as error:
        log.error("Failed to list ingredients : " + error.message)
        return custom_error("Failed to retrieve ingredients")


@check_input('POST', settings.ROLE_ADMIN)
def get_meal_ratings(request, data, user, meal_id):
    '''
    API to get meal ratings
    :param request:
    :param data:
    :param user:
    :param meal_id:
    '''
    try:
        page = 0
        limit = settings.PER_PAGE
        if "nextPage" in data:
            page = int(data['nextPage'])

        meal_ratings = MealRating.objects.filter(meal_id=meal_id,
                                                 is_deleted=False)
        count = meal_ratings.count()

        if page:
            rev_paginator = Paginator(meal_ratings, limit)
            if page > rev_paginator.page_range[-1]:
                page = 1
            try:
                meal_ratings = rev_paginator.page(page)
            except EmptyPage:
                meal_ratings = []

        ratings = [{
            "id": i.id,
            "meal_id": i.meal_id,
            "meal_name": i.meal.name,
            "order_id": i.order_id,
            "rating": i.rating,
            "user": {"id": i.order.cart.user.id,
                     "name": (
                         i.order.cart.user.last_name +
                         " " + i.order.cart.user.first_name),
                     "email": i.order.cart.user.email,
                     "profile_image": (
                         settings.DEFAULT_USER_IMAGE
                         if i.order.cart.user.profile_image is None
                         else i.order.cart.user.profile_image.image.url),
                     },
            "comment": i.comment} for i in meal_ratings]
        response = {
            "status": 1,
            "aaData": ratings,
            "total_count": count,
        }
        if page:
            response["num_pages"] = rev_paginator.num_pages
            response["page_range"] = rev_paginator.page_range
            response["current_page"] = page
            response["per_page"] = limit

        return json_response(response)
    except Exception as error:
        log.error(
            "Failed to get ratings: " + str(type(error)) + " " + error.message)
        return custom_error("Failed to retrieve meal ratings")


@check_input('POST', settings.ROLE_ADMIN)
def delete_meal_rating(request, data, user, pk):
    '''
    API to delete meal rating
    :param request:
    :param data:
    :param user:
    :param pk:
    '''
    try:
        rating = MealRating.objects.get(pk=pk)
        rating.delete()
        return json_response({"status": 1,
                              "message": "Rating deleted successfully."})

    except MealRating.DoesNotExist:
        log.error("Rating object not found")
        return custom_error("Ratings not found!")

    except Exception as error:
        log.error("Failed to delete rating " + error.message)
        return custom_error("Failed to delete rating!")


@check_input('POST', settings.ROLE_ADMIN)
def get_all_ratings(request, data, user):
    '''
    API to get all ratings
    :param request:
    :param data:
    :param user:
    '''
    try:
        page = 0
        limit = settings.PER_PAGE
        if "nextPage" in data:
            page = int(data['nextPage'])

        ratings = MealRating.objects.filter(
            is_deleted=False).distinct().order_by('-created')
        count = ratings.count()

        if page:
            paginator = Paginator(ratings, limit)
            if page > paginator.page_range[-1]:
                page = 1
            try:
                meal_ratings = paginator.page(page)
            except EmptyPage:
                meal_ratings = []

        rating_data = [{"id": i.id,
                        "meal_id": i.meal.id,
                        "meal_name": i.meal.name,
                        "order_id": i.order_id,
                        "rating": i.rating,
                        "comment": i.comment,
                        "user": {
                            "id": i.order.cart.user.id,
                            "name": i.order.cart.user.last_name +
                            " " + i.order.cart.user.first_name,
                            "email": i.order.cart.user.email,
                            "profile_image": (
                                settings.DEFAULT_USER_IMAGE
                                if i.order.cart.user.profile_image is None
                                else i.order.cart.user.profile_image.image.url)
                        }
                        } for i in meal_ratings]

        data = {}
        data["status"] = 1
        data["aaData"] = rating_data
        data["total_count"] = count

        if page:
            data["num_pages"] = paginator.num_pages
            data["page_range"] = paginator.page_range
            data["current_page"] = page
            data["per_page"] = limit
        return json_response(data)

    except Exception as error:
        log.error("Failed to get data." + error.message)
        return custom_error("Failed to get ratings.")


@check_input("POST", settings.ROLE_ADMIN)
def update_meal_soldout(request, data, user):
    '''
    API to update meal soldout or not
    :param request:
    :param data:
    :param user:
    '''
    try:
        meal_id = data["meal_id"]
        sold_out = data["sold_out"]
        try:
            meal = Meal.objects.get(pk=int(meal_id))
        except Meal.DoesNotExist:
            return custom_error("Meal not found")
        meal.sold_out = sold_out
        meal.save()
        return json_response({
            "status": 1,
            "message": "Updated successfully."})
    except Exception as error:
        log.error("Failed to update sold out for meal! " + error.message)
        return custom_error("Error occurred! Please try again.")
