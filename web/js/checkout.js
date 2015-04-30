$(document).ready(function() {
    getCartItems();
    populateYear();
    savedCardDetails();
    var cartItems, payPalEmail ="paypaluser@youremail.com" , 
    returnUrl ="http://meisterdish.qburst.com/views/menu.html",
    cancelReturnUrl = "http://meisterdish.qburst.com/views/checkout.html",
    notifyUrl= "http://meisterdish.qburst.com/views/checkout.html"
    //Remove cart items
    $(document).on('click', '#remove-cart-item', function() {
        var meal_id = $(this).parent().attr('data-id'); //may change
        removeCartItems(meal_id);
    });

    //Clear cart
    $(document).on('click', '.clear-cart', function() {
        clearCart();
    });

    //update cart items
    $(document).on('click', '.operator-plus', function() {
        var oldVal = parseInt($(this).parent().find('.quantity').val()),
            newVal = oldVal + 1,
            meal_id = $(this).parents(':eq(1)').attr('data-id'),
            qty = newVal;
        if (oldVal < $(this).data("max")) {
            $(this).parent().find('.quantity').val(newVal);
        }
        updateCartItems(meal_id, qty);
    });

    $(document).on('click', '.operator-minus', function() {
        var oldVal = parseInt($(this).parent().find('.quantity').val()),
            newVal = oldVal - 1,
            meal_id = $(this).parents(':eq(1)').attr('data-id'),
            qty = newVal;
        if (oldVal > $(this).data("min")) {
            $(this).parent().find('.quantity').val(newVal);
        }
        updateCartItems(meal_id, qty);
    });

    //PayPal payment
    $(".paypal").on('click', function() {
        checkOutPayPal("PayPal", payPalEmail, {
            "return": returnUrl,
            "cancel_return": cancelReturnUrl,
            "notify_url": notifyUrl
        });
    });
    
    //populate year
    function populateYear(){
        var currentYear = new Date().getFullYear();
        for(var i = 1;i<=20;i++){
            $('#ExpYear').append("<option value='"+i+"'>"+currentYear+"</option>");
            currentYear = currentYear + 1;
        }
    }
    $('#save-credit-card').on("click",function(){
        saveCreditCardDetails();
    });
});

//Get Cart items
var getCartItemsCallback = {
    success: function(data, textStatus) {
        cartItems = JSON.parse(data);
        populateCartItems(cartItems);
    },
    failure: function(XMLHttpRequest, textStatus, errorThrown) {}
}

function getCartItems() {
    var url = baseURL + "get_cart_items/",
        header = {
            "session-key": localStorage["session_key"]
        },
        params = {};
    data = JSON.stringify(params);
    var getCartItemsInstance = new AjaxHttpSender();
    getCartItemsInstance.sendPost(url, header, data, getCartItemsCallback);
}

//populate cart items
function populateCartItems(data) {
    $('.order-list-items').remove();
    $.each(data.aaData, function(key, value) {
        $('.order-list-container').append("<div class='order-list-items' data-id='" + value.id + "'>" +
            "<img src='" + value.image + "'>" + "<span class='body-text-small'>" + value.name + "</span>" +
            "<div class='quantity-container'>" + "<span class='operator-minus' data-min='1'>" + '-' + "</span>" +
            "<input type='text' class='quantity' value='" + value.quantity + "'>" +
            "<span class='operator-plus' data-max='10'>" + '+' + "</span>" + "</div>" +
            "<span class='price-container'>" + dollarConvert(value.price) + "</span>" +
            "<img src='../images/cross_black.png' id='remove-cart-item'>"+ "</div>");
    });
}

//Remove cart items call back
var removeCartItemsCallback = {
    success: function(data, textStatus) {
        CartItemCount();
        getCartItems();
        var message = JSON.parse(data).message;
        $('.popup-message span').text(message);
         $('.popup-message').show();
        setTimeout(function(){
            $('.popup-message').hide();
        },2000); 
    },
    failure: function(XMLHttpRequest, textStatus, errorThrown) {}
}

