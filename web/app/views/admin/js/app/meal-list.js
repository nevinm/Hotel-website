$(document).ready(function () {
    $('#searchinMeal').on("click", function () {
        var searchParams = returnMealSearchParams();
        getmealList(searchParams.search_name, searchParams.category, searchParams.mealtype);
    });
    $(document).on('click', '.meal-edit', function () {
        mealId = $(this).data().id;
        window.location.href = 'create-meal.html?mealId=' + mealId;
    });
    $(document).on('click', '.meal-delete', function () {
        var confirmDelete = confirm("Are you sure you want to delete this meal?");
        if (confirmDelete) {
            currentMealId = $(this).data().id;
            deleteMeal(currentMealId);
        } else {
        }
    });
    $(document).on('click', '.edit-meal-order', function () {
        var mealId = $(this).data().id,
                mealOrder = $(this).parent().find('.each-meal-order').text();
        $("#hidden-meal-id").val(mealId);
        $('#new-order').val(mealOrder);
        $('.edit-meal-order-popup').show();
        $('form#change-meal-order-form').validate().resetForm();
    });
    $('#change-order').on('click', function (e) {
        e.preventDefault();
        var new_order = $('#new-order').val(),
                mealId = $("#hidden-meal-id").val();
        if ($('form#change-meal-order-form').valid()) {
            updateMealOrder(mealId, new_order);
        }
    });
    $(document).on('click', '.edit-meal-available', function () {
        var mealId = $(this).data().id;
        var available = $(this).parent().find('.each-meal-available').text();
        $("#hiddenMealId").val(mealId);
        $('#newAvailable').val(available);
        $('.edit-meal-available-popup').show();
        $('form#changeAvailableForm').validate().resetForm();
    });
    $("#updateAvailable").on("click", function (e) {
        e.preventDefault();
        var availableUpdate = $('#newAvailable').val();
        var mealId = $("#hiddenMealId").val();
        if ($('form#changeAvailableForm').valid()) {
            updateAvailableMeals(mealId, availableUpdate);
        }
    });

    $('#cancel').on('click', function () {
        $('.edit-meal-order-popup').hide();
    });
    $(".edit-meal-available-popup .cancel").on("click", function () {
        $(".edit-meal-available-popup").hide();
    });
    getmealList('', '', '', 0);
    getFilterContent();
});

