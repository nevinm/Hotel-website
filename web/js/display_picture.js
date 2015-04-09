	function setProfileImage(){
		var profileId="display-pic";
		getProfile(profileId);
	}

$(document).ready(function() {
	setProfileImage();
    var dummyData={
        "get":1
    }
    data= JSON.stringify(dummyData);
    $('#profile_picture_id').fileupload({
        dataType: 'json',
		headers: {
            "session-key": localStorage["session_key"]
        },       
        formData:{example: 'test'},
        done: function (e, data) {
        	$("#display-pic").attr('src', data.result.thumbnail_url);
        }
    });
});