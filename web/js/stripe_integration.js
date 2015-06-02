function stripeIntegration() {
    $('#pay-form').submit(function(event) {
        event.preventDefault();
        var $form = $(this);

        // Disable the submit button to prevent repeated clicks
        $form.find('button').prop('disabled', true);

        Stripe.card.createToken($form, stripeResponseHandler);

        // Prevent the form from submitting with the default action
        return false;
    });
}

function stripeResponseHandler(status, response) {
    var $form = $('#pay-form');

    if (response.error) {
        // Show the errors on the form
        $form.find('.payment-errors').text(response.error.message);
        $form.find('button').prop('disabled', false);
    } else {
        // response contains id and card, which contains additional card details
        var token = response.id;
        saveCreditCardDetails(token);
    }
};