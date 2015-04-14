function redirectIfAdminLoggedIn(){
        if (localStorage['admin_loggedIn'] == 'true') 
        {
            
        }
        else{window.location.href='index.html';}
    }
    redirectIfAdminLoggedIn();