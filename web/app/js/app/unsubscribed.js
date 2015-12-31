$(document).ready(function() {
	CartItemCount();
	var result  = getParameterFromUrl("subscribe");
	if(result == "error"){
		$("p.main-header").text("You are not subscribed.")
	}
	if (result == "success") {
		$("p.main-header").text("Unsubscribed.");
	}
});
