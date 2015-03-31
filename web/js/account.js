$(document).ready(function() {
// &ACCORDION
    $(".accordion-header").click(function(){
        $(".accordion-content").slideUp();
        if(!$(this).next().is(":visible"))
        {
            $(this).next().slideDown();
        }
    });

    // &NAVMENU - RESPONSIVE
    $('.icon-menu').on("click",function (){
		$('.navMenu').slideToggle();
	});

    //Change contact API process
    var editContactCallback = {
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

    function editContact() {
        var url = baseURL + "edit_profile/", header = {};
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