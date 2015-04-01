$(document).ready(function() {
    function redirectIfLoggedIn() {
            if (localStorage['loggedIn'] == 'true') {
                window.location.href = '../index.html';
            } else {}
        }
        //signup process
    var signupCallback = {
        success: function(data, textStatus) {
            $('.signup-formcontainer')[0].reset();
            alert("Please proceed to login.");
            window.location.href = 'login.html';
        },
        failure: function(XMLHttpRequest, textStatus, errorThrown) {}
    }
    $('#signup-button').on('click', function() {
        signingup();
    });

    function signingup() {
        var url = baseURL + 'signup/',
            header = {},
            password = $('#signup-password').val(),
            first_name = $('#signup-firstname').val(),
            last_name = $('#signup-lastname').val(),
            email = $('#signup-email').val(),
            fdId = JSON.parse(localStorage["fb-id"]);
			var userInfo = {
	            "password": password,
	            "first_name": first_name,
	            "last_name": last_name,
	            "email": email,
	            "fb_id": fdId
	        }
	        data = JSON.stringify(userInfo);

        var signupInstance = new AjaxHttpSender();
        signupInstance.sendPost(url, header, data, signupCallback);
    }

    redirectIfLoggedIn();
});
