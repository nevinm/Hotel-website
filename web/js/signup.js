$(document).ready(function() {
	var baseURL = 'http://meisterdish.qburst.com/backend/api/';

	//signup process
	var signupCallback = {
		success: function(data,textStatus){
			debugger;
			console.log(data);
			$('.signup-formcontainer')[0].reset();
		},
		failure:function(XMLHttpRequest, textStatus, errorThrown){}
	}
	$('#signup-button').on('click',function(){
		signingup();
	});

	function signingup () {
		var url = baseURL+'/signup/';
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
		 header= JSON.stringify(header);
		 data=JSON.stringify(userInfo);

		 var signupInstance = new AjaxHttpSender();
		 signupInstance.sendPost(url,data,signupCallback);
	}

});
