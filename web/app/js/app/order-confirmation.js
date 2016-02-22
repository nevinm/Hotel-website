(function(){
	localStorage.removeItem('orderConfirm');
	//Facebook pixel for tracking
	fbq('track', 'Purchase', {'value': cartValue, 'currency': 'USD'});
})();