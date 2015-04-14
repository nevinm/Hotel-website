from django.core.mail import EmailMessage
 
def mail(to_list, subject, message, sender="Meisterdish <noreply@meisterdish.com>"):
    msg = EmailMessage(subject, message, sender, to_list)
    msg.content_subtype = "html"
    return msg.send()