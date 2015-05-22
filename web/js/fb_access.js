// This is called with the results from from FB.getLoginStatus().
function statusChangeCallback(response) {
    // The response object is returned with a status field that lets the
    // app know the current login status of the person.
    // Full docs on the response object can be found in the documentation
    // for FB.getLoginStatus().
    if (response.status === 'connected') {
        // Logged into your app and Facebook.
        testAPI();
    } else if (response.status === 'not_authorized') {
        fbLogin();
        // The person is logged into Facebook, but not your app.
        document.getElementById('status').innerHTML = 'Please log ' +
            'into this app.';
    } else {
        fbLogin();
        // The person is not logged into Facebook, so we're not sure if
        // they are logged into this app or not.
    }
}

// This function is called when someone finishes with the Login
// Button.  See the onlogin handler attached to it in the sample
// code below.
function checkLoginState() {
    FB.getLoginStatus(function(response) {
        statusChangeCallback(response);
    });
}

window.fbAsyncInit = function() {
    FB.init({
        appId: '736537916455826',
        cookie: true, // enable cookies to allow the server to access 
        oauth: true,
        status: true, // check login status
        xfbml: true, // parse social plugins on this page
        version: 'v2.2' // use version 2.2
    });

    // Now that we've initialized the JavaScript SDK, we call 
    // FB.getLoginStatus().  This function gets the state of the
    // person visiting this page and can return one of three states to
    // the callback you provide.  They can be:
    //
    // 1. Logged into your app ('connected')
    // 2. Logged into Facebook, but not your app ('not_authorized')
    // 3. Not logged into Facebook and can't tell if they are logged into
    //    your app or not.
    //
    // These three cases are handled in the callback function.

    // FB.getLoginStatus(function(response) {
    //   statusChangeCallback(response);
    // });

};

var loginFBCallback = {
    success: function(data, textStatus) {
        userDetails = JSON.parse(data);
        if (userDetails.status == -1) {
            showPopup(userDetails);
        } else {
            showPopup(userDetails);
            var user_name = userDetails.user.first_name + ' ' + userDetails.user.last_name;
            localStorage['username'] = user_name;
            if (localStorage.getItem("session_key") === null) {
                localStorage['session_key']=userDetails.session_key;
            }
            localStorage['loggedIn'] = true;
            checkLoggedIn();
            window.location.href = '../index.html';
        }
    },
    failure: function(XMLHttpRequest, textStatus, errorThrown) {}
}

function loginFB(fb_id, email) {
    var url = baseURL + 'login/',
        header = {};
    var userInfo = {
            "username": email,
            "fb_id": fb_id,
            "remember": 1
        },
        data = JSON.stringify(userInfo);

    var loginFBInstance = new AjaxHttpSender();
    loginFBInstance.sendPost(url, header, data, loginFBCallback);
}

// Load the SDK asynchronously
(function(d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s);
    js.id = id;
    js.src = "//connect.facebook.net/en_US/sdk.js";
    fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));

// Here we run a very simple test of the Graph API after login is
// successful.  See statusChangeCallback() for when this call is made.
function testAPI() {
    FB.api('/me', function(response) {
        if ($('title').text().split('-')[1] == ' Log in') {
            loginFB(response.id, response.email)
        } else {
            localStorage['fb-id'] = JSON.stringify(response.id);
            $('#signup-firstname').val(response.first_name);
            $('#signup-lastname').val(response.last_name);
            $('#signup-email').val(response.email);
        }
    });
    FB.api("/me/picture?width=300&height=300", function(response) {
        if (response && !response.error) {
            localStorage['fb-image'] = response.data.url;
        }
    });

}

function fbLogin() {
    FB.login(function(response) {
        if (response.authResponse) {
            testAPI();
        } else {
            console.log('User cancelled login or did not fully authorize.');
        }
    }, {
        scope: 'publish_stream,email'
    });
}
