//Admin Login
var adminCallback = {
    success: function(data, textStatus) {
        var adminDetails = JSON.parse(data);
        if (adminDetails.status == 1) {
            var userName = adminDetails.user.first_name;
            localStorage['username'] = userName;
            localStorage['session_key'] = adminDetails.session_key;
            localStorage['admin_loggedIn'] = true;
            localStorage['loggedIn'] = false;
            localStorage['admin_loggedIn'] = true;
            localStorage['admin_role'] = adminDetails.role_name;
            createCookie("SessionExpireTime", "true", sessionExpiryTime);
            if (adminDetails.role_name == "ADMIN") {
                window.location.href = 'orderlist.html'
            } else if (adminDetails.role_name == "KITCHEN") {
                window.location.href = 'kitchen-order.html';
            } else if (adminDetails.role_name == "DELIVERY") {
                window.location.href = 'driver-order.html';
            }
        } else {
            alert(adminDetails.message);
        }
    },
    failure: function(XMLHttpRequest, textStatus, errorThrown) {
        console.log("Admin login Failed");
        alert("failed, please try again.")
    }
}

function adminLogin() {
    var adminUserName = $("#adminlogin-email").val();
    adminPassword = $("#adminlogin-password").val();
    var url = baseURL + 'cms/login/';
    header = {},
        params = {
            "username": adminUserName,
            "password": adminPassword,
            "remember": 1
        }

    data = JSON.stringify(params);

    var loginAdminInstance = new AjaxHttpSender();
    loginAdminInstance.sendPost(url, header, data, adminCallback);
}

if (localStorage.getItem('admin_role') === null) {} else {
    var adminRole = localStorage.getItem('admin_role');
    if (adminRole == 'ADMIN') {
        $(".admin-links").addClass('showLi');
    } else
    if (adminRole == 'KITCHEN') {
        $(".kitchen-links").addClass('showLi');
    } else {
        $(".delivery-links").addClass('showLi');
    }
}

function downloadOrderCSV(url, element) {
    $("#" + element).attr("action", baseURL + url);
    $("#" + element).find("input[name='session_key']").val(localStorage['session_key']);
}


$(document).ready(function() {
    $("#login-button").on('click', function(e) {
        e.preventDefault();
        if ($('form#admin-login').valid()) {
            adminLogin();
        }
    });
});
