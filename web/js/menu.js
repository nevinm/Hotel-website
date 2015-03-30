$(function(){
        if($(".subMenu").length){
            $(".subMenu ul li a").on("click",function(){
                $(".subMenu ul li a").removeClass("activeOption");
                $(this).addClass("activeOption");
            });
        }

        $('.icon-menu').on("click", function() {
          $('.navMenu').slideToggle();
    	});
});