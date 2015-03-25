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
    
    is_active = models.BooleanField(default=False)
    created = models.DateTimeField(default=datetime.datetime.now())
    
    def __unicode__(self):
        return self.username

class State(models.Model):
    name = models.CharField(max_length=30)
    state_code = models.CharField(max_length=3, unique=True)
    def __unicode__(self):
        return self.name

class City(models.Model):
    name = models.CharField(max_length=30)
    state = models.ForeignKey(State)
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
"""
class CreditCardDetails(models.Model):
    user = models.ForeignKey(User, related_name="cc_details")
    card_no = models.CharField(max_length=16)
    name = models.CharField(max_length=25)
    expiry_month = models.CharField(choices=months)
    expiry_year = models.CharField(choices=years)

    def __unicode__(self):
        return self.user.username + " : " + self.card_no[-4:]
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
    
class PreRequisite(models.Model):
    name = models.CharField(max_length=20)
    def __unicode__(self):
        return self.name

class Meal(models.Model):
    name = models.CharField(max_length=30)
    image_url = models.CharField(max_length=30)
    description = models.TextField(max_length=1024)
    preparation_time = models.IntegerField(validators=[MinValueValidator(0), MaxValueValidator(100)])
    type = models.ForeignKey(MealType)
    
    nutrients = models.ManyToManyField(Nutrient, through="MealNutrient")
    ingredients = models.ManyToManyField(Ingredient, through="MealIngredient")
    pre_requisites = models.ManyToManyField(PreRequisite, through="MealPreRequisite")
    
    price = models.FloatField(validators=[MinValueValidator(0), MaxValueValidator(1000)])
    tax = models.FloatField(validators=[MinValueValidator(0), MaxValueValidator(1000)])
    
    available = models.BooleanField(default=False)
    def __unicode__(self):
        return self.name

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
    
class MealPreRequisite(models.Model):
    meal = models.ForeignKey(Meal)
    prerequisite = models.ForeignKey(PreRequisite)
    content = models.FloatField(validators=[MinValueValidator(0), MaxValueValidator(1000)])
    unit = models.CharField(max_length=10)
    
    def __unicode__(self):
        return self.meal.name + " - " + self.prerequisite.name
        
class Payment(models.Model):
    methods = PAYMENT_METHODS
    payment_type = models.CharField(choices=methods, max_length=2)
    transaction_id = models.CharField(max_length=35)
    
class Cart(models.Model):
    user = models.ForeignKey(User)

class CartItem(models.Model):
    cart = models.ForeignKey(Cart)
    meal = models.ForeignKey(Meal)
    quantity = models.IntegerField(validators=[MinValueValidator(0), MaxValueValidator(100)])

class Order(models.Model):
    cart = models.ForeignKey(Cart)
    total_amount = models.FloatField(validators=[MinValueValidator(0), MaxValueValidator(10000)])
    tip = models.IntegerField(default=5, validators=[MinValueValidator(0), MaxValueValidator(1000)])
    delivery_address = models.ForeignKey(Address, related_name="delivery_address")
    billing_address = models.ForeignKey(Address, related_name="billing_address")
    delivery_time = models.CharField(max_length=20)
    driver_instructions = models.TextField(max_length=1024, null=True)
    
    payment = models.ForeignKey(Payment)
    status_choices = ((0, "Incomplete"),
                      (1, "Order placed, but not delivered."),
                      (2, "Delivered"),
                      )
    created = models.DateTimeField(default=datetime.datetime.now())
    
class GiftCard(models.Model):
    user = models.ForeignKey(User)
    code = models.CharField(max_length=10)
    credits = models.FloatField(validators=[MinValueValidator(0), MaxValueValidator(100)])
    
    def __unicode__(self):
        return self.user.username + " : " + self.code

class GiftCardRedemption(models.Model):
    gift_card = models.ForeignKey(GiftCard, related_name="redemption")
    time = models.DateTimeField(default=datetime.datetime.now())
    
    def __unicode__(self):
        return self.gift_card.code + " : " + str(self.time)