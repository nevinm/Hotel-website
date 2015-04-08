from django.db import models
from django.core.validators import MinValueValidator, MaxValueValidator
import datetime
from settings import PAYMENT_METHODS

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
years = [(y,y) for y in range(2000, cy+10)]

class Role(models.Model):
    name = models.CharField(max_length=20)
    
    def __unicode__(self):
        return self.name
    
class Country(models.Model):
    name = models.CharField(max_length=30)
    country_code = models.CharField(max_length=3, unique=True)
    
    def __unicode__(self):
        return self.name
    
class State(models.Model):
    name = models.CharField(max_length=30)
    country = models.ForeignKey(Country, to_field='country_code')
    state_code = models.CharField(max_length=3, unique=True)
    
    def __unicode__(self):
        return self.name
    
class City(models.Model):
    name = models.CharField(max_length=30)
    state = models.ForeignKey(State, to_field='state_code')
    
    def __unicode__(self):
        return self.name
    
class Image(models.Model):
    title = models.CharField(default="", max_length=100)    
    image = models.FileField(upload_to="images/")
    thumb = models.FileField(upload_to="images/", null=True, blank=True)
    
    created = models.DateTimeField(null=True)
    updated = models.DateTimeField(null=True)
    
    def create_thumbnail(self):
        if not self.image:
            return
 
        from PIL import Image
        from cStringIO import StringIO
        from django.core.files.uploadedfile import SimpleUploadedFile
        import os
 
        THUMBNAIL_SIZE = (99, 66)
 
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
            
        image = Image.open(StringIO(self.image.read()))
 
        image.thumbnail(THUMBNAIL_SIZE, Image.ANTIALIAS)
 
        temp_handle = StringIO()
        image.save(temp_handle, PIL_TYPE)
        temp_handle.seek(0)
 
        suf = SimpleUploadedFile(os.path.split(self.image.name)[-1],
                temp_handle.read(), content_type=DJANGO_TYPE)
        
        self.thumb.save(
            '%s_thumbnail.%s' % (os.path.splitext(suf.name)[0], FILE_EXTENSION),
            suf,
            save=False
        )
 
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
    fb_user_id = models.CharField(max_length=20, null=True, blank=True, default="")
    password = models.CharField(max_length=50)
    
    role = models.ForeignKey(Role)
    first_name = models.CharField(max_length=25)
    last_name = models.CharField(max_length=25)
    
    email = models.EmailField(max_length=30, unique=True)
    mobile = models.CharField(max_length=15, null=True)
    profile_image = models.ForeignKey(Image, null=True)
    
    user_verify_token = models.CharField(max_length=50, null=True, blank=True, default="")
    password_reset_token = models.CharField(max_length=20, null=True, blank=True, default="")

    is_active = models.BooleanField(default=False)
    
    facebook_login = models.BooleanField(default=False)
    credits = models.FloatField(validators=[MinValueValidator(0), MaxValueValidator(1000)], default=0)
    
    gift_cards = models.ManyToManyField("GiftCard", null=True)
    
    need_sms_notification = models.BooleanField(default=True)
    deleted = models.BooleanField(default=False)
    
    created = models.DateTimeField()
    
    def save(self, *args, **kwargs):
        if not self.id:
            self.created = datetime.datetime.now()
        super(User, self).save(*args, **kwargs)
        
    def __unicode__(self):
        return self.email

class Address(models.Model):
    user = models.ForeignKey(User, related_name="user_address")
    name = models.CharField(max_length=50)
    is_primary = models.BooleanField(default=False)
    street = models.CharField(max_length=50)
    building = models.CharField(max_length=50)
    city = models.ForeignKey(City)
    zip = models.CharField(max_length=10)
    phone = models.CharField(max_length=15)

    def __unicode__(self):
        return self.user.email + " : " + self.name
    

"""
class CreditCardDetails(models.Model):
    user = models.ForeignKey(User, related_name="cc_details")
    card_no = models.CharField(max_length=16)
    name = models.CharField(max_length=25)
    expiry_month = models.CharField(choices=months)
    expiry_year = models.CharField(choices=years)

    def __unicode__(self):
        return self.user.email + " : " + self.card_no[-4:]
"""

class Category(models.Model):
    name = models.CharField(max_length=25)
    
    def __unicode__(self):
        return self.name

class MealType(models.Model):
    """ These can be used to filter meals. 
        Examples : vegan, non-vegan, piscatarious etc..
    """
    name = models.CharField(max_length=25)
    
    def __unicode__(self):
        return self.name

class Nutrient(models.Model):
    name = models.CharField(max_length=20)
    def __unicode__(self):
        return self.name
    
class Ingredient(models.Model):
    name = models.CharField(max_length=20)
    def __unicode__(self):
        return self.name

