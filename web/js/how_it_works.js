$(document).ready(function() {
	$('.tab-container ul li').on("click", function() {
	    $('.tab-container ul li a').removeClass('activeli');
	    $(this).find('a').addClass('activeli');
	});
	$(".how-it-works-tab").tabs();
	
	$('#left-arrow').on("click",function(){
		$('#we-source,#our-suppliers').animate({
			left: '+=100%'
		},600);
	})
	$('#right-arrow').on("click",function(){
		$('#we-source,#our-suppliers').animate({
			left: '-=100%'
		},600);
	})
});