$(document).ready(function() {
	CartItemCount();
	savedCardDetails();
});


//Get saved cards
var savedCardDetailsCallback = {
    success: function(data, textStatus) {
        var last_num;
        cardDetails = JSON.parse(data);
        if (cardDetails.status == 1) {
            if (cardDetails.cards.length != 0) {
            	$('#manage-payment-method-container .message').hide();
            	$('#update-payment').show();
                populateCardDetails(cardDetails.cards);
                // $('.payment-method-container').show();
                // $('.payment-method-guest-container').hide();
            } else {
                $('#manage-payment-method-container .message').show();
                $('#update-payment').hide();
            }
        } else {
            showPopup(cardDetails);
        }
    },
    failure: function(XMLHttpRequest, textStatus, errorThrown) {}
}

function savedCardDetails() {
    var url = baseURL + "get_saved_cards/",
        header = {
            "session-key": localStorage["session_key"]
        },
        params = {}
    data = JSON.stringify(params);
    var savedCardDetailsInstance = new AjaxHttpSender();
    savedCardDetailsInstance.sendPost(url, header, data, savedCardDetailsCallback);
}

function populateCardDetails(cards){
	debugger;
	var last_num;
	 $.each(cards, function(key, value) {
	 	last_num = cards[key].number.slice(-4);
		$('.card-list-container').append("<div class='saved-card-list'>" +
			"<input type='radio' class=' payment-checked' name='saved-card' id='" + value.id +"'>" +
			"<img class='paypal' src='" + value.logo + "'>" +
			"<div class='card-details-small'>" +
			"<div class='body-text-small'>" + value.type + " " + "ending in" + " " + last_num + "</div>" +
			"<div class='body-text-small'>" + "Expires on" + " " +
			value.expire_month + "/" + value.expire_year + "</div>" + "</div>" + "</div>");
		});
}