$(document).ready(function() {
    var baseURL = 'http://meisterdish.qburst.com/backend/api/';

    //Login process
    var loginCallback = {
        success: function(data, textStatus) {
            var userDetails = JSON.parse(data),
            user_name = userDetails.user.first_name+ ' '+ userDetails.user.last_name;
            localStorage['username']=user_name;
            localStorage['session_key']=userDetails.session_key;
            localStorage['loggedIn']=true;
            checkLoggedIn();
        },
        failure: function(XMLHttpRequest, textStatus, errorThrown) {}
    }

    $("#login button").on('click', function(){
        loggingIn();
    });

    function loggingIn() {
        var url = baseURL + "login/", header = {};
        var username = $("#username").val(),
        password=$("#password").val(), remember=1,
        userData={
            "username" : username,
            "password" : password,
            "remember" : remember
        },
        header= JSON.stringify(header);
        data=JSON.stringify(userData);
        $("#login")[0].reset();
        var loginInstance = new AjaxHttpSender();
        loginInstance.sendPost(url, data, loginCallback);
    }
});

