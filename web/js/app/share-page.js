function popitup(a){var b=Number(screen.width/2-350),c=Number(screen.height/2-250),d="channelmode=0,directories=0,fullscreen=0,location=0,menubar=0,resizable=0,scrollbars=0,status=0,width=700,height=500,top="+c+",left="+b;window.open(a,"",d)}function facebookShare(a,b){var c=homeUrl+"/images/fb_banner_meister_14-10-15.jpg",d=localStorage.referral_code;FB.api("me/photos","post",{message:"Meisterdish – New York's first on-demand delivery service that lets you cook in 15 minutes.For a limited time only, all first-time customers receive $20 towards their first two orders.Use promo code MEISTER20 on our landing page. "+d,status:"success",access_token:b,url:c},function(a){console.log(a)})}function twitterShare(a){a=homeUrl+"/views/share-page.html",referralCode=localStorage.referral_code,referralCode=referralCode.split("share/")[1].slice(0,-1);var b="I love @Meisterdish! Sign up with my promo code and get $20 credit for your first two orders! ";a=a+"?refferalCode="+referralCode,popitup("http://twitter.com/share?text="+b+"&url="+a)}function shareViaEmail(a){var b=baseURL+"share_email/",c={"session-key":localStorage.session_key},d={email:a},e=JSON.stringify(d),f=new AjaxHttpSender;f.sendPost(b,c,e,shareViaEmailCallback)}function getProfile(a){var b=baseURL+"get_profile/",c={"session-key":localStorage.session_key},d={get:1};data=JSON.stringify(d);var e=new AjaxHttpSender;e.sendPost(b,c,data,getProfileCallback,a)}$(document).ready(function(){CartItemCount(),$("#copy-to-clipboard").on("click",function(){void 0==navigator.mimeTypes["application/x-shockwave-flash"].enabledPlugin?($("#copied-text").text("Please copy using CTRL + C."),$("#copied-text").css("color","#ff7878"),$("#copied-text").fadeIn()):($("#clipboard-text").css("color","#A9D77B"),$("#copied-text").css("color","#6b6b6b"),$("#copied-text").fadeIn())}),$("#email-share").on("click",function(){if(localStorage.user_profile){var a=JSON.parse(localStorage.user_profile).email;$('input[name="email"]').val(a)}else $('input[name="email"]').val("");$(".email-pupup-wrapper").show()}),$("#send").on("click",function(a){a.preventDefault();var b=$('input[name="email"]').val();$("form#email-form").valid()&&shareViaEmail(b)}),$("#cancel").on("click",function(){$(".email-pupup-wrapper").hide()}),$("#facebook-share").on("click",function(){checkLoginState()}),$("#twitter-share").on("click",function(){twitterShare(homeUrl)}),getProfile()});var clientTarget=new ZeroClipboard($("#copy-to-clipboard"),{moviePath:"zeroclipboard/ZeroClipboard.swf",debug:!1});clientTarget.on("load",function(a){a.on("complete",function(a,b){a.setText(b.text)})});var shareViaEmailCallback={success:function(a,b){var c=JSON.parse(a);$(".email-pupup-wrapper").hide(),1==c.status?showPopup(c):showPopup(c)},failure:function(a,b,c){}},getProfileCallback={success:function(a,b,c){var d=JSON.parse(a);1==d.status?($("#clipboard-text").text(d.referral_code),$("#copy-to-clipboard").show(),localStorage.referral_code=d.referral_code):($("#clipboard-text").text(d.message),$("#copy-to-clipboard").hide())},failure:function(a,b,c){}};