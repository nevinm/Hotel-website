$(document).ready(function() {
    MealsReview.initView();
});
var MealsReview = (function() {
    function initView() {
        loadViewDefaults();
        bindEvents();
    }

    function loadViewDefaults() {
        loadReviews(1);
    }

    function bindEvents() {
        $("input[id^=delete-]").off().on("click", function(e) {
            e.preventDefault();
            $('.popup-wrapper').hide();
            $(".confirm-popup-wrapper .header").text("Delete");
            $(".confirm-popup-wrapper .content span").text("Are you sure you want to delete?");
            $("#yes-button").attr('data-id', this.id.substring(7));
            $(".confirm-popup-wrapper").show();
        });
        $("#yes-button").off().on("click", function(e) {
            e.preventDefault();
            $(".confirm-popup-wrapper").hide();
            triggerDeleteAPI($(this).attr('data-id'));
        });
        $("#no-button").off().on("click", function(e) {
            e.preventDefault();
            $(".confirm-popup-wrapper").hide();
        });
    }

    function loadReviews(pageNumber) {
        var url = baseURL + 'cms/get_all_ratings/',
            header = {
                "session-key": localStorage['session_key']
            },
            params = {
                "nextPage": pageNumber
            };
        data = JSON.stringify(params);
        var api = new AjaxHttpSender();
        api.sendPost(url, header, data, MealsReview.loadReviewsCallback);
    }

    function populateReviewsSection(reviewsData) {
        var html = "";
        var dataArray = reviewsData.aaData;
        $.each(dataArray, function(key, value) {
            html += '<tr><td>' + value.meal_name + '</td>' + '<td>' + value.user.name + '</td>' + '<td><span style="margin: 0px -20px;">';
            for (var i = 1; i <= 5; i++) {
                if (value.rating >= i) {
                    html += '<input type="radio" class="rating-input" id="rating-input-' + i + '-' + key + '" name="rating-input-' + i + '-' + key + '">' + '<label for="rating-input-' + i + '-' + key + '" class="rating-star disable-star change-color"></label>';
                } else {
                    html += ' <input type="radio" class="rating-input" id="rating-input-' + i + '-' + key + '" name="rating-input-' + i + '-' + key + '">' + '<label for="rating-input-' + i + '-' + key + '" class="rating-star disable-star"></label>';
                }
            }
            html += '</span></td>' + '<td>' + value.comment + '</td>' + '<td><input type="button" id="delete-' + value.id + '" class="btn btn-small-primary medium-green" value="DELETE"></td></tr>';
        });
        $("#reviewsArea tbody").html(html);
        $(".pagination").pagination({
            pages: reviewsData.num_pages,
            currentPage: reviewsData.current_page,
            cssStyle: 'light-theme',
            onPageClick: function(pageNumber, event) {
                loadReviews(pageNumber);
            },
            onInit: function() {
                if (getStringAfterHash(location.href, "#")) {
                    var pageString = getStringAfterHash(location.href, "#");
                    if (pageString.indexOf('page') != -1) {
                        pageNumber = getStringAfterHash(pageString, "-");
                        if ($(".pagination").pagination('getCurrentPage') == pageNumber) {} else {
                            $(".pagination").pagination('selectPage', pageNumber);
                        }
                    }
                } else {}
            }
        });
        bindEvents();
    }

    function triggerDeleteAPI(ratingId) {
        var url = baseURL + 'cms/delete_meal_rating/' + ratingId + '/',
            header = {
                "session-key": localStorage['session_key']
            },
            params = {};
        data = JSON.stringify(params);
        var api = new AjaxHttpSender();
        api.sendPost(url, header, data, MealsReview.deleteAPICallback);
    }
    var loadReviewsCallback = {
        success: function(data, textStatus) {
            var responseData = JSON.parse(data);
            if (responseData.status == -1) {
                showPopup(responseData);
            } else {
                populateReviewsSection(responseData);
            }
        },
        failure: function(XMLHttpRequest, textStatus, errorThrown) {}
    };
    var deleteAPICallback = {
        success: function(data, textStatus) {
            var responseData = JSON.parse(data);
            if (responseData.status == -1) {
                showPopup(responseData);
            } else {
                loadReviews($(".pagination").pagination('getCurrentPage'));
            }
        },
        failure: function(XMLHttpRequest, textStatus, errorThrown) {}
    };
    return {
        initView: initView,
        loadReviewsCallback: loadReviewsCallback,
        deleteAPICallback: deleteAPICallback
    };
})();