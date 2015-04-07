  //Remove address API
var removeAddressCallback = {
    success: function(data, textStatus) {
        var userDetails = JSON.parse(data);
        if (userDetails.status == 1) {
           debugger;
        }
         else {}
    },
    failure: function(XMLHttpRequest, textStatus, errorThrown) {}
}

function removeAddress() {
    var url = baseURL + "get_profile/",
        header = {
            "session-key": localStorage["session_key"]
        },
        userData = {
            "get": 1
        };
    data = JSON.stringify(userData);
    var removeAddressInstance = new AjaxHttpSender();
    removeAddressInstance.sendPost(url, header, data, removeAddressCallback);
}

function autoPopulateAdressess(){
    var userProfile=JSON.parse(localStorage['user_profile']);
    $.each(userProfile.address_list,function(key,value){
        debugger;
    });
}
autoPopulateAdressess();