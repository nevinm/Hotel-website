$(document).ready(function(){HelpController.initView()});var HelpController=function(){function a(){b(),c()}function b(){CartItemCount()}function c(){$(".question").on("click",function(a){var b=$(a.target).next(".answer-block");$(".answer-block").not(b).hide(),$(".question div").not($(a.target)).removeClass("bold"),b.slideToggle(300),$(a.target).hasClass("bold")?$(a.target).removeClass("bold"):$(a.target).addClass("bold"),$(window).scrollTop(b.position().top-200)})}return{initView:a}}();