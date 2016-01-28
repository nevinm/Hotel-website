"""
Helper methods
"""

from datetime import datetime
from django.conf import settings
from django.contrib.sessions.backends.db import SessionStore
from django.core.mail.message import EmailMessage
from django.http.response import HttpResponse
from django.template.loader import render_to_string
from django.utils import timezone
from email.mime.image import MIMEImage
import logging
import os
import re

import json as simplejson
from meisterdish_server.models import Image, User, Role, DeliveryArea, Payment,\
    Address, ZipUnavailable, Configuration
from twilio.rest import TwilioRestClient


log = logging.getLogger('libraries')


def mail(to_list, subject, message, sender=None, headers=None, design=True):
    '''
    Function to send mail
    :param to_list:
    :param subject:
    :param message:
    :param sender:
    :param headers:
    :param design:
    '''
    if not sender:
        sender = "Meisterdish<contact@meisterdish.com>"
    if not headers:
        headers = {
            'Reply-To': "Meisterdish<contact@meisterdish.com>",
            'From': "Meisterdish<contact@meisterdish.com>",
        }
    msg = EmailMessage(subject, message, sender, to_list, headers=headers)
    msg.content_subtype = "html"
    msg.mixed_subtype = 'related'

    if design:
        for cid, img in settings.EMAIL_IMAGES.items():
            fp = open(img, 'rb')
            msg_image = MIMEImage(fp.read())
            fp.close()
            msg_image.add_header('Content-ID', '<' + cid + '>')
            msg.attach(msg_image)
    else:
        imgs = {
            "meisterdish_logo": os.path.join(
                settings.STATIC_ROOT, "default", "logo_email.png"),
            "fb": os.path.join(settings.STATIC_ROOT, "default", "fb_icon.png"),
            "in": os.path.join(settings.STATIC_ROOT, "default", "in_icon.png")}
        for cid, img in imgs.items():
            fp = open(img, 'rb')
            msg_image = MIMEImage(fp.read())
            fp.close()
            msg_image.add_header('Content-ID', '<' + cid + '>')
            msg.attach(msg_image)
    return msg.send()


def send_referel_mail(to_list, subject, message, sender=None, headers=None,
                      design=True):
    '''
    Function to send referral email
    :param to_list:
    :param subject:
    :param message:
    :param sender:
    :param headers:
    :param design:
    '''
    if not sender:
        sender = "Meisterdish<contact@meisterdish.com>"
    if not headers:
        headers = {
            'Reply-To': "Meisterdish<contact@meisterdish.com>",
            'From': "Meisterdish<contact@meisterdish.com>",
        }
    msg = EmailMessage(subject, message, sender, to_list, headers=headers)
    msg.content_subtype = "html"
    msg.mixed_subtype = 'related'
    share_images = {
        "meisterdish_logo": os.path.join(
            settings.STATIC_ROOT, "default", "logo_email.png"),
        "deliver": os.path.join(
            settings.STATIC_ROOT, "default", "deliver.png"),
        "recepies": os.path.join(
            settings.STATIC_ROOT, "default", "recepies.png"),
        "cook": os.path.join(
            settings.STATIC_ROOT, "default", "cook.png"),
        "fb": os.path.join(
            settings.STATIC_ROOT, "default", "fb_icon.png"),
        "instagram": os.path.join(
            settings.STATIC_ROOT, "default", "inst_icon.png"),
        "twitter": os.path.join(
            settings.STATIC_ROOT, "default", "tw_icon.png"),
    }
    if design:
        for cid, img in share_images.items():
            fp = open(img, 'rb')
            msg_image = MIMEImage(fp.read())
            fp.close()
            msg_image.add_header('Content-ID', '<' + cid + '>')
            msg.attach(msg_image)
    else:
        imgs = {"meisterdish_logo": os.path.join(
            settings.STATIC_ROOT, "default", "logo_email.png")}
        for cid, img in imgs.items():
            fp = open(img, 'rb')
            msg_image = MIMEImage(fp.read())
            fp.close()
            msg_image.add_header('Content-ID', '<' + cid + '>')
            msg.attach(msg_image)
    return msg.send()


