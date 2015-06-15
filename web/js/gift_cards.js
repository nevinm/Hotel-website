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
    //Old giftcard page
    $("#redeem-card").on('click', function() {
        var code = $(".card-code").val();
        redeemGiftCard(code);
    });

    //New Gift Card pages.
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
