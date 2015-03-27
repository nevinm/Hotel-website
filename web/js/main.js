
$(document).ready(function() {
   	imageFix();
    $(window).resize(function(){
    	imageFix();
    });
    function imageFix(){
    	var sliderImages = $("#fullpage").find("img");
		$.each(sliderImages,function(index,elem){
			if(elem.height<window.innerHeight){
				elem.height=window.innerHeight;
				elem.width=window.innerWidth;
			}
			else{}
		});
    }
    $('#fullpage').fullpage({
    	css3: true,
    	scrollingSpeed:1000,
    	slidesNavigation: true,
    	controlArrows: false,
    	navigation:true
    });
    $('.icon-menu').on("click",function (){
		$('.navMenu').slideToggle();
	});
});
