//signup process
var signupCallback = {
    success: function (data, textStatus) {
        userDetails = JSON.parse(data);
        if (userDetails.status == -1) {
            showPopup(userDetails);
        } else {
            $('.signup-formcontainer')[0].reset();
            showPopup(userDetails);
            var splitter = "Please note that a guest user account already exists with your email";
            if (userDetails.message.match(splitter)) {
                var dataArray = userDetails.message.split(splitter);
                var element = dataArray[0] + "<br>" + splitter + dataArray[1];
                $('.popup-container .content span').html(element);
                $('.popup-container').attr("style", "padding:0px");
            }
            ga('send', {
                'hitType': 'event', // Required.
                'eventCategory': 'button', // Required.
                'eventAction': 'click', // Required.
                'eventLabel': 'Account Creation',
                'eventValue': 4
            });
            SessionController.fbTrackConversionEvent(SessionController.getSignUpPixel(), '0.00', 'USD');
        }
    },
    failure: function (XMLHttpRequest, textStatus, errorThrown) {
    }
}

function signingup() {
    var url = baseURL + 'signup/',
            header = {},
            fbId = '',
            password = $('#signup-password').val(),
            first_name = $('#signup-firstname').val(),
            last_name = $('#signup-lastname').val(),
            email = $('#signup-email').val(),
            zip = $("#zip-code").val(),
            invitecode = $("#invite-code").val();
    if (localStorage["fb-id"]) {
        fbId = JSON.parse(localStorage["fb-id"]);
    }
    var userInfo = {
        "password": password,
        "first_name": first_name,
        "last_name": last_name,
        "email": email,
        "fb_id": fbId,
        "image_url": localStorage['fb-image'],
        "zipcode": zip,
        "referral_code": invitecode
    },
    data = JSON.stringify(userInfo);

    var signupInstance = new AjaxHttpSender();
    signupInstance.sendPost(url, header, data, signupCallback);
}

function referralUIIntegrate() {
    $(".email-wrapper").append("<div class='signup-input invitecode-container'>" +
            "<label class='body-text-small' >Invite Code</label>" +
            "<input class='arrange' type='text' id='invite-code' name='invitecode'></input>" +
            "</div>");
    $(".password-container").removeClass("fifty-percent-first");
    $(".zipcode-container").removeClass("fifty-percent-second");
    $(".zipcode-container").addClass("fifty-percent-first");
    $(".invitecode-container").addClass("fifty-percent-second");
}

function signupInit() {
//    redirectIfLoggedIn();
    if (localStorage['loggedIn'] == 'true') {
        $(".popup-container .content span").text("You're already logged in!");
        $("#close").text("OK");
        $(".popup-wrapper").show();
    }
    $("#close").on("click", function (e) {
        e.preventDefault();
        $(".popup-wrapper").hide();
        $(".popup-container .content span").text("SOMTHING WENT WRONG");
        $("#close").text("CLOSE");
        redirectIfLoggedIn();
    });
    CartItemCount();
    referralCode = getParameterFromUrl('ref');
    checkPromocode(referralCode);
    if (referralCode.length) {
        referralUIIntegrate();
        $("#invite-code").val(referralCode);
    }
}
function checkPromocode(promoCode) {
    var url = baseURL + "verify_promocode/",
            userData = {
                "promocode": promoCode
            },
    header = {
    };
    var data = JSON.stringify(userData);
    new AjaxHttpSender().sendPost(url, header, data, checkPromocodeCallback, promoCode);
}
var checkPromocodeCallback = {
    success: function (data, textStatus, promoCode) {
        var promoCodeDetails = JSON.parse(data);
        if (promoCodeDetails.status == 1) {
            $(".referral-message-container .message").text(promoCodeDetails.label);
            $(".referral-message-container").show();
        }
    },
    failure: function (XMLHttpRequest, textStatus, errorThrown) {
    }
};

$(document).ready(function () {
    signupInit();
    window.onunload = function () {
    };

    $('#signup-button').on('click', function (e) {
        e.preventDefault();
        if ($('form').valid()) {
            signingup();
        }
    });
});
