//Admin Login
var adminCallback = {
        success: function(data, textStatus) {
            var adminDetails = JSON.parse(data);
            if(adminDetails.status==1){
                var userName = adminDetails.user.first_name;
                localStorage['username']=userName;
                localStorage['session_key']=adminDetails.session_key;
                localStorage['admin_loggedIn']=true;
                localStorage['loggedIn']=false;
                localStorage['admin_loggedIn']=true;
                createCookie("SessionExpireTime", "true", 1);
                window.location.href = 'orderlist.html'
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
    var url = baseURL + 'cms/login/';
    header = {},
    params = {
        "username": adminUserName,
        "password": adminPassword,
        "remember": 1
    }

    data = JSON.stringify(params);

    var loginAdminInstance = new AjaxHttpSender();
    loginAdminInstance.sendPost(url, header, data, adminCallback);
}
$(document).ready(function() {
        $("#login-button").on('click',function(e){
            e.preventDefault();
            adminLogin();
        });
});


