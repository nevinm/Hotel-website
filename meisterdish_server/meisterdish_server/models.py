import datetime
from django.core.validators import MinValueValidator, MaxValueValidator
from django.db import models
from django.db.models import Sum
import logging
import random
import string
import sys
import traceback

from settings import PAYMENT_METHODS, ORDER_STATUS, SHIPPING_CHARGE, \
    ROLE_USER, MEAL_STATUS


log = logging.getLogger(__name__)

months = ((1, 'January'),
          (2, 'February'),
          (3, 'March'),
          (4, 'April'),
          (5, 'May'),
          (6, 'June'),
          (7, 'July'),
          (8, 'August'),
          (9, 'September'),
          (10, 'October'),
          (11, 'November'),
          (12, 'December'),
          )
cy = datetime.date.today().year
years = [(y, y) for y in range(2000, cy + 10)]


def generate_ambassador_code():
    return "AM" + ''.join(random.SystemRandom().choice(
        string.digits) for _ in range(7))


class Role(models.Model):
    name = models.CharField(max_length=20)

    def __unicode__(self):
        return self.name


class Country(models.Model):
    name = models.CharField(db_index=True, max_length=30)
    country_code = models.CharField(db_index=True, max_length=3, unique=True)

    def __unicode__(self):
        return self.name


class State(models.Model):
    name = models.CharField(db_index=True, max_length=30)
    country = models.ForeignKey(Country, to_field='country_code')
    state_code = models.CharField(max_length=3, unique=True)

    def __unicode__(self):
        return self.name


class City(models.Model):
    name = models.CharField(db_index=True, max_length=30)
    state = models.ForeignKey(State, to_field='state_code')

    def __unicode__(self):
        return self.name


class Image(models.Model):
    title = models.CharField(default="", max_length=100)
    image = models.FileField(upload_to="images/")
    thumb = models.FileField(upload_to="images/", null=True, blank=True)

    created = models.DateTimeField(null=True)
    updated = models.DateTimeField(null=True)

    def __unicode__(self):
        return self.title

    def create_thumbnail(self):
        if not self.image:
            return

        from PIL import Image
        from cStringIO import StringIO
        from django.core.files.uploadedfile import SimpleUploadedFile
        import os
        try:
            THUMBNAIL_SIZE = (300, 300)
            try:
                DJANGO_TYPE = self.image.file.content_type

                if DJANGO_TYPE == 'image/jpeg':
                    PIL_TYPE = 'jpeg'
                    FILE_EXTENSION = 'jpg'
                elif DJANGO_TYPE == 'image/png':
                    PIL_TYPE = 'png'
                    FILE_EXTENSION = 'png'
                elif DJANGO_TYPE == 'image/gif':
                    PIL_TYPE = 'gif'
                    FILE_EXTENSION = 'gif'
            except:
                PIL_TYPE = os.path.splitext(str(self.image.file))[1].strip('.')
                FILE_EXTENSION = PIL_TYPE
                if PIL_TYPE.upper() == "JPG":
                    PIL_TYPE = 'jpeg'
                DJANGO_TYPE = "image/+" + PIL_TYPE

            image = Image.open(StringIO(self.image.read()))

            image.thumbnail(THUMBNAIL_SIZE, Image.ANTIALIAS)

            temp_handle = StringIO()

            image.save(temp_handle, PIL_TYPE)
            temp_handle.seek(0)

            suf = SimpleUploadedFile(
                os.path.split(self.image.name)[-1],
                temp_handle.read(), content_type=DJANGO_TYPE)
        except KeyError as e:
            log.error(
                e.message + "-" + str(traceback.tb_lineno(sys.exc_info()[2])))

        self.thumb.save(
            '%s_thumbnail.%s' % (
                os.path.splitext(suf.name)[0], FILE_EXTENSION),
            suf,
            save=False
        )

    def save_image_from_url(self, url):
        import os
        from django.core.files import File
        import urllib
        result = urllib.urlretrieve(url)
        self.image.save(
            os.path.basename(url.split('?')[0]),
            File(open(result[0]))
        )
        super(Image, self).save()

    def save(self, *args, **kwargs):
        self.create_thumbnail()
        force_update = False
        if self.id:
            force_update = True
        else:
            self.created = datetime.datetime.now()
        self.updated = datetime.datetime.now()
        super(Image, self).save(force_update=force_update)


