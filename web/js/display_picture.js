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
            error=[];
            if (data.originalFiles[0]['type'] && !acceptFileTypes.test(data.originalFiles[0]['type'])) {
                error.message = 'Not an accepted file type';
                showPopup(error);
                return;
            }
            if (data.originalFiles[0]['size'] && data.originalFiles[0]['size'] > 2000000) {
                error.message = 'Filesize is too big';
                showPopup(error);
                return;
            }
            else{
                data.submit();
            }
        },
        dataType: 'json',
        autoUpload: false,
        headers: {
            "session-key": localStorage["session_key"]
        },
        formData: {
            example: 'test'
        },
        // maxFileSize: 2000000,
        // acceptFileTypes: /(\.|\/)(gif|jpe?g|png)$/i,
        done: function(e, data) {
            $("#display-pic").attr('src', data.result.thumbnail_url);
        },
        fail: function(e, data) {
            $.each(data.messages, function(index, error) {
                console.log(error);
            });
        },
    });

    $(".choose-pic-overlay").on('click', function() {
        $('#profile_picture_id').trigger('click');
    });
});
