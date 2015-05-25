$(document).ready(function() {
    getReviews();
    CartItemCount();  
     
    //STAR RATING
    $(document).on('click', '.rating-star', function() {
        var param = $(this).prev().attr('data-id'),
            star = $(this).parent().find('.rating-star');
        $(star).removeClass("change-color");
        $($(star).get().reverse().slice(0, param)).each(function(key, value) {
            $(value).addClass('change-color');
        });
        $(this).parent().attr("data-rating",param);
    })

    $(document).on('click', '.add-review', function(){
        var currentMealReview = $(this).parents().eq(2),
        reviewValue = $(currentMealReview).find(".user-reviews").val(),
        starRating = $(".meal-star-rating").data("rating"),
        orderId = $(this).data("orderId");
        mealId = $(this).data("mealId");
        addReviews(reviewValue, starRating , orderId, mealId);
    })

    //change session-key
    changeSessionKey();    
   
});
//Get reviews API process
var getReviewsCallback = {
    success: function(data, textStatus) {
        var userDetails = JSON.parse(data);
        if (userDetails.status == 1) {
            populateReviews(userDetails);
        } else {}
    },
    failure: function(XMLHttpRequest, textStatus, errorThrown) {}
}

function getReviews() {
    var url = baseURL + "get_user_reviews/",
        header = {
            "session-key": localStorage["session_key"]
        },
        userData = {};
    data = JSON.stringify(userData);
    var getReviewsInstance = new AjaxHttpSender();
    getReviewsInstance.sendPost(url, header, data, getReviewsCallback);
}

//Add review API process
var addReviewsCallback = {
    success: function(data, textStatus) {
        var userDetails = JSON.parse(data);
           showPopup(userDetails);
        if (userDetails.status == 1) {
        } else {}
    },
    failure: function(XMLHttpRequest, textStatus, errorThrown) {}
}

function addReviews(review, starRating , orderId, mealId) {
    var url = baseURL + "add_rating/"+mealId+ "/",
        header = {
            "session-key": localStorage["session_key"]
        },
        userData = {
            "order_id":orderId,
            "rating": starRating,
            "comment": review
        };
    data = JSON.stringify(userData);
    var addReviewsInstance = new AjaxHttpSender();
    addReviewsInstance.sendPost(url, header, data, addReviewsCallback);
}

function populateReviews(userDetails) {
    $(userDetails.reviews).each(function(key, value){
        $(".meal-review-container").append("<div class='meal-reviews meal-reviews-row'>" +
            "<div class='details meal-review-cell'>" +
            "<img class='meal-image' src='"+value.meal_image+"'>" +
            "<span class='meal-name'>"+value.meal_name+"</span>" +
            "</div><div class='rating meal-review-cell'>" +
            "<span class='meal-star-rating'><input type='radio' class='rating-input' id='rating-input-1-5' name='rating-input-1' data-id='5'>" +
            "<label for='rating-input-1-5' class='rating-star'></label>" +
            "<input type='radio' class='rating-input' id='rating-input-1-4' name='rating-input-1' data-id='4'>" +
            "<label for='rating-input-1-4' class='rating-star'></label>" +
            "<input type='radio' class='rating-input' id='rating-input-1-3' name='rating-input-1' data-id='3'>" +
            "<label for='rating-input-1-3' class='rating-star'></label>" +
            "<input type='radio' class='rating-input' id='rating-input-1-2' name='rating-input-1' data-id='2'>" +
            "<label for='rating-input-1-2' class='rating-star'></label>" +
            "<input type='radio' class='rating-input' id='rating-input-1-1' name='rating-input-1' data-id='1'>" +
            "<label for='rating-input-1-1' class='rating-star'></label></span>" +
            "</div><div class='meal-review-textarea meal-review-cell'>" +
            "<textarea class='user-reviews'>"+value.review+"</textarea>" +
            "</div><div class='meal-review-submit meal-review-cell'>" +
            "<a href='#' class='btn btn-medium-primary medium-green add-review' data-meal-id='"+value.meal_id+"'"+
            "data-order-id='"+value.order_id+"' >Submit</a></div></div>");

        var reviewMeal = $(".meal-review-container").find(".meal-reviews:last"),
            starRating = $($(reviewMeal).find(".rating-star").get().reverse())[value.rating - 1];
        // $(reviewMeal).find(".rating-star").each(function(key, value) {
        //     $(value).addClass("disable-star");
        // });
        $(starRating).trigger("click");
    });
}
function changeSessionKey(){
    var currentUrl = window.location.href,
        newSession = getParameterFromUrl("sess");
    localStorage['session-key'] = newSession;
}