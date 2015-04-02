var baseURL = 'http://meisterdish.qburst.com/backend/api/';
//If already logged in
var $userentry = $('.login-signup');

function checkLoggedIn() {
    if (localStorage['loggedIn'] == 'true' || localStorage['admin_loggedIn'] == 'true') {
        $userentry.hide();
        $('#navbar-username a').append(localStorage['username']);
        $('#menu').addClass('menuPadding');
    } else {
        $userentry.show();
        $("#logout").hide();
        $('#menu').removeClass('menuPadding');
    }
}

$(document).ready(function() {
    //Logout process
    $("#logout").on('click', function() {
        if (localStorage['admin_loggedIn'] == "true") {
            localStorage.removeItem('admin_username');
            localStorage.removeItem('admin_session_key');
            localStorage['admin_loggedIn'] = false;
            window.location.href= '../../index.html';
        } else {
            $('#navbar-username a').text('');
            $userentry.show();
            $('#menu').removeClass('menuPadding');
            $(".logout").addClass('hide');
            localStorage.removeItem('username');

            localStorage.removeItem('session_key');
            localStorage['loggedIn'] = false;
            window.location.href = '../index.html';
        }
    });

    // &NAVMENU - RESPONSIVE
    $('.icon-menu').on("click", function() {
        $('.navMenu').slideToggle();
    });

    checkLoggedIn();
});
