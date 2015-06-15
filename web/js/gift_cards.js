//Old giftcard page
//Redeem Gift Card API.
var redeemGiftCardCallback = {
    success: function(data, textStatus) {
        userDetails = JSON.parse(data);
        showPopup(userDetails);
        if (userDetails.status == 1) {
            $(".card-code").val("");
        } else {
            showPopup(userDetails);
        }
    },
    failure: function(XMLHttpRequest, textStatus, errorThrown) {}
}

function redeemGiftCard(code) {
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
}

//New Gift Card pages.
function getGiftCardData() {
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
}
var cardDetails;

function fetchLocalGiftCardData() {
    return JSON.parse(localStorage['giftcardDetails']);
}

function populateGiftcardDetails(giftcardDetails) {
    $(".recepient-name").text(giftcardDetails.recipientName);
    $(".recepient-email").text(giftcardDetails.recipientEmail);
    $(".recepient-message").text(giftcardDetails.recipientMessage);
    $(".recepient-amount").text("$" + giftcardDetails.giftcardAmount);
}

function fetchGiftCardData(token) {
    var localGiftCardRecipient = fetchLocalGiftCardData(),
        giftCardOrderParams = {
            "name": localGiftCardRecipient.recipientName,
            "email": localGiftCardRecipient.recipientEmail,
            "message": localGiftCardRecipient.recipientMessage,
            "amount": localGiftCardRecipient.giftcardAmount,
            "stripeToken": token
        }
    saveCreditCardGiftCard(giftCardOrderParams);
}

//save credit card details call back
var saveCreditCardGiftCardCallback = {
    success: function(data, textStatus) {
        var response = JSON.parse(data);
        if (response.status == 1) {
            $("#pay-form")[0].reset();
        } else {
            showPopup(response);
        }
    },
    failure: function(XMLHttpRequest, textStatus, errorThrown) {}
}

//save credit card items
function saveCreditCardGiftCard(giftCardOrderParams) {
    var url = baseURL + "gift_card_order/",
        header = {
            "session-key": localStorage["session_key"]
        },
        params = giftCardOrderParams;
    data = JSON.stringify(params);
    var saveCreditCardGiftCardInstance = new AjaxHttpSender();
    saveCreditCardGiftCardInstance.sendPost(url, header, data, saveCreditCardGiftCardCallback);
}

$(document).ready(function() {
    CartItemCount();
    currentPage = getCurrentPage("/", ".html", window.location.href);
    if (currentPage == "giftcard_payment") {
        stripeIntegration();
    }

    if (localStorage.getItem("giftcardDetails") !== null && $(".giftcard-payment").length) {
        var giftcardDetails = fetchLocalGiftCardData();
        populateGiftcardDetails(giftcardDetails);
    }

    populateYear();
    //Old giftcard page
    $("#redeem-card").on('click', function() {
        var code = $(".card-code").val();
        redeemGiftCard(code);
    });

    //New Gift Card pages.
    if (localStorage["session_key"]) {
        savedCardDetails();
        $('.payment-method').show();
        $('.payment-container-guest').hide();
    } else {
        $('.payment-method').hide();
        $('.payment-container-guest').show();
    }

    $(".giftcard-selector").on("click", function() {
        $(".giftcard-selector").removeClass("giftcard-selected");
        $(this).addClass("giftcard-selected");
        $(".checkbox-image").attr("src", "../images/unchecked.png");
        $(this).find(".checkbox-image").attr("src", "../images/checked.png");
        $("#giftcard-custom-amount").val("");
        $("#custom-amount").validate().resetForm();
    });

    $(".giftcard-custom-amount input").on("click", function() {
        $(".checkbox-image").attr("src", "../images/unchecked.png");
        $(".giftcard-selected").removeClass("giftcard-selected");
    });

    $("#recipient-form, #custom-amount").on("submit", function(e) {
        e.preventDefault();
    });

    $(".proceed-checkout").on("click", function() {
        $("#recipient-form").submit();
        if (!$(".giftcard-selected").length) {
            $("#custom-amount").submit();
        }
        if (($(".giftcard-selected").length || $("#custom-amount").valid()) && $("#recipient-form").valid()) {
            getGiftCardData();
            window.location.href = 'giftcard_payment.html';
        } else {}
    });
    $('#change-payment').on("click", function() {
        $('.address-payment-list-popup').show();
        populateCardDetailsInPopup();
    })
    $(document).on('click', '#cancel', function() {
        $('.address-payment-list-popup').hide();
    });
    $(document).on('click', '#save-payment', function() {
        var selectedId = $('input[type=radio][name=change-card]:checked').attr('id');
        showSelectedPaymentMethod(selectedId);
        $('.address-payment-list-popup').hide();
    });
});
//populate year
function populateYear() {
    var currentYear = new Date().getFullYear();
    for (var i = 1; i <= 20; i++) {
        $('#ExpYear').append("<option value='" + currentYear + "'>" + currentYear + "</option>");
        currentYear = currentYear + 1;
    }
}

//Get saved cards
var savedCardDetailsCallback = {
    success: function(data, textStatus) {
        var last_num;
        cardDetails = JSON.parse(data);
        if (cardDetails.status == 1) {
            if (cardDetails.cards.length != 0) {
                populateCardDetails(cardDetails.cards);
            } else {}
        } else {
            showPopup(cardDetails);
        }
    },
    failure: function(XMLHttpRequest, textStatus, errorThrown) {}
}

function savedCardDetails() {
    var url = baseURL + "get_saved_cards/",
        header = {
            "session-key": localStorage["session_key"]
        },
        params = {}
    data = JSON.stringify(params);
    var savedCardDetailsInstance = new AjaxHttpSender();
    savedCardDetailsInstance.sendPost(url, header, data, savedCardDetailsCallback);
}

function populateCardDetails(cards, selectedId) {
    if (selectedId) {
        $.each(cards, function(key, value) {
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
}

//change payment method
function populateCardDetailsInPopup() {
    var cards = cardDetails.cards;
    $('.address-payment-list-popup .button').remove();
    $('.address-payment-list-popup .popup-container').empty();

    $.each(cards, function(key, value) {
        $('.address-payment-list-popup .popup-container').append("<div class='payment-popup-sub-container'>" +
            "<input type='radio' class='added-card pullLeft' name='change-card' class='radio-button-payment' id='" + value.id + "'>" +
            "<label>" + "<img class='paypal' src='" + value.logo + "'>" +
            "<span class='body-text-small'>" + value.type + " " +
            "ending in" + " " + last_num + "</span>" +
            "<span class='body-text-small'>" + "Expires on" +
            " " + value.expire_month + "/" + value.expire_year + "</span>" + "</label>" + "</div>")
    });
    $('.address-payment-list-popup .popup-container').append("<div class='button'>" +
        "<a href='#' class='btn btn-medium-primary medium-green pullLeft' id='save-payment'>" + "SELECT" + "</a>" +
        "<a href='#' class='btn btn-medium-secondary' id='cancel'>" + "CANCEL" + "</a>" + "</div>");
    $('#save-payment').addClass('button-disabled');
    $('.address-payment-list-popup').show();
    $('input[type=radio][name=change-card]').on("focus", function() {
        $('#save-payment').removeClass('button-disabled');
    })
}

function showSelectedPaymentMethod(selectedId) {
    $('.saved-cards').empty();
    populateCardDetails(cardDetails.cards, selectedId);
}
