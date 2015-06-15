

//Old giftcard page

$("#redeem-card").on('click', function() {
    var code = $(".card-code").val();
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

//New Gift Card pages.
populateYear();
$(".giftcard-selector").on("click", function() {
    $(".giftcard-selector").removeClass("giftcard-selected");
    $(this).addClass("giftcard-selected");
    $(".giftcard-selector").find(":checkbox").removeAttr("checked");
    // $("input:radio[name='giftcard']").removeAttr("checked");
    $(this).find(":checkbox").attr("checked","checked");
    console.log($(this));
});
 //populate year
    function populateYear() {
        var currentYear = new Date().getFullYear();
        for (var i = 1; i <= 20; i++) {
            $('#ExpYear').append("<option value='" + currentYear + "'>" + currentYear + "</option>");
            currentYear = currentYear + 1;
        }
    }
