$(document).ready(function() {
      $('#fullpage').fullpage({
        scrollingSpeed: 1000,
        slidesNavigation: true,
        controlArrows: false,
        navigation: true,
        autoScrolling: true,
        loopHorizontal: true, 
        afterRender: function(){
            idInterval = setInterval(function () {
                $.fn.fullpage.moveSlideRight();
            }, 7000);
        },
        afterLoad: function (anchorLink, index) {
            if (index == 2 || index ==1) {
                idInterval = setInterval(function () {
                    $.fn.fullpage.moveSlideRight();
                }, 7000);
            }
        }
    });
});
