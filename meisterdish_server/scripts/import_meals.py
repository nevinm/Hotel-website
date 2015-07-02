#encoding: utf-8
import os, sys, csv, json
sys.path.append('/home/nasar/env/meisterdish/lib/python2.7/site-packages/')
sys.path.append(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
os.environ['DJANGO_SETTINGS_MODULE'] = 'settings'
import settings
import django
django.setup()
from meisterdish_server.models import Meal, Tips, Category, MealType
keys = {
    "name" : "Meal Name",
    "sub" : "Meal Ingredients",
    "desc" : "Description",
    "price" : "Price",
    "tax" : "Tax",
    "main_img" : "Main Image",
    "available" : "Availability",
    "cat" : "Category",
    "types" : "Meal Types",

    "prep_time" : "Preparation Time",
    "saved_time" : "Saved Time",
    "all_you_do" : "All You'll Be Doing",
    "what_we_prepd" : "What We've Prepped",

    "all_you_need" : "All You Need",
    "all_you_need_image" : "All You Need Image",

    "ing" : "Ingredients",
    "ing_image" : 'Ingredients Image',
    
    "tips" : "Tips & Tricks",    
    "nutrients" : "Nutrients",

    
}

lists = ["Meal Types", "All You'll Be Doing", "What We've Prepped", "All You Need", "Ingredients", "Tips & Tricks", "Nutrients"]

class ImportMeals:
    def __init__(self):
        
        if len(sys.argv) != 2:
            print "Please provide a valid import file name"
            return None
        
        filename = sys.argv[1]
        if not self.check_file_type(filename):
            return None

        data = self.read_csv_file(filename)
        if not data:
            return None

        response = self.import_meals(data)


    def check_file_type(self, filename):
        if not filename or filename.strip() == "":
            print "Invalid file name"
            return False
        elif filename.split(".")[-1] != "csv":
            print "Please enter a valid CSV file"
            return False
        return True

    def read_csv_file(self, filename):
        data = []
        with open(filename, 'rb') as csvfile:
            try:
                reader = csv.DictReader(csvfile, delimiter=',')
            except:
                print "Invalid CSV file."
                return False
            counter = 0
            for row in reader:
                counter += 1
                if counter == 1:
                    if row.keys().sort() != keys.values().sort():
                        print "Please cross check all the field names"
                        return False
                print "Checking Row :" + str(counter)
                for key, field in row.items():
                    
                    if key in lists:
                        try:
                            field = '"'+field.replace('\xe2\x80\x9d', "'").replace('\xe2\x80\x9c', "'").replace("\n", "") + '"'
                            field = json.loads(field)
                        except Exception as e:
                            print "No valid json data in " + key + ".. Skipping row"
                            #print field
                            continue
                    row[key] = field
                data.append(row)
        return data


    def import_meals(self, data):
        print "Importing data"
        count = 0
        for row in data:
            try:
                count +=1
                meal = Meal()
                meal.name = row[keys["name"]].strip()
                meal.sub = row[keys["sub"]].strip()
                meal.desciption = row[keys["desc"]].strip()

                price = row[keys["price"]].strip().strip('$').strip()
                tax = row[keys["tax"]].strip().strip('%').strip().strip('$').strip()

                meal.price = 0 if price == "" else float(price)
                meal.tax = 0 if tax == "" else float(tax)

                #meal.main_image = Image.objects.#main_img
                meal.available = bool(int(row[keys["available"]]))

                meal.category = Category.objects.get_or_create(name=row[keys["cat"]].strip())[0]
                
                if type(row[keys["types"]]) == type([]) and len(row[keys["types"]]):
                    for ty in row[keys["types"]]:
                        meal.types.add(MealType.objects.get_or_create(name__iexact=ty.strip()))

                meal.preparation_time = row[keys["prep_time"]].strip()
                meal.saved_time = row[keys["saved_time"]].strip()

                meal.user_to_do = json.dumps(row[keys["all_you_do"]]).strip('"')

                meal.finished_preparation = json.dumps(row[keys["what_we_prepd"]]).strip('"')

                meal.pre_requisites = json.dumps(row[keys["all_you_need"]]).strip('"')
                #all_you_need_image

                meal.ingredients = json.dumps(row[keys["ing"]]).strip('"')
                #ing_image

                #tips
                meal.nutrients = json.dumps(row[keys["nutrients"]]).strip('"')

                meal.save()
            except Exception as e:
                print "Error in inserting row "+str(count) + " : " +e.message
                print row
                continue
            else:
                print "Row "+str(count) + " Inserted"
        print "Done"
        return True







import_ = ImportMeals()