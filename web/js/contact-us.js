$(document).ready(function() {
	
    if (localStorage['loggedIn'] == 'true'){
		$(".guest").hide();
		if(localStorage['user_profile']){
			var userDetails = JSON.parse(localStorage['user_profile']);
			$("#user-email").text("  ("+userDetails.email+")");
		}else{
			getProfile();
		}
	}else{
		$(".guest").show();
		$(".user-account").hide();
	}
	$("#send-message").on("click",function(e){
		e.preventDefault();
		if($("form").valid()){}
	});
    CartItemCount();
});
//Get profile API process
var getProfileCallback = {
    success: function(data, textStatus, profileId) {
        var userDetails = JSON.parse(data);
        if (userDetails.status == 1) {
        	$("#user-email").text("  ("+userDetails.email+")");
        } else {}
    },
    failure: function(XMLHttpRequest, textStatus, errorThrown) {}
}

function getProfile(profileId) {
    var url = baseURL + "get_profile/",
        header = {
            "session-key": localStorage["session_key"]
        },
        userData = {
            "get": 1
        };
    data = JSON.stringify(userData);
    var getProfileInstance = new AjaxHttpSender();
    getProfileInstance.sendPost(url, header, data, getProfileCallback, profileId);
}