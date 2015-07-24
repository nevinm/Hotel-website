var baseURL = 'http://10.7.2.51:86/backend/api/',
    homeUrl = "http://meisterdish.com",
    userDetails, currentPage = $("title").text(),
    currentPageTitle,
    clicked = 0;
//If already logged in
var $userentry = $('.login-signup');

$(document).ready(function() {

    //Logout process
    $("#logout,.mobile-logout").on('click', function() {
        logingOut();
    });
    $('.socialMedia').on("click", function() {
        var clicked_id = $(this).attr('id');
        if (clicked_id == 'facebook') {
            window.open('http://www.facebook.com/meisterdish', '_blank');
        }
        if (clicked_id == 'twitter') {
            window.open('https://twitter.com/meisterdish', '_blank');
        }
        if (clicked_id == 'instagram') {
            window.open('http://instagram.com/meisterdish', '_blank');
        }
        if (clicked_id == 'pinterest') {
            window.open('http://pinterest.com/meisterdish', '_blank');
        }
    });

    //hide social media icons
    // $(".footer-links").remove();

    // &NAVMENU - RESPONSIVE
    $('.icon-menu').on("click", function() {
        clicked = 1;
        $('.navMenu').show();
        $('#header').animate({
                marginLeft: "80%"

            })
            // $("#page-container").css("position","fixed")
        $('#page-container').animate({
            marginLeft: "80%"
        })
        setTimeout(function() {
            $('#page-container').hide();
        })
        $('.navMenu').animate({
            marginLeft: "0"
        });
        setTimeout(function() {
            $('.icon-menu').addClass('icon-cancel').removeClass('icon-menu');
        }, 100)
    });
    $(document).on('click', '.icon-cancel', function() {
        clicked = 0;
        $('.navMenu').animate({
            marginLeft: "-80%"
        });
        // $("#page-container").css("position","relative");
        $('#page-container').animate({
            marginLeft: "0px"
        })
        setTimeout(function() {
            $('#page-container').show();
        }, 700)

        $('#header').animate({
            marginLeft: "0px"
        })
        setTimeout(function() {
            $('.icon-cancel').addClass('icon-menu').removeClass('icon-cancel');
        }, 600)
    });
    $(document).on('keydown', function(e) {
        var key = e.which;
        if (key == 13) // the enter key code
        {
            if ($('.popup-container').is(':visible')) {
                if ($('#ok-button').is(':visible')) {
                    $('#ok-button').trigger('click');
                }
                if ($('#no-button').is(":visible")) {
                    $('#no-button').trigger('click');
                }
                if ($('#ok').is(":visible")) {
                    window.location.href = $('#ok').attr('href');
                }
                if ($(".popup-container #see-menu").is(":visible")) {
                    $('.popup-container #see-menu')[0].click();
                }
                if ($('.popup-container').find('form').length === 0) {
                    e.preventDefault();
                    $('#close').trigger('click');
                }
            } else { ///for gift card form submit
                if ($("#gift-place-order").is(":visible")) {
                    if ($("#address").valid() && $("#pay-form").valid()) {
                        $("#gift-place-order").trigger("click");
                    }
                }
                if ($(".resetsuccess-container ").is(":visible") && $("#done-button").is(":visible")) {
                    $("#done-button")[0].click();
                }
            }
        }
    });

    verifyAccount();
});


function checkLoggedIn() {
    if (localStorage['loggedIn'] == 'true' || localStorage['admin_loggedIn'] == 'true') {
        $userentry.hide();
        $('#navbar-username a').text(localStorage['username']);
        $(".account-header h2").text(localStorage['username'] + "'S ACCOUNT");
        $('.delivery-info-container').show();
        $('.delivery-info-guest-container').hide();
        $('.delivery-info .checkout-header span').text('DELIVERY INFO');
    } else {
        $userentry.show();
        $("#logout").hide();
        $('li#navbar-username').hide();
        $('.delivery-info .checkout-header span').text('GUEST CUSTOMER DETAILS');
    }
    $("#menu").show();
}
checkLoggedIn();

function redirectIfLoggedIn() {
    if (localStorage['loggedIn'] == 'true') {
        window.location.href = '../index.html';
    } else {}
}

function dollarConvert(value) {
    var dollarValue = "$" + value;
    return dollarValue;
}

