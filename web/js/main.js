

$(document).ready(function() {
    $('#fullpage').fullpage({
    	css3: true,
    	scrollingSpeed:1000,
    	responsive: 1400,
    	slidesNavigation: true,
    	controlArrows: false,
    	navigation:true
    });
    $(window).resize(function(){
		var sliderImages = $("#fullpage").find("img");
		$.each(sliderImages,function(index,elem){
			if(elem.height<window.innerHeight){
				elem.height=window.innerHeight;
			}
			else{}
		});
    });
});