var ManageCreditCardController = function () {
};
ManageCreditCardController.prototype = function () {
    //Get saved cards
    var savedCardDetailsCallback = {
        success: function (data, textStatus) {
            var last_num;
            cardDetails = JSON.parse(data);
            if (cardDetails.status == 1) {
                if (cardDetails.cards.length != 0) {
                    $('#manage-payment-method-container .message').hide();
                    populateCardDetails(cardDetails.cards);
                } else {
                    $('#manage-payment-method-container .message').show();
                    $('#update-payment').hide();
                }
            } else {
                showPopup(cardDetails);
            }
        },
        failure: function (XMLHttpRequest, textStatus, errorThrown) {
        }
    };

    var savedCardDetails = function () {
        var url = baseURL + "get_saved_cards/",
                header = {
                    "session-key": localStorage["session_key"]
                },
        params = {}
        data = JSON.stringify(params);
        var savedCardDetailsInstance = new AjaxHttpSender();
        savedCardDetailsInstance.sendPost(url, header, data, savedCardDetailsCallback);
    };

    var populateCardDetails = function (cards) {
        var last_num;
        $.each(cards, function (key, value) {
            last_num = cards[key].number.slice(-4);
            $('.card-list-container').append("<div class='saved-card-list'>" +
                    "<input type='radio' class='checkbox-green payment-checked' name='saved-card' id='" + value.id + "'>" +
                    "<label for='" + value.id + "'>" +
                    "<img class='paypal' src='" + value.logo + "'>" +
                    "<div class='card-details-small'>" +
                    "<div class='body-text-small'>" + value.type + " " + "ending in" + " " + last_num + "</div>" +
                    "<div class='body-text-small'>" + "Expires on" + " " +
                    value.expire_month + "/" + value.expire_year + "</div>" + "</div>" + "</label>" + "</div>");
        });
    };
    var deleteCreditCardCallback = {
        success: function (data, textStatus, delete_id) {
            var cardDetails = JSON.parse(data);
            if (cardDetails.status == 1) {
                showPopup(cardDetails);
                $("#" + delete_id).parent().remove();
                if ($('.card-list-container').is(':empty')) {
                    $('#manage-payment-method-container .message').show();
                } else {
                    $('#manage-payment-method-container .message').hide();
                }
            } else {
                showPopup(cardDetails);
            }

        },
        failure: function (XMLHttpRequest, textStatus, errorThrown) {
        }
    };
    //delete credit card
    var deleteCreditCard = function (delete_id) {
        var url = baseURL + "delete_credit_card/" + delete_id + "/",
                header = {
                    "session-key": localStorage["session_key"]
                },
        params = {}
        data = JSON.stringify(params);
        var deleteCreditCardInstance = new AjaxHttpSender();
        deleteCreditCardInstance.sendPost(url, header, data, deleteCreditCardCallback, delete_id);
    }
    return{
        savedCardDetails: savedCardDetails,
        deleteCreditCard: deleteCreditCard
    };
}();

$(document).ready(function () {
    var manageCreditCard = new ManageCreditCardController();
    CartItemCount();
    manageCreditCard.savedCardDetails();
    $(document).on('click', 'input[name=saved-card]', function () {
        $('#delete-card').removeClass('button-disabled');
    });
    $("#delete-card").on("click", function () {
        $("input[name=saved-card]").each(function () {
            var $this = $(this);
            if ($this.is(":checked")) {
                delete_id = $this.attr("id");
                manageCreditCard.deleteCreditCard(delete_id);
            }
        });
    });
    $(document).on('click', 'img.paypal,.card-details-small', function () {
        var card_id = $(this).closest('.saved-card-list').find('input[type=radio]').attr('id');
        window.location = "add-creditcard.html" + "?cardId=" + card_id;
    });
});

