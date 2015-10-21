import os
from django.core.wsgi import get_wsgi_application
from datetime import datetime, timedelta
import sys

def schedule_text(time):
    from libraries import send_text_reminder
    from meisterdish_server.models import Order
    today = datetime.now()
    orders = Order.objects.filter(notified=False, status__lt=3, delivery_time__hour=time,
                                  delivery_time__day=today.day,
                                  delivery_time__month=today.month)
    for order in orders:
        if order.cart.user.need_sms_notification:
            context = {"order":order.order_num,
                       "mobile":order.phone}
            msg = send_text_reminder(context)
            if msg:
                order.notified = True
                order.save()
            print msg
        
if __name__ == "__main__":
    os.environ.setdefault("DJANGO_SETTINGS_MODULE", "settings")
    application = get_wsgi_application()
    schedule_text(int(sys.argv[1]))
