$(document).ready(function() {
    

    var token = window.location.href.split("=")[1],
                                        password,
                                        newpassword ,
                                        confirmpassword;
    //reset password process
    var resetPasswordCallback = {
        success: function(data,textStatus){
            $('#resetpassword-form')[0].reset();
            userDetails = JSON.parse(data);
            if(userDetails.status == -1){
                showPopup(userDetails);
            }
            else{
            window.location.href='reset_passwordsuccess.html';
            }
        },
        failure:function(XMLHttpRequest, textStatus, errorThrown){}
    }
    

    $('#resetpassword-button').on('click',function(e){   
        e.preventDefault();
        if($('form').valid()){
            newpassword = $('#newpassword').val();
            confirmpassword=  $('#confirm-newpassword').val();
            password = newpassword;
            resetingPassword(password,token);
            }
    });

    function resetingPassword (password,token) {
        alert("asd");
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