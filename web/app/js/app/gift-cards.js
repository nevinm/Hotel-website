var GiftCardsController = function () {
};
GiftCardsController.prototype = function () {
    var cardDetails;
    var placeGiftOrder = function () {
        //Saved card is present.
        if (localStorage['loggedIn'] == 'false') {
            if ($('#address').valid()) {
                $('#address').submit();
            }
        }
        if (!$('.saved-cards').is(':empty')) {
            var cardId = $('.saved-cards .added-card:checked').attr("id");
            fetchGiftCardData('', cardId);
        } else {
            if ($("#pay-form").valid()) {
                $("#pay-form").submit();
            }
        }
    };

    var validateGiftOrder = function () {
        var data = {};
        if ($(".saved-card-list").length && !$(".payment-checked:checked").length) {
            data.message = "Add a method of payment and then proceed";
            showPopup(data);
            return false;
        }
        return true;
    };

//Old giftcard page
//Redeem Gift Card API.
    var redeemGiftCardCallback = {
        success: function (data, textStatus) {
            userDetails = JSON.parse(data);
            showPopup(userDetails);
            if (userDetails.status == 1) {
                $(".card-code").val("");
            } else {
                showPopup(userDetails);
            }
        },
        failure: function (XMLHttpRequest, textStatus, errorThrown) {
        }
    };

    var redeemGiftCard = function (code) {
        var url = baseURL + 'redeem_gift_card/',
                header = {
                    "session-key": localStorage["session_key"]
                },
        userInfo = {
            "code": code
        },
        data = JSON.stringify(userInfo);

        var redeemGiftCardInstance = new AjaxHttpSender();
        redeemGiftCardInstance.sendPost(url, header, data, redeemGiftCardCallback);
    };

    //New Gift Card pages.
    var getGiftCardData = function () {
        var $giftCardSelected = $(".giftcard-selected");
        var giftcardAmount = $giftCardSelected.length ? $($giftCardSelected).find(".giftcard-amount").data("amount") :
                $("#giftcard-custom-amount").val(),
                recipientName = $("#recipient-name").val(),
                recipientEmail = $("#recipient-email").val(),
                recipientMessage = $("#recipient-message").val(),
                giftcardDetails = {};
        giftcardDetails = {
            "giftcardAmount": giftcardAmount,
            "recipientName": recipientName,
            "recipientEmail": recipientEmail,
            "recipientMessage": recipientMessage
        }
        localStorage['giftcardDetails'] = JSON.stringify(giftcardDetails);
    };


    var fetchLocalGiftCardData = function () {
        return JSON.parse(localStorage['giftcardDetails']);
    };

    var populateGiftcardDetails = function (giftcardDetails) {
        $(".recepient-name").text(giftcardDetails.recipientName);
        $(".recepient-email").text(giftcardDetails.recipientEmail);
        $(".recepient-message").text(giftcardDetails.recipientMessage);
        $(".recepient-amount").text("$" + parseFloat(giftcardDetails.giftcardAmount).toFixed(2));
        $(".recepient-amount").attr("data-amount", giftcardDetails.giftcardAmount);
    };

    var fetchGiftCardData = function (token, cardId) {
        var localGiftCardRecipient = fetchLocalGiftCardData(),
                giftCardOrderParams = {
                    "name": localGiftCardRecipient.recipientName,
                    "email": localGiftCardRecipient.recipientEmail,
                    "message": localGiftCardRecipient.recipientMessage,
                    "amount": localGiftCardRecipient.giftcardAmount,
                    "stripeToken": token,
                    "card_id": cardId
                };
        if (localStorage['loggedIn'] == 'false') {
            var first_name = $('input[name="firstname"]').val(),
                    last_name = $('input[name="lastname"]').val(),
                    email = $('input[name="email"]').val(),
                    zip = $('input[name="zip"]').val()
            guestParams = {
                "guest_first_name": first_name,
                "guest_last_name": last_name,
                "guest_email": email,
                "guest_zip": zip
            }
            $.extend(giftCardOrderParams, guestParams);
        }
        saveCreditCardGiftCard(giftCardOrderParams);
    };

    //save credit card details call back
    var saveCreditCardGiftCardCallback = {
        success: function (data, textStatus) {
            $('.loading-indicator').hide();
            var response = JSON.parse(data);
            if (response.status == 1) {
                $("#pay-form")[0].reset();
                $("#close").addClass("redirectApproved");
                showPopup(response);
            } else {
                showPopup(response);
            }
        },
        failure: function (XMLHttpRequest, textStatus, errorThrown) {
            $('.loading-indicator').hide();
        }
    };

    //save credit card items
    var saveCreditCardGiftCard = function (giftCardOrderParams) {
        var url = baseURL + "gift_card_order/",
                header = {
                    "session-key": localStorage["session_key"]
                },
        params = giftCardOrderParams;
        data = JSON.stringify(params);
        var saveCreditCardGiftCardInstance = new AjaxHttpSender();
        saveCreditCardGiftCardInstance.sendPost(url, header, data, saveCreditCardGiftCardCallback);
        $('.loading-indicator').show();
    };

    var populateEditCardDetails = function () {
        $("#recipient-name").val($(".recepient-name").text());
        $("#recipient-email").val($(".recepient-email").text());
        $("#recipient-message").val($(".recepient-message").text());
        $("#recipient-amount").val($($(".recepient-amount")[0]).attr("data-amount"));
    };

    var updateRecipientGiftCard = function () {
        var recipientName = $("#recipient-name").val(),
                recipientEmail = $("#recipient-email").val(),
                recipientMessage = $("#recipient-message").val(),
                recipientAmount = $("#recipient-amount").val();
        if(recipientAmount < 25){
            return false;
        }
        giftcardDetails = {};
        giftcardDetails = {
            "giftcardAmount": recipientAmount,
            "recipientName": recipientName,
            "recipientEmail": recipientEmail,
            "recipientMessage": recipientMessage
        }
        localStorage['giftcardDetails'] = JSON.stringify(giftcardDetails);
        if (localStorage.getItem("giftcardDetails") !== null && $(".giftcard-payment").length) {
            var giftcardDetails = fetchLocalGiftCardData();
            populateGiftcardDetails(giftcardDetails);
        }
        $(".giftcard-popup-wrapper").hide();
    };

    //populate year
    var populateYear = function () {
        var currentYear = new Date().getFullYear();
        for (var i = 1; i <= 20; i++) {
            $('#ExpYear').append("<option value='" + currentYear + "'>" + currentYear + "</option>");
            currentYear = currentYear + 1;
        }
    };

    //Get saved cards
    var savedCardDetailsCallback = {
        success: function (data, textStatus) {
            var last_num;
            cardDetails = JSON.parse(data);
            if (cardDetails.status == 1) {
                if (cardDetails.cards.length != 0) {
                    $('.payment-method').show();
                    $('.payment-info-container').hide();
                    populateCardDetails(cardDetails.cards);
                } else {
                    $('.your-info-container').hide();
                    $(".payment-amount-container").addClass("center-align");
                    $('.gift-card-details-container,.payment-container-guest').addClass('halfWidth');
                    $('.payment-info-container,.details').addClass('fullWidth');
                    $('.payment-info-container').show();
                    $('.payment-info-container').css('padding-top', '45px');
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

    var populateCardDetails = function (cards, selectedId) {
        if (selectedId) {
            $.each(cards, function (key, value) {
                last_num = cards[key].number.slice(-4);
                if (selectedId == value.id) {
                    $('.saved-cards').append("<div class='saved-card-list'>" +
                            "<input type='radio' class='added-card pullLeft payment-checked' name='saved-card' id='" + value.id +
                            "' class='radio-button-payment'>" +
                            "<label for='" + value.id + "'>" +
                            "<img class='paypal' src='" + value.logo + "'>" +
                            "<span class='body-text-small'>" + value.type + " " + "ending in" + " " + last_num + "</span>" +
                            "<span class='body-text-small'>" + "Expires on" + " " +
                            value.expire_month + "/" + value.expire_year + "</span>" + "</label>" + "</div>");
                }
            });

        } else {
            last_num = cards[0].number.slice(-4);
            $('.saved-cards').append("<div class='saved-card-list'>" +
                    "<input type='radio' class='added-card pullLeft payment-checked' name='saved-card' id='" + cards[0].id +
                    "' class='radio-button-payment'>" +
                    "<label for='" + cards[0].id + "'>" +
                    "<img class='paypal' src='" + cards[0].logo + "'>" +
                    "<span class='body-text-small'>" + cards[0].type + " " + "ending in" + " " + last_num + "</span>" +
                    "<span class='body-text-small'>" + "Expires on" + " " +
                    cards[0].expire_month + "/" + cards[0].expire_year + "</span>" + "</label>" + "</div>");
        }
    };

    //change payment method
    var populateCardDetailsInPopup = function () {
        var cards = cardDetails.cards;
        $('.address-payment-list-popup .button').remove();
        $('.address-payment-list-popup .popup-container').empty();
        $('.address-payment-list-popup .popup-container').append("<div class='popup-sub-wrapper'>" + "</div>");
        $.each(cards, function (key, value) {
            $('.address-payment-list-popup .popup-container .popup-sub-wrapper').append("<div class='payment-popup-sub-container'>" +
                    "<input type='radio' class='added-card pullLeft' name='change-card' class='radio-button-payment' id='" + value.id + "'>" +
                    "<label>" + "<img class='paypal' src='" + value.logo + "'>" +
                    "<span class='body-text-small'>" + value.type + " " +
                    "ending in" + " " + last_num + "</span>" +
                    "<span class='body-text-small'>" + "Expires on" +
                    " " + value.expire_month + "/" + value.expire_year + "</span>" + "</label>" + "</div>")
        });
        $('.address-payment-list-popup .popup-container').append("<div class='button'>" +
                "<a href='#' class='btn btn-medium-primary medium-green pullLeft' id='save-payment'>" + "SELECT" + "</a>" +
                "<a href='#!' class='btn btn-medium-secondary' id='cancel'>" + "CANCEL" + "</a>" + "</div>");
        $('#save-payment').addClass('button-disabled');
        $('.address-payment-list-popup').show();
        $('input[type=radio][name=change-card]').on("focus", function () {
            $('#save-payment').removeClass('button-disabled');
        })
    };

    var showSelectedPaymentMethod = function (selectedId) {
        $('.saved-cards').empty();
        populateCardDetails(cardDetails.cards, selectedId);
    };

    return {
        fetchGiftCardData: fetchGiftCardData,
        fetchLocalGiftCardData: fetchLocalGiftCardData,
        populateGiftcardDetails: populateGiftcardDetails,
        populateYear: populateYear,
        redeemGiftCard: redeemGiftCard,
        savedCardDetails: savedCardDetails,
        populateEditCardDetails: populateEditCardDetails,
        updateRecipientGiftCard: updateRecipientGiftCard,
        getGiftCardData: getGiftCardData,
        populateCardDetailsInPopup: populateCardDetailsInPopup,
        showSelectedPaymentMethod: showSelectedPaymentMethod,
        placeGiftOrder: placeGiftOrder,
        validateGiftOrder: validateGiftOrder
    };
}();



$(document).ready(function () {
    var giftCards = new GiftCardsController();
    CartItemCount();
    currentPage = getCurrentPage("/", ".html", window.location.href);
    $("#giftcard-custom-amount").val("50");
    if (currentPage == "giftcard-payment") {
        stripeIntegration();
    }

    if (localStorage.getItem("giftcardDetails") !== null && $(".giftcard-payment").length) {
        var giftcardDetails = giftCards.fetchLocalGiftCardData();
        giftCards.populateGiftcardDetails(giftcardDetails);
    }
    if (localStorage['loggedIn'] == 'false') {
        $('.backToAccount').hide();
    }
    giftCards.populateYear();
    //Old giftcard page
    $("#redeem-card").on('click', function () {
        var code = $(".card-code").val();
        giftCards.redeemGiftCard(code);
    });

    //New Gift Card pages.
    if (localStorage["session_key"]) {
        giftCards.savedCardDetails();
        $(".payment-amount-container").addClass("center-align");
    } else {
        $('.payment-method').hide();
        $('.payment-container-guest,.your-info-container,.payment-info-container').show();
        $(".payment-amount-container").removeClass("center-align");
    }

    $(".giftcard-selector").on("click", function () {

        var giftcardAmount = 0;
        $(".giftcard-selector").removeClass("giftcard-selected");
        $(this).addClass("giftcard-selected");
        $(".checkbox-image").attr("src", "../images/unchecked.png");
        $(this).find(".checkbox-image").attr("src", "../images/checked.png");
        $("#giftcard-custom-amount").val("");
        giftcardAmount = $(this).find('.giftcard-amount').attr('data-amount');
        $("#giftcard-custom-amount").val(giftcardAmount);
        $("#giftcard-form").validate().resetForm();
    });

    $(".gift-amount a").on("click", function (e) {
        e.preventDefault();
        var giftcardAmount = 0;
        $(".gift-amount").removeClass("active-card");
        $(this).closest('.gift-amount').addClass("active-card");
        $("#giftcard-custom-amount").val("");
        giftcardAmount = $(this).attr("data-amount");
        $("#giftcard-custom-amount").val(giftcardAmount);
        $("#giftcard-form").validate().resetForm();
    });

    $(".giftcard-custom-amount input").on("focus", function (e) {
        e.preventDefault();
        if ($(".active-card").length) {
            $(this).val("");
        }
        $(".gift-amount").removeClass("active-card");
    });

    $("#edit-giftcard").on("click", function () {
        $(".giftcard-popup-wrapper").show();
        giftCards.populateEditCardDetails();
    });
    $("#cancel").on("click", function () {
        $(".giftcard-popup-wrapper").hide();
    });

    $("#edit-recipient-details").on("submit", function (e) {
        e.preventDefault();
        giftCards.updateRecipientGiftCard();
    });

    $(".proceed-checkout").on("click", function (e) {
        e.preventDefault();
        if ($('form').valid()) {
            giftCards.getGiftCardData();
            window.location.href = 'giftcard-payment.html';
        } else {
        }
    });
    $('#change-payment').on("click", function () {
        $('.address-payment-list-popup').show();
        giftCards.populateCardDetailsInPopup();
    });
    $(document).on('click', '#cancel', function () {
        $('.address-payment-list-popup').hide();
    });
    $(document).on('click', '#save-payment', function () {
        var selectedId = $('input[type=radio][name=change-card]:checked').attr('id');
        giftCards.showSelectedPaymentMethod(selectedId);
        $('.address-payment-list-popup').hide();
    });

    //To prevent refresh
    $('#address').on("submit", function (e) {
        e.preventDefault();
        return false;
    });

    $("#gift-place-order").on("click", function (e) {
        e.preventDefault();
        if (giftCards.validateGiftOrder()) {
            giftCards.placeGiftOrder();
        }
    });
});
