$(document).ready(function() {
      $('#fullpage').fullpage({
        scrollingSpeed: 1000,
        slidesNavigation: true,
        controlArrows: false,
        navigation: true,
    });

    $('.icon-menu').on("click", function() {
        $('.navMenu').slideToggle();
    });
});
