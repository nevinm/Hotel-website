setTimeout(function() {
    $('#pay-form')[0].reset();
}, 50);
$(document).ready(function() {
    populateYear();
    CartItemCount();
    stripeIntegration();
    checkIfEdit();
});

function checkIfEdit() {
    var siteUrl = window.location.href;
    if (siteUrl.indexOf('cardId') != -1) {
        card_id = getParameterFromUrl('cardId');
        savedCardDetails(card_id);
    }
}

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
            $("#pay-form")[0].reset();
            window.location.href = 'manage_creditcard.html';
        } else {
            showPopup(response);
        }
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

//Get saved cards
var savedCardDetailsCallback = {
    success: function(data, textStatus) {
        var cardDetails = JSON.parse(data);
        if (cardDetails.status == 1) {
            populateCardDetails(cardDetails.cards[0]);
        } else {
            showPopup(cardDetails);
        }
    },
    failure: function(XMLHttpRequest, textStatus, errorThrown) {}
}

function savedCardDetails(card_id) {
    var url = baseURL + "get_saved_cards/",
        header = {
            "session-key": localStorage["session_key"]
        },
        params = {
            card_id: card_id
        }
    data = JSON.stringify(params);
    var savedCardDetailsInstance = new AjaxHttpSender();
    savedCardDetailsInstance.sendPost(url, header, data, savedCardDetailsCallback);
}

function populateCardDetails(cardDetails) {
    var card_num = cardDetails.number,
        exp_year = cardDetails.expire_year,
        exp_month = cardDetails.expire_month;
    $('#card-number').val(card_num);
    $('#card-number').prop('readonly', true);
    // $('#cvv-number').prop('readonly',true);
    $('#ExpMonth  option[value="' + exp_month + '"]').prop('selected', true)
    $('#ExpYear option:selected').text(exp_year);
}
