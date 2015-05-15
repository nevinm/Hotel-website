var ipadWidth = 768;
$(document).ready(function() {
    tabRendering();
});


function tabRendering() {
    // destroyTabs();
    var $tabs = $("#meal-tabs").tabs({
        activate: function(event, ui) {
            $tabs.tabs('option', 'hide', false);
            $tabs.tabs('option', 'show', false);
        }
    });

    $('.next-tab').click(function(e) {
        e.preventDefault();
        $tabs.tabs('option', 'hide', {
            effect: 'slide',
            direction: 'left',
            duration: 300
        });
        $tabs.tabs('option', 'show', {
            effect: 'slide',
            direction: 'right',
            duration: 300
        });
        var selected = $tabs.tabs('option', 'active');
        $tabs.tabs('option', 'active', (selected + 1));
    });

    $('.prev-tab').click(function(e) {
        e.preventDefault();
        $tabs.tabs('option', 'hide', {
            effect: 'slide',
            direction: 'right',
            duration: 300
        });
        $tabs.tabs('option', 'show', {
            effect: 'slide',
            direction: 'left',
            duration: 300
        });
        var selected = $tabs.tabs('option', 'active');
        $tabs.tabs('option', 'active', (selected - 1));
    });
}
$('.meal-tab-container ul li').on("click",function(){
    $('.meal-tab-container ul li').removeClass('activeli');
    $(this).addClass('activeli');
});

//STAR RATING
$('.rating-star').on('click',function(){
    var param = $(this).prev().attr('data-id'),
        star = $(this).parent().find('.rating-star');
   $(star).removeClass("change-color");
   $($(star).get().reverse().slice(0,param)).each(function(key,value){
        $(value).addClass('change-color');  
    })
})