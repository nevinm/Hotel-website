$(document).ready(function() {
    $('#copy-to-clipboard').on("click",function(){
        if (navigator.mimeTypes ["application/x-shockwave-flash"].enabledPlugin == undefined){
            $('#copied-text').text('This feature is not available in your browser.Please install flash player.');
            $('#copied-text').css('color','#ff7878');
            $("#copied-text").fadeIn();
        }else{    
            $('#clipboard-text').css('color','#A9D77B');
            $('#copied-text').css('color','#6b6b6b');
            $("#copied-text").fadeIn();
        }

    })
});
$('#facebook-share').on('click', function() {
    checkLoginState();
})

$('#twitter-share').on('click', function() {
    twitterShare(homeUrl);
})

$('#email-share').on('click', function() {
    shareViaEmail();
})

//share functions
function popitup(url) {
    var left = Number((screen.width / 2) - (700 / 2));
    var top = Number((screen.height / 2) - (500 / 2));
    var windowFeatures = 'channelmode=0,directories=0,fullscreen=0,location=0,menubar=0,resizable=0,scrollbars=0,status=0,width=700,height=500,top=' + top + ',left=' + left;
    window.open(url, '', windowFeatures);
}

function facebookShare(site_url, accessToken) {
    var imgURL = "http://imgur.com/byNMcg1"; //change with your external photo url
    FB.api('me/photos', 'post', {
        message: 'Ready to cook meals, delivered on demand.'+ 
        'Start cooking today'+
        'for $20 off your first order!'+
        'Fresh ingredients washed and prepped by us,'+
        'cooked to perfection by you. http://www.meisterdish.com/',
        status: 'success',
        access_token: accessToken,
        url: imgURL
    }, function(response) {
        console.log(response)
    });
}

function twitterShare(site_url) {
    site_url = "http://meisterdish.com/invite/ABCD1234?o=twtpic.twitter.com/OaPBIVjyo2";
    var subjText = "Start cooking today with $20 off your first order!" + site_url;
    popitup('http://twitter.com/share?url=' + site_url + '&text=' + subjText);
}

//copy to clipboard
var clientTarget = new ZeroClipboard( $("#copy-to-clipboard"), {
    moviePath: "zeroclipboard/ZeroClipboard.swf",
    debug: false
} );

clientTarget.on( "load", function(clientTarget)
{
    clientTarget.on( "complete", function(clientTarget, args) {
        clientTarget.setText( args.text );
    });
});

var shareViaEmailCallback = {
    success: function(data, textStatus) {
        var userDetails = JSON.parse(data);
        if (userDetails.status == 1) {
            showPopup(userDetails);
        } else {
            showPopup(userDetails);
        }
    },
    failure: function(XMLHttpRequest, textStatus, errorThrown) {}
}

function shareViaEmail() {
    var url = baseURL + "share_email/",
        email = JSON.parse(localStorage['user_profile']).email,
        header = {
            "session-key": localStorage["session_key"]
        },
        userData = {
            "email":email
        },
        data = JSON.stringify(userData);
    var shareViaEmailInstance = new AjaxHttpSender();
    shareViaEmailInstance.sendPost(url, header, data, shareViaEmailCallback);
}