(function(){
    $('#signupEmail').text(userEmail);
	localStorage.removeItem('signupEmail');
	//Facebook tracking pixel
	fbq('track', 'CompleteRegistration');
})();