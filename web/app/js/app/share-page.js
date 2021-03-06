$(document).ready(function () {
    CartItemCount();
    $('#copy-to-clipboard').on("click", function () {
        if (navigator.mimeTypes ["application/x-shockwave-flash"].enabledPlugin == undefined) {
            $('#copied-text').text('Please copy using CTRL + C.');
            $('#copied-text').css('color', '#ff7878');
            $("#copied-text").fadeIn();
        } else {
            $('#clipboard-text').css('color', '#A9D77B');
            $('#copied-text').css('color', '#6b6b6b');
            $("#copied-text").fadeIn();
        }
    });

    $('#email-share').on("click", function () {
        if (localStorage['user_profile']) {
            var email = JSON.parse(localStorage['user_profile']).email;
            $('input[name="email"]').val(email);
        } else {
            $('input[name="email"]').val("");
        }
        $('.email-pupup-wrapper').show();
    });

    $('#send').on('click', function (e) {
        e.preventDefault();
        var email = $('input[name="email"]').val();
        if ($('form#email-form').valid()) {
            shareViaEmail(email);
        }
    });

    $('#cancel').on('click', function () {
        $('.email-pupup-wrapper').hide();
    });

    $('#facebook-share').on('click', function () {
        checkLoginState();
    })

    $('#twitter-share').on('click', function () {
        twitterShare(homeUrl);
    })

    getProfile();
});

//share functions
function popitup(url) {
    var left = Number((screen.width / 2) - (700 / 2));
    var top = Number((screen.height / 2) - (500 / 2));
    var windowFeatures = 'channelmode=0,directories=0,fullscreen=0,location=0,menubar=0,resizable=0,scrollbars=0,status=0,width=700,height=500,top=' + top + ',left=' + left;
    window.open(url, '', windowFeatures);
}

function facebookShare(site_url, accessToken) {
    var imgURL = homeUrl + "/images/fb_banner_meister_14-10-15.jpg", //change with your external photo url
            referralCode = localStorage['referral_code'];
    FB.api('me/photos', 'post', {
        message: "Meisterdish – New York's first on-demand delivery service that lets you cook in 15 minutes." +
                "For a limited time only, all first-time customers receive $20 towards their first two orders." +
                "Use promo code MEISTER20 on our landing page. " + referralCode,
        status: 'success',
        access_token: accessToken,
        url: imgURL
    }, function (response) {
        console.log(response);
    });
}

function twitterShare(site_url) {
    site_url = homeUrl + "/views/share-page.html",
            referralCode = localStorage['referral_code'];
    referralCode = referralCode.split("share/")[1].slice(0, -1);
    var subjText = "I love @Meisterdish! Sign up with my promo code and get $20 credit for your first two orders! ";
    site_url = site_url + '?refferalCode=' + referralCode;
    popitup('http://twitter.com/share?text=' + subjText + '&url=' + site_url);
}

//copy to clipboard
var clientTarget = new ZeroClipboard($("#copy-to-clipboard"), {
    moviePath: "zeroclipboard/ZeroClipboard.swf",
    debug: false
});

clientTarget.on("load", function (clientTarget) {
    clientTarget.on("complete", function (clientTarget, args) {
        clientTarget.setText(args.text);
    });
});

var shareViaEmailCallback = {
    success: function (data, textStatus) {
        var userDetails = JSON.parse(data);
        $('.email-pupup-wrapper').hide();
        if (userDetails.status == 1) {
            showPopup(userDetails);
        } else {
            showPopup(userDetails);
        }
    },
    failure: function (XMLHttpRequest, textStatus, errorThrown) {
    }
}

function shareViaEmail(email) {
    var url = baseURL + "share_email/",
            header = {
                "session-key": localStorage["session_key"]
            },
    userData = {
        "email": email
    },
    data = JSON.stringify(userData);
    var shareViaEmailInstance = new AjaxHttpSender();
    shareViaEmailInstance.sendPost(url, header, data, shareViaEmailCallback);
}
//Get profile API process
var getProfileCallback = {
    success: function (data, textStatus, profileId) {
        var userDetails = JSON.parse(data);
        if (userDetails.status == 1) {
            $('#clipboard-text').text(userDetails.referral_code);
            $('#copy-to-clipboard').show();
            localStorage['referral_code'] = userDetails.referral_code;
        } else {
            $('#clipboard-text').text(userDetails.message);
            $('#copy-to-clipboard').hide();
        }
    },
    failure: function (XMLHttpRequest, textStatus, errorThrown) {
    }
}

function getProfile(profileId) {
    var url = baseURL + "get_profile/",
            header = {
                "session-key": localStorage["session_key"]
            },
    userData = {
        "get": 1
    };
    data = JSON.stringify(userData);
    var getProfileInstance = new AjaxHttpSender();
    getProfileInstance.sendPost(url, header, data, getProfileCallback, profileId);
}
