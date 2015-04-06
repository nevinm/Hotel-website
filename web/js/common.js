var baseURL = 'http://meisterdish.qburst.com/backend/api/', 
    userDetails, currentPage=$("title").text();

//If already logged in
var $userentry = $('.login-signup');

function checkLoggedIn() {
        if (localStorage['loggedIn'] == 'true' || localStorage['admin_loggedIn'] == 'true') {
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
function verifyAccount(){
    var verify_url = window.location.href;
    var search_verify = verify.indexOf("verify");
    if(search_verify != -1){
        var trueMessage = {
            'message' : "Account is verified, proceed to login"
        }
        var falseMessage={
            'message':"account is not verified"
        }
        if(verify_url.split("?")[1].split("=")[1] == "true"){
            showPopup(trueMessage);
        }
        else{
            showPopup(falseMessage);
        }
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
            localStorage['loggedIn'] = false;
            localStorage['admin_loggedIn'] = false;
        if(currentPage== "Meisterdish - Admin"){
            window.location.href= '../../index.html';
        } else {
            window.location.href = '../index.html';
        }
    });

    // &NAVMENU - RESPONSIVE
    $('.icon-menu').on("click", function() {
        $('.navMenu').slideToggle();
    });

    checkLoggedIn();
    verifyAccount();
});
    
    //SHOW POPUP
    function showPopup(data){
        var message = data.message;
        $('.popup-container .content span').text(message);
        $('.popup-wrapper').show();
    }
    $('#close').on("click",function(){
        $('.popup-wrapper').hide();
        if($(".facebook-login").length){
            window.location.href='menu.html'
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
                confirmEmail:{
                    required:true,
                    email:true,
                    equalTo:"#new-email"
                },
                phonenumber: {
                    required:true,
                    minlength:10,
                    number :true
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
                confirmEmail:{
                     equalTo:"email doesn't match",
                     required:"please provide email"
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
