$(document).ready(function() {
    CartItemCount();
    currentPage = getCurrentPage("/", ".html", window.location.href);
    if (currentPage == "giftcard-payment") {
        stripeIntegration();
    }

    if (localStorage.getItem("giftcardDetails") !== null && $(".giftcard-payment").length) {
        var giftcardDetails = fetchLocalGiftCardData();
        populateGiftcardDetails(giftcardDetails);
    }
    if (localStorage['loggedIn'] == 'false')
    {
        $('.backToAccount').hide();
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
    } else {
        $('.payment-method').hide();
        $('.payment-container-guest,.your-info-container,.payment-info-container').show();
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

    $("#edit-giftcard").on("click", function() {
        $(".giftcard-popup-wrapper").show();
        populateEditCardDetails();
    });
    $("#cancel").on("click", function() {
        $(".giftcard-popup-wrapper").hide();
    });

    $("#edit-recipient-details").on("submit", function(e) {
        e.preventDefault();
        updateRecipientGiftCard();
    });

    $(".proceed-checkout").on("click", function() {
        $("#recipient-form").submit();
        if (!$(".giftcard-selected").length) {
            $("#custom-amount").submit();
        }
        if (($(".giftcard-selected").length || $("#custom-amount").valid()) && $("#recipient-form").valid()) {
            getGiftCardData();
            window.location.href = 'giftcard-payment.html';
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

    //To prevent refresh
    $('#address').on("submit",function(e){
        e.preventDefault();
        return false;
    })
    
    $("#place-order").on("click", function(e) {
        e.preventDefault();
        if (validateGiftOrder()) {
            placeGiftOrder();
        };
    });
});

function placeGiftOrder() {
    //Saved card is present.
    if(localStorage['loggedIn'] == 'false'){
        if($('#address').valid()){
            $('#address').submit();
        }
    }
    if (!$('.saved-cards').is(':empty')) {
        var cardId = $('.saved-cards .added-card:checked').attr("id");
        fetchGiftCardData('', cardId);
    } else {
        if($("#pay-form").valid()) {
            $("#pay-form").submit();    
        }
    }
}

function validateGiftOrder() {
    var data = {};
    if ($(".saved-card-list").length && !$(".payment-checked:checked").length) {
        data.message = "Add a method of payment and then proceed";
        showPopup(data);
        return false;
    }
    return true;
}
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
    $(".recepient-amount").attr("data-amount", giftcardDetails.giftcardAmount);
}

function fetchGiftCardData(token, cardId) {
    var localGiftCardRecipient = fetchLocalGiftCardData(),
        giftCardOrderParams = {
            "name": localGiftCardRecipient.recipientName,
            "email": localGiftCardRecipient.recipientEmail,
            "message": localGiftCardRecipient.recipientMessage,
            "amount": localGiftCardRecipient.giftcardAmount,
            "stripeToken": token,
            "card_id": cardId
        };
         if(localStorage['loggedIn'] == 'false'){
          var first_name = $('input[name="firstname"]').val(),
            last_name = $('input[name="lastname"]').val(),
            email = $('input[name="email"]').val(),
            zip = $('input[name="zip"]').val()
            guestParams = {
                "guest_first_name":first_name, 
                "guest_last_name":last_name, 
                "guest_email":email, 
                "guest_zip":zip
            }
            $.extend(giftCardOrderParams,guestParams);
         }
    saveCreditCardGiftCard(giftCardOrderParams);
}

//save credit card details call back
var saveCreditCardGiftCardCallback = {
    success: function(data, textStatus) {
        var response = JSON.parse(data);
        if (response.status == 1) {
            $("#pay-form")[0].reset();
            $("#close").addClass("redirectApproved");
            showPopup(response);
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

function populateEditCardDetails() {
    $("#recipient-name").val($(".recepient-name").text());
    $("#recipient-email").val($(".recepient-email").text());
    $("#recipient-message").val($(".recepient-message").text());
    $("#recipient-amount").val($($(".recepient-amount")[0]).data("amount"));
}

function updateRecipientGiftCard() {
    var recipientName = $("#recipient-name").val(),
        recipientEmail = $("#recipient-email").val(),
        recipientMessage = $("#recipient-message").val(),
        recipientAmount = $("#recipient-amount").val();
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
}

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
                $('.payment-method').show();
                $('.payment-info-container').hide();
                populateCardDetails(cardDetails.cards);
            } else {
                $('.your-info-container').hide();
                $('.gift-card-details-container,.payment-container-guest').addClass('halfWidth');
                $('.payment-info-container,.details').addClass('fullWidth');
                $('.payment-info-container').show();
                $('.payment-info-container').css('padding-top', '45px');
            }
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
    $('.address-payment-list-popup .popup-container').append("<div class='popup-sub-wrapper'>"+"</div>");
    $.each(cards, function(key, value) {
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
    $('input[type=radio][name=change-card]').on("focus", function() {
        $('#save-payment').removeClass('button-disabled');
    })
}

function showSelectedPaymentMethod(selectedId) {
    $('.saved-cards').empty();
    populateCardDetails(cardDetails.cards, selectedId);
}
