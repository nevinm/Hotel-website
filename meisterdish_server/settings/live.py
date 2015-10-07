# Django settings for rounding_app project.
import os

DEBUG = True
TEMPLATE_DEBUG = DEBUG
BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

BASE_URL = 'http://meisterdish.com/'
SITE_URL = 'http://meisterdish.com/'
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

STRIPE_SECRET_KEY = "sk_live_m3lyGeCDn11XqWf2UiOMFwvi"
STRIPE_PUBLIC_KEY = "pk_live_nvqCYAD2W5rL3TY9okuAb3Zm"
