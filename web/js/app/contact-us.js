function getProfile(a){var b=baseURL+"get_profile/",c={"session-key":localStorage.session_key},d={get:1};data=JSON.stringify(d);var e=new AjaxHttpSender;e.sendPost(b,c,data,getProfileCallback,a)}function showSuccessMessageContact(){var a=$(".contact-us-popup").find(".content span");$(".popup").find(".header").text("Thank you"),$("#close").hide(),$("#ok-button").show(),$(a[0]).text("Thanks for contacting us."),$(a[1]).show(),$(".contact-us-popup").show()}function sendMessage(){$(".loading-indicator").show();var a=baseURL+"send_contactus_email/",b={"session-key":localStorage.session_key},c=$("input[name='fullname']").val(),d=$("input[name='email']").val(),e=$("input[name='subject']").val(),f=$("textarea[name='message']").val(),g={subject:e,message:f,name:c,email:d};data=JSON.stringify(g);var h=new AjaxHttpSender;h.sendPost(a,b,data,sendMessageCallback)}$(document).ready(function(){if("true"==localStorage.loggedIn)if($(".guest").hide(),localStorage.user_profile){var a=JSON.parse(localStorage.user_profile);$("#user-email").text("  ("+a.email+")")}else getProfile();else $(".guest").show(),$(".user-account").hide();$("#send-message").on("click",function(a){a.preventDefault(),$("form").valid()&&sendMessage()}),CartItemCount()});var getProfileCallback={success:function(a,b,c){var d=JSON.parse(a);1==d.status&&$("#user-email").text("  ("+d.email+")")},failure:function(a,b,c){}},sendMessageCallback={success:function(a,b){var c=JSON.parse(a);if(1==c.status)showSuccessMessageContact();else{var d=$(".contact-us-popup").find(".content span");$(".popup").find(".header").text("Please check"),$("#close").show(),$("#ok-button").hide(),$(d[1]).hide(),showPopup(c)}$(".loading-indicator").hide()},failure:function(a,b,c){}};