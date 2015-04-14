
    
$(document).ready(function() {
      //Admin Login
    var adminCallback = {
            success: function(data, textStatus) {
                var adminDetails = JSON.parse(data);
                if(adminDetails.status==1){
                    var userName = adminDetails.user.first_name+ ' ' + adminDetails.user.last_name;
                    localStorage['username']=userName;
                    localStorage['session_key']=adminDetails.session_key;
                    localStorage['admin_loggedIn']=true;
                    localStorage['loggedIn']=false;
                    window.location.href = 'categories.html'
                }
                else{
                    alert(adminDetails.message);
                }
            },
            failure: function(XMLHttpRequest, textStatus, errorThrown) {
                console.log("Admin login Failed");
                alert("failed, please try again.")
            }
        }

        function adminLogin() {
            var adminUserName = $("#adminlogin-email").val();
                adminPassword = $("#adminlogin-password").val();
            var url = baseURL + 'login/';
            header = {},
            params = {
                "username": adminUserName,
                "password": adminPassword,
                "remember": 1,
                "is_admin":1
            }

            data = JSON.stringify(params);

            var loginAdminInstance = new AjaxHttpSender();
            loginAdminInstance.sendPost(url, header, data, adminCallback);
        }
        $("#login-button").on('click',function(){
            adminLogin();
        });
});


