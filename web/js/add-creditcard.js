setTimeout(function() {
    $('form')[0].reset();
}, 50);
$(document).ready(function() {
    populateYear();
    CartItemCount();
    stripeIntegration();
    var card_id = checkIfEdit();
    $('.update-add-credit-card').on('click',function(e){
        e.preventDefault();
        if($('form').valid()){
            if($('.update-add-credit-card').val() == "ADD"){
                $('form').submit();
            }
            if($('.update-add-credit-card').val() == "UPDATE"){
                updateCardDetails(card_id);
            }
        }
    })
});

function checkIfEdit() {
    var siteUrl = window.location.href;
    if (siteUrl.indexOf('cardId') != -1) {
        card_id = getParameterFromUrl('cardId');
        savedCardDetails(card_id);      
        $('.update-add-credit-card').val("UPDATE");
        $("form").attr('id','update-pay-form');
        $("form").validate({
            ignore: ".ignore"
        });
        return card_id;
    }else{
        $("form").attr('id','pay-form');
        $('.update-add-credit-card').val("ADD");
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
            $("form")[0].reset();
            window.location.href = 'manage-creditcard.html';
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
    $('#card-number-error').hide();
    $('#card-number').removeClass('error');
    $('#card-number').addClass('button-disabled');
    $('#cvv-number').addClass('button-disabled');
    $('#cvv-number').val('****');
    $('#cvv-number').prop('readonly', true);
    $('#ExpMonth  option[value="' + exp_month + '"]').prop('selected', true);
    $('#ExpYear option[value="' + exp_year + '"]').prop('selected', true);
}

//Update card details 
var updateCardDetailsCallback = {
    success: function(data, textStatus) {
        var cardDetails = JSON.parse(data);
        if(cardDetails.status == 1){
            window.location.href="manage-creditcard.html";
        }else{
            showPopup(cardDetails);
        }
    },
    failure: function(XMLHttpRequest, textStatus, errorThrown) {}
}

function updateCardDetails(card_id) {
    var url = baseURL + "update_credit_card/"+card_id+"/",
        name = $('#name-on-card').val(),
        month = $('#ExpMonth option:selected').val(),
        year = $('#ExpYear option:selected').text(),
        header = {
            "session-key": localStorage["session_key"]
        },
        params = {
            "name":name,
            "exp_month" : month,
            "exp_year":year 
        }
    data = JSON.stringify(params);
    var updateCardDetailsInstance = new AjaxHttpSender();
    updateCardDetailsInstance.sendPost(url, header, data, updateCardDetailsCallback);
}
