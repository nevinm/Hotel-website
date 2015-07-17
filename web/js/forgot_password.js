$(document).ready(function() {
    CartItemCount();
    //send email
    var forgotPasswordCallback = {
        success: function(data, textStatus) {
            userDetails = JSON.parse(data);
            if(userDetails.status == -1){
                showPopup(userDetails);
            }
            else{
            $('#forgotpassword-form')[0].reset();
             var message = userDetails.message;
            $('.popup-container .content span').text(message);
            $('.popup-wrapper').show();
            }
        },
        failure: function(XMLHttpRequest, textStatus, errorThrown) {}
    }
    $('#forgotpassword-button').on('click', function(e) {
        e.preventDefault();        
        if($('form').valid()){
                sendEmail();
            }
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
