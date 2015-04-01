$(document).ready(function() {
	function redirectIfLoggedIn(){
        if (localStorage['loggedIn'] == 'true') 
        {
            window.location.href='../index.html';
        }
        else{
        }
    }
	//signup process
	var signupCallback = {
		success: function(data,textStatus){
			$('.signup-formcontainer')[0].reset();
			alert("Please proceed to login.");
			window.location.href=''
		},
		failure:function(XMLHttpRequest, textStatus, errorThrown){}
	}
	$('#signup-button').on('click',function(){
		signingup();
	});

	function signingup () {
		var url = baseURL+'signup/';
		header = {};
		var password = $('#signup-password').val();
		var first_name = $('#signup-firstname').val();
		var last_name = $('#signup-lastname').val();
		var email = $('#signup-email').val();

		var userInfo = {			
			"password": password,
			"first_name": first_name,
			"last_name": last_name,
			"email": email 
		}
		 data=JSON.stringify(userInfo);

		 var signupInstance = new AjaxHttpSender();
		 signupInstance.sendPost(url, header ,data,signupCallback);
	}
	
    redirectIfLoggedIn();
});
