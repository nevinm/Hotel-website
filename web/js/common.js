$(document).ready(function() {
	var json = {
			"username": "user_2",
			"meals_in_cart": [],
			"profile_image": "/media/g",
			"credits": 3,
			"is_admin": false,
			"id": 5,
			"name": "Last First",
			"mobile": "987654321",
			"meals_in_cart_count": 0,
			"email": "nazz007online@gmail.com",
			"sms_notification": false
		}
	$('.check').click("on",function(){
		debugger;
		$('.display').hide();
		$('#navbar-username').text("JOHN SMITH'S");
		$('span.count').text("5");
		$('#menu').addClass('topPadding');
	})
})