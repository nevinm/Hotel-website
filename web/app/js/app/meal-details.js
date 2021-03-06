var MealDetailsController = function () {
};
MealDetailsController.prototype = function () {
    var tabRendering = function () {
        var $tabs = $("#meal-tabs").tabs();

        $('.next-tab').click(function (e) {
            e.preventDefault();
            $tabs.tabs('option', 'hide', {
                effect: 'slide',
                direction: 'left',
                duration: 300
            });
            $tabs.tabs('option', 'show', {
                effect: 'slide',
                direction: 'right',
                duration: 300
            });
            var selected = $tabs.tabs('option', 'active');
            $tabs.tabs('option', 'active', (selected + 1));
        });

        $('.prev-tab').click(function (e) {
            e.preventDefault();
            $tabs.tabs('option', 'hide', {
                effect: 'slide',
                direction: 'right',
                duration: 300
            });
            $tabs.tabs('option', 'show', {
                effect: 'slide',
                direction: 'left',
                duration: 300
            });
            var selected = $tabs.tabs('option', 'active');
            $tabs.tabs('option', 'active', (selected - 1));
        });
    };

    //Add to cart call back
    var addToCartCallback = {
        success: function (data, textStatus, mealId) {
            var meal_details = JSON.parse(data),
                    status = meal_details.status;
            if (status == -1) {
                showPopup(meal_details);
            } else {
                addMultipleMeal(meal_details);
                CartItemCount(true);
                if (meal_details.session_key && (meal_details.session_key).length) {
                    localStorage['session_key'] = meal_details.session_key;
                }
            }
        },
        failure: function (XMLHttpRequest, textStatus, errorThrown) {
        }
    };

    var addToCart = function (mealId, quantity) {
        var url = baseURL + 'add_to_cart/',
                header = {
                    "session-key": localStorage["session_key"]
                },
        params = {
            "meal_id": mealId,
            "quantity": quantity
        };
        data = JSON.stringify(params);
        var addToCartInstance = new AjaxHttpSender();
        addToCartInstance.sendPost(url, header, data, addToCartCallback, mealId);
    };

    //Get Meals deatails.
    var getMealDetailsCallback = {
        success: function (data, textStatus) {
            mealDetails = JSON.parse(data);
            if (mealDetails.status == 1) {
                populateMealDetails(mealDetails);
                foodSettings(mealDetails);
            } else {
                console.log("somthing wrong with meals");
            }
        },
        failure: function (XMLHttpRequest, textStatus, errorThrown) {
        }
    };

    var getMealDetails = function (mealId) {
        var url = baseURL + 'get_meal_details/' + mealId + '/',
                header = {
                    "session-key": localStorage["session_key"]
                },
        userInfo = {},
                data = JSON.stringify(userInfo);

        var getMealDetailsInstance = new AjaxHttpSender();
        getMealDetailsInstance.sendPost(url, header, data, getMealDetailsCallback);
    };

    var populateMealDetails = function (mealDetails) {
        mealDetailsTab(mealDetails);
        mealPreparationTab(mealDetails);
        allYouNeedTab(mealDetails);
        ingredientsTab(mealDetails);
        tipsTricksTab(mealDetails);
        nutrientsTab(mealDetails);
        reviewsTab(mealDetails);
        $("#meal-tabs").tabs({
            activate: function (event, ui) {
                if ((ui.newTab.context.id) == "ui-id-7") {
                    if (!$('#reviews .container').find('.list-review').length > 0) {
                        $('.review-message').fadeIn();
                    } else {
                        $('.review-message').hide();
                    }
                }
            }
        });
    };

    var mealDetailsTab = function (mealDetails) {
        $(".add-meal").attr("data-id", mealDetails.id);
        $(".removeItemButton").attr("data-id", mealDetails.id);
        $('.hidden-field').val(mealDetails.quantity);
        $('.add-meal-message span').text(mealDetails.quantity);
        $('.meal-overlay .upper-line span').text(mealDetails.quantity)
        $(".meal-name").text(mealDetails.name);
        $(".price").text(dollarConvert((mealDetails.price + mealDetails.tax).toFixed(2)));
        $(".thumbnail").attr('src', mealDetails.main_image.url);
        $(".thumbnail").attr('data-id', mealDetails.main_image.id);
        $(".chef-img").attr("src", mealDetails.chef_image.url);
        $(".chef-img").attr("data-id", mealDetails.chef_image.id);
        $(".chef-comments").text(mealDetails.chef_comments);
        if (mealDetails.quantity >= 2) {
            $('.removeItemButton').show();
            $('.add-meal-message').addClass('visible').removeClass('invisible');
            $('.meal-overlay').show();
        }
        if (mealDetails.description) {
            $(".details-description span").text(mealDetails.description);
        }
        $(".chef-name").text("CHEF " + mealDetails.chef_name);
        $(".rating-count").text("(" + mealDetails.ratings_count + ")")
        $(".meal-ingredients").text(mealDetails.sub);
        if (mealDetails.sold_out == 0) {
            $(".sold-overlay").hide();
        }
        else {
            $(".meal-overlay").hide();
            $(".sold-overlay").show();
            $(".removeItemButton").hide();
            $('.add-meal').addClass("button-disabled");
        }
        $($("#meal-rating").find(".rating-star").get().reverse()).each(function (key, value) {
            if (Math.round(mealDetails.avg_rating) == (key + 1)) {
                $(this).trigger("click");
            }
            $("#meal-rating").find(".rating-star").each(function (key, value) {
                $(value).addClass("disable-star");
            });
        });
    };

    var mealPreparationTab = function (mealDetails) {
        $.each(mealDetails.user_to_do, function (key, value) {
            $(".user-to-do").append("<li>" + value + "</li>");
        });
        $.each(mealDetails.finished_preparation, function (key, value) {
            $(".finished-preparation").append("<li>" + value + "</li>");
        });

        $(".preparation-time").text("ALLOW " + mealDetails.preparation_time + " MINUTES");
        $(".saved-time").text(mealDetails.saved_time + " MINUTES SAVED");
    };

    var allYouNeedTab = function (mealDetails) {
        $.each(mealDetails.pre_requisites, function (key, value) {
            $(".pre-requisities").append("<li>" + value + "</li>");
        });
        $(".pre-requisities-image").attr("src", mealDetails.pre_requisites_image.url);
        $(".pre-requisities-image").attr("data-id", mealDetails.pre_requisites_image.id);
    };

    var ingredientsTab = function (mealDetails) {
        if (mealDetails.ingredients.length) {
            $.each(mealDetails.ingredients, function (key, value) {
                $(".ingredients").append("<li>" + value.name + "</li>");
                $("#ingredients").find(".image-container").append("<div class='details-content'>" +
//                    "<p class='upper-content'>" +
                        "<img class='ingredients-image' src='" + value.image_url + "'>" +
//                            "</p>" +
//                    "<p class='lower-content'>" + value.name + "</p>" +
                        "<span class='lower-content ingredients-text'>" + value.name + "</span>" +
                        "</div>");
            });
        }
        else {
            $(".ingredients").append("<div class='ingredients-message review-message'>No ingredients present.</div>");
        }
    };

    var tipsTricksTab = function (mealDetails) {
        $("#tips-and-tricks .video-container").remove();
        if (mealDetails.tips.length) {
            $(mealDetails.tips).each(function (key, value) {
                $("#tips-and-tricks").append("<div class='section'>" +
                        "<div class='container'>" +
                        "<span class='mob-view-header tips-header'>" + value.title + "</span>" +
                        "<div class='video-container' data-id='" + value.id + "'>" +
                        "</div><div class='list-container'>" +
                        "<span class='list-header tips-header'>" + value.title + "</span>" +
                        "<ul class='video-tips'></ul>" +
                        "</div></div></div>");
                if (imgValidation(value.video_url)) {
                    $("#tips-and-tricks .video-container[data-id = '" + value.id + "']").append("<img src = '" + value.video_url + "'>");
                }

                else if (ytVidId(value.video_url)) {
                    $("#tips-and-tricks .video-container[data-id = '" + value.id + "']").append("<iframe height='280' id='tips-video' type='application/x-shockwave-flash'src='https://youtube.com/embed/" +
                            convertToEmbedded(value.video_url) +
                            "' frameborder='0' allowfullscreen=''></iframe>");
                } else {
                }

                $(value.description).each(function (key, value) {
                    $(".video-tips:last").append("<li>" + value + "</li>");
                });
            });
        } else {
            $("#tips-and-tricks").append("<div class='section'><p>" +
                    "NO TIPS AND TRICKS ARE ADDED FOR THIS MEAL YET." + "</p></div>");
        }
    };

    var nutrientsTab = function (mealDetails) {
        if (mealDetails.nutrients.length) {
//        $.each(mealDetails.nutrients, function (key, value) {
//            $("#nutrient-table tbody").append("<tr><td>" + value.mainNutrient + "</td>" +
//                    "<td class='per-serving'>" + value.perServing + "</td>" +
//                    "<td>" + value.dailyValue + "</td>" +
//                    "</tr>");
//            if (value.subNutrients.length) {
//                $.each(value.subNutrients, function (key, value) {
//                    $("#nutrient-table tbody").append("<tr><td class='sub-nutrients'>" + value.nutrientsName + "</td>" +
//                            "<td class='per-serving'>" + value.servingValue + "</td>" +
//                            "<td>" + value.dailyValue + "</td>" +
//                            "</tr>");
//                });
//            }
//        });

            var element = "";
            $.each(mealDetails.nutrients, function (key, value) {
                element += "";
                var mainData = false;
                var subData = false;
                var subElement = "";
                var mainElement = "<tr><td>" + value.mainNutrient + "</td>" +
                        "<td class='per-serving'>" + value.perServing + "</td>" +
                        "<td>" + value.dailyValue + "</td>" +
                        "</tr>";

                if (value.subNutrients.length) {
                    $.each(value.subNutrients, function (subKey, subValue) {
                        if (subValue.servingValue.length > 0 || subValue.dailyValue.length > 0) {
                            subData = true;
                            subElement += "<tr><td class='sub-nutrients'>" + subValue.nutrientsName + "</td>" +
                                    "<td class='per-serving'>" + subValue.servingValue + "</td>" +
                                    "<td>" + subValue.dailyValue + "</td>" +
                                    "</tr>";
                        }
                    });
                }
                if (value.perServing.length > 0 || value.dailyValue.length > 0 || subData) {
                    element += mainElement;
                }
                if (subData) {
                    element += subElement;
                }
            });
            $("#nutrient-table tbody").html(element);
        } else {
            $("#nutrient-table tbody").append("<tr>" + "<td><div>" + "No nutrients present...." + "</div></td>" + "<td></td>" + "<td></td>" + "</tr>");
        }

    };

    var reviewsTab = function (mealDetails) {
        $.each(mealDetails.ratings, function (key, value) {
            $("#reviews .container").append("<div class='list-review'>" +
                    "<div class='list-header'>" + value.user_first_name + " " + value.user_last_name + "</div>" +
                    "<div class='rating'>" +
                    "<span><input type='radio' class='rating-input' id='rating-input-1-5' name='rating-input-1' data-id='5'>" +
                    "<label for='rating-input-1-5' class='rating-star'></label>" +
                    "<input type='radio' class='rating-input' id='rating-input-1-4' name='rating-input-1' data-id='4'>" +
                    "<label for='rating-input-1-4' class='rating-star'></label>" +
                    "<input type='radio' class='rating-input' id='rating-input-1-3' name='rating-input-1' data-id='3'>" +
                    "<label for='rating-input-1-3' class='rating-star'></label>" +
                    "<input type='radio' class='rating-input' id='rating-input-1-2' name='rating-input-1' data-id='2'>" +
                    "<label for='rating-input-1-2' class='rating-star'></label>" +
                    "<input type='radio' class='rating-input' id='rating-input-1-1' name='rating-input-1' data-id='1'>" +
                    "<label for='rating-input-1-1' class='rating-star'></label></span>" +
                    "<span class='review-date'>" + value.date.substring(0, 10) + "</span></div>" +
                    "<span class='description'>" + value.review + "</span></div>");

            var reviewsAll = $("#reviews .container").find(".list-review:last"),
                    starRating = $($(reviewsAll).find(".rating-star").get().reverse())[value.rating - 1];
            $(reviewsAll).find(".rating-star").each(function (key, value) {
                $(value).addClass("disable-star");
            });
            $(starRating).trigger("click");
        });
    };

    var addMultipleMeal = function (meal_details) {
        var $removeButton = $('.removeItemButton');
        $addButton = $('.add-meal');

        $('.add-meal-message').addClass('visible').removeClass('invisible');
        $('.add-meal-message span').text(meal_details.quantity);
        $('.meal-overlay .upper-line span').text(meal_details.quantity);
        if (meal_details.quantity >= 10) {
            $addButton.hide();
            $('.add-meal-message span').text(10);
            $('.meal-overlay .upper-line span').text(10);

        } else {
            $addButton.show();
        }
        if (meal_details.quantity == 0) {
            $removeButton.hide();
            $('.meal-overlay').hide();
            $('.add-meal-message').addClass('invisible').removeClass('visible');
        } else {
            $removeButton.fadeIn();
            $('.meal-overlay').show();
            $('.add-meal-message').addClass('visible').removeClass('invisible');
        }
    };

    var foodSettings = function (meal_details) {
        var preparation_time = meal_details.preparation_time,
                calories = meal_details.calories;
        $('#saved-time').text(preparation_time);
        $('#calories').text(calories);
        var mealTypeObject = meal_details.meal_types;
        $.each(mealTypeObject, function (key, value) {
            $('.icons-container2').append("<div class='details-content'>" +
                    "<span class='upper-content'>" + "<img class='meal-type-icon' src='" + value.image_url + "'>" + "</span>" +
                    "<span class='lower-content'>" + value.meal_type_name + "</span>" + "</div>");
        });
        $('.meal-full-details,.meal-details-hr').fadeIn();
    };


    var imgValidation = function (img_url) {
        var result = (/\.(jpeg|jpg|gif|png)$/).test(img_url);
        return result;
    };

    var ytVidId = function (url) {
        var p = /^(?:https?:\/\/)?(?:www\.)?(?:youtu\.be\/|youtube\.com\/(?:embed\/|v\/|watch\?v=|watch\?.+&v=))((\w|-){11})(?:\S+)?$/;
        return (url.match(p)) ? true : false;
    };
    return {
        getMealDetails: getMealDetails,
        addToCart: addToCart,
        tabRendering: tabRendering
    };
}();
$(document).ready(function () {
    var mealDetailsInstance = new MealDetailsController();
    CartItemCount(setCartCount);
    window.onbeforeunload = function (e) {
        if (cartCount === 0 && cartCount < parseInt($('.hidden-field').val())) {
            SessionController.fbTrackConversionEvent(SessionController.getAddToCartPixel(), '0.00', 'USD');
        }
    };
    var mealId = getParameterFromUrl("mealId");
    mealDetailsInstance.getMealDetails(mealId);

    $(".add-meal").on('click', function () {
        var mealId = $(this).attr("data-id"),
                count = 0;
//        cartCount = parseInt($('.hidden-field').val());
        count = parseInt($('.hidden-field').val()) + 2;
        if (count <= 10) {
            $('.hidden-field').val(count);
            mealDetailsInstance.addToCart(mealId);
        }
    });

    $(".removeItemButton").on("click", function () {
        var mealId = $(this).attr('data-id'),
                count = 0, quantity = -2;
        count = parseInt($('.hidden-field').val()) - 2;
        if (count >= 0) {
            $('.hidden-field').val(count);
            mealDetailsInstance.addToCart(mealId, quantity);
        }
    });
    mealDetailsInstance.tabRendering();
    $('.meal-tab-container ul li a').on("click", function () {
        $('.meal-tab-container ul li a').removeClass('activeli');
        $(this).addClass('activeli');
    });


//STAR RATING
    $(document).on('click', '.rating-star', function () {
        var param = $(this).prev().attr('data-id'),
                star = $(this).parent().find('.rating-star');
        $(star).removeClass("change-color");
        $($(star).get().reverse().slice(0, param)).each(function (key, value) {
            $(value).addClass('change-color');
        })
    });
});


