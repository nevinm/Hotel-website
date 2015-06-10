$(document).ready(function() {
    $("#privacy-policy").on("click", function() {
        $(".terms-inner-details").hide();
        $(".privacy-inner-details").show();
        $("#terms-policy").removeClass("btn-medium-extended medium-green");
        $("#terms-policy").addClass("btn-medium-secondary background-button");
        $("#privacy-policy").removeClass("btn-medium-secondary background-button");
        $("#privacy-policy").addClass("btn-medium-extended medium-green");
    });

    $("#terms-policy").on("click", function() {
        $(".terms-inner-details").show();
        $(".privacy-inner-details").hide();
        $("#privacy-policy").removeClass("btn-medium-extended medium-green");
        $("#privacy-policy").addClass("btn-medium-secondary background-button");
        $("#terms-policy").removeClass("btn-medium-secondary background-button");
        $("#terms-policy").addClass("btn-medium-extended medium-green");
    });
});
