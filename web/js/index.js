$(document).ready(function() {
    ipadWidth = 767;
    isMobileRendered();
    destroyFullPageJS();
    CartItemCount();
});
var mobileRendered;

function renderFullPageJS() {
    $('#fullpage').fullpage({
        scrollingSpeed: 1000,
        slidesNavigation: true,
        controlArrows: false,
        navigation: true,
        afterResize: function() {
            destroyFullPageJS();
        }
    });
    mobileRendered = false;
}

function renderMobileFullPageJs() {
    $('#fullpage').fullpage({
        scrollingSpeed: 1000,
        slidesNavigation: false,
        controlArrows: true,
        navigation: false,
        autoScrolling: false,
        scrollBar: true,
        fitToSection: false,
        afterResize: function() {
            destroyFullPageJS();
        }
    });
    mobileRendered = true;
}

function isMobileRendered() {
    if (window.innerWidth <= ipadWidth) {
        mobileRendered = false;
    } else {
        mobileRendered = true;
    }
}

function destroyFullPageJS() {
    if (window.innerWidth < ipadWidth && mobileRendered == false) {
        if ($.fn.fullpage.destroy) {
            $.fn.fullpage.destroy('all');
        } else {}
        renderMobileFullPageJs();
    } else if (window.innerWidth >= ipadWidth && mobileRendered == true) {
        if ($.fn.fullpage.destroy) {
            $.fn.fullpage.destroy('all');
        } else {}
        renderFullPageJS();
    }
}
