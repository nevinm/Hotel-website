var loginInstance=null,LoginController=function(){};LoginController.prototype=function(){var a=function(){var a=baseURL+"login/",c={"session-key":localStorage.session_key},d=$("#username").val(),e=$("#password").val(),f=1,g={username:d,password:e,remember:f},h=JSON.stringify(g);(new AjaxHttpSender).sendPost(a,c,h,b)},b={success:function(a,b){if(userDetails=JSON.parse(a),-1==userDetails.status)showPopup(userDetails);else{$("#login-form")[0].reset(),ClearLocalStorage();var c=userDetails.user.first_name;localStorage.username=c,localStorage.session_key=userDetails.session_key,localStorage.loggedIn=!0,localStorage.admin_loggedIn=!1,createCookie("SessionExpireTime","true",sessionExpiryTime),checkLoggedIn(),d()}},failure:function(a,b,c){}},c=function(){redirectIfLoggedIn(),CartItemCount()},d=function(){var a=document.referrer;referredPage=getCurrentPage("/",".html",a),"checkout"==referredPage?window.location.href="checkout.html":"giftcard-payment"==referredPage?window.location.href="giftcard-payment.html":"contact-us"==referredPage?window.location.href="contact-us.html":window.location.href="menu.html"};return{loginInit:c,loggingIn:a}}(),$(document).ready(function(){loginInstance=new LoginController,loginInstance.loginInit(),$("#login-button").on("click",function(a){a.preventDefault(),$("form").valid()&&loginInstance.loggingIn()})});