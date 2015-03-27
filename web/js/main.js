
$(document).ready(function() {
    $('#fullpage').fullpage({
    	css3: true,
    	scrollingSpeed:1000,
    	responsive: 1,
    	slidesNavigation: true,
    	controlArrows: false,
    	navigation:true
    });
    $('.icon-menu').on("click",function (e){
    	e.stopPropagation(); 
		$('.navMenu').slideToggle();
	});
});
