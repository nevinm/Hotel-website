$(document).ready(function() {
    var baseURL = 'http://meisterdish.qburst.com/backend/api/';

    //send email
    var forgotPasswordCallback = {
        success: function(data, textStatus) {
            alert("Sent to your email");
            $('#forgotpassword-form')[0].reset();
        },
        failure: function(XMLHttpRequest, textStatus, errorThrown) {}
    }
    $('#forgotpassword-button').on('click', function() {
        sendEmail();
    });

    function sendEmail() {
        var url = baseURL + '/forgot_password/';
        header = {},
        email = $('#forgotpassword-email').val(),
        userInfo = {
            "email": email
        }
        data = JSON.stringify(userInfo);

        var forgotpasswordInstance = new AjaxHttpSender();
        forgotpasswordInstance.sendPost(url, header, data, forgotPasswordCallback);
    }

});
