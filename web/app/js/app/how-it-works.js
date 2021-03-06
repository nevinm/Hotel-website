var HowItWorksController = function () {
};
HowItWorksController.prototype = function () {

//Get reviews API process
    var locationCheckCallback = {
        success: function (data, textStatus) {
            var userDetails = JSON.parse(data);
            if (userDetails.status == 1) {
                $('#close').remove();
                $('#see-menu').remove();
                $('.popup .header').append('<img src="../images/cross-black.png" id="close">');
                $('.popup .button').append("<a href='menu.html' class='btn btn-large-secondary' id='see-menu'>" + "SEE MENU" + "</a>");
                showPopup(userDetails);
            } else {
                showLocationCheckPopup(userDetails);
            }
        },
        failure: function (XMLHttpRequest, textStatus, errorThrown) {
        }
    };

    var locationCheck = function (zipcode) {
        var url = baseURL + "check_delivery/",
                header = {
                    "session-key": localStorage["session_key"]
                },
        userData = {
            'zip': zipcode
        };
        data = JSON.stringify(userData);
        var locationCheckInstance = new AjaxHttpSender();
        locationCheckInstance.sendPost(url, header, data, locationCheckCallback);
    };

    var showLocationCheckPopup = function (userDetails) {
        var message = userDetails.message;
        $('.delivery-area-check-popup .deliver-message span').text(message);
        $('.delivery-area-check-popup').show();
        $('form#validate-email').validate().resetForm();

    };

    var saveEmailCallback = {
        success: function (data, textStatus) {
            var userDetails = JSON.parse(data);
            $('.delivery-area-check-popup').hide();
            showPopup(userDetails);
        },
        failure: function (XMLHttpRequest, textStatus, errorThrown) {
        }
    };

    var saveEmail = function (email, zipcode) {
        var url = baseURL + "save_email/",
                header = {
                    "session-key": localStorage["session_key"]
                },
        userData = {
            'email': email,
            'zipcode': zipcode
        };
        data = JSON.stringify(userData);
        var saveEmailInstance = new AjaxHttpSender();
        saveEmailInstance.sendPost(url, header, data, saveEmailCallback);
    };

    return {
        locationCheck: locationCheck,
        saveEmail: saveEmail
    };
}();
$(document).ready(function () {
    var howItWorks = new HowItWorksController();
    tabRendering();
    CartItemCount();

    $('.tab-container ul li a').on("click", function () {
        $('.tab-container ul li a').removeClass('activeli');
        $(this).addClass('activeli');
    });

    $(".how-it-works-tab").tabs({
        activate: function (event, ui) {
            if ((ui.newTab.context.id) == "ui-id-4")
                $(".next-tab").hide();
            else {
                $(".next-tab").show();
            }
            $('.tab-container ul li a').removeClass('activeli');
            $(ui.newTab).find('a').addClass('activeli');
        }
    });

    $('.sub-tab-container  ul li').on("click", function () {
        $('.sub-tab-container ul li a').removeClass('subactiveli');
        $(this).find('a').addClass('subactiveli');
    });

    $('.sub-tab-container li').on("click", function () {
        $('#farm,#roamimg-acres,#blue-ribbon-fish,#plantation,#common-thread-farm').hide();
        var clicked_id = $(this).find('a').attr('data-id');
        if ($(window).width() <= 767) {
            $('.next-sub-tab').show();
            $('.prev-sub-tab').show();
        }
        $(clicked_id).show();
        if (clicked_id == "#common-thread-farm") {
            $('.next-sub-tab').hide();
        }
        if (clicked_id == "#farm") {
            $('.prev-sub-tab').hide();
        }

    });

    $('.next-sub-tab').on("click", function () {
        $('.prev-sub-tab').show();
        var selected_a = $('.subactiveli').parent().next().find('a');
        selected_a.trigger("click");

    })

    $('.prev-sub-tab').on("click", function () {
        $('.next-sub-tab').show();
        var selected_a = $('.subactiveli').parent().prev().find('a');
        selected_a.trigger("click");

    })

    $(document).on('click', '.icon-cancel', function () {
        setTimeout(function () {
            $('.how-it-works-tab').show();
        }, 700);

    });

    $('.icon-menu').on("click", function () {
        $('.how-it-works-tab').hide();
    })

    $("#btn-what-you-get").on("click", function () {
        $('#you-cook,#what-you-get').animate({
            left: '-=100%'
        }, "slow", "easeOutQuart");
        $('#what-you-get').show();
        if ($(window).width() <= 767) {
            $(".backNav-mobile").show();
            $('.logo-mobile-container,.icon-menu').hide();
        }
    });

    $('#btn-our-suppliers').on("click", function () {
        $('#we-source,#our-suppliers').animate({
            left: '-=100%'
        }, "slow", "easeOutQuart");
        $('#our-suppliers').show();
        if ($(window).width() <= 767) {
            $(".backNav-mobile").show();
            $('.logo-mobile-container,.icon-menu').hide();
        }
    })

    $('.backNav-mobile').on("click", function () {
        $(".backNav-mobile").hide();
        $('.logo-mobile-container,.icon-menu').show();
    })

    $('.tablet-dropdown-btn').on("click", function () {
        $('.tab-header-drop-down').slideToggle();
    })

    //check delivery area
    $('#check-delivery-area').on('click', function (e) {
        e.preventDefault();
        var zip = $('#zip-code').val();
        if ($('form.button-container').valid()) {
            howItWorks.locationCheck(zip);
        }
    });
    $('#submit-email').on("click", function (e) {
        e.preventDefault();
        var email = $('input[type=email]').val(),
                zipcode = $('#zip-code').val();
        if ($('form#validate-email').valid()) {
            howItWorks.saveEmail(email, zipcode);
        }
    });

    $(document).on('click', '.delivery-area-check-popup img#cancel', function () {
        $('.delivery-area-check-popup').fadeOut();
    });

    //popup re-direction on enter
    $(document).on('keypress', function (e) {
        var key = e.which;
        if (key == 13)  // the enter key code
        {
            if ($('.popup-container').is(':visible')) {
                if ($("#see-menu").is(":visible")) {
                    $('#see-menu')[0].click();
                }
            }
        }
    });

    function tabRendering() {
        var $tabs = $(".how-it-works-tab").tabs({
            select: function (event, ui) {
                jQuery(this).css('height', jQuery(this).height());
                jQuery(this).css('overflow', 'hidden');
            },
            show: function (event, ui) {
                jQuery(this).css('height', 'auto');
                jQuery(this).css('overflow', 'visible');
            }
        });
        $('.ui-tabs-anchor').keydown(function (event) {
            // return false;
        });

        $('.next-tab').click(function (e) {
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

        $('.prev-tab').click(function (e) {
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
});

