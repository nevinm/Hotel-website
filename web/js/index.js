$(document).ready(function() {
    ipadWidth = 767;
    isMobileRendered();
    destroyFullPageJS();
    CartItemCount();
    getHomePageMeal();

    $(".check-delivery").on('click', function(e) {
        e.preventDefault();
        var zipcode = $("#zip-code").val();
        if ($("form.zip-code-container").valid()) {
            locationCheck(zipcode);
        }
    });

    $("body").on("load", isSessionExpired);

    $('#submit-email').on("click", function(e) {
        e.preventDefault();
        var email = $('input[type=email]').val(),
            zipcode = $('#zip-code').val();
        if ($('form#validate-email').valid()) {
            saveEmail(email, zipcode);
        }
    });

    $('.delivery-area-check-popup img#cancel').on("click", function() {
        $('.delivery-area-check-popup').fadeOut();
    });

    // //popup re-direction on enter
    // $(document).on('keypress', function(e) {
    //     var key = e.which;
    //     if (key == 13) // the enter key code
    //     {
    //         if ($('.popup-container').is(':visible')) {
    //             if ($("#see-menu").is(":visible")) {
    //                 $('#see-menu')[0].click();
    //             }
    //         }
    //     }
    // });

    $("#meal-info").on("click", function() {
        mealId = $(this).attr('data-id');
        window.location.href = 'views/meal-details.html?mealId=' + mealId;
    });

    $("#meal-add").on("click", function() {
        var mealId = $(this).attr('data-id'),
            count = 0;
        count = parseInt($("#hidden-count").val()) + 2;
        if (count <= 10) {
            $("#hidden-count").val(count);
            addToCart(mealId);
        }
    });

    $(".removeItemButton").on("click", function() {
        var quantity = -2,
            count = 0,
            mealId = $(this).attr('data-id');
        count = parseInt($("#hidden-count").val()) - 2;
        if (count >= 0) {
            $("#hidden-count").val(count);
            addToCart(mealId, quantity);
        } else {}
    });
});

var mobileRendered;

//add to cart call back
var addToCartCallback = {
    success: function(data, textStatus, mealId) {
        var meal_details = JSON.parse(data),
            status = meal_details.status;
        if (status == -1) {
            showPopup(meal_details);
        } else {
            populateOverlayDetails(meal_details);
            CartItemCount();
        }

    },
    failure: function(XMLHttpRequest, textStatus, errorThrown) {}
}

function addToCart(meal_id, quantity) {
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
}

//Get home page meal details.
var getHomePageMealCallback = {
    success: function(data, textStatus) {
        var mealDetails = JSON.parse(data);
        if (mealDetails.status == 1) {
            populateHomePageMeal(mealDetails);
        } else {}
    },
    failure: function(XMLHttpRequest, textStatus, errorThrown) {}
}

function getHomePageMeal() {
    var url = baseURL + "get_meal_details/0/",
        header = {
            "session-key": localStorage["session_key"]
        },
        userData = {};
    data = JSON.stringify(userData);
    var getHomePageMealInstance = new AjaxHttpSender();
    getHomePageMealInstance.sendPost(url, header, data, getHomePageMealCallback);
}

function populateHomePageMeal(mealDetails) {

    var $sectionWhatToExpect = $("#section-what-to-expect");
    $sectionWhatToExpect.find(".meal-name p").text(mealDetails.name);
    $sectionWhatToExpect.find(".meal-image img").attr("src", mealDetails.main_image.url);
    $sectionWhatToExpect.find(".meal-sub-description p").text(mealDetails.sub);
    $sectionWhatToExpect.find(".meal-properties .preparation-time").text(mealDetails.preparation_time);
    $sectionWhatToExpect.find(".meal-properties .calories").text(mealDetails.calories);
    if (mealDetails.meal_types.length) {
        $sectionWhatToExpect.find(".meal-properties .meal-type-icon").attr("src", mealDetails.meal_types[0].image_url);
    } else {
        $sectionWhatToExpect.find(".meal-properties .meal-type-icon").attr("src", mealDetails.default_meal_type_image.image_url);
    }
    $("#meal-info").attr("data-id", mealDetails.id);
    $("#meal-add").attr("data-id", mealDetails.id);
    $(".removeItemButton").attr("data-id", mealDetails.id);
    $(".meal-overlay").attr("data-id", mealDetails.id);
    $(".meal-overlay .upper-line span").text(mealDetails.quantity);
    $("#hidden-count").val(mealDetails.quantity);
    if (mealDetails.quantity < 2) {
        $(".meal-overlay").hide();
        $('.removeItemButton').hide();
        $("#meal-add").removeClass("width-adjust");
    } else {
        $(".meal-overlay").show();
        $('.removeItemButton').show();
        $("#meal-add").addClass("width-adjust");
    }
    if (mealDetails.quantity >= 10) {
        $("#meal-add").addClass("button-disabled");
    } else {
        $("#meal-add").removeClass("button-disabled");
    }
}

