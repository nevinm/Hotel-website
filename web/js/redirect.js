function getrefferallFromUrl(name) {
    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
        results = regex.exec(location.search);
    return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
}

if(getrefferallFromUrl("refferalCode").length){
	window.location.replace("signup.html?ref=" + refferalCode);
}else{}

function redirectIfNotLoggedIn(){
	if(document.title=="Meisterdish - Log in"){
		if (localStorage['loggedIn'] == 'true' || localStorage['admin_loggedIn'] == 'true') {
	        window.location.href = '../index.html';
		} else {}
	}
	else{
	    if (localStorage['loggedIn'] == 'true' || localStorage['admin_loggedIn'] == 'true') {} else {
	        window.location.href = '../index.html';
	    }
	}
}
redirectIfNotLoggedIn();