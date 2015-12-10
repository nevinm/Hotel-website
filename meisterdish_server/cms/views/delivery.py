"""
CMS Delivery related views and functions
"""
from datetime import timedelta
import datetime
from django.conf import settings
from django.core.paginator import Paginator
import logging

from cms.views.decorators import check_input
from libraries import custom_error, json_response, validate_zipcode,\
    validate_date
from meisterdish_server.models import DeliveryArea, DeliveryTimeSlot


log = logging.getLogger(__name__)


@check_input('POST', settings.ROLE_ADMIN)
def get_delivery_areas(request, data, user):
    '''
    API to get delivery addresses
    :param request:
    :param data:
    :param user:
    '''
    try:
        limit = data.get('perPage', settings.PER_PAGE)
        page = data.get("nextPage", 1)

        if "search" in data and data["search"].strip() != "":
            areas = DeliveryArea.objects.filter(
                zip__startswith=data["search"].strip())
        else:
            areas = DeliveryArea.objects.all()
        areas = areas.order_by("-id")
        actual_count = areas.count()

        try:
            paginator = Paginator(areas, limit)
            if page < 1 or page > paginator.page_range:
                page = 1
            areas = paginator.page(page)

        except Exception as error:
            log.error("Delivery area list pagination : " + error.message)
            custom_error("There was an error listing delivery areas.")

        area_list = [{"id": area.id, "zip": str(area.zip)} for area in areas]
        return json_response({"status": 1,
                              "aaData": area_list,
                              "actual_count": actual_count,
                              "num_pages": paginator.num_pages,
                              "page_range": paginator.page_range,
                              "current_page": page,
                              "per_page": limit,
                              })
    except Exception as error:
        log.error("Get Delivery areas : " + error.message)
        return custom_error("An error has occurred. Please try again later.")


@check_input('POST', settings.ROLE_ADMIN)
def manage_delivery_area(request, data, user):
    '''
    API to manage delivery areas
    :param request:
    :param data:
    :param user:
    '''
    try:

        if "edit_id" in data and str(data["edit_id"]).strip() != "":
            zip = data['zip'].strip()
            if not validate_zipcode(zip):
                return custom_error("Please enter a valid zipcode.")

            action = "Updat"
            if DeliveryArea.objects.exclude(
                    pk=data["edit_id"]).filter(zip=zip).exists():
                return custom_error("Zipcode already exists.")
            area = DeliveryArea.objects.get(pk=data["edit_id"])
        elif "delete_id" in data and data["delete_id"]:
            zip_obj = DeliveryArea.objects.get(pk=data["delete_id"])
            zip = zip_obj.zip
            zip_obj.delete()
            return json_response({
                "status": 1,
                "id": data["delete_id"],
                "message": "Deleted " + zip,
                "zip": zip})

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
        return json_response({
            "status": 1,
            "id": area.id,
            "message": action + "ed " + zip,
            "zip": zip})

    except Exception as error:
        log.error("Manage delivery area error : " + error.message)
        return custom_error("An error has occurred. Please try again later.")


