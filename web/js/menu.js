$(document).ready(function() {
    var perPage = 9;
    $(document).on("click", '.subMenu ul li a', function() {
        $(document).find(".subMenu ul li").removeClass("activeOption");
        $(this).parent().addClass("activeOption");
    });

    //Categories
    $(document).on('click', '.menu-categories-list', function() {
        categoryId = $(this).find("a").data().id;
        getmealList('', categoryId, '', perPage, 1);
    });

    var mealTypeFilter=[];
    //Filters
    $(document).on('change','.filter-drop-down input[type=checkbox]', function(e){
        if ($(this).is(":checked")) {
            mealTypeFilter.push(parseInt($(this).val()));
            getmealList('','', mealTypeFilter, perPage, 1);

        }
    });

    getCategory();
    getmealList();
    // 
});
//Get Category list of food items.
var getCategoryCallback = {
    success: function(data, textStatus) {
        userDetails = JSON.parse(data);
        if (userDetails.status == 1) {
            $.each(userDetails.categories, function(key, value) {
                $('.category-wrapper .category-menu').append("<li class='menu-categories-list'><a href='#'" +
                    " class='menu-categories' data-id='" + value.id + "'>" + value.name + "</a></li>")
            });
            $.each(userDetails.meal_types, function(key, value) {
                $(".filter-drop-down ul").append("<li><div><input id='mealtype" + key + "' type='checkbox' " +
                    "name='mealtype" + key + "' value='" + value.id + "'>" +
                    "<label for='mealtype" + key + "'>" + value.name + "</label></div></li>");
            });
        } else {
            console.log("somthing wrong with categories");
        }
    },
    failure: function(XMLHttpRequest, textStatus, errorThrown) {}
}

function getCategory() {
    var url = baseURL + 'get_categories/',
        header = {
            "session-key": localStorage["session_key"]
        },
        userInfo = {
            "get": 1
        },
        data = JSON.stringify(userInfo);

    var getCategoryInstance = new AjaxHttpSender();
    getCategoryInstance.sendPost(url, header, data, getCategoryCallback);
}

//Get meal list
var getmealListCallback = {
    success: function(data, textStatus) {
        var mealLIst = JSON.parse(data);
        populateMealList(mealLIst);
    },
    failure: function(XMLHttpRequest, textStatus, errorThrown) {}
}

function getmealList(search_name, category, mealtype, perPage, nextPage) {
    var url = baseURL + "cms/get_meals/";
    header = {
        "session-key": localStorage['session_key']
    }
    params = {
        "search": search_name,
        "category_id": category,
        "type_ids": mealtype,
        "perPage": perPage,
        "nextPage": nextPage
    }
    data = JSON.stringify(params);
    var getmeallistInstance = new AjaxHttpSender();
    getmeallistInstance.sendPost(url, header, data, getmealListCallback);
}

function populateMealList(mealLIst) {
    $(".listContainer").empty();
    $.each(mealLIst.aaData, function(key, value) {
        $(".listContainer").append("<div class='listItems'>" +
            "<img src='" + value.images[0].thumb_url + "' class='thumbnail'>" +
            "<section class='listItemDetails'>" +
            "<span class='pullLeft menuItemName body-text-bold'>" + value.name + "</span>" +
            "<span class='pullRight itemCost body-text-bold'>" + dollarConvert(value.price + value.tax) + "</span>" +
            "</section><section class='listItemDetails'>" +
            "<span class='menuItemDetails caption'>Brioche Bun, Avocado, Tomato, Red Onions.</span>" +
            "<span><a href='#' class='btn btn-small-primary medium-green addItemButton' " +
            "data-id='" + value.id + "'>ADD</a></span>" +
            "</section></div>");
    });

}
