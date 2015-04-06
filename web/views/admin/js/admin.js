$(document).ready(function() {
      //Admin Login
    var adminCallback = {
            success: function(data, textStatus) {
                var adminDetails = JSON.parse(data),
                userName = adminDetails.user.first_name+ ' '+ adminDetails.user.last_name;
                localStorage['admin_username']=userName;
                localStorage['admin_session_key']=adminDetails.session_key;
                localStorage['admin_loggedIn']=true;
                // checkLoggedIn();
                window.location.href = 'categories.html'
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
        $("#signup-button").on('click',function(){
            adminLogin();
        });
});


