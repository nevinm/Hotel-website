var sessionExpiryTime = 30;
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
        if (currentPage == "login" || currentPage == "how-it-works" ||
            currentPage == "checkout" || currentPage == "forgot-password" ||
            currentPage == "gift-cards-select" || currentPage == "giftcard-payment"     ||
            currentPage == "signup-fail" || currentPage == "meal-details" ||
            currentPage == "privacy-terms" || currentPage == "signup" ||
            currentPage == "menu" || currentPage == "reset-password" ||
            currentPage == "reset-passwordsuccess") {
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
