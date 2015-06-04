from django.db.models import Q
from decorators import *
from django.core.paginator import Paginator
from api.models import GiftCard, PromoCode
from datetime import datetime
import settings 
@check_input('POST', True)
def manage_gift_card(request, data, user):
    try:
        if "edit_id" in data and str(data["edit_id"]).strip() != "":
            code = data['code'].strip()
            name = data['name'].strip()
            amount = float(str(data['amount']).strip())

            if name == "" or code == "":
                return custom_error("Please enter valid gift card details.")
            elif amount < 10 or amount > 1000:
                return custom_error("Please enter a valid amount.")

            action = "Updat"
            if GiftCard.objects.exclude(pk=data["edit_id"]).filter(Q(code=code) | Q(name=name)).exists():
                return custom_error("Either Gift Card code or name already exists.")
            elif PromoCode.objects.filter(code=code).exists():
                return custom_error("A promo code with this code already exists.")

            gc = GiftCard.objects.get(pk=data["edit_id"])
        elif "delete_id" in data and data["delete_id"]:
            gc_obj = GiftCard.objects.get(pk=data["delete_id"])
            message = "Deleted " + gc_obj.name
            gc_obj.delete()
            return json_response({"status":1, "id":data["delete_id"], "message": message})

        else:
            code = data['code'].strip()
            name = data['name'].strip()
            amount = float(str(data['amount']).strip())

            if name == "" or code == "":
                return custom_error("Please enter valid gift card details.")
            elif amount < 10 or amount > 1000:
                return custom_error("Please enter an amount between $ 10 and $ 1000.")

            if GiftCard.objects.filter(Q(code=code) | Q(name=name)).exists():
                return custom_error("Either Gift Card code or name already exists.")
            elif PromoCode.objects.filter(code=code).exists():
                return custom_error("A promo code with this code already exists.")

            action = "Add"
            gc = GiftCard()
        
        gc.code = code
        gc.amount = amount
        gc.name = name
        gc.save()
        return json_response({"status":1, "id":gc.id, "message": action + "ed "+name, "code":code})
      
    except Exception as e:
        log.error("Manage GiftCards : " + e.message)
        return custom_error("An error has occurred. Please try again later.")

@check_input('POST', True)
def list_gift_cards(request, data, user):
    try:
        limit = data.get('perPage', settings.PER_PAGE)
        page = data.get("nextPage",1)
                    
        gc_list = []
        gcs = GiftCard.objects.all()
        total_count = gcs.count()
        
        #Filter
        if "code" in data and str(data['code']).strip() != "":
            gcs.filter(code__istartswith=data['code'])
        
        if "name" in data and str(data['name']).strip() != "":
            gcs.filter(name__istartswith=data['name'])

        # End filter
        gcs = gcs.order_by("-id")
        actual_count = gcs.count()

        try:
            paginator = Paginator(gcs, limit)
            if page <1 or page > paginator.page_range:
                page = 1
            gcs = paginator.page(page)
        except Exception as e:
            log.error("Gift Card list pagination : " + e.message)
            custom_error("There was an error listing gift cards.")

        #Format response
        for gc in gcs:
            gc_list.append({
                "id" : gc.id,
                "name":gc.name.title(),
                "code":gc.code,
                "amount":gc.amount
                })
        #End format response
        return json_response({"status":1, 
                              "aaData":gc_list,
                              "total_count":total_count,
                              "actual_count":actual_count,
                              "num_pages" : paginator.num_pages,
                              "page_range" : paginator.page_range,
                              "current_page":page,
                              "per_page" : limit,
                              })
    except Exception as e:
        log.error("Failed to list Gift Cards." + e.message)
        return custom_error("Failed to get gift cards.")

