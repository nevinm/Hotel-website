$(document).ready(function() {
    var baseURL = 'http://meisterdish.qburst.com/backend/api/';
    
    //Login process
    var loginCallback = {
        success: function(data, textStatus) {
            debugger;
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

        var loginInstance = new AjaxHttpSender();
        loginInstance.sendPost(url, data, loginCallback);
    }
});

