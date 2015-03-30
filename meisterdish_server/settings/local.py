import os
DEBUG = True
TEMPLATE_DEBUG = DEBUG
BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

BASE_URL = 'http://meisterdish.qburst.com/backend/'
URL_PREFIX = ''

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql_psycopg2',
        'NAME': 'dmeisterdish',
        'USER': 'umeisterdish',
        'PASSWORD': 'kF#Ghj63@L',
        'HOST': 'localhost',
        'PORT': '5432',
    }
}

