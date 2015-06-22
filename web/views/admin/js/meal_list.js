$(document).ready(function() {
    $('#searchinMeal').on("click", function() {
        var searchParams = returnMealSearchParams();
        getmealList(searchParams.search_name, searchParams.category, searchParams.mealtype);
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
    getmealList('', '', '', 0);
    getFilterContent();
});

function returnMealSearchParams() {
    var search_name = $('#searchBy-name').val(),
        category = $('#category option:selected').attr('value'),
        mealtype = [];
    $('#meal-type option:selected').each(function() {
        mealtype.push($(this).attr('value'));
    });
    $("#meal-list tr td").detach();
    return searchParams = {
        "search_name": search_name,
        "category": category,
        "mealtype": mealtype
    }
}

//Delete Meals
var deleteMealCallback = {
    success: function(data, textStatus) {
        var deleteMealResponse = JSON.parse(data);
        var searchParams = returnMealSearchParams();
        currentPage = $('.pagination').pagination('getCurrentPage');
        getmealList(searchParams.search_name, searchParams.category, searchParams.mealtype, currentPage);
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
        if (mealLIst.aaData.length > 0) {
            $(".meal-list-empty").hide();
            populateMealList(mealLIst);
        } else {
            $(".meal-list-empty").show();
            $(".pagination").pagination({
                pages: 0,
                cssStyle: 'light-theme',
            });
        }
    },
    failure: function(XMLHttpRequest, textStatus, errorThrown) {}
}

function getmealList(search_name, category, mealtype, pageNumber) {
        var url = baseURL + "cms/get_meals/";
        if (mealtype == "") {
            mealtype.length = 0;
        }
        header = {
            "session-key": localStorage['session_key']
        }
        params = {
            "search": search_name,
            "category_id": category,
            "type_ids": mealtype,
            "nextPage": pageNumber
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
    var url = baseURL + "cms/get_categories_filters/";
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
            "<td>" + dollarConvert(value.price) + "</td>" +
            "<td><button type='button' class='meal-delete' data-id='" + value.id + "'>Delete</button></td>" +
            "<td><button type='button' class='meal-edit' data-id='" + value.id + "'>Edit</button></td>" + "</tr>");
    });
    $(".pagination").pagination({
        pages: fullMealList.num_pages,
        currentPage: fullMealList.current_page,
        cssStyle: 'light-theme',
        onPageClick: function(pageNumber, event) {
            var searchParams = returnMealSearchParams();
            getmealList(searchParams.search_name, searchParams.category, searchParams.mealtype, pageNumber);
        }
    });
}
