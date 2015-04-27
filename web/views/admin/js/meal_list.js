$(document).ready(function() {
    $('#searchinMeal').on("click", function() {
        var search_name = $('#searchBy-name').val(),
            category = $('#category option:selected').attr('value'),mealtype=[];
            // mealtype = $('#meal-type option:selected').attr('value');
        $('#meal-type option:selected').each(function() {
            mealtype.push($(this).attr('value'));
        });
        $("#meal-list tr td").detach();
        getmealList(search_name, category, mealtype);
    });

    $(document).on('click', '.meal-edit', function() {
        mealId = $(this).data().id;
        window.location.href = 'create_meal.html?mealId=' + mealId;
    });

    $(document).on('click', '.meal-delete', function() {
        var confirmDelete = confirm("Are you sure you want to delete this meal?");
        if (confirmDelete) {
            currentMealId = $(this).data().id;
            deleteMeal(currentMealId);
        } else {}
    });
    getmealList();
    getFilterContent();
});

//Delete Meals
var deleteMealCallback = {
    success: function(data, textStatus) {
        var deleteMealResponse = JSON.parse(data);
        getmealList();
    },
    failure: function(XMLHttpRequest, textStatus, errorThrown) {}
}

function deleteMeal(currentMealId) {
    var url = baseURL + "cms/delete_meal/" + currentMealId + "/";
    header = {
        "session-key": localStorage['session_key']
    }
    params = {}
    data = JSON.stringify(params);
    var deleteMealInstance = new AjaxHttpSender();
    deleteMealInstance.sendPost(url, header, data, deleteMealCallback);
}


//get meal list
var getmealListCallback = {
    success: function(data, textStatus) {
        var mealLIst = JSON.parse(data);
        populateMealList(mealLIst);
    },
    failure: function(XMLHttpRequest, textStatus, errorThrown) {}
}

function getmealList(search_name, category, mealtype) {
        var url = baseURL + "cms/get_meals/";
        header = {
            "session-key": localStorage['session_key']
        }
        params = {
            "search": search_name,
            "category_id": category,
            "type_ids": mealtype
        }
        data = JSON.stringify(params);
        var getmeallistInstance = new AjaxHttpSender();
        getmeallistInstance.sendPost(url, header, data, getmealListCallback);
    }
    //populate category & meal type
var getFilterContentCallback = {
    success: function(data, textStatus) {
        var filterContent = JSON.parse(data);
        // console.log(filterContent);
        populateFilterData(filterContent);
    },
    failure: function(XMLHttpRequest, textStatus, errorThrown) {}
}

function getFilterContent() {
    var url = baseURL + "get_categories/";
    header = {
        "session-key": localStorage['session_key']
    }
    params = {
        "get": "1"
    }
    data = JSON.stringify(params);
    var getFilterContentInstance = new AjaxHttpSender();
    getFilterContentInstance.sendPost(url, header, data, getFilterContentCallback);
}

function populateFilterData(data) {
    var meal_type = data.meal_types,
        categories = data.categories;
    $.each(meal_type, function(k, v) {
        $('.filter-container #meal-type').append('<option value="' + v.id + '">' + v.name + '</option');
    });
    $.each(categories, function(k, v) {
        $('.filter-container #category').append("<option value='" + v.id + "'>" + v.name + "</option>");
    });
}

//function populate MealList 
function populateMealList(data) {
    $('#meal-list tbody').empty();
    var fullMealList = data;
    $.each(fullMealList.aaData, function(key, value) {
        $('#meal-list tbody').append("<tr>" + "<td>" + value.name + "</td>" +
            "<td>" + value.description + "</td>" +
            "<td>" + value.available + "</td>" +
            "<td>" + value.category + "</td>" +
            "<td>" + value.meal_types[0].name + "</td>" +
            "<td>" + value.price + "</td>" +
            "<td><button type='button' class='meal-delete' data-id='" + value.id + "'>Delete</button></td>" +
            "<td><button type='button' class='meal-edit' data-id='" + value.id + "'>Edit</button></td>" + "</tr>");
    });
}
