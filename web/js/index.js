$(document).ready(function() {
    ipadWidth = 767;
    isMobileRendered();
    destroyFullPageJS();
    CartItemCount();

    $(".check-delivery").on('click', function(e) {
        e.preventDefault();
        var zipcode = $("#zip-code").val();
        if($("form.zip-code-container").valid()){    
            locationCheck(zipcode);
        }
    });

    $("body").on("load",isSessionExpired);
    
    $('#submit-email').on("click",function(e){
        e.preventDefault();
        var email = $('input[type=email]').val(),
            zipcode = $('#zip-code').val();
        if($('form#validate-email').valid()){
            saveEmail(email,zipcode);
        }
    });
    $('.delivery-area-check-popup img#cancel').on("click",function(){
        $('.delivery-area-check-popup').fadeOut();
    });
});
var mobileRendered;

function isSessionExpired() {
    if (localStorage.getItem("session-expired") === null) {} else {
        var data = {};
        data.message = "Your session has expired, please login.";
        showPopup(data);
        localStorage.removeItem('session-expired');
    }
}

function renderFullPageJS() {
    $('#fullpage').fullpage({
        scrollingSpeed: 1000,
        slidesNavigation: true,
        controlArrows: false,
        navigation: true,
        afterResize: function() {
            destroyFullPageJS();
        }
    });
    mobileRendered = false;
}

function renderMobileFullPageJs() {
    $('#fullpage').fullpage({
        scrollingSpeed: 1000,
        slidesNavigation: false,
        controlArrows: true,
        navigation: false,
        autoScrolling: false,
        scrollBar: true,
        fitToSection: false,
        afterResize: function() {
            destroyFullPageJS();
        }
    });
    mobileRendered = true;
}

function isMobileRendered() {
    if (window.innerWidth <= ipadWidth) {
        mobileRendered = false;
    } else {
        mobileRendered = true;
    }
}

function destroyFullPageJS() {
    if (window.innerWidth < ipadWidth && mobileRendered == false) {
        if ($.fn.fullpage.destroy) {
            $.fn.fullpage.destroy('all');
        } else {}
        renderMobileFullPageJs();
    } else if (window.innerWidth >= ipadWidth && mobileRendered == true) {
        if ($.fn.fullpage.destroy) {
            $.fn.fullpage.destroy('all');
        } else {}
        renderFullPageJS();
    }
}

//Get reviews API process
var locationCheckCallback = {
    success: function(data, textStatus) {
        var userDetails = JSON.parse(data);
        if (userDetails.status == 1) {
            $('#close').remove();
            $('#see-menu').remove();
            $('.popup .header').append('<img src="images/cross_black.png" id="close">');
            $('.popup .button').append("<a href='views/menu.html' class='btn btn-large-secondary' id='see-menu'>"+"SEE MENU"+"</a>");
            showPopup(userDetails);
        }else{
            showLocationCheckPopup(userDetails);
        }
    },
    failure: function(XMLHttpRequest, textStatus, errorThrown) {}
}

function locationCheck(zipcode) {
    var url = baseURL + "check_delivery/",
        header = {
            "session-key": localStorage["session_key"]
        },
        userData = {
            'zip': zipcode
        };
    data = JSON.stringify(userData);
    var locationCheckInstance = new AjaxHttpSender();
    locationCheckInstance.sendPost(url, header, data, locationCheckCallback);
}

function showLocationCheckPopup(userDetails){
    var message = userDetails.message;
    $('.delivery-area-check-popup .deliver-message span').text(message);
    $('.delivery-area-check-popup').show();
}

//Get reviews API process
var saveEmailCallback = {
    success: function(data, textStatus) {
        var userDetails = JSON.parse(data);
        if (userDetails.status == 1) {
            $('.delivery-area-check-popup').hide();
            showPopup(userDetails);
        } else {
            showPopup(userDetails);
        }
    },
    failure: function(XMLHttpRequest, textStatus, errorThrown) {}
}

function saveEmail(email,zipcode){
    var url = baseURL + "save_email/",
        header = {
            "session-key": localStorage["session_key"]
        },
        userData = {
            'email' : email,
            'zipcode': zipcode
        };
    data = JSON.stringify(userData);
    var saveEmailInstance = new AjaxHttpSender();
    saveEmailInstance.sendPost(url, header, data, saveEmailCallback);
}