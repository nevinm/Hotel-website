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
        activate: function(event, ui) {
            $tabs.tabs('option', 'hide', false);
            $tabs.tabs('option', 'show', false);
        },
        fx: {
            opacity: 'toggle'
        },
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
    $('.meal-tab-container ul li').removeClass('activeli');
    $(this).addClass('activeli');
});

//STAR RATING
$('.rating-star').on('click',function(){
    var param = $(this).prev().attr('data-id'),
        star = $(this).parent().find('.rating-star');
   $(star).removeClass("change-color");
   $($(star).get().reverse().slice(0,param)).each(function(key,value){
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
}

function mealDetailsTab(mealDetails) {
    var majorIngredients= "";
    $(".add-meal").attr("data-id", mealDetails.id);
    $(".meal-name").text(mealDetails.name);
    $(".price").text(dollarConvert(mealDetails.price + mealDetails.tax));
    $(".thumbnail").attr('src', mealDetails.main_image.url);
    $(".thumbnail").attr('data-id', mealDetails.main_image.id);
    $(".chef-img").attr("src", mealDetails.chef_image);
    $(".chef-img").attr("data-id", mealDetails.chef_id);
    $(".chef-comments").attr("data-id", mealDetails.chef_comments);
    $(".details-description span").text('"' + mealDetails.description + '"');
    $(".chef-name").text("CHEF " + mealDetails.chef_name);
    $(mealDetails.ingredients).each(function(key, value) {
        majorIngredients = majorIngredients + "," + value;
    });
    $(".meal-ingredients").text(majorIngredients.substring(1));
    $(".meal-ingredients").text(majorIngredients.substring(1));
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
