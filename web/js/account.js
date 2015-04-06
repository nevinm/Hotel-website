function redirectIfLoggedIn() {
    if (localStorage['loggedIn'] == 'true') {} else {
        window.location.href = '../index.html';
    }
}

function dollarConvert(value) {
    var dollarValue = "$" + value + ".00";
        return dollarValue;
}

function profileAutoPopulate(){
    var userDetails= JSON.parse(localStorage['user_profile']);
    if(currentPage=='Meisterdish - Change Contact'){
        $("#change-contact input[name='firstname']").val(userDetails.name);
        $("#change-contact input[name='phonenumber']").val(userDetails.mobile);
    }
}
    //Get profile API process
var getProfileCallback = {
    success: function(data, textStatus) {
        // if (data.status == 1) {
            var userDetails = JSON.parse(data);
            $(".cart span").text(userDetails.meals_in_cart_count);
            $(".account-credit").text(dollarConvert(userDetails.credits));
        // }
         // else {}
    },
    failure: function(XMLHttpRequest, textStatus, errorThrown) {}
}

function getProfile() {
    var url = baseURL + "get_profile/",
        header = {
            "session-key": localStorage["session_key"]
        },
        userData = {
            "get": 1
        };
    data = JSON.stringify(userData);
    var getProfileInstance = new AjaxHttpSender();
    getProfileInstance.sendPost(url, header, data, getProfileCallback);
}

$(document).ready(function() {
    // &ACCORDION
    $(".accordion-header").click(function() {
        $(".accordion-content").slideUp();
        if (!$(this).next().is(":visible")) {
            $(this).next().slideDown();
        }
    });

    // &NAVMENU - RESPONSIVE
    $('.icon-menu').on("click", function() {
        $('.navMenu').slideToggle();
    });

    //Change contact API process
    var editContactCallback = {
        success: function(data, textStatus) {
            alert("Success")
        },
        failure: function(XMLHttpRequest, textStatus, errorThrown) {}
    }

    $("#change-contact #update").on('click', function() {
        editContact();
    });

    function editContact() {
        var url = baseURL + "edit_profile/",
            $changeContactForm = $("#change-contact"),
            first_name = $changeContactForm.find("input[name=firstname]").val(),
            last_name = $changeContactForm.find("input[name=lastname]").val(),
            mobile_number = $changeContactForm.find("input[name=phonenumber]").val(),
            remember = 1,
            header = {
                "session-key": localStorage["session_key"]
            },
            userData = {
                "first_name": first_name,
                "last_name": last_name,
                "mobile": mobile_number
            },
            data = JSON.stringify(userData);
        $changeContactForm[0].reset();
        var changeContactInstance = new AjaxHttpSender();
        changeContactInstance.sendPost(url, header, data, editContactCallback);
    }

    //Change password API process
    var changePasswordCallback = {
        success: function(data, textStatus) {
            if (JSON.parse(data).status == 1) {
                console.log(data);
                alert("Password change success")
            }
        },
        failure: function(XMLHttpRequest, textStatus, errorThrown) {}
    }
    $('#updateButton').on('click', function(e) {
        e.preventDefault();
        if ($('form').valid()) {
            changePassword();
        }
    });

    function changePassword() {
        var oldpassword = $('#old-password').val(),
            newpassword = $('#new-password').val(),
            confirmpassword = $('#confirm-password').val(),
            remember = 1,
            header = {
                "session-key": localStorage["session_key"]
            },
            url = baseURL + "change_password/",

            userData = {
                "old_password": oldpassword,
                "new_password": newpassword
            },
            data = JSON.stringify(userData);
        var changePasswordInstance = new AjaxHttpSender();
        changePasswordInstance.sendPost(url, header, data, changePasswordCallback);
    }

    redirectIfLoggedIn();
    getProfile();
    profileAutoPopulate();
});
