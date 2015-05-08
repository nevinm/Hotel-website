var ipadWidth = 768;
$(document).ready(function() {

    isMobileRendered();
    // checkTabReplacement();
    $(window).resize(function() {
        checkTabReplacement();
    });

});

function checkTabReplacement() {
	//To do mobile rendering
    if (window.innerWidth < ipadWidth && mobileRendered == false) {
        mobileJqueryUITab();
        replaceWord();
        mobileRendered = true;
    } 
	//To do pc rendering
    else if (window.innerWidth >= ipadWidth && mobileRendered == true) {
        pcJqueryUiTab();
        replaceWord();
        mobileRendered = false;
    }
}

function replaceWord() {
    $(".meal-tab-container").find('.pc-tab').each(function(key, value) {
        $value = $(value);
        replacedWord = $value.attr("data-link");
        $value.attr("data-link", $value.html());
        $value.html(replacedWord);
    });
}

function isMobileRendered() {
    if (window.innerWidth >= ipadWidth) {
        mobileRendered = false;
        pcJqueryUiTab();
    } else {
        mobileRendered = true;
        mobileJqueryUITab();
    }
}

function pcJqueryUiTab() {
    if ($("#meal-tabs").data("ui-tabs")) {
        $("#meal-tabs").tabs('destroy');
    }
    $("#meal-tabs").tabs();
}

function mobileJqueryUITab() {
    if ($("#meal-tabs").data("ui-tabs")) {
        $("#meal-tabs").tabs('destroy');
    }
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
