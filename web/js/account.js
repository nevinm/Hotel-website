$(document).ready(function() {
// &ACCORDION
    $(".accordion-header").click(function(){
        $(".accordion-content").slideUp();
        if(!$(this).next().is(":visible"))
        {
            $(this).next().slideDown();
        }
    });

    // &NAVMENU - RESPONSIVE
    $('.icon-menu').on("click",function (){
		$('.navMenu').slideToggle();
	});
});