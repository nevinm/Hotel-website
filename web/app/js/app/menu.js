var MenuController = function () {
};
MenuController.prototype = function () {
    //Infinite Scrolling
    var infiniteScrolling = function () {
        console.log("infiniteScrolling")
        var stickyMenuOffset = $('.subMenu').offset().top;
        $(document).unbind('scroll');
        $(document).on('scroll', function (e) {
            if ($('.listItems').length && endOfList == false) {
                if (elementScrolling(".listItems:last")) {
                    $(document).unbind('scroll');
                    mealData = JSON.parse(localStorage['meal_details']);
                    getmealList(mealData.search, mealData.category_id, mealData.type_ids, mealData.perPage, mealData.nextPage + 1, true)
                }
                ;
            }
        });
    };
    //Get Category list of food items.
    var getCategoryCallback = {
        success: function (data, textStatus) {
            userDetails = JSON.parse(data);
            if (userDetails.status == 1) {
                $.each(userDetails.categories, function (key, value) {
                    $('.category-wrapper .category-menu').append("<li class='menu-categories-list'><a '" + " class='menu-categories' data-id='" + value.id + "'>" + value.name + "</a></li>");
                });
                $.each(userDetails.meal_types, function (key, value) {
                    $(".filter-drop-down ul").append("<li><div><input id='mealtype" + key + "' type='checkbox' " + "name='mealtype" + key + "' value='" + value.id + "'>" + "<label for='mealtype" + key + "'>" + value.name + "</label></div></li>");
                });
            } else {
                console.log("somthing wrong with categories");
            }
        },
        failure: function (XMLHttpRequest, textStatus, errorThrown) {
        }
    };

    var getCategory = function () {
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
    };
    //Get meal list
    var getmealListCallback = {
        success: function (data, textStatus, isInfinteScrolling) {
            var mealList = JSON.parse(data);
            if (mealList.status == 1) {
                endOfList = (mealList.current_page == mealList.page_range[mealList.page_range.length - 1]);
                if (endOfList == true) {
                    // $(document).unbind('scroll');
                } else {
                }
                populateMealList(mealList, isInfinteScrolling);
            } else {
                console.log("Something wrong with meals list");
            }
            $(".menu-loading-gif").hide();
        },
        failure: function (XMLHttpRequest, textStatus, errorThrown) {
        }
    };

    var getmealList = function (search_name, category, mealtype, perPage, nextPage, isInfinteScrolling) {
        if (isInfinteScrolling) {
            $(".menu-loading-gif").show();
        }
        var url = baseURL + "get_meals/";
        header = {
            "session-key": localStorage['session_key']
        }
        params = {
            // "search": search_name,
            // "category_id": category,
            // "type_ids": mealtype,
            // "perPage": perPage,
            // "nextPage": nextPage
        }
        data = JSON.stringify(params);
        localStorage['meal_details'] = data;
        var getmeallistInstance = new AjaxHttpSender();
        getmeallistInstance.sendPost(url, header, data, getmealListCallback, isInfinteScrolling);
    };

    var populateMealList = function (mealList, isInfinteScrolling) {
        if (!isInfinteScrolling) {
            $(".listContainer").empty();
        } else {
        }
        $.each(mealList.aaData, function (key, value) {
            if (value.available) {
                $(".listContainer").append("<div class='listItems'>" + "<div class='meal-image-wrapper'>" +
                        "<img src='" + value.main_image + "' data-id='" + value.id + "' class='thumbnail'>" +
                        "<div class='meal-overlay' data-id='" + value.id + "'>" + "<p class='upper-line'>" +
                        "<span>" + value.quantity + "</span>" + " " + "SERVINGS" + "</p>" +
                        "<p class='lower-line'>" + "Added to cart" + "</p>" + "</div>" +
                        " <div class='sold-overlay'  data-id='" + value.id + "'>" + "<p class='upper-line' style='top:44%;'>SOLD OUT</p>" + "</div>" + "</div>" +
                        "<section class='listItemDetails'>" + "<h4 class='pullLeft menuItemName'>" + value.name + "</h4>" +
                        "<div class='menuItemDetails'>" + value.sub + "</div>" +
                        "<hr class='mealList-hr'>" + "</section><section class='listItemDetails tableDisplay'>" +
                        "<input type='hidden' class='hidden-field' value='" + value.quantity + "'>" +
                        "<h3 class='pullLeft itemCost'>" + dollarConvert(parseFloat(value.tax + value.price).toFixed(2)) + "</h3>" +
                        "<div class='serveBox'><span class='per-serving-text'>" + "PER SERVING" + "</span>" +
                        "<span class='per-serving-box'>" + "(2x SERVINGS PER BOX)" + "</span></div>" +
                        "<div class='removeItemButton' data-id='" + value.id + "'>" + "&#8211" + "</div>" +
                        "<span id='addMenuButton'><a class='btn btn-small-primary medium-green addItemButton' " + "data-id='" + value.id + "'>ADD</a></span>" + "</section></div>");
            }
            if (value.quantity < 2) {
                $('.removeItemButton[data-id="' + value.id + '"]').hide();
                $('.meal-overlay[data-id="' + value.id + '"]').hide();
            } else {
                $('.removeItemButton[data-id="' + value.id + '"]').show();
                $('.meal-overlay[data-id="' + value.id + '"]').show();
            }
            if (value.quantity >= 10) {
                $('.addItemButton[data-id="' + value.id + '"]').hide();
            } else {
                $('.addItemButton[data-id="' + value.id + '"]').show();
            }
            //Sold Out
            if (value.sold_out == 0) {
                $(".sold-overlay:last").hide();
            } else {
                $(".meal-overlay:last").hide();
                $(".sold-overlay:last").show();
                $(".removeItemButton:last").hide();
                $(".addItemButton:last").addClass("button-disabled");
            }
        });
        if (endOfList) {
        } else {
            //Removed for showing all data initially
            // infiniteScrolling();
        }
    };

    var elementScrolling = function (elem) {
        var docViewTop = $(window).scrollTop();
        var docViewBottom = docViewTop + $(window).height();
        var elemTop = $(elem).offset().top;
        var elemBottom = elemTop + $(elem).height();
        return ((elemBottom <= docViewBottom) && (elemTop >= docViewTop));
    };
    //add to cart call back
    var addToCartCallback = {
        success: function (data, textStatus, mealId) {
            var meal_details = JSON.parse(data),
                    status = meal_details.status;
            if (status == -1) {
                showPopup(meal_details);
            } else {
                var $removeButton = $('a[data-id="' + mealId + '"]').closest('.listItems').find('.removeItemButton'),
                        $addButton = $('a[data-id="' + mealId + '"]').closest('.listItems').find('.addItemButton'),
                        $showOverlay = $('.meal-overlay[data-id="' + mealId + '"]');
                $showOverlay.find('.upper-line span').text(meal_details.quantity);
                if (meal_details.quantity == 0) {
                    $removeButton.hide();
                    $showOverlay.hide();
                } else {
                    $removeButton.fadeIn();
                    $showOverlay.show();
                }
                if (meal_details.quantity >= 10) {
                    $addButton.hide();
                    $showOverlay.find('.upper-line span').text(10);
                } else {
                    $addButton.show();
                }
                if (meal_details.session_key && (meal_details.session_key).length) {
                    localStorage['session_key'] = meal_details.session_key;
                    createCookie("SessionExpireTime", "true", sessionExpiryTime);
                }
                CartItemCount();
            }
        },
        failure: function (XMLHttpRequest, textStatus, errorThrown) {
        }
    };

    var addToCart = function (meal_id, quantity) {
        var url = baseURL + 'add_to_cart/',
                header = {
                    "session-key": localStorage["session_key"]
                },
        params = {
            "meal_id": meal_id,
            "quantity": quantity
        };
        data = JSON.stringify(params);
        var addToCartInstance = new AjaxHttpSender();
        addToCartInstance.sendPost(url, header, data, addToCartCallback, meal_id);
    };
    return{
        addToCart: addToCart,
        getmealList: getmealList,
        infiniteScrolling: infiniteScrolling,
        getCategory: getCategory
    };
}();