@check_input('POST', True)
def manage_promocode(request, data, user):
    try:
        if "edit_id" in data and str(data["edit_id"]).strip() != "":
            code = data['code'].strip()
            amount = float(str(data['amount']).strip())
            expiry_date = datetime.strptime(str(data['expiry_date']).strip()+" 23:59:59","%Y-%m-%d %H:%M:%S")

            if code == "":
                return custom_error("Please enter valid promo code.")
            elif amount < 10 or amount > 1000:
                return custom_error("Please enter a valid amount.")

            action = "Updat"
            if PromoCode.objects.exclude(pk=data["edit_id"]).filter(code=code).exists():
                return custom_error("The Promo code ("+ code+") already exists.")
            elif GiftCard.objects.filter(code=code).exists():
                return custom_error("A gift card with this code or name already exists.")

            promo = PromoCode.objects.get(pk=data["edit_id"])

        elif "delete_id" in data and data["delete_id"]:
            promo_obj = PromoCode.objects.get(pk=data["delete_id"])
            message = "Deleted " + promo_obj.code
            promo_obj.delete()
            return json_response({"status":1, "id":data["delete_id"], "message": message})

        else:
            code = data['code'].strip()
            amount = float(str(data['amount']).strip())
            expiry_date = datetime.strptime(str(data['expiry_date']).strip()+" 23:59:59","%Y-%m-%d %H:%M:%S")

            if code == "":
                return custom_error("Please enter valid promo code.")
            elif amount < 10 or amount > 1000:
                return custom_error("Please enter a valid amount.")

            if PromoCode.objects.filter(code=code).exists():
                return custom_error("The Promo code ("+ code+") already exists.")
            elif GiftCard.objects.filter(code=code).exists():
                return custom_error("A gift card with this code or name already exists.")

            action = "Add"
            promo = PromoCode()
        
        promo.code = code
        promo.amount = amount
        promo.expiry_date = expiry_date
        promo.save()
        return json_response({"status":1, "id":promo.id, "message": action + "ed "+code, "code":code})
      
    except Exception as e:
        log.error("Manage Promo codes : " + e.message)
        return custom_error("An error has occurred. Please try again later.")

@check_input('POST', True)
def list_promocodes(request, data, user):
    try:
        limit = data.get('perPage', settings.PER_PAGE)
        page = data.get("nextPage",1)
                    
        promo_list = []
        promos = PromoCode.objects.all()
        total_count = promos.count()
        
        #Filter
        if "code" in data and str(data['code']).strip() != "":
            promos.filter(code__istartswith=data['code'])
        
        # End filter

        promos = promos.order_by("-id")
        actual_count = promos.count()

        try:
            paginator = Paginator(promos, limit)
            if page <1 or page > paginator.page_range:
                page = 1
            promos = paginator.page(page)
        except Exception as e:
            log.error("Promocode list pagination : " + e.message)
            custom_error("There was an error listing promo codes.")

        #Format response
        for promo in promos:
            promo_list.append({
                "id" : promo.id,
                "code":promo.code,
                "amount":promo.amount,
                "expiry_date":promo.expiry_date.strftime("%m/%d/%Y %H:%M:%S"),
                "expiry_date_format":promo.expiry_date.strftime("%Y-%m-%d")
                })
        #End format response
        return json_response({"status":1, 
                              "aaData":promo_list,
                              "total_count":total_count,
                              "actual_count":actual_count,
                              "num_pages" : paginator.num_pages,
                              "page_range" : paginator.page_range,
                              "current_page":page,
                              "per_page" : limit,
                              })
    except Exception as e:
        log.error("Failed to list promo codes." + e.message)
        return custom_error("Failed to get promo codes.")

@check_input('POST', True)
def apply_promocode(request, data, user):
    try:
        cart = Cart.objects.get(completed=False, user=user)
        if cart.promo_code and cart.promo_code != None:
            return custom_error("You cannot apply more than one promo code for a single transaction.")

        code = data["code"].strip()
        code_obj = PromoCode.objects.get(code=code, deleted=False)

        cart.promo_code = code_obj
        cart.save()
    except Exception as e:
        log.error("Failed to apply promo code." + e.message)
        return custom_error("Failed to get apply promo code.")

@check_input('POST')
def redeem_gift_card(request, data, user):
    try:
        code = data["code"].strip()
        try:
            gift_card = GiftCard.objects.get(user=user, code=code)
        except Exception as e:
            return custom_error("Invalid gift card code entered.")
        else:
            credits = gift_card.credits
            user.credits = user.credits + credits
            user.gift_cards.remove(gift_card)
            user.save()
            gift_card.delete()
        return json_response({"status":1, "message": " Success, $"+str(credits) +" have been added to your credits."})
    except Exception as e:
        log.error("Redeem gift card error : " + e.message)
        return custom_error("Failed to redeem gift card ")