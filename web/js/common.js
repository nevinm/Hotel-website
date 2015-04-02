var baseURL = 'http://meisterdish.qburst.com/backend/api/', 
                                                userDetails;
//If already logged in
var $userentry=$('.login-signup');
function checkLoggedIn(){
	if (localStorage['loggedIn'] == 'true') 
	{
        $userentry.hide();
        $('#navbar-username a').append(localStorage['username']);
        $('#menu').addClass('menuPadding');
    }
    else{
    	$userentry.show();
    	$("#logout").hide();
    	$('#menu').removeClass('menuPadding');
    }
}

$(document).ready(function() {
    //Logout process
    $("#logout").on('click', function() {
    	$('#navbar-username a').text('');
        $userentry.show();
        $('#menu').removeClass('menuPadding');
        $(".logout").addClass('hide');
        localStorage.removeItem('username');
        localStorage.removeItem('session_key');
        localStorage['loggedIn']=false;
        window.location.href='../index.html';
    });

    // &NAVMENU - RESPONSIVE
    $('.icon-menu').on("click", function() {
        $('.navMenu').slideToggle();
    });

    checkLoggedIn();
});
    
    //SHOW POPUP
    function showPopup(data){
        var message = data.message;
        $('.popup-container .content span').text(message);
        $('.popup-wrapper').show();
    }
    $('#close').on("click",function(){
        $('.popup-wrapper').hide();
    });
   
   
    //JQuery Validation   
    $("form").each(function(){
        $(this).validate({
        rules: {
                firstname: {
                    required: true,
                    minlength: 2,
                    maxlength: 15,
                    letters: true
                },
                lastname: {
                    required: true,
                    minlength: 2,
                    maxlength: 15,
                    letters: true
                },
                username:{
                    required: true,
                    minlength: 2,
                    maxlength: 15,
                },
                oldpassword:{
                    required: true,
                    minlength: 4
                },
                password: {
                    required: true,
                    minlength: 4
                },
                email: {
                    required: true,
                    email: true
                },
                confirmpassword: {
                    required: true,
                    minlength: 4,
                    equalTo: "#newpassword"
                },
                repassword: {
                    required:true,
                    minlength:4,
                    equalTo: "#new-password"
                }
            },
            messages: {
                firstname: {
                    required: "Please enter your first name",
                    letters: "Name should contain only alphabets",
                    minlength: "Name should contain atleast 2 characters",
                    maxlength: "Name should not contain more than 15 charcters"
                },
                lastname: {
                    required: "Please enter your last name",
                    letters: "Name should contain only alphabets",
                    minlength: "Name should contain atleast 2 characters",
                    maxlength: "Name should not contain more than 15 charcters"
                },
                password: {
                    required: "Please provide a password",
                    minlength: "password shoudn't be short"
                },
                username:{
                    required: "Plaese enter username",
                    minlength: "Name should contain atleast 2 characters",
                    maxlength: "Name should not contain more than 15 charcters"
                },
                confirmpassword: {
                    required: "Please provide a password",
                    minlength: "password shoudn't be short",
                    equalTo: "password doesn't match"
                },
                repassword:{
                    required:"Please provide a password",
                    minlength:"password shoudn't be short",
                    equalTo:"password doesn't match"
                },
                email: "enter a valid email address"
            }
        });
    });
$.validator.addMethod('letters', function(value) {
       return value.match(/^[- a-zA-Z]+$/);
   });
