$(document).ready(function () {
    HelpController.initView();
});
var HelpController = (function () {
    function initView() {
        loadViewDefaults();
        bindEvents();
    }
    function loadViewDefaults() {

    }
    function bindEvents() {
        $(".question").on("click", function (e) {
            e.preventDefault();
            var $element = $(e.target).next('.answer-block');
            $('.answer-block').not($element).hide();
            $(".question div").not($(e.target)).removeClass("bold");
            $element.slideToggle(300);
            if ($(e.target).hasClass("bold")) {
                $(e.target).removeClass("bold");
            } else {
                $(e.target).addClass("bold");
            }
        });
    }
    return {
        initView: initView
    };
})();

