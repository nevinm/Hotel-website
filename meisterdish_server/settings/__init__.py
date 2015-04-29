import os     
if os.path.dirname(__file__) == "/home/staging/settings":
    from live import *
    Live = True
else:
    from local import *
    Live = False

DEBUG = DEBUG
BASE_URL = BASE_URL
SITE_URL = SITE_URL
BASE_DIR = BASE_DIR

ADMINS = (
     ('Abdul Nasar', 'nasarp@qburst.com'),
)

MANAGERS = ADMINS

ROLE_ADMIN = 1
ROLE_USER = 2
ROLE_GUEST = 3

ALLOWED_HOSTS = []
# Local time zone for this installation. Choices can be found here:
# http://en.wikipedia.org/wiki/List_of_tz_zones_by_name
# although not all choices may be available on all operating systems.
# On Unix systems, a value of None will cause Django to use the same
# timezone as the operating system.
# If running in a Windows environment this must be set to the same as your
# system time zone.
TIME_ZONE = 'America/Chicago'

# Language code for this installation. All choices can be found here:
# http://www.i18nguy.com/unicode/language-identifiers.html
LANGUAGE_CODE = 'en-us'

SITE_ID = 1

# If you set this to False, Django will make some optimizations so as not
# to load the internationalization machinery.
USE_I18N = True

# If you set this to False, Django will not format dates, numbers and
# calendars according to the current locale
USE_L10N = True

# URL that handles the media served from MEDIA_ROOT. Make sure to use a
# trailing slash.
# Examples: "http://media.lawrence.com/media/", "http://example.com/media/"
MEDIA_URL =BASE_URL+'/media/'

MEDIA_ROOT = os.path.join(BASE_DIR,'media')

# Example: "http://media.lawrence.com/static/"
STATIC_URL = BASE_URL+'static/'

STATIC_ROOT = BASE_DIR + '/static/'

# URL prefix for admin static files -- CSS, JavaScript and images.
# Make sure to use a trailing slash.
# Examples: "http://foo.com/static/admin/", "/static/admin/".
ADMIN_MEDIA_PREFIX = '/static/admin/'

# Additional locations of static files
STATICFILES_DIRS = (
    # Put strings here, like "/home/html/static" or "C:/www/django/static".
    # Always use forward slashes, even on Windows.
    # Don't forget to use absolute paths, not relative paths.
)

# List of finder classes that know how to find static files in
# various locations.
STATICFILES_FINDERS = (
    'django.contrib.staticfiles.finders.FileSystemFinder',
    'django.contrib.staticfiles.finders.AppDirectoriesFinder',
#    'django.contrib.staticfiles.finders.DefaultStorageFinder',
)

# Make this unique, and don't share it with anybody.
SECRET_KEY = 'a_=d43%+glrxe3am&pj$s2$nqyr9(qqnuek1y1t(h&k87gcv2o'

# List of callables that know how to import templates from various sources.
TEMPLATE_LOADERS = (
    'django.template.loaders.filesystem.Loader',
    'django.template.loaders.app_directories.Loader',
#     'django.template.loaders.eggs.Loader',
)

MIDDLEWARE_CLASSES = (
    'corsheaders.middleware.CorsMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    #'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
)
CORS_ORIGIN_ALLOW_ALL = True

CORS_ALLOW_HEADERS = (
        'x-requested-with',
        'content-type',
        'accept',
        'origin',
        'authorization',
        'x-csrftoken',
        'session-key',
        'page',
    )

ROOT_URLCONF = 'meisterdish_server.urls'

#WSGI_APPLICATION = 'rounding_app.wsgi.application'

TEMPLATE_DIRS = (
    # Put strings here, like "/home/html/django_templates" or "C:/www/django/templates".
    # Always use forward slashes, even on Windows.
    # Don't forget to use absolute paths, not relative paths.
    BASE_DIR+"/templates",

)

INSTALLED_APPS = (
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.sites',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'django.contrib.admin',
    'corsheaders',
    'api',
)

LOGGING = {
    'version': 1,
    'disable_existing_loggers': True,
    'formatters': {
        'standard': {
            'format' : "[%(asctime)s] %(levelname)s [%(name)s:%(lineno)s] %(message)s",
            'datefmt' : "%d/%b/%Y %H:%M:%S"
        },
    },
    'handlers': {
        'logfile': {
            'level':'DEBUG',
            'class':'logging.handlers.RotatingFileHandler',
            'filename': BASE_DIR + "/Log/logfile.txt",
            'maxBytes': 500000,
            'backupCount': 100,
            'formatter': 'standard',
        },
        'console':{
            'level':'INFO',
            'class':'logging.StreamHandler',
            'formatter': 'standard'
        },
    },
    'loggers': {
        'django': {
            'handlers':['console'],
            'propagate': True,
            'level':'WARN',
        },
        'django.db.backends': {
            'handlers': ['console'],
            'level': 'DEBUG',
            'propagate': False,
        },
        'api': {
            'handlers': ['logfile'],
            'level': 'DEBUG'
        },
        'cms_api': {
            'handlers': ['logfile'],
            'level': 'DEBUG'
        },
        'api_user': {
            'handlers': ['logfile'],
            'level': 'DEBUG'
        },
        'model': {
            'handlers': ['logfile'],
            'level': 'DEBUG'
        },
        'libraries': {
            'handlers': ['logfile'],
            'level': 'DEBUG'
        },
        'order': {
            'handlers': ['logfile'],
            'level': 'DEBUG'
        },
    }
}


EMAIL_HOST = 'smtp.gmail.com'
EMAIL_USE_TLS = True
MAIL_USE_TLS=True
EMAIL_PORT = 587
EMAIL_HOST_USER = 'afmpmail2@gmail.com'
EMAIL_HOST_PASSWORD = 'afmp@123mail2'
#EMAIL_HOST_USER = 'meisterdishtest@gmail.com'
#EMAIL_HOST_PASSWORD = 'meisterdish@123'
DEFAULT_FROM_EMAIL = 'Meisterdish Test<meisterdishtest@gmail.com>'


SESSION_EXPIRY = 5 * 60 # 5 mins

PAYMENT_METHODS = (
                   ('CC', 'Credit Card'),
                   ('PP', 'PayPal'),
                   )
PER_PAGE = 10

ORDER_STATUS =  (
    (0, "Incomplete"),
    (1, "Payment failed"),
    (2, "Paid, but order failed"),
    (3, "Not delivered"),
    (4, "Complete"),
    )

if not Live:
    # SandBox
    PAYPAL_MODE="sandbox"
    PAYPAL_CLIENT_ID = "AfPVcIBPTPK4v-ssJY7FvudRt4bYlSviIY02zi7b8JbtmaL91ZneDCMMJSOiIgqo9hBVemBUkpF8p_1F"
    PAYPAL_CLIENT_SECRET = "EDrB0Fsr8fny7_aTopTkjC4t5btB-SvoRQDx2B2omc6OabinTG503o1aVx7_jm1D9giX-9bPfsgB_fGE"
    PAYPAL_ACCOUNT = "nazz007online-facilitator@gmail.com"
    PAYPAL_ENDPOINT = "api.sandbox.paypal.com"
else:
    #@TODO
    pass

DEFAULT_MEAL_IMAGE  = STATIC_URL + "default/meal_default.jpg"
DEFAULT_USER_IMAGE  = STATIC_URL + "default/user_default.jpg"


