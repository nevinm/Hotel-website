$(document).ready(function() {
    populateYear();
    CartItemCount();
    stripeIntegration();
});

function populateYear() {
    var currentYear = new Date().getFullYear();
    for (var i = 1; i <= 20; i++) {
        $('#ExpYear').append("<option value='" + currentYear + "'>" + currentYear + "</option>");
        currentYear = currentYear + 1;
    }
}

//save credit card details call back
var saveCreditCardDetailsCallback = {
    success: function(data, textStatus) {
        var response = JSON.parse(data);
        if (response.status == 1) {
            showPopup(response);
            $("#pay-form")[0].reset();
            window.location.href = 'payment_method.html';
        } else {}
        showPopup(response);
    },
    failure: function(XMLHttpRequest, textStatus, errorThrown) {}
}

//save credit card items
function saveCreditCardDetails(token) {
    var url = baseURL + "save_credit_card/",
        header = {
            "session-key": localStorage["session_key"]
        },
        params = {
            "stripeToken": token
        }
    data = JSON.stringify(params);
    var saveCreditCardDetailsInstance = new AjaxHttpSender();
    saveCreditCardDetailsInstance.sendPost(url, header, data, saveCreditCardDetailsCallback);
}