def mail_order_confirmation(
        to_list, subject, message, order,
        sender="Meisterdish<contact@meisterdish.com>",
        headers={
            'Reply-To': "Meisterdish<contact@meisterdish.com>",
            'From': "Meisterdish<contact@meisterdish.com>",
        }):
    '''
    Function to send order confirmation email
    :param to_list:
    :param subject:
    :param message:
    :param order:
    :param sender:
    :param headers:
    '''
    try:
        msg = EmailMessage(subject, message, sender, to_list, headers=headers)
        msg.content_subtype = "html"
        msg.mixed_subtype = 'related'
        user = order.cart.user
        first_name = user.first_name.title(
        ) if user.role.id == settings.ROLE_USER else "Guest"
        if "Guest" not in first_name:
            share_images = {
                "share_fb": os.path.join(
                    settings.STATIC_ROOT, "default", "share_fb.png"),
                "meisterdish_logo": os.path.join(
                    settings.STATIC_ROOT, "default", "logo_email.png"),
            }
        else:
            share_images = {
                "meisterdish_logo": os.path.join(
                    settings.STATIC_ROOT, "default", "logo_email.png"),
            }

        for ci in order.cart.cartitem_set.all():
            share_images["img_" + str(ci.meal.id)] = (
                ci.meal.main_image.image.path if ci.meal.main_image
                else os.path.join(
                    settings.STATIC_ROOT, "default", "meal-default.jpg"))

        for cid, img in share_images.items():
            fp = open(img, 'rb')
            msg_image = MIMEImage(fp.read())
            fp.close()
            msg_image.add_header('Content-ID', '<' + cid + '>')
            msg.attach(msg_image)
        return msg.send()
    except KeyError as error:
        log.error(error.message)
        return False


def manage_image_upload(request):
    '''
    Function to manage image upload
    :param request:
    '''
    try:
        from django.core.files.uploadedfile import UploadedFile

        if request.FILES is None:
            return custom_error('Please upload a valid image')

        image_file = request.FILES[u'image_upload']
        wrapped_file = UploadedFile(image_file)
        filename = wrapped_file.name
        file_size = wrapped_file.file.size
        log.info('File upload : "' + str(filename) + '"')

        image = Image()
        image.title = str(filename)
        image.image = image_file
        image.save()
        log.info('Image uploaded.')

        return {
            "status": 1,
            "message": "Sucessfully uploaded the image.",
            "id": image.id,
            "name": filename,
            "size": file_size,
            "url": image.image.url,
            "thumbnail_url": image.thumb.url,
        }
    except Exception as error:
        log.error("Failed to upload image : " + error.message)
        return None


def validate_zipcode(zip_code):
    '''
    Function to validate zipcode
    :param zip:
    '''
    regex = r'^\d{5}(-\d{4})?$'
    if re.match(regex, str(zip_code)) is None:
        return False
    return True


def validate_date(date_str):
    '''
    Function to validate date
    :param date_str:
    '''
    try:
        datetime.strptime(date_str, '%m-%d-%Y')
        return True
    except ValueError:
        return False


def validate_email(email):
    '''
    Function to validate email
    :param email:
    '''
    regex = "[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?"
    if re.match(regex, str(email)) is None:
        return False
    return True


def validate_phone(phone):
    '''
    Function to validate phone number
    :param phone:
    '''
    regex = "^(1\s*[-\/\.]?)?(\((\d{3})\)|(\d{3}))\s*[-\/\.]?\s*(\d{3})\s*[-\/\.]?\s*(\d{4})\s*(([xX]|[eE][xX][tT])\.?\s*(\d+))*$"
    if re.match(regex, str(phone)) is None:
        return False
    return True


def get_request_user(request):
    '''
    Function to get current user
    :param request:
    '''
    session_key = request.META.get('HTTP_SESSION_KEY', None)
    session = SessionStore(session_key=session_key)
    if session and 'user' in session:
        try:
            user = User.objects.get(pk=session['user']['id'])
        except Exception:
            user = None
    else:
        user = None
    return user


