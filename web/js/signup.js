//signup process
var signupCallback = {
    success: function(data, textStatus) {
        userDetails = JSON.parse(data);
        if (userDetails.status == -1) {
            showPopup(userDetails);
        } else {
            $('.signup-formcontainer')[0].reset();
            showPopup(userDetails);
        }
    },
    failure: function(XMLHttpRequest, textStatus, errorThrown) {}
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
            "referral_code" : invitecode
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
    redirectIfLoggedIn();
    CartItemCount();
    referralCode = getParameterFromUrl('ref');
    if (referralCode.length) {
        referralUIIntegrate();
        $("#invite-code").val(referralCode);
        $(".referral-message-container").show();
    }else{}
}

$(document).ready(function() {
    signupInit();

    $('#signup-button').on('click', function(e) {
        e.preventDefault();
        if ($('form').valid()) {
            signingup();
        }
    });
});
