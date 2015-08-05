$(document).ready(function() {

    if (localStorage['loggedIn'] == 'true') {
        $(".guest").hide();
        if (localStorage['user_profile']) {
            var userDetails = JSON.parse(localStorage['user_profile']);
            $("#user-email").text("  (" + userDetails.email + ")");
        } else {
            getProfile();
        }
    } else {
        $(".guest").show();
        $(".user-account").hide();
    }
    $("#send-message").on("click", function(e) {
        e.preventDefault();
        if ($("form").valid()) {
            sendMessage();
        }
    });
    CartItemCount();
});
//Get profile API process
var getProfileCallback = {
    success: function(data, textStatus, profileId) {
        var userDetails = JSON.parse(data);
        if (userDetails.status == 1) {
            $("#user-email").text("  (" + userDetails.email + ")");
        } else {}
    },
    failure: function(XMLHttpRequest, textStatus, errorThrown) {}
}

function getProfile(profileId) {
    var url = baseURL + "get_profile/",
        header = {
            "session-key": localStorage["session_key"]
        },
        userData = {
            "get": 1
        };
    data = JSON.stringify(userData);
    var getProfileInstance = new AjaxHttpSender();
    getProfileInstance.sendPost(url, header, data, getProfileCallback, profileId);
}

function showSuccessMessageContact() {
    var content = $(".contact-us-popup").find(".content span");
    $(".popup").find(".header").text("Thank you");
    $("#close").hide();
    $("#ok-button").show();
    $(content[0]).text("Thanks for contacting us.");
    $(content[1]).show();
    $(".contact-us-popup").show();
}

var sendMessageCallback = {
    success: function(data, textStatus) {
        var sendMessageDetails = JSON.parse(data);
        if (sendMessageDetails.status == 1) {
            showSuccessMessageContact();
        } else {
            var content = $(".contact-us-popup").find(".content span");
            $(".popup").find(".header").text("Please check");
            $("#close").show();
            $("#ok-button").hide();
            $(content[1]).hide();
            showPopup(sendMessageDetails);
        }
    },
    failure: function(XMLHttpRequest, textStatus, errorThrown) {}
}

function sendMessage() {
    var url = baseURL + "send_contactus_email/",
        header = {
            "session-key": localStorage["session_key"]
        },
        name = $("input[name='fullname']").val(),
        email = $("input[name='email']").val(),
        subject = $("input[name='subject']").val(),
        message = $("textarea[name='message']").val(),
        userData = {
            "subject": subject,
            "message": message,
            "name": name, //optional, for guest
            "email": email //optional, for guest
        };
    data = JSON.stringify(userData);
    var sendMessageInstance = new AjaxHttpSender();
    sendMessageInstance.sendPost(url, header, data, sendMessageCallback);
}