class User(models.Model):
    fb_user_id = models.CharField(
        db_index=True, max_length=20, null=True, blank=True, default="")
    password = models.CharField(max_length=50, null=True)

    role = models.ForeignKey(Role)
    first_name = models.CharField(db_index=True, max_length=25, default="")
    last_name = models.CharField(db_index=True, max_length=25, default="")
    full_name = models.CharField(db_index=True, max_length=55, default="")
    zipcode = models.CharField(
        db_index=True, max_length=6, null=True, blank=True)
    email = models.EmailField(db_index=True, max_length=30, null=True)
    mobile = models.CharField(max_length=15, null=True)
    profile_image = models.ForeignKey(Image, null=True, blank=True)

    user_verify_token = models.CharField(
        max_length=50, null=True, blank=True, default="")
    password_reset_token = models.CharField(
        max_length=20, null=True, blank=True, default="")

    is_active = models.BooleanField(db_index=True, default=False)
    is_ambassador = models.BooleanField(db_index=True, default=False)

    facebook_login = models.BooleanField(default=False)
    credits = models.FloatField(
        db_index=True, validators=[
            MinValueValidator(0), MaxValueValidator(1000)], default=0)

    need_sms_notification = models.BooleanField(default=True)
    need_email_promotions = models.BooleanField(default=True)
    deleted = models.BooleanField(db_index=True, default=False)

    referral_code = models.CharField(max_length=10)

    created = models.DateTimeField()
    stripe_customer_id = models.CharField(
        max_length=50, null=True, default=None, blank=True)

    ambassador_code = models.CharField(
       max_length=9, default=generate_ambassador_code)

    def save(self, *args, **kwargs):
        if self.full_name != self.first_name + ' ' + self.last_name:
            self.full_name = self.first_name + ' ' + self.last_name
        if not self.id:
            self.created = datetime.datetime.now()
            if self.role.pk == ROLE_USER:
                self.referral_code = ''.join(random.SystemRandom().choice(
                    string.ascii_uppercase + string.digits) for _ in range(6))

        super(User, self).save(*args, **kwargs)

    def __unicode__(self):
        return self.email if self.email else "Guest user"

    def delete(self, using=None):
        self.deleted = True
        self.save()
        if self.role == Role.objects.get(name="Guest"):
            if not Order.objects.filter(cart__user=self).exists() and \
                not Order.objects.filter(
                    delivery_address__in=Address.objects.filter(
                        user=self)).exists():
                models.Model.delete(self, using)


class Address(models.Model):
    user = models.ForeignKey(User, related_name="user_address")
    first_name = models.CharField(max_length=50, default="")
    last_name = models.CharField(max_length=50, default="")
    is_primary = models.BooleanField(db_index=True, default=False)
    is_business = models.BooleanField(db_index=True, default=False)
    company = models.CharField(max_length=100, default="")
    street = models.CharField(max_length=50)
    building = models.CharField(max_length=50)
    state = models.ForeignKey(State)
    city = models.CharField(max_length=50)
    zip = models.CharField(max_length=10)
    phone = models.CharField(max_length=15)
    email = models.CharField(max_length=50, null=True, blank=True)

    def __unicode__(self):
        return str(self.user.email) + " : " + self.first_name +\
            " " + self.last_name