def create_guest_user(request, details=None):
    '''
    Function to create a new guest user
    :param request:
    :param details:
    '''
    log.info(details)
    try:
        if details:
            email = 'guest_' + details["guest_email"].strip()
            try:
                user = User.objects.get(email=email, deleted=False)
            except User.DoesNotExist:
                user = User()
        else:
            user = User()
        user.role = Role.objects.get(pk=settings.ROLE_GUEST)
        user.is_active = True
        if details:
            user.first_name = details["guest_first_name"].strip()
            user.last_name = details["guest_last_name"].strip()
            user.email = email
            user.zip = details["guest_zip"].strip()
        user.save()

        if user.id:
            user_dic = {
                "id": user.id,
                "email": user.email,
                "first_name": user.first_name,
                "last_name": user.last_name,
                "role": user.role.id,
            }

            session = SessionStore()
            session["user"] = user_dic
            session.set_expiry = settings.SESSION_EXPIRY
            session.save()
            return user, session.session_key
        else:
            return None, None

    except Exception as error:
        log.error("Failed to add guest user " + error.message)
        return None, None


def check_delivery_area(zip_code):
    '''
    Function to check delivery area
    :param zip:
    '''
    if DeliveryArea.objects.filter(zip=zip_code).exists():
        return True
    return False


def json_request(request):
    '''
    Function to get json from request
    :param request:
    '''
    if request.method == 'GET':
        req = request.GET
        return req
    else:
        req = request.body

        if not req:
            req = '{"a":"b"}'

    if req:
        try:
            if request.FILES:
                return request.POST
            else:
                return simplejson.loads(req, "ISO-8859-1")
        except Exception as error:
            log.error("Error json-decoding input : " + error.message)
            return None
    else:
        return None


def nvp_request(request):
    '''
    Function to get request params
    :param request:
    '''
    if request.method == 'GET':
        req = request.GET
        return req
    else:
        req = request.POST
    return req


def json_response(response, wrap=False):
    '''
    Function to return json response
    :param response:
    :param wrap:
    '''
    if wrap:
        final_response = {"data": response}
    else:
        final_response = response
    header_res = HttpResponse(simplejson.dumps(final_response))
    return header_res


def custom_error(message, status=-1):
    '''
    Function to raise custom error as response
    :param message:
    :param status:
    '''
    return json_response({'status': status, 'message': message})


def save_payment_data(data):
    '''
    Function to save payment data
    :param data:
    '''
    try:
        payment = Payment()
        payment.response = simplejson.dumps(data)
        payment.transaction_id = data["id"]
        payment.transaction_date = datetime.fromtimestamp(data["created"])
        payment.amount = data["amount"]

        if data["status"].lower() == "succeeded":
            payment.verified = True
        payment.save()
        return payment
    except Exception as error:
        log.error("Failed to save payment data " + error.message)
        return False


def create_address_text_from_model(address, phone=None):
    '''
    Function to create address string from Address model
    :param address:
    :param phone:
    '''
    if not address or not isinstance(address, Address):
        return "Pick up ( Ph: +1 " + str(phone) + ")"
    text = address.first_name.title() + " " + address.last_name.title() + ", "
    text += address.street + ", " + address.building + ", "
    text += address.city.title() + ", " + address.state.name + ", "
    text += str(address.zip) + ", Ph: +1 " + str(address.phone)
    return text


def export_csv(export_list, filename):
    '''
    Function to export to csv
    :param export_list:
    :param filename:
    '''
    import csv
    response = HttpResponse(content_type='text/csv')
    response['Content-Disposition'] = 'attachment; filename="' + filename + '"'
    writer = csv.writer(response)
    for row in export_list:
        writer.writerow([s.encode("utf-8") for s in row if s is not None])
    return response


def get_time_past(dtm):
    '''
    Function to return time passed
    :param dtm:
    '''
    now = datetime.now()
    mins = (now - dtm).days * 24 * 60
    return mins


def add_to_mailing_list(email, zip_code):
    '''
    Function to add email to mailchimp email list
    :param email:
    :param zip:
    '''
    try:
        zip_code = int(zip_code)
        import mailchimp

        if not ZipUnavailable.objects.filter(email=email).exists():
            zu = ZipUnavailable()
            zu.email = email
            zu.zipcode = zip_code
            zu.save()

        mc = mailchimp.Mailchimp(settings.MAILCHIMP_API_KEY)
        res = mc.lists.subscribe(
            settings.MAILCHIMP_LIST_ID, {'email': email}, {"merge3": zip_code},
            double_optin=False)
        if res and res['euid']:
            log.info("Added email to list")
            return True
        else:
            log.info("Failed to add email to list")
            return False
    except Exception as error:
        log.error("Failed to add to mailing list : " + error.message)
        return False


