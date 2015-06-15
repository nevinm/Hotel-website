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

$(document).ready(function() {
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

    }
    else{
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
        $.each(cards, function(key, value) {
            last_num = cards[key].number.slice(-4);
            $('.saved-cards').append("<div class='saved-card-list'>" +
                "<input type='radio' class='added-card pullLeft payment-checked' name='saved-card' id='" + value.id +
                "' class='radio-button-payment'>" +
                "<label for='" + value.id + "'>" +
                "<img class='paypal' src='" + value.logo + "'>" +
                "<span class='body-text-small'>" + value.type + " " + "ending in" + " " + last_num + "</span>" +
                "<span class='body-text-small'>" + "Expires on" + " " +
                value.expire_month + "/" + value.expire_year + "</span>" + "</label>" + "</div>");
        });
    }
}