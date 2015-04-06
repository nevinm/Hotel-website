    function redirectIfLoggedIn(){
        if (localStorage['loggedIn'] == 'true') 
        {
            
        }
        else{
            window.location.href='../index.html';
        }
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
            console.log(data);
            userDetails = JSON.parse(data);
            console.log(userDetails);

            // if(userDetails.status == -1){
                showPopup(userDetails);
            // }
            // else{
            //     showPopup(userDetails);
            //     window.location.href = 'account.html';
            // }
        },
        failure: function(XMLHttpRequest, textStatus, errorThrown) {}
    }

    $("#change-contact #updateButton").on('click', function(e) {
        e.preventDefault();
        if($('form#change-contact').valid()){
            editContact();
        }
    });

    function editContact() {
        alert("editcontact");
        var url = baseURL + "edit_profile/",
        $changeContactForm = $("#change-contact");
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
        success: function(data,textStatus){
            console.log(data);
            userDetails = JSON.parse(data);
            showPopup(userDetails);
        },
        failure:function(XMLHttpRequest, textStatus, errorThrown){}
    }
    $('#updatepassword').on('click',function(e){
        e.preventDefault();
        if($('form').valid()){
            changePassword();
            }
    });

    function changePassword(){
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
            data =  JSON.stringify(userData);
            var changePasswordInstance = new AjaxHttpSender();
            changePasswordInstance.sendPost(url, header, data, changePasswordCallback);
         }

    redirectIfLoggedIn();
});
