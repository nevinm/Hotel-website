$(document).ready(function() {
    getCartItems();
    populateYear();
    savedCardDetails();
    setCurrentTime();
    var cartItems, payPalEmail = "paypaluser@youremail.com",
        returnUrl = "http://meisterdish.qburst.com/views/menu.html",
        cancelReturnUrl = "http://meisterdish.qburst.com/views/checkout.html",
        notifyUrl = "http://meisterdish.qburst.com/views/checkout.html"

    //Remove cart items
    $(document).on('click', '#remove-cart-item', function() {
        var meal_id = $(this).parent().attr('data-id'); //may change
        removeCartItems(meal_id);
        updateReciept();
    });

    $('.driver-tip').on('change', function() {
        selectedTip = $(this).find('option:selected').text();
          $('.driver-tip-display').text(selectedTip+".00");
    });
    //Set time for delivery API call
    $('.set-time-button').on('click',function(){
        var requiredDate = $(this).attr("data-date");
        requiredDateTime = getDateTimeRequiredFormat(requiredDate)+ " " + $(this).attr('data-hr')+":00:00";
        saveDeliveryTime(requiredDateTime);
    });

    //Separate the today and week buttons
    timeActiveRestriction(".week-content input[type=button]", "checkout-time-button-active", ".today-content input[type=button]");
    timeActiveRestriction(".today-content input[type=button]", "checkout-time-button-active", ".week-content input[type=button]");
    //Within Week button restriction
    timeActiveRestriction(".week-content .date-content .checkout-time-button", "checkout-time-button-active", ".week-content .date-content .checkout-time-button");
    timeActiveRestriction(".week-content .time-content .checkout-time-button", "checkout-time-button-active", ".week-content .time-content .checkout-time-button");

    //Today button restriction
    timeActiveRestriction(".today-content .checkout-time-button", "checkout-time-button-active", ".today-content .checkout-time-button");

    $(document).on('click', '.order-list-items', function() {
        $('span#remove-cart-item').show();
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
        updateReciept();
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
        updateReciept();
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
    function populateYear() {
        var currentYear = new Date().getFullYear();
        for (var i = 1; i <= 20; i++) {
            $('#ExpYear').append("<option value='" + i + "'>" + currentYear + "</option>");
            currentYear = currentYear + 1;
        }
    }
    $('#save-credit-card').on("click", function() {
        saveCreditCardDetails();
    });
});


function setCurrentTime() {
    currentHour = getCurrentHour();
    $(".today-content .checkout-time-button").each(function(key, value) {
        if (getCurrentHour() == $(value).data().hr) {
            $(this).val("NOW");
            $(this).addClass("checkout-time-button-active");
        }
    });

    //Setting the correct date.
    var currentDate = getMonthDate(getCurrentDateTime(0));
    $(".today-content .content-heading").text("TODAY " + currentDate);
    $('.today-content').find('.checkout-time-button').each(function(key, value){
        $(value).attr("data-date",getMonthDate(getCurrentDateTime(0))+"/"+ getCurrentYear());
    });

    //Setting the future dates and blocking the dates other than tomorrow.
    $(".date-content .checkout-time-button").each(function(key, value){
        var tomorrowDate =getMonthDate(getCurrentDateTime(key+1));
        $(value).val(tomorrowDate);
        if(key!=0){
            $(value).addClass("button-disabled");
        }
    });
}

//Used for the time selection resrtiction
function timeActiveRestriction(buttonSelector, activeClass, oppositeSelector) {
    $(buttonSelector).on('click', function() {
        $(oppositeSelector).removeClass(activeClass);
        $(this).addClass(activeClass);
        if (buttonSelector == ".today-content input[type=button]") {
            $(".week-content .time-content .checkout-time-button").addClass("button-disabled");
        } else if (buttonSelector == ".week-content .date-content .checkout-time-button") {
            $(".week-content .time-content .checkout-time-button").removeClass("button-disabled");
           var date = $(this).val()+"/"+getCurrentYear();
            $(this).parents().eq(1).find('.time-content .checkout-time-button').each(function(key, value){
                $(value).attr('data-date',date);
            });
            firstDate = $(buttonSelector).parents().eq(1).find('.time-content .checkout-time-button')[0];
            $(firstDate).trigger("click");
        }
    });
}

function populateDate(cartItems){
    dateTime = cartItems.delivery_time.split(" ")[0];
    dateMonth = cartItems.delivery_time.substring(0,5).replace('-','/');
    hour = cartItems.delivery_time.substring(11,13);
    currentDate = getCurrentDateTime(0).replace(/\//g, "-");
    tomorrowDate = getCurrentDateTime(1).replace(/\//g, "-");
    if(dateTime==currentDate){
        $('.today-content .checkout-time-button').each(function(key, value){
            if($(value).data().hr == parseInt(hour)){
                $('.checkout-time-button-active').removeClass('checkout-time-button-active');
                $(value).addClass("checkout-time-button-active");
            }
        });
    }
    else if(dateTime==tomorrowDate){
        //Setting the future date
        tommorrowSelector = $('.week-content .date-content').find('.checkout-time-button')[0];
        $(tommorrowSelector).trigger("click");

        //Setting the future time.
        $('.week-content .set-time-button').each(function(key, value){
            if($(value).data().hr == parseInt(hour)){
                // $('.checkout-time-button-active').removeClass('checkout-time-button-active');
                $('.week-content .set-time-button').removeClass("checkout-time-button-active");
                // $(value).removeClass("button-disabled");
                // $(value).siblings().removeClass("button-disabled")
                $(value).addClass("checkout-time-button-active");
            }
        });
    }
}

//Get Cart items
var getCartItemsCallback = {
    success: function(data, textStatus) {
        localStorage['cartItems'] = data;
        cartItems = JSON.parse(data);
        if (cartItems.status == 1) {
            $(".emtpy-cart-message").hide();
            populateCartItems(cartItems);
            populateDate(cartItems);
        } else {
            $('.order-list-items').remove();
            $(".emtpy-cart-message").show();
        }
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

//Save delivery time
var saveDeliveryTimeCallback = {
    success: function(data, textStatus) {
        
    },
    failure: function(XMLHttpRequest, textStatus, errorThrown) {}
}

function saveDeliveryTime(date) {
    var url = baseURL + "save_delivery_time/",
        header = {
            "session-key": localStorage["session_key"]
        },
        params = {"delivery_time":date};
    data = JSON.stringify(params);
    var saveDeliveryTimeInstance = new AjaxHttpSender();
    saveDeliveryTimeInstance.sendPost(url, header, data, saveDeliveryTimeCallback);
}

//populate cart items
function populateCartItems(data) {
    $('.order-list-items').remove();
    $(".items-container .item-count").text("(" + data.total_count + ")");
    $.each(data.aaData, function(key, value) {
        $('.order-list-container').append("<div class='order-list-items' data-id='" + value.id + "'>" +
            "<img src='" + value.image + "'>" + "<span class='body-text-small'>" + value.name + "</span>" +
            "<div class='quantity-container'>" + "<span class='operator-minus' data-min='1'>" + '-' + "</span>" +
            "<input type='text' class='quantity' value='" + value.quantity + "'>" +
            "<span class='operator-plus' data-max='10'>" + '+' + "</span>" + "</div>" +
            "<span class='price-container' data-tax='" + value.tax + "'>" + dollarConvert(value.price) + "</span>" +
            "<img src='../images/cross_black.png' id='remove-cart-item'>" + "</div>");
    });
    updateReciept();
}

function updateReciept() {
    var totalItemCost = totalDeliveryCost = totalTaxCost = totalCost = 0,
        totalDriverTip = 5,
        totalDeliveryCost = 2;
    $(".order-list-items").each(function(key, value) {
        quantity = parseInt($(value).find('.quantity').val());
        price = parseInt($(value).find('.price-container').text().slice(1));
        tax = parseInt($(value).find('.price-container').attr("data-tax"));

        totalItemCost += (price * quantity);
        totalTaxCost += (tax * quantity);
    });
    totalCost = totalItemCost + totalTaxCost + totalDriverTip + totalDeliveryCost;

    $(".items-container .total-item-cost").text("$" + (totalItemCost).toFixed(2));
    $(".items-container .total-tax-cost").text("$" + (totalTaxCost).toFixed(2));
    $(".total-cost").text("$" + (totalCost).toFixed(2));
}

//Remove cart items call back
var removeCartItemsCallback = {
    success: function(data, textStatus) {
        CartItemCount();
        getCartItems();
        var message = JSON.parse(data).message;
        $('.popup-message span').text(message);
        $('.popup-message').show();
        setTimeout(function() {
            $('.popup-message').hide();
        }, 2000);
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
    success: function(data, textStatus) {
        localStorage['cartItems'] = data;
    },
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

        cartItems = JSON.parse(localStorage['cartItems']);
        // item data
        for (var i = 0; i < cartItems.aaData.length; i++) {
            var item = cartItems.aaData[i];
            var counter = i + 1;
            data["item_name_" + counter] = item.name;
            data["quantity_" + counter] = item.quantity;
            data["amount_" + counter] = (item.price).toFixed(2);
            data["tax_" + counter] = (item.tax).toFixed(2);
        }
        data["shipping_" + counter] = 2;
        data["handling_" + counter] = parseInt($('.driver-tip option:selected').text().substring(1));

        // build form
        var form = $('<form/></form>');
        form.attr("action", "https://www.sandbox.paypal.com/cgi-bin/webscr");
        form.attr("method", "POST");
        form.attr("style", "display:none;");
        addFormFields(form, data);
        addFormFields(form, options);
        $("body").append(form);

        // submit form
        // clearCart();
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
    success: function(data, textStatus) {},
    failure: function(XMLHttpRequest, textStatus, errorThrown) {}
}

//save credit card items
function savedCardDetails() {
    var url = baseURL + "get_saved_cards/",
        header = {
            "session-key": localStorage["session_key"]
        },
        params = {}
    data = JSON.stringify(params);
    var savedCardDetailsInstance = new AjaxHttpSender();
    savedCardDetailsInstance.sendPost(url, header, data, savedCardDetailsCallback);
}
