var baseURL = 'http://meisterdish.qburst.com/backend/api/',
    userDetails, currentPage = $("title").text();
//If already logged in
var $userentry = $('.login-signup');

function redirectIfLoggedIn() {
    if (localStorage['loggedIn'] == 'true') {
        window.location.href = '../index.html';
    } else {}
}

function dollarConvert(value) {
    var dollarValue = "$" + value;
    return dollarValue;
}

// delivery_time : 04-28-2015 20:15:20
function getCurrentDateTime(days){
    var currentdate = new Date();
    currentdate.setDate(currentdate.getDate()+days);
    return datetime = ('0' + (currentdate.getMonth()+1)).slice(-2)  + "-" 
                +('0'+ currentdate.getDate()).slice(-2) + "-"
                + currentdate.getFullYear();
}

function getCurrentHour() {
    var currentdate = new Date();
    var hours = currentdate.getHours();
    hours = hours % 12;
    hours = hours ? hours : 12; // the hour '0' should be '12'
    var strTime = hours;
    return strTime;
}

function getMonthDate(currentDate){
    return currentDate.replace(/\-/g, "/").substring(0, 5);
}


function getCurrentYear(){
    var currentdate = new Date();
    return currentdate.getFullYear();
}

function getDateTimeRequiredFormat(date){
    return date.replace(/\//g, "-");
}

function getParameterFromUrl(name) {
    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
        results = regex.exec(location.search);
    return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
}

function checkLoggedIn() {
    if (localStorage['loggedIn'] == 'true' || localStorage['admin_loggedIn'] == 'true') {
        $userentry.hide();
        $('#navbar-username a').text(localStorage['username']);
        $(".account-header h2").text(localStorage['username'] + "'S ACCOUNT");
        $('#menu').addClass('menuPadding');
        $('.delivery-info-container').show();
        $('.delivery-info-guest-container').hide();
    } else {
        $userentry.show();
        $("#logout").hide();
        $('#menu').removeClass('menuPadding');
        $('li#navbar-username').hide();
    }
}

function verifyAccount() {
    var verify_url = window.location.href;
    var search_verify = verify_url.indexOf("account_verify");
    var search_ve = verify_url.indexOf("email_verify");

    //email verification
    if (search_ve != -1 && search_ve != undefined) {
        var truemessage = {
            'message': "Your email is verified"
        }
        var falsemessage = {
            'message': "email is not verified"
        }
        if (verify_url.split("?")[1].split("=")[1] == "true") {
            showPopup(truemessage);
        } else {
            showPopup(falsemessage);
        }
    }
    if (search_verify != -1 && search_verify != undefined) {
        var trueMessage = {
            'message': "Account is verified, proceed to login"
        }
        var falseMessage = {
            'message': "account is not verified"
        }
        if (verify_url.split("?")[1].split("=")[1] == "true") {
            debugger;
            showPopup(trueMessage);
        } else {
            showPopup(falseMessage);
        }
    }
}

function logingOut() {
    $('#navbar-username a').text('');
    $userentry.show();
    $('#menu').removeClass('menuPadding');
    $(".logout").addClass('hide');
    localStorage.removeItem('username');
    localStorage.removeItem('session_key');
    localStorage.removeItem('cartItems');
    localStorage.removeItem('fb-id');
    localStorage.removeItem('user_profile');
    localStorage.removeItem('fb-image');
    localStorage['loggedIn'] = false;
    localStorage['admin_loggedIn'] = false;
    if (currentPage == "Meisterdish - Admin") {
        window.location.href = '../../index.html';
    } else {
        window.location.href = '../index.html';
    }
}


//SHOW POPUP
function showPopup(data) {
    var message = data.message;
    $('.popup-container .content span').text(message);
    $('.popup-wrapper').show();

    $('#close').on("click", function() {
        $('.popup-wrapper').hide();
        if (currentPage == "Meisterdish - Signup" || currentPage == "Meisterdish - Login") {
            if (localStorage['loggedIn'] == 'true' || localStorage['admin_loggedIn'] == 'true') {
                window.location.href = 'menu.html';
            }
        }
    })
}

//show Error popup
function showErrorPopup(data) {
    var message = data.message;
    $('.popup-container .content span').text(message);
    $('.delivery-address-error-popup-wrapper').show();
    $('#ok-button').on("click", function() {
        $('.delivery-address-error-popup-wrapper').hide();
    })
}
$(document).ready(function() {
    //Logout process
    $("#logout").on('click', function() {
        logingOut();
    });

    // &NAVMENU - RESPONSIVE
    $('.icon-menu').on("click", function() {
        $('.navMenu').slideToggle();
    });

    checkLoggedIn();
    verifyAccount();
    CartItemCount();
});

//JQuery Validation   
$("form").each(function() {
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
            fullname: {
                required: true,
                minlength: 2,
                maxlength: 20,
                letters: true
            },
            username: {
                required: true,
                minlength: 2,
                maxlength: 15,
            },
            mealname: {
                required: true,
                minlength: 3,
            },
            chef_name: {
                required: true,
                minlength: 3,
            },
            mealprice: {
                required: true,
                number: true
            },
            mealtax: {
                required: true,
                number: true
            },
            mealdescription: {
                required: true,
                minlength: 5
            },
            oldpassword: {
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
            confirmEmail: {
                required: true,
                email: true,
                equalTo: "#new-email"
            },
            phonenumber: {
                required: true,
                minlength: 10,
                maxlength: 15,
                number: true
            },
            confirmpassword: {
                required: true,
                minlength: 6,
                equalTo: "#newpassword"
            },
            repassword: {
                required: true,
                minlength: 6,
                equalTo: "#new-password"
            },
            zip: {
                required: true,
                number: true,
                minlength: 4,
                maxlength: 6
            },
            state: {
                required: true
            },
            city: {
                required: true
            },
            street: {
                required: true,
                letters: true,
                minlength: 4
            },
            building: {
                required: true,
                letters: true,
                minlength: 2
            },
            available: {
                required: true
            },
            category: {
                required: true
            },
            meal_type: {
                required: true
            },
            // image_upload :{
            //     required:true
            // }
        },
        messages: {
            firstname: {
                required: "Please enter your first name.",
                letters: "Name should contain only alphabets.",
                minlength: "Name should contain atleast 2 characters.",
                maxlength: "Name should not contain more than 15 charcters."
            },
            lastname: {
                required: "Please enter your last name.",
                letters: "Name should contain only alphabets.",
                minlength: "Name should contain atleast 2 characters.",
                maxlength: "Name should not contain more than 15 charcters."
            },
            phonenumber: "Provide a valid number.",
            fullname: {
                required: "Please enter your first name.",
                letters: "Name should contain only alphabets.",
                minlength: "Name should contain atleast 2 characters.",
                maxlength: "Name should not contain more than 15 charcters."
            },
            password: {
                required: "Please provide a password.",
                minlength: "Password should be of minimum 6 characters."
            },
            username: {
                required: "Plaese enter username.",
                minlength: "Name should contain atleast 2 characters.",
                maxlength: "Name should not contain more than 15 charcters."
            },
            confirmpassword: {
                required: "Please provide a password.",
                minlength: "Password should be of minimum 6 characters.",
                equalTo: "Password doesn't match."
            },
            repassword: {
                required: "Please provide a password.",
                minlength: "Password should be of minimum 6 characters.",
                equalTo: "Password doesn't match."
            },
            confirmEmail: {
                equalTo: "Email doesn't match.",
                required: "Please provide email."
            },
            email: "Enter a valid email address.",
            zip: "Provide a valid zip code.",
            street: "Provide a valid address.",
            building: "Provide a valid address.",
            state: "Provide a state name.",
            city: "Provide a city name.",
            mealprice: "Enter a valid meal price.",
            mealtax: "Enter a valid meal tax.",
            mealname: "Enter a valid meal name.",
            chef_name: "Enter a valid chef name.",
            mealdescription: "Meal description is not valid."
                // image_upload:"Please select an image."
        }
    });
});

if ($.validator) {
    $.validator.addMethod('letters', function(value) {
        return value.match(/^[- a-zA-Z]+$/);
    });
}

//CartItemCount
var CartItemCountCallback = {
    success: function(data, textStatus) {
        var numOfItems = JSON.parse(data);
        // setInterval(function() {
        //     $('span.c
        //     ount').animate({
        // //     height: '28px',
        // //     padding: '0px 10px',
        // //     fontSize: '16px'
        // //     });
        // // },3000);
        $('span.count').text(numOfItems.count);
    },
    failure: function(XMLHttpRequest, textStatus, errorThrown) {}
}

function CartItemCount() {
    var url = baseURL + 'get_cart_items_count/',
        header = {
            "session-key": localStorage["session_key"]
        },
        params = {};
    data = JSON.stringify(params);
    var CartItemCountInstance = new AjaxHttpSender();
    CartItemCountInstance.sendPost(url, header, data, CartItemCountCallback);
}


//Used to add form fields - paypal.
function addFormFields(form, data) {
    if (data != null) {
        $.each(data, function(name, value) {
            if (value != null) {
                var input = $("<input></input>").attr("type", "hidden").attr("name", name).val(value);
                form.append(input);
            }
        });
    }
}