//Remove cart items
function removeCartItems(meal_id) {
    var url = baseURL + "remove_from_cart/",
        header = {
            "session-key": localStorage["session_key"]
        },
        params = {
            "meal_id": meal_id
        };
    data = JSON.stringify(params);
    var removeCartItemsInstance = new AjaxHttpSender();
    removeCartItemsInstance.sendPost(url, header, data, removeCartItemsCallback);
}

//clear cart
var clearCartCallback = {
    success: function(data, textStatus) {
        CartItemCount();
        getCartItems();
    },
    failure: function(XMLHttpRequest, textStatus, errorThrown) {}
}

function clearCart() {
    var url = baseURL + "delete_cart/",
        header = {
            "session-key": localStorage["session_key"]
        },
        params = {};
    data = JSON.stringify(params);
    var clearCartInstance = new AjaxHttpSender();
    clearCartInstance.sendPost(url, header, data, clearCartCallback);
}

//update cart items call back
var updateCartItemsCallback = {
    success: function(data, textStatus) {},
    failure: function(XMLHttpRequest, textStatus, errorThrown) {}
}

//update cart items
function updateCartItems(meal_id, quantity) {
    var url = baseURL + "update_cart/",
        header = {
            "session-key": localStorage["session_key"]
        },
        params = {
            "meal_id": meal_id,
            "quantity": quantity
        };
    data = JSON.stringify(params);
    var updateCartItemsInstance = new AjaxHttpSender();
    updateCartItemsInstance.sendPost(url, header, data, updateCartItemsCallback);
}

function checkOutPayPal(serviceName, merchantID, options) {
    // global data
    var data = {
        cmd: "_cart",
        business: merchantID,
        upload: "1",
        rm: "2",
        charset: "utf-8"
    };

    // item data
    for (var i = 0; i < cartItems.aaData.length; i++) {
        var item = cartItems.aaData[i];
        var counter = i + 1;
        data["item_name_" + counter] = item.name;
        data["quantity_" + counter] = item.quantity;
        data["amount_" + counter] = (item.price + item.tax).toFixed(2);
    }

    // build form
    var form = $('<form/></form>');
    form.attr("action", "https://www.sandbox.paypal.com/cgi-bin/webscr");
    form.attr("method", "POST");
    form.attr("style", "display:none;");
    addFormFields(form, data);
    addFormFields(form, options);
    $("body").append(form);
    debugger;

    // submit form
    clearCart();
    form.submit();
    form.remove();
}
//save credit card details call back
var saveCreditCardDetailsCallback = {
    success: function(data, textStatus) {
        debugger;
    },
    failure: function(XMLHttpRequest, textStatus, errorThrown) {}
}

//save credit card items
function saveCreditCardDetails() {
    var url = baseURL + "save_credit_card/",
        card_number = $('#card-number').val(),
        cvv = $('#cvv-number').val(),
        Exp_month = $("#ExpMonth").val(),
        Exp_year = $("#ExpYear option:selected").text(),
        header = {
            "session-key": localStorage["session_key"]
        },
        params = {
            "number": card_number,
            "exp_month": Exp_month,
            "exp_year": Exp_year,
            "cvv2": cvv
            }
    data = JSON.stringify(params);
    var saveCreditCardDetailsInstance = new AjaxHttpSender();
    saveCreditCardDetailsInstance.sendPost(url, header, data, saveCreditCardDetailsCallback);
}

//Get saved cards
var savedCardDetailsCallback = {
    success: function(data, textStatus) {
        debugger;
    },
    failure: function(XMLHttpRequest, textStatus, errorThrown) {}
}

//save credit card items
function savedCardDetails() {
    var url = baseURL + "get_saved_cards/",
        header = {
            "session-key": localStorage["session_key"]
        },
        params = {
            }
    data = JSON.stringify(params);
    var savedCardDetailsInstance = new AjaxHttpSender();
    savedCardDetailsInstance.sendPost(url, header, data, savedCardDetailsCallback);
}