class CreditCardDetails(models.Model):
    user = models.ForeignKey(User, related_name="cc_details")
    name = models.CharField(max_length=50, default="")
    card_id = models.CharField(db_index=True, max_length=50)
    number = models.CharField(max_length=25)
    expire_month = models.CharField(max_length=16)
    expire_year = models.CharField(max_length=16)
    funding = models.CharField(max_length=20)
    card_type = models.CharField(max_length=30)

    def __unicode__(self):
        return str(self.user.email) + " : " + str(self.number)


class Category(models.Model):
    name = models.CharField(db_index=True, max_length=25)
    is_hidden = models.BooleanField(db_index=True, default=False)
    is_deleted = models.BooleanField(db_index=True, default=False)

    def __unicode__(self):
        return self.name


class MealType(models.Model):
    name = models.CharField(db_index=True, max_length=25)
    is_hidden = models.BooleanField(db_index=True, default=False)
    is_deleted = models.BooleanField(db_index=True, default=False)
    image = models.ForeignKey(Image)

    def __unicode__(self):
        return self.name


class Nutrient(models.Model):
    name = models.CharField(db_index=True, max_length=20)

    def __unicode__(self):
        return self.name


class Ingredient(models.Model):
    name = models.CharField(db_index=True, max_length=40)
    image = models.ForeignKey(Image)

    def __unicode__(self):
        return self.name


class Chef(models.Model):
    name = models.CharField(db_index=True, max_length=20)
    image = models.ForeignKey(Image)

    def __unicode__(self):
        return self.name


class Tips(models.Model):
    title = models.CharField(max_length=1024, null=True, blank=True)
    description = models.TextField(max_length=1024)
    image = models.ForeignKey(Image, null=True, blank=True)
    video_url = models.CharField(max_length=1024, null=True, blank=True)
    image_url = models.CharField(max_length=1024, null=True, blank=True)


class Meal(models.Model):
    name = models.CharField(db_index=True, max_length=100)
    sub = models.CharField(db_index=True, max_length=100, default="")
    description = models.TextField(db_index=True, max_length=1024)

    main_image = models.ForeignKey(
        Image, null=True, blank=True, related_name="main_image")
    images = models.ManyToManyField(
        Image, related_name="meal", null=True, blank=True)

    chef = models.ForeignKey(Chef, null=True, blank=True)
    chef_comments = models.TextField(max_length=1024, null=True, blank=True)

    types = models.ManyToManyField(MealType, null=True, blank=True)
    category = models.ForeignKey(Category, null=True)

    user_to_do = models.TextField(
        max_length=1024, null=True, blank=True, default="")
    preparation_time = models.CharField(
        max_length=30, null=True, blank=True, default="")

    finished_preparation = models.TextField(
        max_length=1024, null=True, blank=True, default="")
    saved_time = models.CharField(
        max_length=30, null=True, blank=True, default="")

    pre_requisites = models.TextField(
        max_length=1024, null=True, blank=True, default="")
    pre_requisites_image = models.ForeignKey(
        Image, null=True, blank=True, related_name="pre_requisites")

    nutrients = models.TextField(
        max_length=1024, null=True, blank=True, default="")
    calories = models.CharField(
        max_length=30, null=True, blank=True, default="")

    ingredients = models.ManyToManyField(Ingredient, null=True, blank=True)

    tips = models.ManyToManyField(Tips, null=True, blank=True)

    allergy_notice = models.TextField(
        max_length=1024, null=True, blank=True, default="")
    need_boiling_water = models.BooleanField(default=False)

    price = models.FloatField(
        validators=[MinValueValidator(0), MaxValueValidator(1000)])
    tax = models.FloatField(
        validators=[MinValueValidator(0), MaxValueValidator(1000)])

    is_deleted = models.BooleanField(db_index=True, default=False)
    available = models.IntegerField(default=0)
    sold_out = models.BooleanField(default=False)
    locked = models.BooleanField(default=False)
    order = models.IntegerField(default=0)

    def __unicode__(self):
        return self.name


