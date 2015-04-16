from django.core.mail import EmailMessage
import logging
from api.models import Image
log = logging.getLogger('libraries')
 
def mail(to_list, subject, message, sender="Meisterdish <noreply@meisterdish.com>", headers = {'Reply-To': "<noreply@meisterdish.com>"}):
    msg = EmailMessage(subject, message, sender, to_list)
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
