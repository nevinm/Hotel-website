function stripeIntegration() {
    $('#pay-form').submit(function(event) {
        if ($('#pay-form').valid()) {
            event.preventDefault();
            var $form = $(this);

            // Disable the submit button to prevent repeated clicks
            $form.find('button').prop('disabled', true);

            Stripe.card.createToken($form, stripeResponseHandler);

            // Prevent the form from submitting with the default action
            return false;
        }
    });
}

function stripeResponseHandler(status, response) {
    var $form = $('#pay-form');

    if (response.error) {
        // Show the errors on the form
        // $form.find('.payment-errors').text(response.error.message);
        $form.find('button').prop('disabled', false);
        var error = {};
        error.message = (response.error.message);
        showPopup(error);
        return;
    } else {
        // response contains id and card, which contains additional card details
        var token = response.id,
            currentPage = getCurrentPage("/", ".html", window.location.href);
        if (currentPage == "add-creditcard") {
            saveCreditCardDetails(token);
        } else if (currentPage == "checkout") {
            cardNotSavedCreateOrder(token);
        } else if(currentPage == "giftcard-payment"){
            fetchGiftCardData(token);
        }
    }
};
