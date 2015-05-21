$("#redeem-card").on('click', function(){
    var code =  $(".card-code").val();
    redeemGiftCard(code);
})

//Redeem Gift Card API.
var redeemGiftCardCallback = {
    success: function(data, textStatus) {
        userDetails = JSON.parse(data);
            showPopup(userDetails);
        if (userDetails.status == 1) {
            $(".card-code").val("");
        } else {
            showPopup(userDetails);
        }
    },
    failure: function(XMLHttpRequest, textStatus, errorThrown) {}
}

function redeemGiftCard(code) {
    var url = baseURL + 'redeem_gift_card/',
        header = {
            "session-key": localStorage["session_key"]
        },
        userInfo = {
            "code": code
        },
        data = JSON.stringify(userInfo);

    var redeemGiftCardInstance = new AjaxHttpSender();
    redeemGiftCardInstance.sendPost(url, header, data, redeemGiftCardCallback);
}