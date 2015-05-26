$(document).ready(function() {
	$('.tab-container ul li').on("click", function() {
	    $('.tab-container ul li a').removeClass('activeli');
	    $(this).find('a').addClass('activeli');
	});
	$(".how-it-works-tab").tabs();
	$('.left-arrow').on("click",function(){
		$('#we-source,#you-cook,#our-suppliers,#what-you-get').animate({
			left: '+=100%'
		},"slow","easeOutQuart");
	})
	$('.right-arrow').on("click",function(){
		$('#we-source,#you-cook,#our-suppliers,#what-you-get').animate({
			left: '-=100%'
		},"slow","easeOutQuart");
	})
	$('.sub-tab-container  ul li').on("click", function() {
	    $('.sub-tab-container ul li a').removeClass('subactiveli');
	    $(this).find('a').addClass('subactiveli');
	});
	$('.sub-tab-container li').on("click",function(){
		$('#farm,#roamimg-acres,#blue-ribbon-fish,#plantation,#common-thread-farm').hide();
		var clicked_id =$(this).find('a').attr('href');
		$(clicked_id).show();
	});
});