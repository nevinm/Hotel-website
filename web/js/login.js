    function loggingIn() {
        var url = baseURL + "login/", header = {};
        var username = $("#username").val(),
        password=$("#password").val(), remember=1,
        userData={
            "username" : username,
            "password" : password,
            "remember" : remember
        },
        data=JSON.stringify(userData);
        var loginInstance = new AjaxHttpSender();
        loginInstance.sendPost(url, header, data, loginCallback);
    }

    //Login process
    var loginCallback = {
        success: function(data, textStatus) { 
            userDetails = JSON.parse(data);
            if(userDetails.status == -1){
                showPopup(userDetails);
            }
            else{
                $("#login-form")[0].reset();
                var user_name = userDetails.user.first_name+ ' '+ userDetails.user.last_name;
                localStorage['username']=user_name;
                localStorage['session_key']=userDetails.session_key;
                localStorage['loggedIn']=true;
                checkLoggedIn();
                window.location.href = 'menu.html'
            }
        },
        failure: function(XMLHttpRequest, textStatus, errorThrown) {}
    }

    function redirectIfLoggedIn(){
        if (localStorage['loggedIn'] == 'true') 
        {
            window.location.href='../index.html';
        }
        else{}
    }
    redirectIfLoggedIn();

$(document).ready(function() {
    //login form submit
    $("#login-button").on('click', function(e){
        e.preventDefault();
        loggingIn();
    });
});

