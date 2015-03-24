from django.db import models
from django.core.validators import MinValueValidator, MaxValueValidator
import datetime

class User(models.Model):
    username = models.CharField(unique=True, max_length=15)
    password = models.CharField(max_length=25)
    first_name = models.CharField(max_length=25)
    last_name = models.CharField(max_length=25)
    zip = models.CharField(max_length=10)
    email = models.EmailField(max_length=30)
    mobile = models.CharField(max_length=15)
    dob = models.DateField()
    profile_image = models.CharField(max_length=50)
    
    def __unicode__(self):
        return self.username

class State(models.Model):
    name = models.CharField(max_length=30)
    state_code = models.CharField(max_length=3, unique=True)
    def __unicode__(self):
        return self.name

class City(models.Model):
    name = models.CharField(max_length=30)
    state = models.ForeignKey(state)
    state_code = models.CharField(max_length=3, unique=True)
    def __unicode__(self):
        return self.name

class Address(models.Model):
    user = models.ForeignKey(User, related_name="address")
    name = models.CharField(max_length=50)
    is_business = models.BooleanField(default=False)
    street = models.CharField(max_length=50)
    building = models.CharField(max_length=50)
    city = models.ForeignKey(City)
    zip = models.CharField(max_length=10)
    phone = models.CharField(max_length=15)
    
    def __unicode__(self):
        return self.user.username + " : " + self.name

class CreditCardDetails(models.Model):
    user = models.ForeignKey(User, related_name="cc_details")
    card_no = models.CharField(max_length=16)
    name = models.CharField(max_length=25)
    expiry_month = models.CharField(choices=months)
    expiry_year = models.CharField(choices=years)

    def __unicode__(self):
        return self.user.username + " : " + self.card_no[-4:]


class Category(models.Model):
    name = models.CharField(max_length=25)
    
    def __unicode__(self):
        return self.name

class Meal(models.Model):
    name = models.CharField(max_length=30)
    image_url = models.CharField(max_length=30)
    description = models.TextField(max_length=1024)
    preparation_time = models.IntegerField(validators=[MinValueValidator(0), MaxValueValidator(100)])
    
    price = models.FloatField(validators=[MinValueValidator(0), MaxValueValidator(1000)])
    tax = models.FloatField(validators=[MinValueValidator(0), MaxValueValidator(1000)])
    
    available = models.BooleanField(default=False)
    def __unicode__(self):
        return self.name

class Payment(models.Model):
    methods = (('CC', 'Credit Card'),
               ('PP', 'PayPal'))
    payment_type = models.CharField(choices=self.methods)
    transaction_id = models.CharField(max_length=35)
    
class Cart(models.Model):
    user = models.ForeignKey(User)

class CartItem(models.Model):
    cart = models.ForeignKey(Cart)
    meal = models.ForeignKey(meal)
    quantity = models.IntegerField(validators=[MinValueValidator(0), MaxValueValidator(100)])

class Order(models.Model):
    cart = models.ForeignKey(Cart)
    total_amount = models.FloatField(validators=[MinValueValidator(0), MaxValueValidator(10000)])
    tip = models.IntegerField(default=5, validators=[MinValueValidator(0), MaxValueValidator(1000)])
    delivery_address = models.ForeignKey(Address)
    billing_address = models.ForeignKey(Address)
    delivery_time = models.CharField(max_length=20)
    driver_instructions = models.TextField(max_length=1024, null=True)
    
    payment = models.ForeignKey(Payment)
    status_choices = ((0, "Incomplete"),
                      (1, "Order placed, but not delivered."),
                      (2, "Delivered"),
                      )
    
class GiftCard(models.Model):
    code = models.CharField(max_length=10)
    credits = models.FloatField(validators=[MinValueValidator(0), MaxValueValidator(100)])
    user = models.ForeignKey(user)
    
    def __unicode__(self):
        return self.user.username + " : " + self.code

class GiftCardRedemption(models.Model):
    gift_card = models.ForeignKey(GiftCard)
    time = models.DateTimeField(default=datetime.datetime.now())
    
    def __unicode__(self):
        return self.gift_card.code + " : " + str(self.time)