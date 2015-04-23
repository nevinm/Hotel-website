$(document).ready(function() {
    ipadWidth = 767;
    // renderFullPageJS();
    destroyFullPageJS();
    $(window).resize(function() {
        destroyFullPageJS();
    });
});

function renderFullPageJS() {
    $('#fullpage').fullpage({
        scrollingSpeed: 1000,
        slidesNavigation: true,
        controlArrows: false,
        navigation: true,
        // afterRender: function() {
        //     idInterval = setInterval(function() {
        //         $.fn.fullpage.moveSlideRight();
        //     }, 7000);
        // },
        // afterLoad: function(anchorLink, index) {
        //     clearInterval(idInterval);
        //     if (index == 1 || index == 2) {
        //         idInterval = setInterval(function() {
        //             $.fn.fullpage.moveSlideRight();
        //         }, 7000);
        //     } else {
        //         clearInterval(idInterval);
        //     }
        // }
    });
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
    });
}

function destroyFullPageJS() {
    if (window.innerWidth < ipadWidth) {
        if($.fn.fullpage.destroy){
            $.fn.fullpage.destroy('all');
        }
        renderMobileFullPageJs();
    } else {
        if($.fn.fullpage.destroy){
            $.fn.fullpage.destroy('all');
        }
        else{}
        renderFullPageJS();
    }
}