function returnMealSearchParams() {
    var search_name = $('#searchBy-name').val(),
            category = $('#category option:selected').attr('value'),
            mealtype = [];
    $('#meal-type option:selected').each(function () {
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
    success: function (data, textStatus) {
        var deleteMealResponse = JSON.parse(data);
        var searchParams = returnMealSearchParams();
        // currentPage = $('.pagination').pagination('getCurrentPage');
        getmealList(searchParams.search_name, searchParams.category, searchParams.mealtype/*, currentPage*/);
    },
    failure: function (XMLHttpRequest, textStatus, errorThrown) {
    }
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
    success: function (data, textStatus) {
        var mealLIst = JSON.parse(data);
        if (mealLIst.aaData.length > 0) {
            $(".meal-list-empty").hide();
            populateMealList(mealLIst);
        } else {
            $(".meal-list-empty").show();
            // $(".pagination").pagination({
            //     pages: 0,
            //     cssStyle: 'light-theme',
            // });
        }
    },
    failure: function (XMLHttpRequest, textStatus, errorThrown) {
    }
}

function getmealList(search_name, category, mealtype/*, pageNumber*/) {
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
        // "nextPage": pageNumber
    }
    data = JSON.stringify(params);
    var getmeallistInstance = new AjaxHttpSender();
    getmeallistInstance.sendPost(url, header, data, getmealListCallback);
}
//populate category & meal type
var getFilterContentCallback = {
    success: function (data, textStatus) {
        var filterContent = JSON.parse(data);
        // console.log(filterContent);
        populateFilterData(filterContent);
    },
    failure: function (XMLHttpRequest, textStatus, errorThrown) {
    }
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
    $.each(meal_type, function (k, v) {
        $('.filter-container #meal-type').append('<option value="' + v.id + '">' + v.name + '</option');
    });
    $.each(categories, function (k, v) {
        $('.filter-container #category').append("<option value='" + v.id + "'>" + v.name + "</option>");
    });
}
//Update meal order
var updateMealOrderCallback = {
    success: function (data, textStatus) {
        var updateMealResponse = JSON.parse(data);
        if (updateMealResponse.status == 1) {
            // currentPage = $('.pagination').pagination('getCurrentPage');
            getmealList();
        } else {
            $("#viewPopup .content span").text(updateMealResponse.message);
            $("#viewPopup").show();
        }
        $('.edit-meal-order-popup').hide();
    },
    failure: function (XMLHttpRequest, textStatus, errorThrown) {
    }
}

function updateMealOrder(currentMealId, order) {
    var url = baseURL + "cms/update_meal_order/" + currentMealId + "/";
    header = {
        "session-key": localStorage['session_key']
    }
    params = {
        "order": order
    }
    data = JSON.stringify(params);
    var updateMealOrderInstance = new AjaxHttpSender();
    updateMealOrderInstance.sendPost(url, header, data, updateMealOrderCallback);
}
var updatePrimaryMealOrderCallback = {
    success: function (data, textStatus, currentElement) {
        var updateMealResponse = JSON.parse(data);
        if (updateMealResponse.status == 1) {
            $(".primary-meal").addClass("non-primary-meal");
            $(".primary-meal").text("NO");
            $(".primary-meal").removeClass("primary-meal");
            $(currentElement).removeClass("non-primary-meal");
            $(currentElement).addClass("primary-meal");
            $(currentElement).text("YES");
        } else {
            $("#viewPopup .content span").text(updateMealResponse.message);
            $("#viewPopup").show();
        }
    },
    failure: function (XMLHttpRequest, textStatus, errorThrown) {
    }
}
function updateAvailableMeals(mealId, availableUpdate) {
    var url = baseURL + "cms/update_meal_availablity/" + mealId + "/";
    var header = {
        "session-key": localStorage['session_key']
    };
    var params = {
        "available": availableUpdate
    };
    var data = JSON.stringify(params);
    new AjaxHttpSender().sendPost(url, header, data, updateAvailableMealsCallback);
}
var updateAvailableMealsCallback = {
    success: function (data, textStatus) {
        var updateMealResponse = JSON.parse(data);
        if (updateMealResponse.status == 1) {
            // currentPage = $('.pagination').pagination('getCurrentPage');
            getmealList();
        } else {
            $("#viewPopup .content span").text(updateMealResponse.message);
            $("#viewPopup").show();
        }
        $(".edit-meal-available-popup").hide();
    },
    failure: function (XMLHttpRequest, textStatus, errorThrown) {
    }
};
function updatePrimaryMeal(currentMealId, currentElement) {
    var url = baseURL + "cms/update_home_meal/";
    header = {
        "session-key": localStorage['session_key']
    }
    params = {
        "meal_id": currentMealId
    }
    data = JSON.stringify(params);
    var updatePrimaryMealInstance = new AjaxHttpSender();
    updatePrimaryMealInstance.sendPost(url, header, data, updatePrimaryMealOrderCallback, currentElement);
}
//function populate MealList 
function populateMealList(data) {
    $('#meal-list tbody').empty();
    var fullMealList = data;
    $.each(fullMealList.aaData, function (key, value) {
        $('#meal-list tbody').append("<tr>" +
                "<td>" + "<img class='meal-list-img'src = '" + value.main_image + "'>" + "</td>" +
                "<td>" + value.name + "</td>" + "<td>" + value.description + "</td>" +
                "<td><span class = 'each-meal-order'>" + value.order + "</span>" + "<span  data-id = '" + value.id + "' class = 'edit-meal-order'>" + "EDIT" + "</span>" + "</td>" +
                "<td><span class = 'each-meal-available'>" + value.available + "</span>" + "<span  data-id = '" + value.id + "' class = 'edit-meal-available'>" + "EDIT" + "</span>" + "</td>" +
                "<td>" + value.category + "</td>" +
                "<td class='meal-type'></td>" + "<td>" + dollarConvert(parseFloat(value.price).toFixed(2)) + "</td>" +
                "<td><a href='#!' data-id = '" + value.id + "' class='meal-homepage primary-meal'></a>" + "</td>" +
                "<td><a href='#' data-id = '" + value.id + "' class='' id='soldOut-" + value.id + "'>" + (value.sold_out == 1 ? "YES" : "NO") + "</a>" + "</td>" +
                "<td><button type='button' class='meal-delete btn btn-small-primary medium-green' data-id='" + value.id + "'>Delete</button></td>" +
                "<td><button type='button' class='meal-edit btn btn-small-primary medium-green' data-id='" + value.id + "'>Edit</button></td>" +
                "</tr>");
        if (value.primary_meal) {
            $(".meal-homepage:last").addClass("primary-meal");
            $(".meal-homepage:last").text("YES");
        } else {
            $(".meal-homepage:last").addClass("non-primary-meal");
            $(".meal-homepage:last").text("NO");
        }
        if (value.sold_out) {
            $("#soldOut-" + value.id).removeClass("not-sold-out").addClass("sold-out");
        } else {
            $("#soldOut-" + value.id).removeClass("sold-out").addClass("not-sold-out");
        }
        if (value.meal_types.length) {
            var mealTypes = "";
            $.each(value.meal_types, function (key, value) {
                mealTypes = mealTypes + value.name + ", ";
            });
            $(".meal-type:last").text(mealTypes.trim().slice(0, -1));
        } else {
            $(".meal-type:last").text("None");
        }
        $("a[id^=soldOut-]").off().on("click", function (e) {
            e.preventDefault();
            updateSoldOut(this);
        });
    });
    // $(".pagination").pagination({
    //     pages: fullMealList.num_pages,
    //     currentPage: fullMealList.current_page,
    //     cssStyle: 'light-theme',
    //     onPageClick: function (pageNumber, event) {
    //         var searchParams = returnMealSearchParams();
    //         getmealList(searchParams.search_name, searchParams.category, searchParams.mealtype, pageNumber);
    //     },
    //     onInit: function () {
    //         if (getStringAfterHash(location.href, "#")) {
    //             var pageString = getStringAfterHash(location.href, "#");
    //             if (pageString.indexOf('page') != -1) {
    //                 pageNumber = getStringAfterHash(pageString, "-");
    //                 if ($(".pagination").pagination('getCurrentPage') == pageNumber) {
    //                 } else {
    //                     $(".pagination").pagination('selectPage', pageNumber);
    //                 }
    //             }
    //         } else {
    //         }
    //     }
    // });
    $(".non-primary-meal").on("click", function () {
        currentMealId = $(this).data("id");
        updatePrimaryMeal(currentMealId, $(this));
    });
}

function updateSoldOut(element) {
    var mealId = $(element).attr("data-id");
    var url = baseURL + "cms/update_meal_soldout/";
    header = {
        "session-key": localStorage['session_key']
    }
    params = {
        "meal_id": mealId,
        "sold_out": (element.text === "YES" ? 0 : 1) //Toggle
    }
    data = JSON.stringify(params);
    var deleteMealInstance = new AjaxHttpSender();
    deleteMealInstance.sendPost(url, header, data, updateSoldOutCallback, mealId);
}
var updateSoldOutCallback = {
    success: function (data, textStatus, mealId) {
        var responseData = JSON.parse(data);
        if (responseData.status == 1) {
            if ($("#soldOut-" + mealId).text() === "YES") {
                $("#soldOut-" + mealId).text("NO");
                $("#soldOut-" + mealId).removeClass("sold-out").addClass("not-sold-out");
            } else {
                $("#soldOut-" + mealId).text("YES");
                $("#soldOut-" + mealId).removeClass("not-sold-out").addClass("sold-out");
            }
        } else {
            $(".popup-wrapper:first .content span").text(responseData.message);
            $(".popup-wrapper:first").show();
        }
    },
    failure: function (XMLHttpRequest, textStatus, errorThrown) {
    }
}