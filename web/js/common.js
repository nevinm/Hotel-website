//If already logged in
var $userentry=$('.user-entry');
function checkLoggedIn(){
	if (localStorage['loggedIn'] == 'true') 
	{
        $userentry.hide();
        $('#navbar-username').text(localStorage['username']);
        $('#menu').addClass('menuPadding');
    }
    else{
    	$userentry.show();
    	$('#menu').removeClass('menuPadding');
    }
}

$(document).ready(function() {
    //Logout process
    $("#logout").on('click', function() {
    	$('#navbar-username').text('');
        $userentry.show();
        $('#menu').removeClass('menuPadding');
        $(".logout").addClass('hide');
        localStorage.removeItem('username');
        localStorage.removeItem('session_key');
        localStorage['loggedIn']=false;
    });

    // &NAVMENU - RESPONSIVE
    $('.icon-menu').on("click", function() {
        $('.navMenu').slideToggle();
    });

    checkLoggedIn();
});