class Meal(models.Model):
    name = models.CharField(max_length=30)
    image_url = models.CharField(max_length=30)
    description = models.TextField(max_length=1024)
    preparation_time = models.IntegerField(validators=[MinValueValidator(0), MaxValueValidator(100)])
    type = models.ForeignKey(MealType)
    category = models.ForeignKey(Category, null=True)
    
    nutrients = models.ManyToManyField(Nutrient, through="MealNutrient")
    ingredients = models.ManyToManyField(Ingredient, through="MealIngredient")
    pre_requisites = models.TextField(max_length=1024, null=True)
    
    price = models.FloatField(validators=[MinValueValidator(0), MaxValueValidator(1000)])
    tax = models.FloatField(validators=[MinValueValidator(0), MaxValueValidator(1000)])
    
    available = models.BooleanField(default=False)
    def __unicode__(self):
        return self.name

class MealRating(models.Model):
    meal = models.ForeignKey(Meal)
    user = models.ForeignKey(User)
    rating = models.FloatField(validators=[MinValueValidator(0), MaxValueValidator(5)])
    comment = models.TextField(max_length=200)
    
    def __init__(self):
        return self.rating
    
class MealNutrient(models.Model):
    meal = models.ForeignKey(Meal)
    nutrient = models.ForeignKey(Nutrient)
    content = models.FloatField(validators=[MinValueValidator(0), MaxValueValidator(1000)])
    unit = models.CharField(max_length=10)
    
    def __unicode__(self):
        return self.meal.name + " - " + self.nutrient.name
    
class MealIngredient(models.Model):
    meal = models.ForeignKey(Meal)
    ingredient = models.ForeignKey(Ingredient)
    content = models.FloatField(validators=[MinValueValidator(0), MaxValueValidator(1000)])
    unit = models.CharField(max_length=10)
    
    def __unicode__(self):
        return self.meal.name + " - " + self.ingredient.name
        
class Payment(models.Model):
    methods = PAYMENT_METHODS
    payment_type = models.CharField(choices=methods, max_length=2)
    data = models.TextField(max_length=1024, null=True)
    status = models.BooleanField(default=False)
    created = models.DateTimeField(null=True)
    updated = models.DateTimeField(null=True)
    
    def save(self, *args, **kwargs):
        if not self.id:
            self.created = datetime.datetime.now()
        self.updated = datetime.datetime.now()
        super(Payment, self).save(*args, **kwargs)
        
class Cart(models.Model):
    user = models.ForeignKey(User)

class CartItem(models.Model):
    cart = models.ForeignKey(Cart)
    meal = models.ForeignKey(Meal, related_name="cartitem")
    quantity = models.IntegerField(validators=[MinValueValidator(0), MaxValueValidator(100)])

class Order(models.Model):
    order_num = models.CharField(max_length=20)
    transaction_id = models.CharField(max_length=30)
    
    cart = models.ForeignKey(Cart)
    total_amount = models.FloatField(validators=[MinValueValidator(0), MaxValueValidator(10000)])
    total_tax = models.FloatField(validators=[MinValueValidator(0), MaxValueValidator(10000)])
    tip = models.IntegerField(default=5, validators=[MinValueValidator(0), MaxValueValidator(1000)])
    grand_total = models.FloatField(validators=[MinValueValidator(0), MaxValueValidator(10000)])
    
    delivery_address = models.ForeignKey(Address, related_name="delivery_address")
    billing_address = models.ForeignKey(Address, related_name="billing_address")
    
    delivery_time = models.CharField(max_length=20)
    driver_instructions = models.TextField(max_length=1024, null=True)
    
    payment = models.ForeignKey(Payment)
    status_choices = ((0, "Incomplete"),
                      (1, "Order placed, but not delivered."),
                      (2, "Delivered"),
                      )
    
    status = models.BooleanField(default=True)
    
    created = models.DateTimeField(null=True)
    updated = models.DateTimeField(null=True)
    
    def save(self, *args, **kwargs):
        if not self.id:
            self.created = datetime.datetime.now()
        self.updated = datetime.datetime.now()
        super(Order, self).save(*args, **kwargs)
    
class GiftCard(models.Model):
    code = models.CharField(max_length=10)
    credits = models.FloatField(validators=[MinValueValidator(0), MaxValueValidator(100)])
    
    def __unicode__(self):
        return self.code

class GiftCardRedemption(models.Model):
    user = models.ForeignKey(User)
    gift_card = models.ForeignKey(GiftCard, related_name="redemption")
    time = models.DateTimeField(null=True)
    
    def save(self, *args, **kwargs):
        if not self.id:
            self.created = datetime.datetime.now()
        super(GiftCardRedemption, self).save(*args, **kwargs)
    
    def __unicode__(self):
        return self.gift_card.code + " : " + str(self.time)