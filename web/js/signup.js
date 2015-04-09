//signup process
var signupCallback = {
    success: function(data, textStatus) {
        $('.signup-formcontainer')[0].reset();
        userDetails = JSON.parse(data);
        if (userDetails.status == -1) {
            showPopup(userDetails);
        } else {
            showPopup(userDetails);
        }
    },
    failure: function(XMLHttpRequest, textStatus, errorThrown) {}
}

function signingup() {
    var url = baseURL + 'signup/',
        header = {},
        fbId = '',
        password = $('#signup-password').val(),
        first_name = $('#signup-firstname').val(),
        last_name = $('#signup-lastname').val(),
        email = $('#signup-email').val();
    if (localStorage["fb-id"]) {
        fbId = JSON.parse(localStorage["fb-id"]);
    }
    var userInfo = {
            "password": password,
            "first_name": first_name,
            "last_name": last_name,
            "email": email,
            "fb_id": fbId,
            "image_url": localStorage['fb-image']
        },
        data = JSON.stringify(userInfo);

    var signupInstance = new AjaxHttpSender();
    signupInstance.sendPost(url, header, data, signupCallback);
}

$(document).ready(function() {
    redirectIfLoggedIn();

    $('#signup-button').on('click', function(e) {
        e.preventDefault();
        if ($('form').valid()) {
            signingup();
        }

    });
});
