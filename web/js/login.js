function loggingIn() {
    var url = baseURL + "login/",
        header = {
            "session-key": localStorage["session_key"]
        };
    var username = $("#username").val(),
        password = $("#password").val(),
        remember = 1,
        userData = {
            "username": username,
            "password": password,
            "remember": remember
        },
        data = JSON.stringify(userData);
    var loginInstance = new AjaxHttpSender();
    loginInstance.sendPost(url, header, data, loginCallback);
}

//Login process
var loginCallback = {
    success: function(data, textStatus) {
        userDetails = JSON.parse(data);
        if (userDetails.status == -1) {
            showPopup(userDetails);
        } else {
            $("#login-form")[0].reset();
            var user_name = userDetails.user.first_name;
            localStorage['username'] = user_name;
            localStorage['session_key'] = userDetails.session_key;
            localStorage['loggedIn'] = true;
            localStorage['admin_loggedIn'] = false;
            createCookie("SessionExpireTime", "true", sessionExpiryTime);
            checkLoggedIn();
            checkReferredPage();
        }
    },
    failure: function(XMLHttpRequest, textStatus, errorThrown) {}
}

function loginInit() {
    redirectIfLoggedIn();
    CartItemCount();
}

function checkReferredPage() {
    var referrer = document.referrer;
    referredPage = getCurrentPage("/", ".html", referrer);
    if (referredPage == "checkout") {
        window.location.href = 'checkout.html';
    } else if (referredPage == "giftcard_payment") {
        window.location.href = 'giftcard-payment.html';
    } else {
        window.location.href = 'menu.html';
    }
}

$(document).ready(function() {
    loginInit();
    //login form submit
    $("#login-button").on('click', function(e) {
        e.preventDefault();
        if ($('form').valid()) {
            loggingIn();
        }
    });
});