$(document).ready(function () {
    var menuInstance = new MenuController();
    window.onbeforeunload = function (e) {
//    setTimeout(function () {
        if (cartCount === 0 && cartCount < parseInt($(".count").text())) {
            SessionController.fbTrackConversionEvent(SessionController.getAddToCartPixel(), '0.00', 'USD');
        }
//    }, 1000);
    };
    $("#page-container").css("min-height", ($(window).height() - 200) + "px")
    var perPage = 6,
            nextPage = 1,
            mealTypeFilter = [],
            endOfList = false,
            ipadWidth = 767;
    if (localStorage['loggedIn'] == 'true' && localStorage['signupMessage']) {
        //In case of new signup
        $('.menu-offer').children().hide();
        $('.menu-offer').css("background-color", "#3D4C4C");
        var signupMessage = $('<span>' + localStorage['signupMessage'] + '</span>');
        $('.menu-offer').append(signupMessage);
        $('.menu-offer').show();
        localStorage.removeItem('signupMessage');
    } else if (localStorage['loggedIn'] == 'true') {
        $('.menu-offer').show();
    } else {
        $('.menu-offer').hide();
        $("#header").css("margin-top", "0px");
        if ($(window).width() <= 767 && $(window).width() >= 320) {
            $("#page-container").css("margin-top", "75px");
        } else {
            $("#page-container").css("margin-top", "100px");
        }
    }
    $(document).on("click", '.subMenu .menu-categories-list', function () {
        $(document).find(".subMenu ul li").removeClass("activeOption");
        $(this).addClass("activeOption");
        if (window.innerWidth < ipadWidth) {
            $(".category-menu").slideToggle();
        }
    });
    //Add to cart
    $(document).on("click", '.addItemButton', function (e) {
        e.preventDefault();
        // var listItems = $(this).closest('.listItems');
        // listItems.find('.removeItemButton').fadeIn();
        var x = {},
                count = 0,
                meal_id = $(this).attr('data-id');
        count = parseInt($(this).closest('.listItemDetails').find('.hidden-field').val()) + 2;
        if (count <= 10) {
            $(this).closest('.listItemDetails').find('.hidden-field').val(count);
            if (localStorage['loggedIn'] == 'true') {
                menuInstance.addToCart(meal_id);
            } else if (localStorage['loggedIn'] == 'false' || localStorage.getItem('loggedIn') === null) {
                menuInstance.addToCart(meal_id);
            }
        } else {
            // $(this).hide();
        }
    });
    $(document).on("click", '.removeItemButton', function (e) {
        var quantity = -2,
                count = 0,
                mealId = $(this).attr('data-id');
        count = parseInt($(this).closest('.listItemDetails').find('.hidden-field').val()) - 2;
        if (count >= 0) {
            $(this).closest('.listItemDetails').find('.hidden-field').val(count);
            menuInstance.addToCart(mealId, quantity);
        } else {
            // removeCartItems(mealId);
        }
    });
    $(document).on("click", '.thumbnail,.meal-overlay,.sold-overlay', function () {
        mealId = this.dataset.id;
        window.location.href = 'meal-details.html?mealId=' + mealId;
    });
    //Categories
    $(document).on('click', '.menu-categories-list', function () {
        nextPage = 1;
        categoryId = $(this).find("a").data().id;
        menuInstance.getmealList('', categoryId, mealTypeFilter, perPage, 1);
        menuInstance.infiniteScrolling();
    });
    //Mobile category header
    $(".category-header").on('click', function () {
        $(".category-menu").slideToggle();
    });
    //Filter toggle
    $(".filter-container").on('click', function (e) {
        filterContainer = document.getElementsByClassName("filter-container")[0];
        filterCenter = document.getElementsByClassName("filter-center")[0];
        filterMenuLabel = document.getElementsByClassName("filter-menu-label")[0];
        arrowDown = document.getElementsByClassName("arrow-down")[1];
        subMenuFilter = document.getElementsByClassName("subMenuFilter")[0];
        if ((e.target == filterContainer) || (e.target == filterCenter) || (e.target == filterMenuLabel) || (e.target == arrowDown) || (e.target == subMenuFilter)) {
            $(".filter-drop-down").slideToggle();
        } else {
            return;
        }
    });
    //Filters
    $(document).on('change', '.filter-drop-down input[type=checkbox]', function (e) {
        currentCategory = $(".activeOption a").attr("data-id");
        nextPage = 1;
        if ($(this).is(":checked")) {
            mealTypeFilter.push(parseInt($(this).val()));
            menuInstance.getmealList('', currentCategory, mealTypeFilter, perPage, 1);
        } else {
            index = mealTypeFilter.indexOf(parseInt($(this).val()));
            if (index > -1) {
                mealTypeFilter.splice(index, 1);
            }
            menuInstance.getmealList('', currentCategory, mealTypeFilter, perPage, 1);
        }
        menuInstance.infiniteScrolling();
    });
    $(window).on('scroll', function (e) {
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
    $('#share-now').on('click', function () {
        window.location.href = "share-page.html";
    });

    CartItemCount(setCartCount);
    menuInstance.getCategory();
    menuInstance.getmealList('', '', '', '', '');
    //Removed for showing all data initially
    // infiniteScrolling();
});