class MealRating(models.Model):
    meal = models.ForeignKey(Meal, related_name="mealrating")
    order = models.ForeignKey("Order")
    rating = models.FloatField(
        validators=[MinValueValidator(0), MaxValueValidator(5)])
    comment = models.TextField(max_length=200)
    created = models.DateTimeField(null=True)
    is_deleted = models.BooleanField(default=False)

    def save(self, *args, **kwargs):
        if not self.id:
            self.created = datetime.datetime.now()
        super(MealRating, self).save(*args, **kwargs)

    def __unicode__(self):
        return str(self.rating)

    def delete(self, using=None):
        self.is_deleted = True
        super(MealRating, self).save()


class MealNutrient(models.Model):
    meal = models.ForeignKey(Meal)
    nutrient = models.ForeignKey(Nutrient)
    per_serving = models.CharField(
        max_length=30, default="", null=True, blank=True)
    daily_value = models.CharField(
        max_length=30, default="", null=True, blank=True)

    def __unicode__(self):
        return self.meal.name + " - " + self.nutrient.name


class Payment(models.Model):
    methods = PAYMENT_METHODS

    response = models.TextField(max_length=5000, null=True, blank=True)
    transaction_id = models.CharField(max_length=128, null=True, blank=True)
    transaction_date = models.DateTimeField(null=True)
    amount = models.FloatField(
        validators=[MinValueValidator(0), MaxValueValidator(10000)])
    verified = models.BooleanField(default=False)

    created = models.DateTimeField(null=True)
    updated = models.DateTimeField(null=True)

    def save(self, *args, **kwargs):
        if not self.id:
            self.created = datetime.datetime.now()
        self.updated = datetime.datetime.now()
        super(Payment, self).save(*args, **kwargs)


class Cart(models.Model):
    user = models.ForeignKey(User)
    delivery_time = models.DateTimeField(null=True, blank=True)
    delivery_address = models.ForeignKey(Address, null=True, blank=True)
    gift_cards = models.ManyToManyField("GiftCard", null=True, blank=True)
    promo_code = models.ForeignKey("PromoCode", null=True, blank=True)
    completed = models.BooleanField(default=False)

    def str(self):
        return "Cart for user " + self.user.first_name +\
            " " + self.user.last_name


class CartItem(models.Model):
    cart = models.ForeignKey(Cart)
    meal = models.ForeignKey(Meal, related_name="cartitem")
    quantity = models.IntegerField(
        validators=[MinValueValidator(0), MaxValueValidator(100)])
    status = models.IntegerField(db_index=True, choices=MEAL_STATUS, default=4)

delivery_types = (
    ("pickup", "Pick Up"),
    ("delivery", "Delivery"),
)


