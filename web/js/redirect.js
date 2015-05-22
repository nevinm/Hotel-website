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