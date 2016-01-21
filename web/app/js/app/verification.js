$(document).ready(function(){
    $('#signupEmail').text(userEmail);
	localStorage.removeItem('signupEmail');
	//Facebook pixel for tracking
	fbq('track', 'CompleteRegistration');
	CartItemCount();
});