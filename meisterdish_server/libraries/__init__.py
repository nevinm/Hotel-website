from django.core.mail import EmailMessage
import logging
from api.models import Image
import re

log = logging.getLogger('libraries')
 
def mail(to_list, subject, message, sender="Meisterdish Test<meisterdishtest@gmail.com>", headers = {
              'Reply-To': "Meisterdish Test<meisterdishtest@gmail.com>",
              'From':"Meisterdish Test<meisterdishtest@gmail.com>",
              }):
    msg = EmailMessage(subject, message, sender, to_list, headers=headers)
    msg.content_subtype = "html"
    return msg.send()

def manage_image_upload(request):
    try:
        from django.core.files.uploadedfile import UploadedFile

        if request.FILES == None:
            return custom_error('Please upload a valid image')
        
        file = request.FILES[u'files[]']
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