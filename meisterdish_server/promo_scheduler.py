from datetime import datetime, timedelta
from django.core.wsgi import get_wsgi_application
import random
import string
import os
import sys


def schedule_promocode(name='Holiday 20'):
    from meisterdish_server.models import User
    user = User.objects.get(full_name=name)
    print user.ambassador_code
    print user.referral_code
    tmp =[] 
    tmp2 = []
    for i in range(5):
        tmp.append(random.choice(string.punctuation))
        tmp2.append(random.choice(string.punctuation))

    user.referral_code = 'HO20' + ''.join(tmp)
    user.ambassador_code = 'HO50'+''.join(tmp2)
    user.save()


if __name__ == "__main__":
    os.environ.setdefault("DJANGO_SETTINGS_MODULE", "settings")
    application = get_wsgi_application()
    try:
        schedule_promocode(sys.argv[1])
    except IndexError:
        schedule_promocode()
