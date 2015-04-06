var baseURL = 'http://meisterdish.qburst.com/backend/api/', 
    userDetails, currentPage=$("title").text();

//If already logged in
var $userentry = $('.login-signup');

function checkLoggedIn() {
    if(currentPage== "Meisterdish - Admin"){
        if(localStorage['admin_loggedIn'] == 'true'){
            $userentry.hide();
            $('#navbar-username a').text(localStorage['admin_username']);
        }
    }
    else{
        if (localStorage['loggedIn'] == 'true') {
            $userentry.hide();
            $('#navbar-username a').text(localStorage['username']);
            $(".account-header h2").text(localStorage['username'] + "'S ACCOUNT");
            $('#menu').addClass('menuPadding');
        } else {
            $userentry.show();
            $("#logout").hide();
            $('#menu').removeClass('menuPadding');
        }
    }

}

$(document).ready(function() {
    //Logout process
    $("#logout").on('click', function() {
        if(currentPage== "Meisterdish - Admin"){
            localStorage.removeItem('admin_username');
            localStorage.removeItem('admin_session_key');
            localStorage['admin_loggedIn'] = false;
            window.location.href= '../../index.html';
        } else {
            $('#navbar-username a').text('');
            $userentry.show();
            $('#menu').removeClass('menuPadding');
            $(".logout").addClass('hide');
            localStorage.removeItem('username');
            localStorage.removeItem('session_key');
            localStorage['loggedIn'] = false;
            window.location.href = '../index.html';
        }
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
        if($(".signup-redirect")){
            window.location.href = 'login.html'
        }
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
                    minlength: 6
                },
                password: {
                    required: true,
                    minlength: 6
                },
                email: {
                    required: true,
                    email: true
                },
                confirmpassword: {
                    required: true,
                    minlength: 6,
                    equalTo: "#newpassword"
                },
                repassword: {
                    required:true,
                    minlength:6,
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
                    minlength: "password shoudn't be less than 6"
                },
                username:{
                    required: "Plaese enter username",
                    minlength: "Name should contain atleast 2 characters",
                    maxlength: "Name should not contain more than 15 charcters"
                },
                confirmpassword: {
                    required: "Please provide a password",
                    minlength: "password shoudn't be less than 6",
                    equalTo: "password doesn't match"
                },
                repassword:{
                    required:"Please provide a password",
                    minlength:"password shoudn't be less than 6",
                    equalTo:"password doesn't match"
                },
                email: "enter a valid email address"
            }
        });
    });

if($.validator){
    $.validator.addMethod('letters', function(value) {
           return value.match(/^[- a-zA-Z]+$/);
    });
}
