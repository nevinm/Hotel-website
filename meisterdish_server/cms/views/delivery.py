from cms.views.decorators import *
from meisterdish_server.models import *
import logging 
import settings
from django.core.paginator import Paginator
from libraries import validate_zipcode

log = logging.getLogger('cms')


@check_input('POST', True)
def get_delivery_areas(request, data, user):
    try:
        limit = data.get('perPage', settings.PER_PAGE)
        page = data.get("nextPage",1)

        if "search" in data and data["search"].strip() != "":
          areas = DeliveryArea.objects.filter(zip__startswith=data["search"].strip())
        else:
          areas = DeliveryArea.objects.all()
        areas = areas.order_by("-id")
        actual_count = areas.count()

        try:
            paginator = Paginator(areas, limit)
            if page <1 or page > paginator.page_range:
                page = 1
            areas = paginator.page(page)

        except Exception as e:
            log.error("Delivery area list pagination : " + e.message)
            custom_error("There was an error listing delivery areas.")

        area_list = [{"id":area.id, "zip":str(area.zip)} for area in areas]
        return json_response({"status":1, 
                              "aaData":area_list,
                              "actual_count":actual_count,
                              "num_pages" : paginator.num_pages,
                              "page_range" : paginator.page_range,
                              "current_page":page,
                              "per_page" : limit,
                              })
    except Exception as e:
        log.error("Get Delivery areas : " + e.message)
        return custom_error("An error has occurred. Please try again later.")

@check_input('POST', True)
def manage_delivery_area(request, data, user):
    try:
        
        if "edit_id" in data and str(data["edit_id"]).strip() != "":
            zip = data['zip'].strip()
            if not validate_zipcode(zip):
                return custom_error("Please enter a valid zipcode.")

            action = "Updat"
            if DeliveryArea.objects.exclude(pk=data["edit_id"]).filter(zip=zip).exists():
                return custom_error("Zipcode already exists.")
            area = DeliveryArea.objects.get(pk=data["edit_id"])
        elif "delete_id" in data and data["delete_id"]:
            zip_obj = DeliveryArea.objects.get(pk=data["delete_id"])
            zip = zip_obj.zip
            zip_obj.delete()
            return json_response({"status":1, "id":data["delete_id"], "message": "Deleted "+zip, "zip":zip})

        else:
            zip = data['zip'].strip()
            if not validate_zipcode(zip):
                return custom_error("Please enter a valid zipcode.")
            if DeliveryArea.objects.filter(zip=zip).exists():
                return custom_error("Zipcode already exists.")
            action = "Add"
            area = DeliveryArea()
        
        area.zip = zip
        area.save()
        return json_response({"status":1, "id":area.id, "message": action + "ed "+zip, "zip":zip})
      
    except Exception as e:
        log.error("Manage delivery area error : " + e.message)
        return custom_error("An error has occurred. Please try again later.")