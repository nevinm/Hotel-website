function redirectIfLoggedIn() {
    if (localStorage['loggedIn'] == 'true' || localStorage['admin_loggedIn'] == 'true') {} else {
        window.location.href = '../index.html';
    }
}

function profileAutoPopulate() {
    var userDetails = JSON.parse(localStorage['user_profile']);
    if (currentPage == 'Meisterdish - Change Contact') {
        $("#change-contact input[name='firstname']").val(userDetails.first_name);
        $("#change-contact input[name='lastname']").val(userDetails.last_name);
        $("#change-contact input[name='phonenumber']").val(userDetails.mobile);
    }
    if(currentPage== 'Meisterdish - Account'){
        $(".small-profile-pic").attr('src', userDetails.profile_image_thumb);
    }
}

function showAdminLink() {
        if (localStorage['admin_loggedIn'] == 'true') {
            $(".admin-button").show();
        } else {
            $(".admin-button").hide();
        }
    }
    //Get profile API process
var getProfileCallback = {
    success: function(data, textStatus, profileId) {
        var userDetails = JSON.parse(data);
        if (userDetails.status == 1) {
            localStorage['user_profile'] = data;
            $(".cart span").text(userDetails.meals_in_cart_count);
            $(".account-credit").text(dollarConvert(userDetails.credits));
            profileAutoPopulate();
            if(profileId){
                if(userDetails.profile_image_thumb!= "Not Available"){
                    $("#"+profileId).attr('src',userDetails.profile_image_thumb);
                }
                else{
                    $("#"+profileId).attr('src','../images/blank-person.png');
                }
            }
        } 
        else {}
    },
    failure: function(XMLHttpRequest, textStatus, errorThrown) {}
}

function getProfile(profileId) {
    var url = baseURL + "get_profile/",
        header = {
            "session-key": localStorage["session_key"]
        },
        userData = {
            "get": 1
        };
    data = JSON.stringify(userData);
    var getProfileInstance = new AjaxHttpSender();
    getProfileInstance.sendPost(url, header, data, getProfileCallback, profileId);
}

$(document).ready(function() {
    // &ACCORDION
    $(".accordion-header").click(function() {
        $(".accordion-content").slideUp();
        if (!$(this).next().is(":visible")) {
            $(this).next().slideDown();
        }
    });

    //Change contact API process
    var editContactCallback = {
        success: function(data, textStatus) {
            userDetails = JSON.parse(data);
            showPopup(userDetails);
            newName = $("#change-contact").find("input[name=firstname]").val();
            $('#navbar-username a').text(newName);
            localStorage['username'] = newName;
        },
        failure: function(XMLHttpRequest, textStatus, errorThrown) {}
    }

    $("#change-contact #updateButton").on('click', function(e) {
        e.preventDefault();
        if ($('form#change-contact').valid()) {
            editContact();
        }
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
        var changeContactInstance = new AjaxHttpSender();
        changeContactInstance.sendPost(url, header, data, editContactCallback);
    }

    //Change password API process
    var changePasswordCallback = {
        success: function(data, textStatus) {
            userDetails = JSON.parse(data);
            showPopup(userDetails);
            $('#change-password')[0].reset();
        },
        failure: function(XMLHttpRequest, textStatus, errorThrown) {}
    }
    $('#updatepassword').on('click', function(e) {
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
    showAdminLink();
});

//Change email API process
var changeEmailCallback = {
    success: function(data, textStatus) {
        userDetails = JSON.parse(data);
        showPopup(userDetails);
        $('#change-email')[0].reset();
    },
    failure: function(XMLHttpRequest, textStatus, errorThrown) {}
}

$('#update-email').on('click', function(e) {
    e.preventDefault();
    if ($('form').valid()) {
        changeEmail();
    }
});

function changeEmail() {
    var url = baseURL + "change_email/",
        newemail = $('#change-email').find('input[name=email]').val(),
        header = {
            "session-key": localStorage["session_key"]
        },
        userData = {
            "email": newemail
        },
        data = JSON.stringify(userData);
    var changeEmailInstance = new AjaxHttpSender();
    changeEmailInstance.sendPost(url, header, data, changeEmailCallback);
}

//show addaddress popup 

$('#add-address').on("click", function() {
    $(".addaddress-popup")[0].reset();
    $(".addresspopup-wrapper").show();
    $("#savepopup-data").hide();
    $("#addpopup-data").show();
});
$('#cancel').on("click", function() {
    $(".addresspopup-wrapper").hide();
});

//show edit address popup
$(document).on("click", ".edit-address", function() {
    currentId = $(this).data().id;
    $("#savepopup-data").attr("data-id", currentId);
    populateAddressToForm(currentId);
    $(".addresspopup-wrapper").show();
    $("#addpopup-data").hide();
    $("#savepopup-data").show();
})
