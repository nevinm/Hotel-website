$(document).ready(function() {
    var baseURL = 'http://meisterdish.qburst.com/backend/api/';

    //send email
    var forgotPasswordCallback = {
        success: function(data,textStatus){
            $('#forgotpassword-form')[0].reset();
        },
        failure:function(XMLHttpRequest, textStatus, errorThrown){}
    }
    $('#forgotpassword-button').on('click',function(){
        sendEmail();
    });

    function sendEmail () {
        var url = baseURL+'/forgot_password/';
        header = {};
        var email = $('#forgotpassword-email').val();

        var userInfo = {          
            "email": email 
        }
         header = JSON.stringify(header);
         data = JSON.stringify(userInfo);

         var forgotpasswordInstance = new AjaxHttpSender();
         forgotpasswordInstance.sendPost(url,data,forgotPasswordCallback);
    }

});