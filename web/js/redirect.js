function redirectIfNotLoggedIn(){
    if (localStorage['loggedIn'] == 'true' || localStorage['admin_loggedIn'] == 'true') {} else {
        window.location.href = '../index.html';
    }
}
redirectIfNotLoggedIn();