def send_text_reminder(context):
    '''
    Function to send reminder text before 2 hours of delivery
    :param context:
    '''
    try:
        txt = "Your Meisterdish is getting prepared and will be delivered \
            within the next hour. Please make sure that you are at location \
            to receive your meal"
        client = TwilioRestClient(
            settings.TWILIO_ACCOUNT_SID, settings.TWILIO_AUTH_TOKEN)
        country_code = "+1"
        number = country_code + str(context["mobile"]).strip()
        message = client.messages.create(
            body=txt, to=number,
            from_=settings.TWILIO_NUMBER)
        log.info(message)
        if message:
            log.info("Sent SMS to " + number)
            return True
        else:
            log.error("Failed to send SMS to " + number)
            return False
    except Exception as error:
        log.error(
            "Failed to send order SMS to : " + number + " : " + error.message)
        return False


def send_failure_mail(to_list, subject,
                      message, req,
                      user=None, sender=None,
                      headers=None):
    '''
    Function to send mail
    :param to_list:
    :param subject:
    :param message:
    :param sender:
    :param headers:
    :param design:
    '''
    try:
        if not sender:
            sender = "Meisterdish<error@meisterdish.com>"
        if not headers:
            headers = {
                'Reply-To': "Meisterdish<contact@meisterdish.com>",
                'From': "Meisterdish<error@meisterdish.com>",
            }
        source_ip = (get_client_ip(req)
                     if get_client_ip(req) is not None
                     else 'Not Available'
                     )
        usr = (user.full_name if user is not None
               else 'Not Applicable')

        dic = {
            'error_reason': message,
            'sub': subject,
            'error_time': timezone.now(),
            'error_ip': source_ip,
            'user': usr,
        }
        log.info("data is " + str(dic))
        log.info("User is : " + str(user))
        message_html = render_to_string('failure_alert_email.html', dic)
        msg = EmailMessage(
            subject, message_html, sender, [to_list, ], headers=headers)
        log.info('Message Details :' + str(msg))
        msg.content_subtype = "html"
        msg.mixed_subtype = 'related'
        log.info('Sending message')
        imgs = {
            "meisterdish_logo": os.path.join(
                settings.STATIC_ROOT, "default", "logo_email.png"),
        }
        for cid, img in imgs.items():
            fp = open(img, 'rb')
            msg_image = MIMEImage(fp.read())
            fp.close()
            msg_image.add_header('Content-ID', '<' + cid + '>')
            msg.attach(msg_image)

        return msg.send()
    except Exception as error:
        log.error("Failure Message failed due to:  " + error.message)


def get_client_ip(request):
    if request is not None:
        x_forwarded_for = request.META.get('HTTP_X_FORWARDED_FOR')
        if x_forwarded_for:
            ip = x_forwarded_for.split(',')[0]
        else:
            ip = request.META.get('REMOTE_ADDR')
        return ip
    else:
        return 'Not Available'


def send_order_notification_sms(order):
    '''
    Function to send reminder when a new order comes.
    :param context:
    '''
    try:
        txt = "Meisterdish order  \
        " + str(order.order_num) + " recieved"
        number = Configuration.objects.get(key='NOTIFICATION_NUMBER').value
        client = TwilioRestClient(
            settings.TWILIO_ACCOUNT_SID, settings.TWILIO_AUTH_TOKEN)
        country_code = "+1" if number not in settings.INDIAN_NUMBERS else "+91"
        number = country_code + number
        message = client.messages.create(
            body=txt, to=number,
            from_=settings.TWILIO_NUMBER)
        log.info(message)
        if message:
            log.info("Sent SMS to " + number)
            return True
        else:
            log.error("Failed to send SMS to " + number)
            return False
    except Exception as error:
        log.error(
            "Failed to send order SMS to : " + number + " : " + error.message)
        return False
