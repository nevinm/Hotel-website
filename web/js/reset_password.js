$(document).ready(function() {
    

    var token = window.location.href.split("=")[1],
                                        password,
                                        newpassword ,
                                        confirmpassword;
    //reset password process
    var resetPasswordCallback = {
        success: function(data,textStatus){
            $('#resetpassword-form')[0].reset();
            window.location.href='reset_passwordsuccess.html';
        },
        failure:function(XMLHttpRequest, textStatus, errorThrown){}
    }
    

    $('#resetpassword-button').on('click',function(){   
        newpassword = $('#newpassword').val();
        confirmpassword=  $('#confirm-newpassword').val();
        
        if( newpassword ==  confirmpassword){
            password = newpassword;
            resetingPassword(password,token);
        }
        else{
            alert("password doesn't match");
        }
    });

    function resetingPassword (password,token) {
        var url = baseURL+'reset_password/';
        header = {};
        var userInfo = { 
            "token":token,         
            "password": password 
        }
         data=JSON.stringify(userInfo);

         var resetpasswordInstance = new AjaxHttpSender();
         resetpasswordInstance.sendPost(url,header,data,resetPasswordCallback);
    }

});