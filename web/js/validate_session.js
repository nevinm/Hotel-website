var sessionExpiryTime = 5;
function getCurrentPage(firstChar, secondChar, url) {
    currentPage = url.substring(url.lastIndexOf(firstChar) + 1, url.lastIndexOf(secondChar));
    return currentPage;
}

function sessionCheckLogout() {
    var currentLink = window.location.href,
        currentPage = getCurrentPage("/", ".", currentLink);
    if (!readCookie("SessionExpireTime") && JSON.parse(localStorage.getItem('loggedIn'))) {
        localStorage.removeItem('username');
        localStorage.removeItem('session_key');
        localStorage.removeItem('user_profile');
        localStorage.removeItem('delivery_addressess');
        localStorage.removeItem('fb-image');
        localStorage.removeItem('cartItems');
        localStorage.removeItem('fb-id');
        localStorage['loggedIn'] = false;
        localStorage['admin_loggedIn'] = false;
        if (currentPage == "login" || currentPage == "How_it_works" ||
            currentPage == "checkout" || currentPage == "forgot_password" ||
            currentPage == "gift_cards_select" || currentPage == "giftcard_payment"     ||
            currentPage == "signup_fail" || currentPage == "meal_details" ||
            currentPage == "privacy_terms" || currentPage == "signup" ||
            currentPage == "menu" || currentPage == "reset_password" ||
            currentPage == "reset_passwordsuccess") {
            location.reload();
        } else {
            window.location.href = 'login.html';
        }
    }
    if (!readCookie("SessionExpireTime") && JSON.parse(localStorage.getItem("admin_loggedIn"))) {
        localStorage.removeItem('username');
        localStorage.removeItem('session_key');
        localStorage['loggedIn'] = false;
        localStorage['admin_loggedIn'] = false;
        window.location.href = 'index.html';
    }
}

function createCookie(name, value, minutes) {
    if (minutes) {
        var date = new Date();
        date.setTime(date.getTime() + (minutes * 60 * 1000));
        var expires = "; expires=" + date.toGMTString();
    } else var expires = "";
    document.cookie = name + "=" + value + expires + "; path=/";
}

function readCookie(name) {
    var nameEQ = name + "=";
    var ca = document.cookie.split(';');
    for (var i = 0; i < ca.length; i++) {
        var c = ca[i];
        while (c.charAt(0) == ' ') c = c.substring(1, c.length);
        if (c.indexOf(nameEQ) == 0) return c.substring(nameEQ.length, c.length);
    }
    return null;
}

function eraseCookie(name) {
    createCookie(name, "", -1);
}

sessionCheckLogout();
