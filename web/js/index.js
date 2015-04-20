$(document).ready(function() {
      $('#fullpage').fullpage({
        scrollingSpeed: 1000,
        slidesNavigation: true,
        controlArrows: false,
        navigation: true,
        afterRender: function(){
            idInterval = setInterval(function () {
                $.fn.fullpage.moveSlideRight();
            }, 7000);
        },
        afterLoad: function (anchorLink, index) {
            clearInterval(idInterval);
            if (index == 1 || index ==2) {
                idInterval = setInterval(function () {
                    $.fn.fullpage.moveSlideRight();
                }, 7000);
            }
        else{
                clearInterval(idInterval);
            }
        }
    });
});
