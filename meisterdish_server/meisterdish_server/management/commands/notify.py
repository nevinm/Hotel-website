from django.core.management.base import BaseCommand, CommandError
from meisterdish_server.models import Order
from datetime import datetime
from twilio.rest import TwilioRestClient
import settings
import logging 
log = logging.getLogger(__name__)

class Command(BaseCommand):
    help = 'Snd SMS notifications for order delivery'

    def add_arguments(self, parser):
        parser.add_argument('a_id', nargs='+', type=int)

    def handle(self, *args, **options):
        try:
            now = datetime.now()
            a = now.hour
            orders = Order.objects.filter(status__lt=3, delivery_type="delivery", delivery_time__year=now.year, delivery_time__month=now.month, delivery_time__day=now.day, delivery_time__hour=now.hour + 2)
            if not orders.exists():
                self.stdout.write('There are no notifications to send.')
                return False
            
            sent = 0
            for order in orders:
                if self.send_sms_notification(order):
                    sent += 1

        except Exception as e:
            self.stdout.write('Error : "%s"' % e.message)    
        else:
            self.stdout.write('Successfully sent %d notifications out of %d' % (sent, orders.count()))

    def send_sms_notification(self, order):
        try:
            if not order.phone:
                log.error("No mobile number available to send SMS.")
                return False
            
            txt = "Your Meisterdish is getting prepared and will be delivered within the next hour. Please make sure that you are at location to receive your meal"
            client = TwilioRestClient(settings.TWILIO_ACCOUNT_SID, settings.TWILIO_AUTH_TOKEN)

            country_code = "+1"
            if str(order.phone).strip() in ["7034088806", '9961963746']:
                country_code = "+91"
            number = country_code + str(order.phone).strip()

            message = client.messages.create(body=txt,
                    to=number,
                    from_=settings.TWILIO_NUMBER)
            
            if message:
                log.info("Sent SMS to " + number)
                return True
            else:
                log.error("Failed to send SMS to " + number)
                return False

        except Exception as e:
            log.error("Failed to send order SMS to : " + number + " : " + e.message)
            return False
