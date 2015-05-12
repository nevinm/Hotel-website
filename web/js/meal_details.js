var ipadWidth = 768;
$(document).ready(function() {
    // $("#meal-tabs").tabs();
    mobileJqueryUITab();
});

function checkTabReplacement() {
    //To do mobile rendering
    if (window.innerWidth < ipadWidth && mobileRendered == false) {
        mobileJqueryUITab();
        replaceWord(true);
        mobileRendered = true;
    }
    //To do pc rendering
    else if (window.innerWidth >= ipadWidth && mobileRendered == true) {
        pcJqueryUiTab();
        replaceWord(false);
        mobileRendered = false;
    }
}

function replaceWord(isMobile) {
    if (isMobile) {
        $(".meal-tab-container").find('.pc-tab').each(function(key, value) {
            $value = $(value);
            replacedWord = $value.attr("data-mobile-link");
            $value.html(replacedWord);
        });
    } else {
        $(".meal-tab-container").find('.pc-tab').each(function(key, value) {
            $value = $(value);
            replacedWord = $value.attr("data-pc-link");
            $value.html(replacedWord);
        });
    }
}

function isMobileRendered() {
    if (window.innerWidth >= ipadWidth) {
        mobileRendered = false;
        pcJqueryUiTab();
        replaceWord(mobileRendered);
    } else {
        mobileRendered = true;
        mobileJqueryUITab();
        replaceWord(mobileRendered);
    }
}

function pcJqueryUiTab() {
    destroyTabs();
    $("#meal-tabs").tabs();
}

function destroyTabs() {
    if ($("#meal-tabs").data("ui-tabs")) {
        $("#meal-tabs").tabs('destroy');
    }
}

function mobileJqueryUITab() {
    destroyTabs();
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
