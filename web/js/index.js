$(document).ready(function() {
    var footerCorrected = false;
    imageFix();
    $(window).resize(function() {
        imageFix();
    });

    function imageFix() {
        var sliderImages = $("#fullpage").find("img");
        $.each(sliderImages, function(index, elem) {
            if (elem.height < window.innerHeight) {
                elem.height = window.innerHeight;
                elem.width = window.innerWidth;
            } else {}
        });
    }

    function fixFooter(nextIndex) {
        if (nextIndex == 3) {
            if (!footerCorrected ) {
                var lastSectionHeight = $("#section3").height() - 100;
                $("#section3").height(lastSectionHeight);
                $("#section3 img").css({
                    "max-height": "100%"
                });
                $("#section3 .fp-tableCell").height(lastSectionHeight);
                footerCorrected = true;
            }
            $("#footer").css({
                "opacity": 1
            });
        } else {
            $("#footer").css({
                "opacity": 0
            });
        }
    }

    $('#fullpage').fullpage({
        css3: true,
        scrollingSpeed: 1000,
        slidesNavigation: true,
        controlArrows: false,
        navigation: true,
        onLeave: function(index, nextIndex, direction) {
        	if(nextIndex!=3){
        		fixFooter(nextIndex);
        	}
	        setTimeout(function(){
	        	fixFooter(nextIndex)
	        },600);
        },
        afterResize: function() {
            var className = $("body").attr('class'),
            currentSlide = (className.split("-").pop()*1)+1;
            footerCorrected=false;
	        setTimeout(function(){
	        	fixFooter(currentSlide)
	        },600);
        }
    });

    $('.icon-menu').on("click", function() {
        $('.navMenu').slideToggle();
    });
});
