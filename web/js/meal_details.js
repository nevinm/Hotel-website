$(document).ready(function() {
    tabRendering();
    var mealId = getParameterFromUrl("mealId");
    getMealDetails(mealId);

    $(".add-meal").on('click', function() {
        var mealId = $(this).attr("data-id");
        addToCart(mealId);
    });
});


function tabRendering() {
    var $tabs = $("#meal-tabs").tabs({
        select: function(event, ui) {
            jQuery(this).css('height', jQuery(this).height());
            jQuery(this).css('overflow', 'hidden');
        },
        show: function(event, ui) {
            jQuery(this).css('height', 'auto');
            jQuery(this).css('overflow', 'visible');
        }
    });

    $('.next-tab').click(function(e) {
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

    $('.prev-tab').click(function(e) {
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
}

$('.meal-tab-container ul li').on("click", function() {
    $('.meal-tab-container ul li a').removeClass('activeli');
    $(this).find('a').addClass('activeli');
});

//STAR RATING
$(document).on('click', '.rating-star', function() {
    var param = $(this).prev().attr('data-id'),
        star = $(this).parent().find('.rating-star');
    $(star).removeClass("change-color");
    $($(star).get().reverse().slice(0, param)).each(function(key, value) {
        $(value).addClass('change-color');
    })
})

//Add to cart call back
var addToCartCallback = {
    success: function(data, textStatus, mealId) {
        var meal_details = JSON.parse(data),
            status = meal_details.status;
        if (status == -1) {
            showPopup(meal_details);
        } else {
            $('*[data-id="' + mealId + '"]').addClass("button-disabled");
            showPopup(meal_details);
            CartItemCount();
            if (meal_details.session_key && (meal_details.session_key).length) {
                localStorage['session_key'] = meal_details.session_key;
            }
        }
    },
    failure: function(XMLHttpRequest, textStatus, errorThrown) {}
}

function addToCart(mealId) {
    var url = baseURL + 'add_to_cart/',
        header = {
            "session-key": localStorage["session_key"]
        },
        params = {
            "meal_id": mealId,
        };
    data = JSON.stringify(params);
    var addToCartInstance = new AjaxHttpSender();
    addToCartInstance.sendPost(url, header, data, addToCartCallback, mealId);
}

//Get Meals deatails.
var getMealDetailsCallback = {
    success: function(data, textStatus) {
        mealDetails = JSON.parse(data);
        if (mealDetails.status == 1) {
            populateMealDetails(mealDetails);
        } else {
            console.log("somthing wrong with meals");
        }
    },
    failure: function(XMLHttpRequest, textStatus, errorThrown) {}
}

function getMealDetails(mealId) {
    var url = baseURL + 'get_meal_details/' + mealId + '/',
        header = {
            "session-key": localStorage["session_key"]
        },
        userInfo = {},
        data = JSON.stringify(userInfo);

    var getMealDetailsInstance = new AjaxHttpSender();
    getMealDetailsInstance.sendPost(url, header, data, getMealDetailsCallback);
}

function populateMealDetails(mealDetails) {
    mealDetailsTab(mealDetails);
    mealPreparationTab(mealDetails);
    allYouNeedTab(mealDetails);
    ingredientsTab(mealDetails);
    tipsTricksTab(mealDetails);
    nutrientsTab(mealDetails);
    reviewsTab(mealDetails);
}

function mealDetailsTab(mealDetails) {
    var majorIngredients = "";
    $(".add-meal").attr("data-id", mealDetails.id);
    $(".meal-name").text(mealDetails.name);
    $(".price").text(dollarConvert(mealDetails.price + mealDetails.tax));
    $(".thumbnail").attr('src', mealDetails.main_image.url);
    $(".thumbnail").attr('data-id', mealDetails.main_image.id);
    $(".chef-img").attr("src", mealDetails.chef_image.url);
    $(".chef-img").attr("data-id", mealDetails.chef_image.id);
    $(".chef-comments").text(mealDetails.chef_comments);
    $(".details-description span").text('"' + mealDetails.description + '"');
    $(".chef-name").text("CHEF " + mealDetails.chef_name);
    if (mealDetails.in_cart == 1) {
        $(".add-meal").addClass("button-disabled");
    }
    $(mealDetails.ingredients).each(function(key, value) {
        majorIngredients = majorIngredients + "," + value;
    });
    $(".meal-ingredients").text(majorIngredients.substring(1));
    $(".meal-ingredients").text(majorIngredients.substring(1));

    $("#meal-rating").find(".rating-star").each(function(key, value) {
        if (mealDetails.avg_rating == (key + 1)) {
            $(this).trigger("click");
        }
        $("#meal-rating").find(".rating-star").each(function(key, value) {
            $(value).addClass("disable-star");
        });
    });
}

function mealPreparationTab(mealDetails) {
    $.each(mealDetails.user_to_do, function(key, value) {
        $(".user-to-do").append("<li>" + value + "</li>");
    });
    $.each(mealDetails.finished_preparation, function(key, value) {
        $(".finished-preparation").append("<li>" + value + "</li>");
    });

    $(".preparation-time").text("ALLOW " + mealDetails.preparation_time + " MINUTES");
    $(".saved-time").text(mealDetails.saved_time + " MINUTES SAVED");
}

function allYouNeedTab(mealDetails) {
    $.each(mealDetails.pre_requisites, function(key, value) {
        $(".pre-requisities").append("<li>" + value + "</li>");
    });
    $(".pre-requisities-image").attr("src", mealDetails.pre_requisites_image.url);
    $(".pre-requisities-image").attr("data-id", mealDetails.pre_requisites_image.id);
}

function ingredientsTab(mealDetails) {
    $.each(mealDetails.ingredients, function(key, value) {
        $(".ingredients").append("<li>" + value + "</li>");
    });
    $(".ingredients-image").attr("src", mealDetails.ingredients_image.url);
    $(".ingredients-image").attr("data-id", mealDetails.ingredients_image.id);
}

function tipsTricksTab(mealDetails) {
    $("#tips-and-tricks .section").each(function(key, value) {
        $(this).find(".tips-header").text();
    });
    $(mealDetails.tips).each(function(key, value) {
        $("#tips-and-tricks").append("<div class='section'>" +
            "<div class='container'>" +
            "<span class='mob-view-header tips-header'>" + value.title + "</span>" +
            "<div class='video-container'>" +
            "<iframe height='280' src='" + value.video_url + "' frameborder='0' allowfullscreen=''></iframe>" +
            "</div><div class='list-container'>" +
            "<span class='list-header tips-header'>" + value.title + "</span>" +
            "<ul class='video-tips'></ul>" +
            "</div></div></div>");

        $(value.description).each(function(key, value){
            $(".video-tips:last").append("<li>"+value+"</li>");
        });
    });
}

function nutrientsTab(mealDetails) {
    $.each(mealDetails.nutrients, function(key, value) {
        $("#nutrient-table tbody").append("<tr><td>" + value.mainNutrient + "</td>" +
            "<td>" + value.perServing + "</td>" +
            "<td>" + value.dailyValue + "</td>" +
            "</tr>");
        if (value.subNutrients.length) {
            $.each(value.subNutrients, function(key, value) {
                $("#nutrient-table tbody").append("<tr><td class='sub-nutrients'>" + value.nutrientsName + "</td>" +
                    "<td>" + value.servingValue + "</td>" +
                    "<td>" + value.dailyValue + "</td>" +
                    "</tr>");
            });
        }
    });
}

function reviewsTab(mealDetails) {
    $.each(mealDetails.ratings, function(key, value) {
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
            starRating = $(reviewsAll).find(".rating-star")[value.rating - 1];
        $(reviewsAll).find(".rating-star").each(function(key, value) {
            $(value).addClass("disable-star");
        });
        $(starRating).trigger("click");
    });
}
