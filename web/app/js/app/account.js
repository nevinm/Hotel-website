//Revealing Prototype Pattern
var account = null;
var userDetails;
var AccountController = function () {
};
AccountController.prototype = function () {
    var profileAutoPopulate = function () {
        var currentPage = $("title").text();
        userDetails = JSON.parse(localStorage['user_profile']);
        if (currentPage == 'Meisterdish - Change Contact') {
            $("#change-contact input[name='firstname']").val(userDetails.first_name);
            $("#change-contact input[name='lastname']").val(userDetails.last_name);
            $("#change-contact input[name='phonenumber']").val(userDetails.mobile);
            $('input[name=notification]').prop('checked', userDetails.sms_notification);
        }
        if (currentPage == 'Meisterdish -Change Email') {
            $('.current-email-container span').text(userDetails.email);
            $('input[name=notification]').prop('checked', userDetails.email_promotions);
            $('#hidden-email-promotion').val(userDetails.email_promotions);
        }
        if (currentPage == 'Meisterdish - Account') {
            $(".small-profile-pic").attr('src', userDetails.profile_image_thumb);
        }
    };
    var showAdminLink = function () {
        if (localStorage['admin_loggedIn'] == 'true') {
            $(".admin-button").show();
        } else {
            $(".admin-button").hide();
        }
    };
    var getProfile = function (profileId) {
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
    };
    //Get profile API process
    var getProfileCallback = {
        success: function (data, textStatus, profileId) {
            var userDetails = JSON.parse(data);
            if (userDetails.status == 1) {
                localStorage['user_profile'] = data;
                $(".account-credit").text("$" + parseFloat((userDetails.credits)).toFixed(2));
                profileAutoPopulate();
                if (profileId) {
                    if (userDetails.profile_image_thumb != "Not Available") {
                        $("#" + profileId).attr('src', userDetails.profile_image_thumb);
                    } else {
                        $("#" + profileId).attr('src', '../images/blank-person.png');
                    }
                }
            } else {
                showPopup(userDetails);
            }
        },
        failure: function (XMLHttpRequest, textStatus, errorThrown) {
        }
    };
    var editContact = function () {
        var url = baseURL + "edit_profile/",
                $changeContactForm = $("#change-contact"),
                first_name = $changeContactForm.find("input[name=firstname]").val(),
                last_name = $changeContactForm.find("input[name=lastname]").val(),
                mobile_number = $changeContactForm.find("input[name=phonenumber]").val(),
                remember = 1,
                isSendSms = 0;
        if ($('input[name=notification]').prop('checked')) {
            isSendSms = 1;
        }
        header = {
            "session-key": localStorage["session_key"]
        }
        userData = {
            "first_name": first_name,
            "last_name": last_name,
            "mobile": mobile_number,
            "sms_notification": isSendSms
        };
        data = JSON.stringify(userData);
        var changeContactInstance = new AjaxHttpSender();
        changeContactInstance.sendPost(url, header, data, editContactCallback);
    }
    //Change contact API process
    var editContactCallback = {
        success: function (data, textStatus) {
            userDetails = JSON.parse(data);
            if (userDetails.status == 1) {
                showPopup(userDetails);
                newName = $("#change-contact").find("input[name=firstname]").val();
                $('#navbar-username a').text(newName);
                localStorage['username'] = newName;
            } else {
                showPopup(userDetails);
            }

        },
        failure: function (XMLHttpRequest, textStatus, errorThrown) {
        }
    };
    var changePassword = function () {
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
    };
    //Change password API process
    var changePasswordCallback = {
        success: function (data, textStatus) {
            userDetails = JSON.parse(data);
            showPopup(userDetails);
            $('#change-password')[0].reset();
        },
        failure: function (XMLHttpRequest, textStatus, errorThrown) {
        }
    };
    var changeEmail = function () {
        var url = baseURL + "change_email/",
                newemail = $('#change-email').find('input[name=email]').val();
        isEmailPromotion = 0;
        if ($('input[name=notification]').prop('checked')) {
            isEmailPromotion = 1;
        }
        header = {
            "session-key": localStorage["session_key"]
        },
        userData = {
            "email": newemail,
            "email_promotion": isEmailPromotion
        },
        data = JSON.stringify(userData);
        var changeEmailInstance = new AjaxHttpSender();
        changeEmailInstance.sendPost(url, header, data, changeEmailCallback);
    };
    //Change email API process
    var changeEmailCallback = {
        success: function (data, textStatus) {
            userDetails = JSON.parse(data);
            showPopup(userDetails);
            if (userDetails.status == 1) {
                $('#change-email')[0].reset();
                $('input[name=notification]').prop('checked', userDetails.email_promotion);
                $('#hidden-email-promotion').val(userDetails.email_promotion);
            } else {
            }

        },
        failure: function (XMLHttpRequest, textStatus, errorThrown) {
        }
    };
    return{
        editContact: editContact,
        changePassword: changePassword,
        changeEmail: changeEmail,
        getProfile: getProfile,
        showAdminLink: showAdminLink
    };
}();
$(document).ready(function () {
    account = new AccountController();
    $("#change-contact #updateButton").on('click', function (e) {
        e.preventDefault();
        if ($('form#change-contact').valid()) {
            account.editContact();
        }
    });
    $('#updatepassword').on('click', function (e) {
        e.preventDefault();
        if ($('form').valid()) {
            account.changePassword();
        }
    });
    $('input[name=notification]').on("click", function () {
        $('#change-email').validate().resetForm();
    });

    $('#update-email').on('click', function (e) {
        e.preventDefault();
        var checkBoxState = JSON.parse($('#hidden-email-promotion').val());
        if ($('input[name=notification]').prop('checked') == checkBoxState) {
            if ($('form').valid()) {
                account.changeEmail();
            }
        } else {
            if ($('#change-email').find('input[name=email]').val() == "" &&
                    $('#change-email').find('input[name=confirmEmail]').val() == "") {
                account.changeEmail();
            } else {
                if ($('form').valid()) {
                    account.changeEmail();
                }
            }
        }
    });
    account.getProfile();
    CartItemCount();
    account.showAdminLink();
});
