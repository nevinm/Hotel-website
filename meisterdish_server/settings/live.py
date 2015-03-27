# Django settings for rounding_app project.
import os

DEBUG = True
TEMPLATE_DEBUG = DEBUG
BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

BASE_URL = 'http://10.7.1.64:82/'
URL_PREFIX = ''

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql_psycopg2',
        'NAME': 'universal_rounding_app',
        'USER': 'pacs',
        'PASSWORD': 'pacs',
        'HOST': 'localhost',
        'PORT': '5432',
    }
}

# Absolute filesystem path to the directory that will hold user-uploaded files.
# Example: "/home/media/media.lawrence.com/media/"
MEDIA_ROOT = '/home/user/tiatech/media/'