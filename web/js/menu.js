$(document).ready(function() {
    var perPage = 6,
        nextPage = 1,
        mealTypeFilter = [],
        endOfList = false,
        ipadWidth = 767;

     if (localStorage['loggedIn'] == 'true') {
        $('.menu-offer').show();
     }else{
        $('.menu-offer').hide();
     }

    $(document).on("click", '.subMenu .menu-categories-list', function() {
        $(document).find(".subMenu ul li").removeClass("activeOption");
        $(this).addClass("activeOption");
        if (window.innerWidth < ipadWidth) {
            $(".category-menu").slideToggle();
        }
    });
    //Add to cart
    $(document).on("click", '.addItemButton', function(e) {
        e.preventDefault();
        var x = {},
            meal_id = $(this).attr('data-id');
        if (localStorage['loggedIn'] == 'true') {
            addToCart(meal_id);
        } else if (localStorage['loggedIn'] == 'false' || localStorage.getItem('loggedIn') === null) {
            addToCart(meal_id);
        }
    });

    $(document).on("click", '.thumbnail', function() {
        mealId = this.dataset.id;
        window.location.href = 'meal_details.html?mealId=' + mealId;
    });
    //Categories
    $(document).on('click', '.menu-categories-list', function() {
        nextPage = 1;
        categoryId = $(this).find("a").data().id;
        getmealList('', categoryId, mealTypeFilter, perPage, 1);
        infiniteScrolling();
    });

    //Mobile category header
    $(".category-header").on('click', function() {
        $(".category-menu").slideToggle();
    });

    //Filter toggle
    $(".filter-container").on('click', function(e) {
        filterContainer = document.getElementsByClassName("filter-container")[0];
        filterCenter = document.getElementsByClassName("filter-center")[0];
        filterMenuLabel = document.getElementsByClassName("filter-menu-label")[0];
        arrowDown = document.getElementsByClassName("arrow-down")[1];
        subMenuFilter = document.getElementsByClassName("subMenuFilter")[0];
        if ((e.target == filterContainer) || (e.target == filterCenter) ||
            (e.target == filterMenuLabel) || (e.target == arrowDown) || (e.target == subMenuFilter)) {
            $(".filter-drop-down").slideToggle();
        } else {
            return;
        }
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

    $(window).on('scroll', function(e) {
        var menuNavHeight = 100,
            stickyMenu = $('.subMenu'),
            scroll = $(document).scrollTop();
        if (scroll >= menuNavHeight) {
            stickyMenu.addClass('fixedMenu');
        } else {
            stickyMenu.removeClass('fixedMenu');
        }
    });

    //share with friends
    $('#share-now').on('click',function(){
        if ($(window).width() <= 767 && $(window).width() >= 320) {
            $('.share-popup-wrapper').show();
        }else{
            window.location.href = "share_page.html";
        }

    });
    $('#done-share').on('click', function() {
        $('.share-popup-wrapper').hide();
    })

    $('#facebook-share').on('click', function() {
        checkLoginState();
    })

    $('#twitter-share').on('click', function() {
        twitterShare(homeUrl);
    })

    $('#email-share').on('click', function() {
        emailShare(homeUrl);
    })

    CartItemCount();
    getCategory();
    getmealList('', '', '', perPage, nextPage);
    infiniteScrolling();
});

//Infinite Scrolling
function infiniteScrolling() {
    var stickyMenuOffset = $('.subMenu').offset().top;
    $(document).unbind('scroll');
    $(document).on('scroll', function(e) {
        if ($('.listItems').length && endOfList == false) {
            if (elementScrolling(".listItems:last")) {
                $(document).unbind('scroll');
                mealData = JSON.parse(localStorage['meal_details']);
                getmealList(mealData.search, mealData.category_id, mealData.type_ids, mealData.perPage, mealData.nextPage + 1, true)
            };
        }
    });
}

//Get Category list of food items.
var getCategoryCallback = {
    success: function(data, textStatus) {
        userDetails = JSON.parse(data);
        if (userDetails.status == 1) {
            $.each(userDetails.categories, function(key, value) {
                $('.category-wrapper .category-menu').append("<li class='menu-categories-list'><a '" +
                    " class='menu-categories' data-id='" + value.id + "'>" + value.name + "</a></li>");
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
        if (mealList.status == 1) {
            endOfList = (mealList.current_page == mealList.page_range[mealList.page_range.length - 1]);
            if (endOfList == true) {
                // $(document).unbind('scroll');
            } else {}
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
    var url = baseURL + "get_meals/";
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
            "<img src='" + value.main_image + "' data-id='" + value.id + "' class='thumbnail'>" +
            "<section class='listItemDetails'>" +
            "<h4 class='pullLeft menuItemName'>" + value.name + "</h4>" +
            "</section><section class='listItemDetails'>" +
            "<h3 class='pullLeft itemCost'>" + dollarConvert(value.price + value.tax) + "</h3>" +
            "<span class='menuItemDetails caption'>" + value.sub + "</span>" +
            "<span><a class='btn btn-small-primary medium-green addItemButton' " +
            "data-id='" + value.id + "'>ADD</a></span>" +
            "</section></div>");
        if (value.available && !value.in_cart) {} else {
            $(".addItemButton:last").addClass("button-disabled");
        }
    });
    if (endOfList) {} else {
        infiniteScrolling();
    }
}

function elementScrolling(elem) {
    var docViewTop = $(window).scrollTop();
    var docViewBottom = docViewTop + $(window).height();

    var elemTop = $(elem).offset().top;
    var elemBottom = elemTop + $(elem).height();

    return ((elemBottom <= docViewBottom) && (elemTop >= docViewTop));
}

//add to cart call back
var addToCartCallback = {
    success: function(data, textStatus, mealId) {
        var meal_details = JSON.parse(data),
            status = meal_details.status;
        if (status == -1) {
            showPopup(meal_details);
        } else {
            $('*[data-id="' + mealId + '"]').addClass("button-disabled");
            showPopup(meal_details);
            if (meal_details.session_key && (meal_details.session_key).length) {
                localStorage['session_key'] = meal_details.session_key;
            }
            CartItemCount();
        }
    },
    failure: function(XMLHttpRequest, textStatus, errorThrown) {}
}

function addToCart(meal_id) {
    var url = baseURL + 'add_to_cart/',
        header = {
            "session-key": localStorage["session_key"]
        },
        params = {
            "meal_id": meal_id,
        };
    data = JSON.stringify(params);
    var addToCartInstance = new AjaxHttpSender();
    addToCartInstance.sendPost(url, header, data, addToCartCallback, meal_id);
}