@check_input('POST', settings.ROLE_ADMIN)
def manage_delivery_slots(request, data, user):
    '''
    API to manage delivery slots
    :param request:
    :param data:
    :param user:
    '''
    try:
        single = False
        if "from_date" in data and str(data["from_date"]).strip() != "":
            from_date = data['from_date'].strip()
            if not validate_date(from_date):
                return custom_error("Please enter a valid from_date.")
        if "to_date" in data and str(data["to_date"]).strip() != "":
            to_date = data['to_date'].strip()
            if not validate_date(to_date):
                return custom_error('Please enter a valid to date')
        else:
            single = True

        try:
            if "slots_list" in data:
                slots_list = data["slots_list"]
        except ValueError:
            return custom_error('Please enter valid slot data')

        start_date = datetime.datetime.strptime(from_date, '%m-%d-%Y').date()

        if not single:
            end_date = datetime.datetime.strptime(to_date, '%m-%d-%Y').date()
        else:
            end_date = start_date

        day_count = (end_date - start_date).days + 1
        dates = [d for d in (start_date + timedelta(n)
                             for n in range(day_count)) if d.weekday() < 5]
        log.info("Dates in range are" +
                 " ".join([datetime.datetime.strftime(
                     i, format="%m-%d-%Y") for i in dates]))

        for slot_data in slots_list:
            if datetime.datetime.strptime(slot_data["date"], '%m-%d-%Y').date(
            ) not in dates and datetime.datetime.strptime(
                    slot_data["date"], '%m-%d-%Y').date().weekday() < 5:
                return custom_error("Date not in the given Range")
            time_slots = DeliveryTimeSlot.objects.filter(
                date=datetime.datetime.strptime(slot_data["date"], '%m-%d-%Y'))

            if len(time_slots) == 0:
                time_slots = DeliveryTimeSlot(
                    date=datetime.datetime.strptime(
                        slot_data["date"], '%m-%d-%Y'))
            else:
                time_slots = time_slots[0]

            time_slots.slot1 = slot_data["slot1"]
            time_slots.slot2 = slot_data["slot2"]
            time_slots.slot3 = slot_data["slot3"]
            time_slots.slot4 = slot_data["slot4"]
            time_slots.slot5 = slot_data["slot5"]

            time_slots.save()
            log.info("Time slots saved ")

        return json_response({
            "status": 1,
            "message": ("value form " + from_date +
                        " to " + to_date +
                        " saved successfully"),
        }

        )

    except Exception as error:
        log.error("Manage delivery slot error : " + error.message)
        return custom_error("An error has occurred. Please try again later.")


@check_input('POST', settings.ROLE_ADMIN)
def get_delivery_slots(request, data, user):
    '''
    API to get delivery slots
    :param request:
    :param data:
    :param user:
    '''
    try:
        single = False
        if "from_date" in data and str(data["from_date"]).strip() != "":
            from_date = data['from_date'].strip()
            if not validate_date(from_date):
                return custom_error("Please enter a valid from_date.")
        if "to_date" in data and str(data["to_date"]).strip() != "":
            to_date = data['to_date'].strip()
            if not validate_date(to_date):
                return custom_error('Please enter a valid to date')
        else:
            single = True
        log.info("Date validated")
        start_date = datetime.datetime.strptime(from_date, '%m-%d-%Y').date()
        log.info("Strp ed start date")
        slots_list = []

        if not single:
            end_date = datetime.datetime.strptime(to_date, '%m-%d-%Y').date()
        else:
            end_date = start_date

        day_count = (end_date - start_date).days + 1
        dates = [d for d in (start_date + timedelta(n)
                             for n in range(day_count)) if d.weekday() < 5]
        for d in dates:
            time_slots = DeliveryTimeSlot.objects.filter(date=d)
            if len(time_slots) == 0:
                tmp = DeliveryTimeSlot.objects.filter(
                    date=d - timedelta(days=7))
                if tmp:
                    time_slots = DeliveryTimeSlot.objects.create(
                        date=d,
                        slot1=tmp[0].slot1,
                        slot2=tmp[0].slot2,
                        slot3=tmp[0].slot3,
                        slot4=tmp[0].slot4,
                        slot5=tmp[0].slot5)
                else:

                    time_slots = DeliveryTimeSlot.objects.create(
                        date=d, slot1=0, slot2=0, slot3=0, slot4=0, slot5=0)
            else:
                time_slots = time_slots[0]
            slots = {
                "date": time_slots.date.strftime('%m-%d-%Y'),
                "slot1": time_slots.slot1,
                "slot2": time_slots.slot2,
                "slot3": time_slots.slot3,
                "slot4": time_slots.slot4,
                "slot5": time_slots.slot5,
            }
            slots_list.append(slots)
            time_slots.save()

        return json_response({"status": 1,
                              "aaData": slots_list,
                              "total_count": len(slots_list)
                              }

                             )

    except Exception as error:
        log.error("List delivery slot error : " + error.message)
        return custom_error("An error has occurred. Please try again later.")
