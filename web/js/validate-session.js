var sessionExpiryTime = 30,
//------ QA ----
        baseURL = 'http://meisterdish.qburst.com/backend/api/',
        homeUrl = "http://meisterdish.qburst.com",
        PROMO_CODE = "MEISTER20",
        GLOBAL = {
            APP_ID: '736537916455826'
        };
//
//------ LIVE ----
//        baseURL = 'http://meisterdish.com/backend/api/',
//        homeUrl = "http://www.meisterdish.com",
//        PROMO_CODE = "MEISTER20",
//        GLOBAL = {
//            APP_ID: '1412578365736463'
//        };
var SessionController = (function () {
    var data = {
        signUp: '6044372159257',
        placeOrder: '6044371585457',
        addToCart: '6044372168057'
    };
    function getSignUpPixel() {
        return data.signUp;
    }
    function getAddToCartPixel() {
        return data.addToCart;
    }
    function includePixel() {
        (function () {
            var _fbq = window._fbq || (window._fbq = []);
            if (!_fbq.loaded) {
                var fbds = document.createElement('script');
                fbds.async = true;
                fbds.src = '//connect.facebook.net/en_US/fbds.js';
                var s = document.getElementsByTagName('script')[0];
                s.parentNode.insertBefore(fbds, s);
                _fbq.loaded = true;
            }
        })();
        window._fbq = window._fbq || [];
    }
    function getPlaceOrderPixel() {
        return data.placeOrder;
    }
    function fbTrackConversionEvent(pixelId, value, currency) {
        var customData = {};
        customData.value = value;
        customData.currency = currency;
        _fbq.push(['track', pixelId, customData]);
        $('head').append('<noscript id="fbTrack"></noscript>');
        document.getElementById('fbTrack').innerHTML = '<img height="1" width="1" alt="" style="display:none" src="https://www.facebook.com/tr?ev=' + pixelId + '&amp;cd[value]=' + value + '&amp;cd[currency]=' + currency + '&amp;noscript=1" />';
    }
    return{
        getSignUpPixel: getSignUpPixel,
        getPlaceOrderPixel: getPlaceOrderPixel,
        includePixel: includePixel,
        fbTrackConversionEvent: fbTrackConversionEvent,
        getAddToCartPixel: getAddToCartPixel
    };
})();

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
                currentPage == "gift-cards-select" || currentPage == "giftcard-payment" ||
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
    } else
        var expires = "";
    document.cookie = name + "=" + value + expires + "; path=/";
}

function readCookie(name) {
    var nameEQ = name + "=";
    var ca = document.cookie.split(';');
    for (var i = 0; i < ca.length; i++) {
        var c = ca[i];
        while (c.charAt(0) == ' ')
            c = c.substring(1, c.length);
        if (c.indexOf(nameEQ) == 0)
            return c.substring(nameEQ.length, c.length);
    }
    return null;
}

function eraseCookie(name) {
    createCookie(name, "", -1);
}

function isLocalStorageNameSupported() {
    var testKey = 'test',
            storage = window.sessionStorage;
    try {
        storage.setItem(testKey, '1');
        storage.removeItem(testKey);
        return true;
    } catch (error) {
        debugger;
        location.href = homeUrl + '/views/incogneto-error.html';
    }
}

isLocalStorageNameSupported();
sessionCheckLogout();
