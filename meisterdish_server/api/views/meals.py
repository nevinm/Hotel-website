'''
Meal related views
'''
from django.conf import settings
from django.contrib.sessions.backends.db import SessionStore
from django.core.paginator import Paginator
from django.db.models import Q
import logging

from api.views.decorators import check_input
import json as simplejson
from libraries import get_request_user, custom_error, json_response
from meisterdish_server.models import Meal, CartItem, User, Configuration


log = logging.getLogger(__name__)


@check_input('POST')
def get_meals(request, data):
    '''
    API to get list of meals
    :param request:
    :param data:
    '''
    try:
        user = get_request_user(request)

        limit = data.get('perPage', settings.PER_PAGE)
        page = data.get("nextPage", None)

        meal_list = []
        meals = Meal.objects.filter(is_deleted=False, available__gt=0)
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

        meals = meals.order_by("order", "pk")

        actual_count = meals.count()
        try:
            if page:
                paginator = Paginator(meals, limit)
                if page < 1 or page > paginator.page_range:
                    page = 1
                meals = paginator.page(page)
        except Exception as error:
            log.error("meal list pagination : " + error.message)
            custom_error("There was an error listing meals.")

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

            qty = 0
            if user:
                ci = CartItem.objects.filter(
                    cart__user=user, cart__completed=False, meal__pk=meal.id)
                qty = ci[0].quantity if ci.exists() else 0

            meal_list.append({
                "id": meal.id,
                "name": meal.name,
                "sub": meal.sub,
                "description": meal.description,
                "main_image": (
                    settings.DEFAULT_MEAL_IMAGE if not meal.main_image
                    else meal.main_image.image.url),
                "available": meal.available,
                "sold_out": 1 if meal.sold_out else 0,
                "category": ("Not Available" if not meal.category
                             else meal.category.name.title()),
                "meal_types": meal_types,
                "preparation_time": meal.preparation_time,
                "price": meal.price,
                "tax": (meal.price * meal.tax) / 100,
                "ingredients": ing_list,
                "in_cart": 1 if qty != 0 else 0,
                "quantity": qty,
                "order": meal.order})
        res = {"status": 1,
               "aaData": meal_list,
               "total_count": total_count,
               "actual_count": actual_count,
               "page_range": paginator.page_range if page else 1}
        if page:
            res["num_pages"] = paginator.num_pages
            res["current_page"] = page
            res["per_page"] = limit

        return json_response(res)
    except Exception as error:
        log.error("Failed to list meals : " + error.message)
        return custom_error("Failed to list meals")


@check_input('POST')
def get_meal_details(request, data, meal_id):
    '''
    API to get deatils of a particular meal
    :param request:
    :param data:
    :param meal_id:
    '''
    try:
        session_key = request.META.get('HTTP_SESSION_KEY', None)
        session = SessionStore(session_key=session_key)
        if session and 'user' in session:
            try:
                user = User.objects.get(pk=session['user']['id'])
            except Exception as error:
                user = None
        else:
            user = None

        if str(meal_id) == '0':  # Get meal for home page
            meal_id = Configuration.objects.filter(key='home_meal_id')
            if not meal_id.exists():
                return custom_error("Home meal is not set.")
            else:
                meal_id = int(meal_id[0].value)

        meal = Meal.objects.get(pk=meal_id, is_deleted=False, available__gt=0)
        rating_list = []
        rating_sum = 0.0
        rating_count = 0
        for rating in meal.mealrating.filter(is_deleted=False):
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
                "description": ("" if tips.description.strip() == ""
                                else simplejson.loads(tips.description)),
                "image_url": (settings.DEFAULT_MEAL_IMAGE if tips.image is None
                              else tips.image.image.url),
                "video_url": "" if tips.video_url is None else tips.video_url,
                "image_url1": "" if tips.image_url is None else tips.image_url,
            })
        qty = 0
        if user:
            ci = CartItem.objects.filter(
                cart__user=user, cart__completed=False, meal__pk=meal.id)
            qty = ci[0].quantity if ci.exists() else 0
        meal_types = [{
            "id": ty.id,
            "image_id": ty.image.id,
            "image_url": ty.image.image.url,
            "meal_type_name": ty.name} for ty in meal.types.all()]
        return json_response({
            "status": 1,
            "id": meal.id,
            "name": meal.name,
            "sub": meal.sub,
            "description": meal.description,
            "price": meal.price,
            "need_boiling_water": meal.need_boiling_water,
            "tax": (meal.price * meal.tax) / 100,
            "available": meal.available,
            "sold_out": 1 if meal.sold_out else 0,
            "calories": meal.calories,
            "cat_id": 'Not Available' if not meal.category else {
                "id": meal.category.id,
                "name": meal.category.name.title(),
            },
            "chef_id": "Not available" if not meal.chef else meal.chef.id,
            "chef_name": ("Not available" if not meal.chef
                          else meal.chef.name.title()),
            "chef_image": (
                {
                    "url": settings.DEFAULT_USER_IMAGE, "id": ""
                } if not meal.chef or not meal.chef.image
                else {
                    "id": meal.chef.image.id,
                    "url": meal.chef.image.thumb.url,
                }),
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
                "" if not meal.pre_requisites or meal.pre_requisites == ""
                else simplejson.loads(meal.pre_requisites)),
            "pre_requisites_image": (
                settings.DEFAULT_MEAL_IMAGE
                if meal.pre_requisites_image is None
                else {
                    "id": meal.pre_requisites_image.id,
                    "url": meal.pre_requisites_image.image.url,
                }),

            "nutrients": (
                "" if not meal.nutrients or meal.nutrients == ""
                else simplejson.loads(meal.nutrients)),
            "ingredients": [
                {"id": ing.id,
                 "name": ing.name,
                 "image_url": ing.image.image.url}
                for ing in meal.ingredients.all()],
            "tips": tips_list,
            "allergy_notice": meal.allergy_notice,
            "images": image_list,
            "ratings": rating_list,
            "avg_rating": (rating_sum / rating_count
                           if int(rating_count) != 0
                           else 0),
            "ratings_count": rating_count,
            "main_image": (
                {"url": settings.DEFAULT_MEAL_IMAGE, "id": ""}
                if not meal.main_image
                else {"id": meal.main_image.id,
                      "url": meal.main_image.image.url, }),
            "in_cart": 1 if user and CartItem.objects.filter(
                cart__user=user, meal__pk=meal.id).exists() else 0,
            "quantity": qty,
            "meal_types": meal_types,
            "default_meal_type_image": settings.DEFAULT_MEAL_TYPE_IMAGE,
        })
    except Exception as error:
        log.error("get_meal details : " + error.message)
        return custom_error("Failed to get the meal details.")
