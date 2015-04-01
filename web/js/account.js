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
           alert("Success")
        },
        failure: function(XMLHttpRequest, textStatus, errorThrown) {}
    }

    $("#change-contact #update").on('click', function() {
        editContact();
    });

    function editContact() {
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
        $changeContactForm[0].reset();
        var changeContactInstance = new AjaxHttpSender();
        changeContactInstance.sendPost(url, header, data, editContactCallback);
    }

    redirectIfLoggedIn();
});