function getHourCorrected(Hour) {
    return (("0" + Hour).slice(-2));
}

// delivery_time : 04-28-2015 20:15:20
function getCurrentDateTime(days) {
    var currentdate = new Date();
    currentdate.setDate(currentdate.getDate() + days);
    return datetime = ('0' + (currentdate.getMonth() + 1)).slice(-2) +
        "-" + ('0' + currentdate.getDate()).slice(-2) + "-" + currentdate.getFullYear();
}

function getCurrentPageTitle() {
    return $("title").text();
}

function stringToDate(date, format, delimiter) {
    var formatLowerCase = format.toLowerCase();
    var formatItems = formatLowerCase.split(delimiter);
    var dateItems = date.split(delimiter);
    var monthIndex = formatItems.indexOf("mm");
    var dayIndex = formatItems.indexOf("dd");
    var yearIndex = formatItems.indexOf("yyyy");
    var month = parseInt(dateItems[monthIndex]);
    month -= 1;
    var formatedDate = new Date(dateItems[yearIndex], month, dateItems[dayIndex]);
    return formatedDate;
}

function convertToEST(timeRecieved) {
    //EST
    var offset = -4.0,
        clientDate = new Date(timeRecieved);
    utc = clientDate.getTime() + (clientDate.getTimezoneOffset() * 60000);
    serverDate = new Date(utc + (3600000 * offset));
    return serverDate;
}

function getEstFormattedForWebService(time) {
    var hours = time.getHours(),
        day = time.getDate(),
        months = time.getMonth() + 1,
        year = time.getFullYear();
    var selectedDate = (('0' + (time.getMonth() + 1)).slice(-2) +
        "-" + ('0' + time.getDate()).slice(-2) + "-" + time.getFullYear() + " " +
        getHourCorrected(hours) + ":00:00").replace(/\-/g, "/");
    return selectedDate;
}

function getCurrentDateMonth(days) {
    var currentdate = new Date(),
        month = [];
    currentdate.setDate(currentdate.getDate() + days);
    month[0] = "January";
    month[1] = "February";
    month[2] = "March";
    month[3] = "April";
    month[4] = "May";
    month[5] = "June";
    month[6] = "July";
    month[7] = "August";
    month[8] = "September";
    month[9] = "October";
    month[10] = "November";
    month[11] = "December";
    var monthName = month[currentdate.getMonth()];

    return dateMonth = ('0' + currentdate.getDate()).slice(-2) + " " + monthName;
}

function getStringAfterHash(url, symbol) {
    if (url.indexOf(symbol) != -1) {
        return url.substr(url.indexOf(symbol) + 1);
    } else {
        return false;
    }
}

function getCurrentHourMin() {
    var currentdate = new Date(),
        hours = currentdate.getHours(),
        minutes = ("0" + currentdate.getMinutes()).slice(-2),
        strTime = hours + ":" + minutes;
    return strTime;
}

function getMonthDate(currentDate) {
    return currentDate.replace(/\-/g, "/").substring(0, 5);
}


function getCurrentYear() {
    var currentdate = new Date();
    return currentdate.getFullYear();
}

function getDateTimeRequiredFormat(date) {
    return date.replace(/\//g, "-");
}

function getParameterFromUrl(name) {
    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
        results = regex.exec(location.search);
    return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
}


function getCurrentPage(firstChar, secondChar, url) {
    currentPage = url.substring(url.lastIndexOf(firstChar) + 1, url.lastIndexOf(secondChar));
    return currentPage;
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
            showPopup(trueMessage);
        } else {
            showPopup(falseMessage);
        }
    }
}

function logingOut() {
    $("#menu").hide();
    eraseCookie("SessionExpireTime");
    localStorage.removeItem('username');
    localStorage.removeItem('session_key');
    localStorage.removeItem('cartItems');
    localStorage.removeItem('fb-id');
    localStorage.removeItem('user_profile');
    localStorage.removeItem('delivery_addressess');
    localStorage.removeItem('fb-image');
    localStorage.removeItem('admin_role');
    localStorage.removeItem('referral_code');
    localStorage['loggedIn'] = false;
    localStorage['admin_loggedIn'] = false;
    $('#navbar-username a').text('');
    $userentry.show();
    $('#menu').removeClass('menuPadding');
    $(".logout").addClass('hide');
    currentPage = $("title").text();
    if (currentPage == "Meisterdish - Admin") {
        window.location.href = 'index.html';
    } else if (currentPage == "Meisterdish Home Page") {} else {
        window.location.href = '../index.html';
    }
}


