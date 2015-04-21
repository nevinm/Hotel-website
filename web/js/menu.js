$(document).ready(function() {
    var perPage = 3,
        nextPage = 1,
        mealTypeFilter = [],
        endOfList = false, ipadWidth=767;
    $(document).on("click", '.subMenu .menu-categories-list', function() {
        $(document).find(".subMenu ul li").removeClass("activeOption");
        $(this).addClass("activeOption");
    });

    //Categories
    $(document).on('click', '.menu-categories-list', function() {
        nextPage = 1;
        categoryId = $(this).find("a").data().id;
        getmealList('', categoryId, mealTypeFilter, perPage, 1);
        infiniteScrolling();
    });

    $(".category-header").on('click',function(){
        $(".category-menu").slideToggle();
    });

    $(".filter-container").on('click',function(){
        // if(window.innerWidth < ipadWidth){
            $(".filter-drop-down").slideToggle();
        // }
        // else{}
    })

    //Filters
    $(document).on('change', '.filter-drop-down input[type=checkbox]', function(e) {
        currentCategory = $(".activeOption a").attr("data-id");
        nextPage = 1;
        if ($(this).is(":checked")) {
            mealTypeFilter.push(parseInt($(this).val()));
            getmealList('', currentCategory, mealTypeFilter, perPage, 1);
        } else {
            index = mealTypeFilter.indexOf(parseInt($(this).val()));
            if (index > -1) {
                mealTypeFilter.splice(index, 1);
            }
            getmealList('', currentCategory, mealTypeFilter, perPage, 1);
        }
        infiniteScrolling();
    });

//Infinite Scrolling
function infiniteScrolling() {
    $("body").on('scroll', function(e) {
        if ($('.listItems').length && !endOfList) {
            if (elementScrolling(".listItems:last")) {
                mealData = JSON.parse(localStorage['meal_details']);
                getmealList(mealData.search, mealData.category_id, mealData.type_ids, mealData.perPage, mealData.nextPage + 1, true)
           };
        }
    });
}

    getCategory();
    getmealList('', '', '', perPage, nextPage);
    infiniteScrolling();
});
//Get Category list of food items.
var getCategoryCallback = {
    success: function(data, textStatus) {
        userDetails = JSON.parse(data);
        if (userDetails.status == 1) {
            $.each(userDetails.categories, function(key, value) {
                $('.category-wrapper .category-menu').append("<li class='menu-categories-list'><a href='#'" +
                    " class='menu-categories' data-id='" + value.id + "'>" + value.name + "</a></li>");
                // $('.sub-menu-mobile .category-menu').append("<li class='menu-categories-list '><a href='#'"+
                //     "class='menu-categories' data-id='" + value.id + "'>" + value.name + "</a></li>")
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
    success: function(data, textStatus, isInfinteScrolling) {
        var mealList = JSON.parse(data);
        // debugger;
        if (mealList.status == 1) {
            endOfList = (mealList.current_page == mealList.page_range[mealList.page_range.length - 1]);
            if(endOfList){
                $('body').unbind('scroll');
            }else{}
            populateMealList(mealList, isInfinteScrolling);
        } else {
            console.log("Something wrong with meals list");
        }
        $(".menu-loading-gif").hide();
    },
    failure: function(XMLHttpRequest, textStatus, errorThrown) {}
}

function getmealList(search_name, category, mealtype, perPage, nextPage, isInfinteScrolling) {
    if (isInfinteScrolling) {
        $(".menu-loading-gif").show();
    }
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
    localStorage['meal_details'] = data;
    var getmeallistInstance = new AjaxHttpSender();
    getmeallistInstance.sendPost(url, header, data, getmealListCallback, isInfinteScrolling);
}

function populateMealList(mealList, isInfinteScrolling) {
    if (!isInfinteScrolling) {
        $(".listContainer").empty();
    } else {}
    $.each(mealList.aaData, function(key, value) {
        $(".listContainer").append("<div class='listItems'>" +
            "<img src='" + value.images[0].thumb_url + "' class='thumbnail'>" +
            "<section class='listItemDetails'>" +
            "<h4 class='pullLeft menuItemName'>" + value.name + "</h4>" +
            "<h3 class='pullRight itemCost'>" + dollarConvert(value.price + value.tax) + "</h3>" +
            "</section><section class='listItemDetails'>" +
            "<span class='menuItemDetails caption'>Brioche Bun, Avocado, Tomato, Red Onions.</span>" +
            "<span><a href='#' class='btn btn-small-primary medium-green addItemButton' " +
            "data-id='" + value.id + "'>ADD</a></span>" +
            "</section></div>");
    });
}

function elementScrolling(elem) {
    var docViewTop = $(window).scrollTop();
    var docViewBottom = docViewTop + $(window).height();

    var elemTop = $(elem).offset().top;
    var elemBottom = elemTop + $(elem).height();

    return ((elemBottom <= docViewBottom) && (elemTop >= docViewTop));
}
