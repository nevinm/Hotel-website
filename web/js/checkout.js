function getCartItems() {
    var url = baseURL + "get_cart_items/",
        header = {
            "session-key": localStorage["session_key"]
        },
        userData = {};
    data = JSON.stringify(userData);
    var getCartItemsInstance = new AjaxHttpSender();
    getCartItemsInstance.sendPost(url, header, data, getCartItemsCallback);
}

//Login process
var getCartItemsCallback = {
    success: function(data, textStatus) {
        userDetails = JSON.parse(data);
    },
    failure: function(XMLHttpRequest, textStatus, errorThrown) {}
}

$(document).ready(function() {
    getCartItems();
});