class Order(models.Model):
    order_num = models.CharField(db_index=True, max_length=50, null=True)

    cart = models.ForeignKey(Cart)

    total_amount = models.FloatField(
        validators=[MinValueValidator(0), MaxValueValidator(10000)], default=0)
    total_tax = models.FloatField(
        validators=[MinValueValidator(0), MaxValueValidator(10000)], default=0)
    tip = models.IntegerField(
        default=5, validators=[MinValueValidator(0), MaxValueValidator(1000)])

    grand_total = models.FloatField(
        validators=[MinValueValidator(0), MaxValueValidator(10000)], default=0)

    credits = models.FloatField(
        validators=[MinValueValidator(0), MaxValueValidator(10000)], default=0)

    discount = models.FloatField(
        validators=[MinValueValidator(0), MaxValueValidator(10000)], default=0)

    delivery_type = models.CharField(
        choices=delivery_types, max_length=8, default="delivery")

    delivery_address = models.ForeignKey(
        Address, related_name="delivery_address", null=True, blank=True)
    billing_address = models.ForeignKey(
        Address, related_name="billing_address", null=True, blank=True)

    email = models.CharField(db_index=True, max_length=50, null=True)
    phone = models.CharField(db_index=True, max_length=15, null=True)

    delivery_time = models.DateTimeField()
    driver_instructions = models.TextField(max_length=1024, null=True)

    payment = models.ForeignKey(Payment, null=True, blank=True)

    status = models.IntegerField(
        db_index=True, choices=ORDER_STATUS, default=4)
    is_deleted = models.BooleanField(db_index=True, default=False)

    created = models.DateTimeField(db_index=True, null=True)
    updated = models.DateTimeField(null=True)

    notified = models.BooleanField(default=False)

    def save(self, *args, **kwargs):
        self.updated = datetime.datetime.now()

        if self.status != 4:
            self.cart.completed = True
            self.cart.save()

        if not self.id:
            self.created = datetime.datetime.now()

            self.discount = (
                0 if not self.cart.promo_code else self.cart.promo_code.amount)
            gc_amt = self.cart.gift_cards.aggregate(
                Sum('amount'))["amount__sum"]
            gc_amt = 0 if not gc_amt else gc_amt
            self.discount += gc_amt

            self.grand_total = self.total_amount + \
                self.total_tax - self.discount - self.credits

            if self.delivery_type == 'delivery':
                self.grand_total += SHIPPING_CHARGE + self.tip
            else:
                self.tip = 0

            self.grand_total = 0 if self.grand_total < 0 else self.grand_total
            self.grand_total = round(self.grand_total, 2)

        super(Order, self).save(*args, **kwargs)
        self.order_num = '0' * (6 - len(str(self.id))) + str(self.id)
        super(Order, self).save(*args, **kwargs)


class GiftCard(models.Model):
    user = models.ForeignKey(User)
    code = models.CharField(max_length=10)
    name = models.CharField(max_length=100)
    email = models.CharField(max_length=100)
    message = models.TextField(max_length=1000)
    amount = models.FloatField(
        validators=[MinValueValidator(0), MaxValueValidator(100)])
    order_num = models.TextField(max_length=15, default='')
    payment = models.ForeignKey(Payment)
    used = models.BooleanField(default=False)
    created = models.DateTimeField(null=True)

    def __unicode__(self):
        return self.code

    def save(self, *args, **kwargs):
        if not self.id:
            self.created = datetime.datetime.now()
        super(GiftCard, self).save(*args, **kwargs)


class PromoCode(models.Model):
    code = models.CharField(max_length=10)
    amount = models.FloatField(
        validators=[MinValueValidator(0), MaxValueValidator(100)])
    expiry_date = models.DateTimeField()
    active = models.BooleanField(default=False)
    deleted = models.BooleanField(default=False)

    def __unicode__(self):
        return self.code


class DeliveryTimeSlot(models.Model):
    date = models.DateField(unique=True)
    slot1 = models.IntegerField(default=0)
    slot2 = models.IntegerField(default=0)
    slot3 = models.IntegerField(default=0)
    slot4 = models.IntegerField(default=0)
    slot5 = models.IntegerField(default=0)

    def __unicode__(self):
        return self.date.strftime('%m-%d-%Y')


class DeliveryArea(models.Model):
    zip = models.CharField(max_length=10)

    def __unicode__(self):
        return self.zip


class Referral(models.Model):
    referrer = models.ForeignKey(User)
    referree = models.ForeignKey(User, related_name="referree")

    def __str__(self):
        return self.referrer.first_name + " --> " + self.referree.first_name


class AmbassadorReferral(models.Model):
    ambassador = models.ForeignKey(User)
    referree = models.ForeignKey(User, related_name="ambassador_referree")

    def __unicode__(self):
        return self.ambassador.full_name + "-->" + self.referree.full_name


class Configuration(models.Model):
    key = models.CharField(max_length=100)
    value = models.CharField(max_length=200)

    def __str__(self):
        return self.key + " = " + self.value


class ZipUnavailable(models.Model):
    email = models.CharField(max_length=25)
    zipcode = models.CharField(max_length=10)
