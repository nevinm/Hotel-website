import os
DEBUG = True
TEMPLATE_DEBUG = DEBUG
BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

BASE_URL = 'http://10.7.1.64:86/'
URL_PREFIX = ''

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql_psycopg2',
        'NAME': 'meisterdish',
        'USER': 'pacs',
        'PASSWORD': 'pacs',
        'HOST': 'localhost',
        'PORT': '5432',
    }
}

