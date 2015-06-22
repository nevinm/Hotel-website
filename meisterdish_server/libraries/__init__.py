from django.http import HttpResponse
from django.core.mail import EmailMessage
from email.MIMEImage import MIMEImage
import logging
from meisterdish_server.models import Image, User, Role, DeliveryArea, Payment, Address
import re
import settings
from django.contrib.sessions.backends.db import SessionStore
from urllib import unquote_plus, unquote
from urllib2 import Request, urlopen
import json as simplejson
from datetime import datetime
log = logging.getLogger('libraries')
import os

def mail(to_list, subject, message, sender="Meisterdish Test<meisterdishtest@gmail.com>", headers = {
              'Reply-To': "Meisterdish Test<meisterdishtest@gmail.com>",
              'From':"Meisterdish Test<meisterdishtest@gmail.com>",
              }, design=True):
    
    msg = EmailMessage(subject, message, sender, to_list, headers=headers)
    msg.content_subtype = "html"
    if design:
      for cid, img in settings.EMAIL_IMAGES.items():
          fp = open(img, 'rb')
          msgImage = MIMEImage(fp.read())
          fp.close()
          msgImage.add_header('Content-ID', '<'+cid+'>')
          msg.attach(msgImage)
    return msg.send()

def mail_order_confirmation(to_list, subject, message, order, sender="Meisterdish Test<meisterdishtest@gmail.com>", headers = {
              'Reply-To': "Meisterdish Test<meisterdishtest@gmail.com>",
              'From':"Meisterdish Test<meisterdishtest@gmail.com>",
              }):
    try:
        log.info("mail sending")
        log.info(to_list)
        msg = EmailMessage(subject, message, sender, to_list, headers=headers)
        msg.content_subtype = "html"
        
        share_images = {
          "share_fb" : os.path.join(settings.STATIC_ROOT, "default", "share_fb.png"),
          "share_tw" : os.path.join(settings.STATIC_ROOT, "default", "share_tw.png"),
          "share_em" : os.path.join(settings.STATIC_ROOT, "default", "share_em.png"),
        }

        for ci in order.cart.cartitem_set.all():
            share_images[str(ci.meal.id)] = ci.meal.main_image.image.path

        for cid, img in share_images.items():
            fp = open(img, 'rb')
            msgImage = MIMEImage(fp.read())
            fp.close()
            msgImage.add_header('Content-ID', '<'+cid+'>')
            msg.attach(msgImage)
        return msg.send()
    except Exception as e:
        log.error(e.message)
        return False

def manage_image_upload(request):
    try:
        from django.core.files.uploadedfile import UploadedFile

        if request.FILES == None:
            return custom_error('Please upload a valid image')
        
        file = request.FILES[u'image_upload']
        wrapped_file = UploadedFile(file)
        filename = wrapped_file.name
        file_size = wrapped_file.file.size
        log.info ('File upload : "'+str(filename)+'"')

        image = Image()
        image.title=str(filename)
        image.image=file
        image.save()
        log.info('Image uploaded.')
        
        return {
                   "status":1,
                   "message" : "Sucessfully uploaded the image.",
                   "id":image.id,
                   "name":filename, 
                   "size":file_size, 
                   "url":image.image.url,
                   "thumbnail_url":image.thumb.url,
                }
    except Exception as e:
        log.error("Failed to upload image : " + e.message)
        return None

def validate_zipcode(zip):
  regex = "^\d{5}(-\d{4})?$"
  if re.match(regex, str(zip)) is None:
    return False
  return True

def validate_email(email):
  regex = "[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?"
  if re.match(regex, str(email)) is None:
    return False
  return True

def validate_phone(phone):
  regex = "^(1\s*[-\/\.]?)?(\((\d{3})\)|(\d{3}))\s*[-\/\.]?\s*(\d{3})\s*[-\/\.]?\s*(\d{4})\s*(([xX]|[eE][xX][tT])\.?\s*(\d+))*$"
  if re.match(regex, str(phone)) is None:
    return False
  return True  


def get_request_user(request):
  session_key = request.META.get('HTTP_SESSION_KEY', None)
  session = SessionStore(session_key=session_key)
  if session and 'user' in session :
      try:
          user = User.objects.get(pk=session['user']['id'])
      except Exception as e:
          user = None
  else:
      user = None
  return user

def create_guest_user(request, details=None):
  try:
    user = User()
    user.role = Role.objects.get(pk=settings.ROLE_GUEST)
    user.is_active = True
    if details:
        user.first_name = details["guest_first_name"].strip()
        user.last_name = details["guest_last_name"].strip()
        user.email = details["guest_email"].strip()
        user.zip = details["guest_zip"].strip()
    user.save()

    if user.id:
        user_dic = {
                    "id":user.id,
                    "email":user.email,
                    "first_name":user.first_name,
                    "last_name":user.last_name,
                    "role":user.role.id,
                   }

        session = SessionStore()
        session["user"] = user_dic
        session.set_expiry = settings.SESSION_EXPIRY
        session.save()
        return (user, session.session_key)
    else:
      return (None, None)
    
  except Exception as e:
    log.error("Failed to add guest user " +e.message )
    return (None, None)


def check_delivery_area(zip):
    if DeliveryArea.objects.filter(zip=zip).exists():
        return True
    return False

def json_request(request):
    if (request.method == 'GET'):
        req = request.GET
        return req
    else:
        req = request.body

        if not req:
            req='{"a":"b"}'

    if (req):
        try:
            if request.FILES:
                return request.POST
            else:
                return simplejson.loads(req, "ISO-8859-1")
        except Exception as e:
            log.error("Error json-decoding input : " +e.message)
            return None
    else:
        return None

def json_response(response, wrap=False):
    if (wrap == True):
        final_response = {"data" : response}
    else:
        final_response = response
    header_res = HttpResponse(simplejson.dumps(final_response))
    return header_res

def custom_error(message, status=-1):
    return json_response({'status' : status, 'message' : message})

def save_payment_data(data):
    try:
        payment =Payment()
        payment.response = simplejson.dumps(data)
        payment.transaction_id = data["id"]
        payment.transaction_date = datetime.fromtimestamp(data["created"])
        payment.amount = data["amount"]

        if data["status"].lower() == "succeeded":
            payment.verified = True
        payment.save()
        return payment
    except Exception as e:
        log.error("Failed to save payment data " + e.message)
        return False

def create_address_text_from_model(address):
    if not address or not isinstance(address, Address):
        return ""
    text = address.first_name.title() + " " + address.last_name.title() + "\n"
    text += address.street + ", " + address.building + "\n"
    text += address.city.name + ", "+address.city.state.name + "\n"
    text += str(address.zip) + ", Ph: +1 "+str(address.phone)
    return text

def export_csv(export_list, filename):
    import csv, os
    response = HttpResponse(content_type='text/csv')
    response['Content-Disposition'] = 'attachment; filename="'+filename+'"'
    writer = csv.writer(response)
    for row in export_list:
        writer.writerow(row)
    return response