//Revealing Prototype Pattern
var loginInstance = null;
var LoginController = function () {
};
LoginController.prototype = function () {
    var loggingIn = function () {
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
        new AjaxHttpSender().sendPost(url, header, data, loginCallback);
    };
    var loginCallback = {
        success: function (data, textStatus) {
            userDetails = JSON.parse(data);
            if (userDetails.status == -1) {
                showPopup(userDetails);
            } else {
                $("#login-form")[0].reset();
                ClearLocalStorage();
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
        failure: function (XMLHttpRequest, textStatus, errorThrown) {
        }
    };
    var loginInit = function () {
        redirectIfLoggedIn();
        CartItemCount();
    };
    var checkReferredPage = function () {
        var referrer = document.referrer;
        referredPage = getCurrentPage("/", ".html", referrer);
        if (referredPage == "checkout") {
            window.location.href = 'checkout.html';
        } else if (referredPage == "giftcard-payment") {
            window.location.href = 'giftcard-payment.html';
        } else if (referredPage == "contact-us") {
            window.location.href = 'contact-us.html';
        } else {
            window.location.href = 'menu.html';
        }
    };
    return{
        loginInit: loginInit,
        loggingIn: loggingIn
    };
}();

$(document).ready(function () {
    loginInstance = new LoginController();
    loginInstance.loginInit();
    //login form submit
    $("#login-button").on('click', function (e) {
        e.preventDefault();
        if ($('form').valid()) {
            loginInstance.loggingIn();
        }
    });
});
