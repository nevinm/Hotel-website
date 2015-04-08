	function setProfileImage(){
		var profileId="display-pic";
		getProfile(profileId);
	}

$(document).ready(function() {
	setProfileImage();
    $('#profile_picture_id').fileupload({
        dataType: 'json',
		headers: {
            "session-key": localStorage["session_key"]
        },       
        done: function (e, data) {
        	$("#display-pic").attr('src', data.result.url);
        }
    });
});