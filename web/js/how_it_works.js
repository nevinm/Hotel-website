$(document).ready(function() {
	$('.tab-container ul li').on("click", function() {
	    $('.tab-container ul li a').removeClass('activeli');
	    $(this).find('a').addClass('activeli');
	});
	$(".how-it-works-tab").tabs();
});