function updateHeight() {
    var currentHeight = window.innerHeight,
        updatedHeight = 0.70 * currentHeight;
    $("#section-what-is").css({
        "height": updatedHeight
    });
    $("#section-what-is .fp-slide").css({
        "height": updatedHeight
    });
    $("#section-what-is .fp-tableCell").css({
        "height": updatedHeight
    });
}

function isSessionExpired() {
    if (localStorage.getItem("session-expired") === null) {} else {
        var data = {};
        data.message = "Your session has expired, please login.";
        showPopup(data);
        localStorage.removeItem('session-expired');
    }
}

function renderFullPageJS() {
    $('#fullpage').fullpage({
        scrollingSpeed: 1000,
        slidesNavigation: false,
        // controlArrows: false,
        navigation: false,
        autoScrolling: false,
        scrollBar: true,
        keyboardScrolling: false,
        fitToSection: false,
        navigation: true,
        afterResize: function() {
            destroyFullPageJS();
            updateHeight();
        },
        afterRender: function() {
            updateHeight();
        }
    });
    mobileRendered = false;
}

function renderMobileFullPageJs() {
    $('#fullpage').fullpage({
        scrollingSpeed: 1000,
        slidesNavigation: false,
        controlArrows: false,
        keyboardScrolling: false,
        navigation: false,
        paddingTop: '70px',
        autoScrolling: false,
        scrollBar: true,
        fitToSection: false,
        afterResize: function() {
            destroyFullPageJS();
            updateHeight();
        },
        afterRender: function() {
            $("#slide2").remove();
            $("#slide4").remove();
            updateHeight();
        }
    });
    mobileRendered = true;
}

function isMobileRendered() {
    if (window.innerWidth <= ipadWidth) {
        mobileRendered = false;
    } else {
        mobileRendered = true;
    }
}

function destroyFullPageJS() {
    if (window.innerWidth < ipadWidth && mobileRendered == false) {
        if ($.fn.fullpage.destroy) {
            $.fn.fullpage.destroy('all');
        } else {}
        renderMobileFullPageJs();
    } else if (window.innerWidth >= ipadWidth && mobileRendered == true) {
        if ($.fn.fullpage.destroy) {
            $.fn.fullpage.destroy('all');
        } else {}
        renderFullPageJS();
    }
}

//Get reviews API process
var locationCheckCallback = {
    success: function(data, textStatus) {
        var userDetails = JSON.parse(data);
        if (userDetails.status == 1) {
            $('#close').remove();
            $('#see-menu').remove();
            $('.popup .header').append('<img src="images/cross_black.png" id="close">');
            $('.popup .button').append("<a href='views/menu.html' class='btn btn-large-secondary' id='see-menu'>" + "SEE MENU" + "</a>");
            showPopup(userDetails);
        } else {
            showLocationCheckPopup(userDetails);
        }
    },
    failure: function(XMLHttpRequest, textStatus, errorThrown) {}
}

function locationCheck(zipcode) {
    var url = baseURL + "check_delivery/",
        header = {
            "session-key": localStorage["session_key"]
        },
        userData = {
            'zip': zipcode
        };
    data = JSON.stringify(userData);
    var locationCheckInstance = new AjaxHttpSender();
    locationCheckInstance.sendPost(url, header, data, locationCheckCallback);
}

function showLocationCheckPopup(userDetails) {
    var message = userDetails.message;
    $('.delivery-area-check-popup .deliver-message span').text(message);
    $('.delivery-area-check-popup').show();
    $('form#validate-email').validate().resetForm();
}

var saveEmailCallback = {
    success: function(data, textStatus) {
        var userDetails = JSON.parse(data);
        $('.delivery-area-check-popup').hide();
        showPopup(userDetails);
    },
    failure: function(XMLHttpRequest, textStatus, errorThrown) {}
}

function saveEmail(email, zipcode) {
    var url = baseURL + "save_email/",
        header = {
            "session-key": localStorage["session_key"]
        },
        userData = {
            'email': email,
            'zipcode': zipcode
        };
    data = JSON.stringify(userData);
    var saveEmailInstance = new AjaxHttpSender();
    saveEmailInstance.sendPost(url, header, data, saveEmailCallback);
}

function populateOverlayDetails(mealDetails) {
    $(".meal-overlay .upper-line span").text(mealDetails.quantity);
    if (mealDetails.quantity == 0) {
        $(".removeItemButton").hide();
        $(".meal-overlay").hide();
        $("#meal-add").removeClass("width-adjust");
    } else {
        $(".removeItemButton").fadeIn();
        $("#meal-add").addClass("width-adjust");
        $(".meal-overlay").show();
    }
    if (mealDetails.quantity >= 10) {
        $("#meal-add").addClass("button-disabled");
    } else {
        $("#meal-add").removeClass("button-disabled");
    }
    if (mealDetails.session_key && (mealDetails.session_key).length) {
        localStorage['session_key'] = mealDetails.session_key;
        createCookie("SessionExpireTime", "true", sessionExpiryTime);
    }
}
