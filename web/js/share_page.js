// $(document).ready(function() {
// 	$(".button").clipboard({
// 	    path: 'jquery.clipboard.swf',
// 	    copy: function() {
// 	        alert("Text copied.");
// 	        debugger;
// 	        return $("div#some-content").text();
// 	    }    
// 	});
// })
$('#facebook-share').on('click',function(){
    facebookShare(homeUrl);
})

$('#twitter-share').on('click',function(){
    twitterShare(homeUrl);
})

$('#email-share').on('click',function(){
    emailShare(homeUrl);
})

//share functions
function popitup(url) {
    var left = Number((screen.width / 2) - (700 / 2));
    var top = Number((screen.height / 2) - (500 / 2));
    var windowFeatures = 'channelmode=0,directories=0,fullscreen=0,location=0,menubar=0,resizable=0,scrollbars=0,status=0,width=700,height=500,top=' + top + ',left=' + left;
    window.open(url, '', windowFeatures);
}
function facebookShare(site_url){
    window.open('https://www.facebook.com/sharer/sharer.php?u='+encodeURIComponent(homeUrl),'facebook-share-dialog','width=626,height=436');
     return false;
}
function twitterShare(site_url){
    site_url = "http://meisterdish.com/invite/ABCD1234?o=twtpic.twitter.com/OaPBIVjyo2";
    var subjText = "Start cooking today with $20 off your first order!"+site_url;
        popitup('http://twitter.com/share?url='+site_url+'&text='+subjText);
}
function emailShare(site_url){
    site_url = "http://meisterdish.com/invite/ABCD1234?o=email";
    var subjText = "Cooking at home shouldn’t be such a hassle. Meisterdish makes cooking fit the New York lifestyle. With fresh, cleaned and portioned ingredients delivered on demand, along with step-by-step instructions - all you have to do is cook. Cooking has never been so fast, fresh and tasty. "
    +'\n\n'+" Sign up for free using this link and you’ll receive $20 off your first order:"
    +'\n\n'+"       "+site_url
    +'\n\n'+"Enjoy your meal!";
    var subject = "Start cooking with Meisterdish";
    $("a#email-share").attr('href', "mailto:?subject="+subject+"&body="+encodeURIComponent(subjText));
}