//SHOW POPUP
function showPopup(data) {
    var message = data.message;
    $('.popup-container .content span').text(message);
    $('.popup-wrapper').show();
    if (data.status == -2) {
        $("#close").addClass("session-expire-close");
    }
}

//SHOW POPUP
function showSessionExpire(data) {
    var message = data.message;
    $('.popup-container .content span').text(message);
    $('.sessionexpire-wrapper').show();
}

$(document).on('click', '#close', function() {
    $('.popup-wrapper').hide();
    if (currentPage == "Meisterdish - Signup" || currentPage == "Meisterdish - Login") {
        if (localStorage['loggedIn'] == 'true' || localStorage['admin_loggedIn'] == 'true') {
            window.location.href = 'menu.html';
        }
    }
    if (getCurrentPageTitle() == 'Meisterdish - Gift Cards Payment') {
        if ($(".redirectApproved").length) {
            window.location.href = 'gift-cards-select.html';
        }
    }
    if ($(this).hasClass("session-expire-close")) {
        logingOut();
    }
});

//show Error popup
function showErrorPopup(data) {
    var message = data.message;
    $('.popup-container .content span').text(message);
    $('.error-popup-wrapper').show();
    $('#ok-button').on("click", function() {
        $('.error-popup-wrapper').hide();
    })
}


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
                minlength: 1,
                maxlength: 15,
                letters: true
            },
            fullname: {
                required: true,
                minlength: 3,
                maxlength: 20,
                letters: true
            },
            username: {
                required: true,
                minlength: 3,
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
            message: {
                required: true
            },
            password: {
                required: true,
                minlength: 6,
                maxlength: 20
            },
            date: {
                required: true
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
            promocode: {
                required: true,
                maxlength: 8
            },
            giftcard: {
                required: true,
                maxlength: 8
            },
            giftcardname: {
                required: true,
                maxlength: 8
            },
            zip: {
                // required: true,
                // number: true,
                // minlength: 4,
                // maxlength: 6,
                zipcode: true
            },
            state: {
                required: true
            },
            city: {
                required: true
            },
            street: {
                required: true,
                minlength: 4
            },
            building: {
                required: true,
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
            cardnumber: {
                required: true,
                creditcard: true
            },
            nameOnCard: {
                required: true,
                minlength: 2,
                maxlength: 20,
                letters: true
            },
            expiryMonth: {
                required: true
            },
            expiryYear: {
                required: true
            },
            cvv: {
                number: true,
                minlength: 3,
                maxlength: 4,
                required: true
            },
            url: {
                youtube_url: true
            },
            preperationtime: {
                required: true
            },
            tips_details: {
                required: true,
                minlength: 2
            },
            amount: {
                required: true,
                minAmount: 2
            },
            credits: {
                required: true,
                number: true,
                maxlength: 5
            },
            giftcardcustomamount: {
                required: true,
                decimal: true,
                minlength: 2,
                minAmount: 25
            },
            invitecode: {
                required: true
            },
            delivery_tip: {
                required: true,
                minAmount: 0,
                maxAmount: 10
            },
            new_category: {
                required: true,
                minlength: 3
            },
            update_category: {
                required: true,
                minlength: 3
            },
            tip: {
                required: true,
                number: true,
                maxAmount: 10,
                minAmount: 0
            },
            order: {
                required: true,
                number: true
            },
            calories: {
                required: true,
                number: true
            },
            dailyvalue: {
                number: true
            }
        },
        messages: {
            firstname: {
                required: "Please enter your first name.",
                letters: "Name should contain only alphabets.",
                minlength: "Name should contain at least 2 characters.",
                maxlength: "Name should not contain more than 15 charcters."
            },
            lastname: {
                required: "Please enter your last name.",
                letters: "Name should contain only alphabets.",
                minlength: "Name should contain at least 2 characters.",
                maxlength: "Name should not contain more than 15 charcters."
            },
            phonenumber: "Please enter as xxxxxxxxxx",
            fullname: {
                required: "Please enter your full name.",
                letters: "Name should contain only alphabets.",
                minlength: "Name should contain at least 2 characters.",
                maxlength: "Name should not contain more than 15 charcters."
            },
            password: {
                required: "Please provide a password.",
                minlength: "Password should be of minimum 6 characters."
            },
            calories: {
                required: "Please enter calories",
                number: "Please enter a number"
            },
            username: {
                required: "Please enter username.",
                minlength: "Name should contain at least 2 characters.",
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
            message: {
                required: "Please enter a message",
            },
            confirmEmail: {
                equalTo: "Email doesn't match.",
                required: "Please provide email."
            },
            giftcardcustomamount: {
                required: "Please enter an amount.",
                minAmount: "Enter a min amount of 25",
                decimal: "Please enter a whole number."
            },
            amount: {
                required: "Please enter an amount.",
                minAmount: "Enter a valid amount"
            },
            credits: {
                required: "Please enter an amount",
                number: "Enter a valid number"
            },
            delivery_tip: {
                required: "Please enter a valid tip",
                minAmount: "Enter amount between 1 and 10",
                maxAmount: "Enter amount between 1 and 10"
            },
            preperationtime: {
                required: "Please enter prepared time"
            },
            dailyvalue: {
                number: "Should be a number"
            },
            nameOnCard: "Enter valid name.",
            expiryMonth: "Enter exp month.",
            expiryYear: "Enter exp year.",
            email: "Enter a valid email address.",
            zip: "Provide a valid zip.",
            street: "Provide a valid address.",
            building: "Provide a valid address.",
            state: "Provide a state name.",
            city: "Provide a city name.",
            mealprice: "Enter a valid meal price.",
            mealtax: "Enter a valid meal tax.",
            mealname: "Enter a valid meal name.",
            message: "Enter a message.",
            chef_name: "Enter a valid chef name.",
            mealdescription: "Meal description is not valid.",
            cvv: "provide a valid cvv.",
            url: "Enter valid url.",
            tips_details: "Enter valid title.",
            invitecode: "Enter Invitecode",
            date: "Please enter date",
            promocode: "Please enter valid promocode.",
            giftcard: "Please enter valid code.",
            tip: {
                required: "Please enter tip",
                number: "Enter a number less than 10.",
                maxAmount: "Enter a number less than 10.",
                minAmount: "Enter a number greater than 0."
            },
            giftcardname: "Enter valid giftcardname.",
            order: "Enter valid Order."
                // image_upload:"Please select an image."
        }
    });
});

