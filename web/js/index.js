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

    //popup re-direction on enter
    $(document).on('keypress', function(e) {
        var key = e.which;
        if (key == 13) // the enter key code
        {
            if ($('.popup-container').is(':visible')) {
                if ($("#see-menu").is(":visible")) {
                    $('#see-menu')[0].click();
                }
            }
        }
    });

    $("#meal-info").on("click", function() {
        mealId = $(this).data().mealId;
        window.location.href = 'meal-details.html?mealId=' + mealId;
    });

    $("#meal-add").on("click", function() {
        mealId = $(this).data().mealId;
        window.location.href = 'meal-details.html?mealId=' + mealId;
    });
});

var mobileRendered;

//add to cart call back
var addToCartCallback = {
    success: function(data, textStatus, mealId) {
        var meal_details = JSON.parse(data),
            status = meal_details.status;
        showPopup(meal_details);
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
    $sectionWhatToExpect.find(".meal-properties .meal-type-icon").attr("src", mealDetails.meal_types[0].image_url);
    $("#meal-info").data("meal-id", mealDetails.id);
    $("#meal-add").data("meal-id", mealDetails.id);
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
        // slidesNavigation: true,
        // controlArrows: false,
        paddingTop: '70px',
        keyboardScrolling: false,
        navigation: true,
        afterResize: function() {
            destroyFullPageJS();
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
        },
        afterRender: function() {
            $("#slide2").remove();
            $("#slide4").remove();
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
        if (userDetails.status == 1) {
            $('.delivery-area-check-popup').hide();
            showPopup(userDetails);
        }
        if (userDetails.status == -1) {
            showPopup(userDetails);
        }
        if (userDetails.status == -2) {
            $('.delivery-area-check-popup').hide();
            showPopup(userDetails);
        }
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
