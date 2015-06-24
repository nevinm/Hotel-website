#encoding: utf-8
import os, sys, csv, json
sys.path.append('/home/nasar/env/meisterdish/lib/python2.7/site-packages/')
sys.path.append(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
os.environ['DJANGO_SETTINGS_MODULE'] = 'settings'
import settings

from meisterdish_server.models import Meal, Tips
keys = ['Category', "All You'll Be Doing", 'Saved Time', 'Description', 'Ingredients', "What We've Prepped", 'Tips & Tricks', 'Price', 'All You Need', 'Tax', 'Ingredients Image', 'Main Image', 'Meal Types', 'Meal Ingredients', 'Nutrients', 'Meal Name', 'All You Need Image', 'Availability', 'Preparation Time']
lists = ["All You'll Be Doing", "What We've Prepped", "All You Need", "Ingredients", "Tips & Tricks", "Nutrients"]

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
                    if row.keys() != keys:
                        print "Please cross check all the field names"
                        return False
                print "Checking Row :" + str(counter)
                for key, field in row.items():
                    if key in lists:    
                        try:
                            field = '"'+field.replace('\xe2\x80\x9d', "'").replace('\xe2\x80\x9c', "'").replace("\n", "") + '"'
                            field = json.loads(field)
                        except:
                            print "No valid json data in " + key + ".. Skipping row"
                            print field
                            continue
                    row[key] = field
                data.append(row)
        return data


    def import_meals(self, data):
        print "Importing data"
        print "In Process"












import_ = ImportMeals()