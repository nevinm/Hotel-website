from meisterdish_server.models import *
import json as simplejson
import logging, settings
from django.db.models import Q
from api.views.decorators import *
from django.core.paginator import Paginator
from libraries import get_request_user

log = logging.getLogger('api')

@check_input('POST')
def get_meals(request, data):
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
            
        actual_count = meals.count()
        try:
            paginator = Paginator(meals, limit)
            if page <1 or page > paginator.page_range:
                page = 1
            meals = paginator.page(page)
        except Exception as e:
            log.error("meal list pagination : " + e.message)
            custom_error("There was an error listing meals.")
        
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
            ingredients = simplejson.loads(meal.ingredients) if meal.ingredients is not None and len(meal.ingredients) > 0 else []
            
            meal_types = [{"id":ty.id, "name":ty.name.title()} for ty in meal.types.all()]
            
            meal_list.append({
                              "id":meal.id,
                              "name":meal.name,
                              "sub":meal.sub,
                              "description":meal.description,
                              #"images":meal_images,
                              "main_image" : settings.DEFAULT_MEAL_IMAGE if not meal.main_image else meal.main_image.thumb.url,
                              "available":1 if meal.available else 0,
                              "category":"Not Available" if not meal.category else meal.category.name.title(),
                              "meal_types":meal_types,
                              "preparation_time":meal.preparation_time,
                              "price":meal.price,
                              "tax":meal.tax,
                              "ingredients":ingredients,
                              "in_cart" : 1 if user and CartItem.objects.filter(cart__user=user, cart__completed=False, meal__pk=meal.id).exists() else 0,
                              
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
    
