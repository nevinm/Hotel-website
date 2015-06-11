from django.db.models import Q
from api.views.decorators import *
from django.core.paginator import Paginator
from meisterdish_server.models import GiftCard, PromoCode
from datetime import datetime
import settings , logging
from libraries import save_payment_data
import string, random
from libraries import get_request_user, create_guest_user, validate_email

log = logging.getLogger('api')
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
            if Cart.objects.filter(completed=True, promo_code=promo_obj).exists():
                return custom_error("Cannot delete this code. This code is used somewhere.")
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
        if cart.promo_code:
            return custom_error("You cannot apply more than one promo code for a single transaction.")

        code = data["code"].strip()
        code_obj = PromoCode.objects.get(code=code, deleted=False)
        if code_obj.expiry_date < datetime.now():
            return custom_error("The Promo Code ("+ code +") has expired.")

        #Promo code Type check TODO
        
        cart.promo_code = code_obj
        cart.save()
    except Exception as e:
        log.error("Failed to apply promo code." + e.message)
        return custom_error("Failed to get apply promo code.")
>>>>>>> 6dff53e7a39126afc13e7c1876b0b34be862d02b

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

@check_input('POST')
def gift_card_order(request, data, user=None):
    try:
        name = data["name"].strip()
        email = data["email"].strip()
        message = data["message"].strip()
        amount = data["amount"]
        if name == "" or email == "" or message == "":
            return custom_error("Please provide valid details.")
        elif not validate_email(email):
            return custom_error("Please provide valid email.")
        elif float(amount) < 25:
            return custom_error("The minimum gift card amount should be $25.")

        user = get_request_user(request)
        if not user:
            (user, session_key) = create_guest_user(request)
        else:
            session_key = None

        save_card = bool(data.get("save_card", 0))
        card_id = data.get("card_id", False)
        
        if not card_id:
            token = data["stripeToken"].strip()

        if user.stripe_customer_id and str(user.stripe_customer_id).strip() != "":
            customer = stripe.Customer.retrieve(user.stripe_customer_id)
            if card_id:
                #Using pre-saved card
                card_id = CreditCardDetails.objects.get(pk=card_id).card_id
                card = customer.sources.retrieve(card_id)
            else:
                #Add the entered card to the exising customer
                card = customer.sources.create(source=token)
        elif not card_id:
            #Create new customer
            customer = stripe.Customer.create(
                source=token,
                description="meisterdish_user_"+str(user.id)
            )

            #Save customer id to user table, for future use
            user.stripe_customer_id = customer.id
            user.save()

            cards = customer.sources.all(object="card")
            if cards:
                card = cards.data[0]
            else:
                log.error("Failed to save Stripe card")
            
            if save_card:
                c_card = CreditCardDetails()
                c_card.user = user
                c_card.card_id = card.id
                c_card.number = '#### #### #### '+str(card.last4)
                c_card.funding = card.funding
                c_card.expire_year = card.exp_year
                c_card.expire_month = card.exp_month
                c_card.card_type = card.brand
                c_card.save()


        response = stripe.Charge.create(
            amount=int(amount * 100), #Cents
            currency="usd",
            customer=customer.id,
            source = card.id
        )

        log.info(response)
        payment =  save_payment_data(response)
        if not payment:
            return custom_error("Failed to make payment. Please try again later.")
        
        code = ''.join(random.SystemRandom().choice(string.ascii_uppercase + string.digits) for _ in range(6))

        gc = GiftCard()
        gc.user = user
        gc.code = code
        gc.name = name
        gc.email = email
        gc.message = message
        gc.amount = amount
        gc.payment = payment
        gc.save()
        
        if not gc.id:
            log.error("Gift card payment success, but failed to create card.")
            return custom_error("Failed to create GiftCard. Please contact customer support.")

        if send_gift_card(gc):
            return json_response({"status":1, "messge":"The Gift Card coupon has been sent to " + gc.to_email, "id":gc.id})
        else:
            log.error("Gift card created, but failed to send.")
            return custom_error("There was an error sending Gift Card. Please contact customer support.")
    except IOError as e:
        log.error("Buy gift card error : " + e.message)
        return custom_error("An error has occurred. Please try again later.")

def send_gift_card(gc):
    # TODO
    dic = {
        "code" : gc.code,
        "name" : gc.name,
        "message":gc.message
        "first_name" : gc.user.first_name.title(),
        "last_name" : gc.user.last_name.title(),
        "amount" : str(gc.amount),
    }

    msg = render_to_string('gift_card_email.html', dic)
    sub = 'Your Gift Card for Meisterdish'    
        
    mail([gc.email], sub, msg )
    return True

@check_input('POST')
def apply_promocode(request, data, user):
    try:
        cart = Cart.objects.get(completed=False, user=user)
        if cart.promo_code:
            return custom_error("You cannot apply more than one promo code for a single transaction.")

        code = data["code"].strip()
        code_obj = PromoCode.objects.get(code=code, deleted=False)
        if code_obj.expiry_date < datetime.now():
            return custom_error("The Promo Code ("+ code +") has expired.")

        #Promo code Type check TODO
        
        cart.promo_code = code_obj
        cart.save()
    except Exception as e:
        log.error("Failed to apply promo code." + e.message)
        return custom_error("Failed to get apply promo code.")
