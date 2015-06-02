$(document).ready(function() {
	populateYear();
	CartItemCount();
});

function populateYear() {
        var currentYear = new Date().getFullYear();
        for (var i = 1; i <= 20; i++) {
            $('#ExpYear').append("<option value='" + i + "'>" + currentYear + "</option>");
            currentYear = currentYear + 1;
        }
    }