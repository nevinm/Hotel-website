$(document).ready(function() {
    
    //Logout process

    // &NAVMENU - RESPONSIVE
    $('.icon-menu').on("click", function() {
        $('.navMenu').slideToggle();
    });

	$('.check').click("on",function(){
		debugger;
		$('.display').hide();
		$('#navbar-username').text("JOHN SMITH'S");
		$('span.count').text("5");
		$('#menu').addClass('topPadding');
	})
})
