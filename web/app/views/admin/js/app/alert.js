$(document).ready(function() {
    loadAlertNumber();
    $("#update-number").on("click", function (e) {
        e.preventDefault();
        var newNumber =  $("#alertNumber").val();
        //if ($("#alertNumber").valid()) {
            updateAlertNumber(newNumber);
        // } else {
        // }
    });
});
//Initiate Allocated slots API call
function loadAlertNumber() {
    var url = baseURL + 'cms/notification_settings/';
    var header = {
        "session-key": localStorage['session_key']
    };
    var getAlertNumber = new AjaxHttpSender();
    getAlertNumber.sendPost(url, header, {}, loadAlertNumberCallback);
}
var loadAlertNumberCallback = {
    success: function(data, textStatus) {
        var responseData = JSON.parse(data);
        $('#alertNumber').val(responseData.mobile_number);
    },
    failure: function(XMLHttpRequest, textStatus, errorThrown) {}
}
var updateAlertNumberCallback = {
    success: function (data, textStatus) {
        var numberData = JSON.parse(data);
        if (numberData.status == 1) {
        	$('#alertNumber').val(numberData.mobile_number);
        }
        // } else {
        //     showUserCreditPoup(creditsData);
        // }
    },
    failure: function (XMLHttpRequest, textStatus, errorThrown) {
    }
}
function updateAlertNumber(newNumber) {
    var url = baseURL + 'cms/notification_settings/';
    header = {
        "session-key": localStorage['session_key']
    },
    params = {
        "mobile_number": newNumber,
    },
    data = JSON.stringify(params);

    var updateAlertNumberInstance = new AjaxHttpSender();
    updateAlertNumberInstance.sendPost(url, header, data, updateAlertNumberCallback);
}