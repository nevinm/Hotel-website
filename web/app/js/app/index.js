//Prototype pattern
var bootstrap = null;
var Bootstrap = function () {
};
Bootstrap.prototype = {
    checkPromocode: function (promoCode) {
        var url = baseURL + "verify_promocode/",
                userData = {
                    "promocode": promoCode
                },
        header = {
        };
        var data = JSON.stringify(userData);
        new AjaxHttpSender().sendPost(url, header, data, this.checkPromocodeCallback, promoCode);
    },
    checkPromocodeCallback: {
        success: function (data, textStatus, promoCode) {
            var promoCodeDetails = JSON.parse(data);
            if (promoCodeDetails.status == 1) {
                window.open(homeUrl + "/share/" + promoCode + "/", "_self");
            } else {
                showPopup(promoCodeDetails);
            }
        },
        failure: function (XMLHttpRequest, textStatus, errorThrown) {
        }
    },
    shouldFullpageRender: function () {
        if ($("#section-what-is .fp-tableCell").innerHeight() > window.innerHeight) {
        } else {
            this.fullPageRender();
        }
        // if ($(window).width() > ipadWidth) {
        //     var marginLeft = $(".contentArea").offset().left - 10;
        //     $("#section-what-is .outer-slide-description").css("margin-left", marginLeft + "px");
        // } else {
        //     $("#section-what-is .outer-slide-description").css("margin-left", "");
        // }
    },
    fullPageRender: function () {
        var headerHeight = $("#header").innerHeight(),
                screenHeight = (window.innerHeight - headerHeight),
                section1Height = $("#section-what-is").innerHeight(),
                section2HeadingHeight = $("#section-what-is-meisterdish .slider-header-containter").innerHeight(),
                section2Padding = parseInt($("#section-what-is-meisterdish").css('padding-top').split("px")[0]),
                footerHeight = $("#slider-footer").innerHeight(),
                reqOffset = screenHeight - section1Height - section2HeadingHeight;
        $("#section-what-is").css({
            "height": parseInt( window.innerHeight * 0.8)+"px" /*section1Height + reqOffset - section2Padding*/
        });
        console.log(parseInt(0.8*window.innerHeight) + " " + window.innerHeight);
        $("#section-zipcode").css({
            "height": screenHeight - footerHeight
        });
        $("#sectionPromocode").height($("#section-zipcode").height() + 10);

    },
    addToCart: function (meal_id, quantity) {
        var url = baseURL + 'add_to_cart/',
                header = {
                    "session-key": localStorage["session_key"]
                },
        params = {
            "meal_id": meal_id,
            "quantity": quantity
        };
        var data = JSON.stringify(params);
        var addToCartInstance = new AjaxHttpSender();
        addToCartInstance.sendPost(url, header, data, this.addToCartCallback, meal_id);
    },
    //add to cart call back
    addToCartCallback: {
        success: function (data, textStatus, mealId) {
            var meal_details = JSON.parse(data),
                    status = meal_details.status;
            if (status == -1) {
                showPopup(meal_details);
            } else {
                bootstrap.populateOverlayDetails(meal_details);
                CartItemCount();

            }
        },
        failure: function (XMLHttpRequest, textStatus, errorThrown) {
        }
    },
    getMainMealId: function () {
        var url = baseURL + "get_home_meal/",
                header = {
                    "session-key": localStorage["session_key"]
                },
        userData = {};
        var data = JSON.stringify(userData);
        var getMainMealIdInstance = new AjaxHttpSender();
        getMainMealIdInstance.sendPost(url, header, data, this.getMainMealIdCallback);
    },
//Get home page meal details.
    getMainMealIdCallback: {
        success: function (data, textStatus) {
            var mealIdDetails = JSON.parse(data);
            if (mealIdDetails.status == 1) {
                bootstrap.getHomePageMeal(mealIdDetails.meal_id);
            } else {
                showPopup(mealIdDetails);
            }
        },
        failure: function (XMLHttpRequest, textStatus, errorThrown) {
        }
    },
    getHomePageMeal: function (mealId) {
        // var url = baseURL + "get_meal_details/" + mealId + "/",
        var url = baseURL + "get_meal_details/0/",
                header = {
                    "session-key": localStorage["session_key"]
                },
        userData = {};
        var data = JSON.stringify(userData);
        var getHomePageMealInstance = new AjaxHttpSender();
        getHomePageMealInstance.sendPost(url, header, data, this.getHomePageMealCallback);
    },
    //Get home page meal details.
    getHomePageMealCallback: {
        success: function (data, textStatus) {
            var mealDetails = JSON.parse(data);
            if (mealDetails.status == 1) {
                bootstrap.populateHomePageMeal(mealDetails);
            } else {
            }
        },
        failure: function (XMLHttpRequest, textStatus, errorThrown) {
        }
    },
    populateHomePageMeal: function (mealDetails) {
        var $sectionWhatToExpect = $("#section-what-to-expect");
        $sectionWhatToExpect.find(".meal-name p").text(mealDetails.name);
        $sectionWhatToExpect.find(".meal-image img").attr("src", mealDetails.main_image.url);
        $sectionWhatToExpect.find(".meal-sub-description p").text(mealDetails.sub);
        $sectionWhatToExpect.find(".meal-properties .preparation-time").text(mealDetails.preparation_time);
        $sectionWhatToExpect.find(".meal-properties .calories").text(mealDetails.calories);
        $.each(mealDetails.ingredients, function (key, value) {
            $sectionWhatToExpect.find(".ingredients-wrapper").append("<div class='details-content'>" + "<p class='upper-content'>" + "<img src='" + value.image_url + "'></p>" + "<p class='lower-content'>" + value.name + "</p>" + "</div>");
        });

        if (mealDetails.meal_types.length) {
            $.each(mealDetails.meal_types, function (key, value) {
                var html = '<div class="details-content"><p class="upper-content">' +
                        '<img class="meal-type-description-icon meal-type-icon" src="' + value.image_url + '"></p>' +
                        '<p class="lower-content meal-type">' + value.meal_type_name + '</p></div>';
                $(".meal-properties-section").append(html);
            });
        }
        else {
            $sectionWhatToExpect.find(".meal-properties .meal-type-icon").css("display", "none");
        }
        $("#meal-info").attr("data-id", mealDetails.id);
        $("#meal-add").attr("data-id", mealDetails.id);
        $(".removeItemButton").attr("data-id", mealDetails.id);
        $(".meal-overlay").attr("data-id", mealDetails.id);
        $(".sold-overlay").attr("data-id", mealDetails.id);
        $(".meal-overlay .upper-line span").text(mealDetails.quantity);
        $("#hidden-count").val(mealDetails.quantity);
        if (mealDetails.quantity < 2) {
            $(".meal-overlay").hide();
            $('.removeItemButton').hide();
//        $("#meal-add").removeClass("width-adjust");
        } else {
            $(".meal-overlay").show();
            $('.removeItemButton').css("display", "inline-block");
//        $("#meal-add").addClass("width-adjust");
        }
        if (mealDetails.quantity >= 10) {
            $("#meal-add").addClass("button-disabled");
        } else {
            $("#meal-add").removeClass("button-disabled");
        }
        if (mealDetails.sold_out == 0) {
            $(".sold-overlay").hide();
        } else {
            $(".meal-overlay").hide();
            $(".removeItemButton").hide();
            $(".sold-overlay").show();
            $("#meal-add").addClass("button-disabled");
        }
    },
    updateHeight: function () {
        var currentHeight = window.innerHeight,
                updatedHeight = 0.70 * currentHeight,
                updatedMargintop = -(0.15 * currentHeight);
        $("#section-what-is").css({
            "height": updatedHeight
        });
        $("#section-what-is .fp-slide").css({
            "height": updatedHeight
        });
        $("#section-what-is .fp-tableCell").css({
            "height": updatedHeight
        });
    },
    correctMarginTop: function () {
        var currentHeight = window.innerHeight,
                updatedMargintop = -(0.15 * currentHeight);
        console.log(window.innerWidth);
        if (window.innerHeight > 700) {
            console.log("Margin corrected");
            $("#section-what-is-meisterdish").css({
                "margin-top": updatedMargintop
            });
        } else {
            $("#section-what-is-meisterdish").css({
                "margin-top": 0
            });
        }
    },
    isSessionExpired: function () {
        if (localStorage.getItem("session-expired") === null) {
        } else {
            var data = {};
            data.message = "Your session has expired, please login.";
            showPopup(data);
            localStorage.removeItem('session-expired');
        }
    },
    locationCheck: function (zipcode) {
        var url = baseURL + "check_delivery/",
                header = {
                    "session-key": localStorage["session_key"]
                },
        userData = {
            'zip': zipcode
        };
        var data = JSON.stringify(userData);
        var locationCheckInstance = new AjaxHttpSender();
        locationCheckInstance.sendPost(url, header, data, this.locationCheckCallback);
    },
//Get reviews API process
    locationCheckCallback: {
        success: function (data, textStatus) {
            var userDetails = JSON.parse(data);
            if (userDetails.status == 1) {
                $('#close').remove();
                $('#see-menu').remove();
                $('.popup .header').append('<img src="images/cross-black.png" id="close">');
                $('.popup .button').append("<a href='views/menu.html' class='btn btn-large-secondary' id='see-menu'>" + "SEE MENU" + "</a>");
                showPopup(userDetails);
            } else {
                bootstrap.showLocationCheckPopup(userDetails);
            }
        },
        failure: function (XMLHttpRequest, textStatus, errorThrown) {
        }
    },
    showLocationCheckPopup: function (userDetails) {
        var message = userDetails.message;
        $('.delivery-area-check-popup .deliver-message span').text(message);
        $('.delivery-area-check-popup').show();
        $('form#validate-email').validate().resetForm();
    },
    saveEmail: function (email, zipcode) {
        var url = baseURL + "save_email/",
                header = {
                    "session-key": localStorage["session_key"]
                },
        userData = {
            'email': email,
            'zipcode': zipcode
        };
        var data = JSON.stringify(userData);
        var saveEmailInstance = new AjaxHttpSender();
        saveEmailInstance.sendPost(url, header, data, this.saveEmailCallback);
    },
    saveEmailCallback: {
        success: function (data, textStatus) {
            var userDetails = JSON.parse(data);
            $('.delivery-area-check-popup').hide();
            showPopup(userDetails);
        },
        failure: function (XMLHttpRequest, textStatus, errorThrown) {
        }
    },
    populateOverlayDetails: function (mealDetails) {
        $(".meal-overlay .upper-line span").text(mealDetails.quantity);
        if (mealDetails.quantity == 0) {
            $(".removeItemButton").hide();
            $(".meal-overlay").hide();
//        $("#meal-add").removeClass("width-adjust");
        } else {
            $(".removeItemButton").fadeIn();
            $('.removeItemButton').css("display", "inline-block");
//        $("#meal-add").addClass("width-adjust");
            $(".meal-overlay").show();
        }
        if (mealDetails.quantity >= 10) {
//    if (mealDetails.quantity >= 10 || mealDetails.quantity >= mealDetails.available) {
            $("#meal-add").addClass("button-disabled");
        } else {
            $("#meal-add").removeClass("button-disabled");
        }
        if (mealDetails.session_key && (mealDetails.session_key).length) {
            localStorage['session_key'] = mealDetails.session_key;
            createCookie("SessionExpireTime", "true", sessionExpiryTime);
        }
    }
};
$(document).ready(function () {
    bootstrap = new Bootstrap();
    window.onunload = function () {
    };
    window.onbeforeunload = function (e) {
        if (cartCount === 0 && cartCount < parseInt($("#hidden-count").val())) {
            SessionController.fbTrackConversionEvent(SessionController.getAddToCartPixel(), '0.00', 'USD');
        }
    };
    ipadWidth = 767;
    CartItemCount(setCartCount);
    bootstrap.getMainMealId();
    // getHomePageMeal();
    // bootstrap.shouldFullpageRender();
    if (localStorage['loggedIn'] == 'true') {
        $("#sectionPromocode").hide();
    }
    $(".check-delivery").on('click', function (e) {
        e.preventDefault();
        var zipcode = $("#zip-code").val();
        if ($("form.zip-code-container").valid()) {
            bootstrap.locationCheck(zipcode);
        }
    });
    $("#promoCheck").on("click", function (e) {
        e.preventDefault();
        if ($("form.promo-code-container").valid()) {
            bootstrap.checkPromocode($("#promoCode").val());
//        window.open(homeUrl + "/share/" + PROMO_CODE + "/", "_self");
        }
    });
    $("body").on("load", bootstrap.isSessionExpired);
    $('#submit-email').on("click", function (e) {
        e.preventDefault();
        var email = $('input[type=email]').val(),
                zipcode = $('#zip-code').val();
        if ($('form#validate-email').valid()) {
            bootstrap.saveEmail(email, zipcode);
        }
    });
    $('.delivery-area-check-popup img#cancel').on("click", function () {
        $('.delivery-area-check-popup').fadeOut();
    });
    $("#meal-info").on("click", function () {
        mealId = $(this).attr('data-id');
        window.location.href = 'views/meal-details.html?mealId=' + mealId;
    });
    $("#meal-add").on("click", function () {
        var mealId = $(this).attr('data-id'),
                count = 0;
        count = parseInt($("#hidden-count").val()) + 2;
//        cartCount = parseInt($("#hidden-count").val());
        if (count <= 10) {
            $("#hidden-count").val(count);
            bootstrap.addToCart(mealId);
        }
    });
    $(".removeItemButton").on("click", function () {
        var quantity = -2,
                count = 0,
                mealId = $(this).attr('data-id');
        count = parseInt($("#hidden-count").val()) - 2;
        if (count >= 0) {
            $("#hidden-count").val(count);
            bootstrap.addToCart(mealId, quantity);
        } else {
        }
    });
    // $(window).resize(function () {
    //     bootstrap.shouldFullpageRender();
    // });
});
