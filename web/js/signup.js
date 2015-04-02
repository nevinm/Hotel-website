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
			userDetails = JSON.parse(data);
			if(userDetails.status == -1){
				showPopup(userDetails);
			}
			else{
			window.location.href='login.html';
			}
		},
		failure:function(XMLHttpRequest, textStatus, errorThrown){}
	}
	$('#signup-button').on('click',function(e){
			e.preventDefault();
		   if($('form').valid()){
		   		signingup();
   			}
		
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
