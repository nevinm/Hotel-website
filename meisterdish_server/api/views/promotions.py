from django.db.models import Q
from api.views.decorators import *
from django.core.paginator import Paginator
from meisterdish_server.models import GiftCard, PromoCode
from datetime import datetime
import settings , logging
from libraries import save_payment_data
import string, random

log = logging.getLogger('api')

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
def gift_card_order(request, data, user):
    try:
        name = data["name"].strip()
        amount = data["amount"]

        if amount < 10 or amount > 1000:
            return custom_error("Please enter a valid gift card amount.")

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
        gc.amount = amount
        gc.payment = payment
        gc.save()
        
        if not gc.id:
            log.error("Gift card payment success, but failed to create card.")
            return custom_error("Failed to create GiftCard. Please contact customer support.")

        gc.to_email = data.get("email", user.email)

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
        "first_name" : gc.user.first_name.title(),
        "last_name" : gc.user.last_name.title(),
        "amount" : str(gc.amount),
    }

    msg = render_to_string('gift_card_email.html', dic)
    sub = 'Your Gift Card for Meisterdish'
    to_email = gc.user.email
        
    mail([to_email], sub, msg )
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
