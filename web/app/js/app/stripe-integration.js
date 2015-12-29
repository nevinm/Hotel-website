function stripeIntegration() {
    $('#pay-form').submit(function (event) {
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
            new AddCreditCardController().saveCreditCardDetails(token);
        } else if (currentPage == "checkout") {
            cardNotSavedCreateOrder(token);
        } else if (currentPage == "giftcard-payment") {
            new GiftCardsController().fetchGiftCardData(token);
        }
    }
}
var StripeController = (function () {
    var global = {
        callback: undefined,
        form: undefined
    };
    function createToken(form, callbackFn) {
        global.callback = callbackFn;
        global.form = form;
        var $form = form;
        Stripe.card.createToken($form, StripeController.tokenResponseHandler);
        return false;
    }
    function tokenResponseHandler(status, response) {
        if (global.callback !== undefined) {
            global.callback(status, response, global.form);
        }
    }
    return {
        createToken: createToken,
        tokenResponseHandler: tokenResponseHandler
    };
})();