if ($.validator) {
    $.validator.addMethod('letters', function(value) {
        return value.match(/^[- a-zA-Z]+$/);
    });
    $.validator.addMethod('youtube_url', function(value) {
        return value.match(/^(?:https?:\/\/)?(?:www\.)?youtube\.com\/watch\?(?=.*v=((\w|-){11}))(?:\S+)?$/);
    });
    $.validator.addMethod('minAmount', function(value, el, param) {
        return value >= param;
    });
    $.validator.addMethod('maxAmount', function(value, el, param) {
        return value <= param;
    });
    $.validator.addMethod('zipcode', function(value) {
        return value.match(/\d{5}-\d{4}$|^\d{5}$/);
    });
    $.validator.addMethod('decimal', function(value, element) {
        return this.optional(element) || /^[0-9,]+$/.test(value);
    });
    $.validator.addMethod('positiveNumber', function(value) {
        return Number(value) > 0;
    });
}

//CartItemCount
var CartItemCountCallback = {
    success: function(data, textStatus) {
        var numOfItems = JSON.parse(data);
        if (numOfItems.status == 1) {
            $('span.count').text(numOfItems.count);
        } else {
            $('span.count').text('0');
        }
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

$(window).resize(function() {
    mobileResponsive();
});

$(window).load(function() {
    mobileResponsive();
});

function mobileResponsive() {
    if ($(window).width() <= 767 && $(window).width() >= 320) {
        if (clicked == 1) {
            $('#page-container').css("margin-left", "60%");
            $('#header').css("margin-left", "60%");
        }
    } else {
        $('#page-container').css("margin-left", "0px");
        $('#header').css("margin-left", "0px");
    }
}

function convertToEmbedded(url) {
    var regExp = /^.*(youtu.be\/|v\/|u\/\w\/|embed\/|watch\?v=|\&v=)([^#\&\?]*).*/;
    var match = url.match(regExp);

    if (match && match[2].length == 11) {
        return match[2];
    } else {
        return 'error';
    }
}
