function setProfileImage() {
    var profileId = "display-pic";
    getProfile(profileId);
}

$(document).ready(function() {
    setProfileImage();
    CartItemCount();
    var dummyData = {
        "get": 1
    }
    data = JSON.stringify(dummyData);
    $('#profile_picture_id').fileupload({
        add: function(e, data) {
            var acceptFileTypes = /^image\/(gif|jpe?g|png)$/i,
                error = {};
            if (data.originalFiles[0]['type'] && !acceptFileTypes.test(data.originalFiles[0]['type'])) {
                error.message = "Please check the file type";
                showPopup(error);
            } else if (data.originalFiles[0]['size'] && data.originalFiles[0]['size'] > 2000000) {
                error.message = "File type too big";
                showPopup(error);
            }
        },
        dataType: 'json',
        headers: {
            "session-key": localStorage["session_key"]
        },
        formData: {
            example: 'test'
        },
        done: function(e, data) {
            $("#display-pic").attr('src', data.result.thumbnail_url);
        }
    });

    $(".choose-pic-overlay").on('click', function() {
        $('#profile_picture_id').trigger('click');
    });
});
