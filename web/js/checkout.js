var billingAddressId, cardDetails,
        payPalEmail = "nazz007online-facilitator@gmail.com",
        returnUrl = baseURL + "paypal_success/",
        cancelReturnUrl = homeUrl + "/views/checkout.html",
        notifyUrl = baseURL + "paypal_ipn/",
        totalDiscount = 0,
        tipAmt = null,
        decimalPoint = 0,
        slotsObject = {"slot1": "4-5pm", "slot2": "5-6pm", "slot3": "6-7pm", "slot4": "7-8pm", "slot5": "8-9pm"};

$(document).ready(function () {
    loadViewDefaults();
    bindEvents();
    $('.loading-indicator').show();
    $("#tip-error").css("width", "144px");
    CartItemCount();
    if (localStorage["session_key"]) {
        getAddress();
        getCartItems();
        savedCardDetails();
        // CartItemCount();
    } else {
        $('.address-info-guest').show();
        $('.address-info').hide();
        $('.payment-method-guest-container').show();
//        $('.payment-info .checkout-header span').css('padding-left', '35px');
        $(".emtpy-cart-message").text("There are no items in cart.");
        $(".emtpy-cart-message").show();
    }
    stripeIntegration();
    setCurrentTime();
    populateYear($('#ExpYear'));
    fixGoogleMapLink();
    getDeliverySlots();
    getStates();
    var cartItems;

    //Remove cart items
    $(document).on('click', '#remove-cart-item', function () {
        var meal_id = $(this).parent().attr('data-id'); //may change
        removeCartItems(meal_id);
    });
    $('#tip-form').on('submit', function (e) {
        e.preventDefault();
    });
    $('.driver-tip').on('keydown', function (event) {
        return isNumber(event, this);
    }).on('keyup', function (event) {
        selectedTip = 0;
        $('.driver-tip-display').text("$0.00");
        selectedTip = this.value;
        if (isNaN(selectedTip) || selectedTip.length === 0) {
            $('.driver-tip-display').text("$0.00");
        } else if (selectedTip >= 0) {
            $('.driver-tip-display').text("$" + parseFloat(selectedTip).toFixed(2));
        }
        if ($('#tip-form').valid()) {
            updateReciept();
        }
    }).on('blur', function (e) {
        var element = $(this);
        if (element.val() === "")
            element.val(0);
    }).on('input', function (e) {
        var maxlength = $(this).attr("dataLength");
        var val = parseInt($(this).val()) + "";
        if (val.length > maxlength)
            $(this).val($(this).val().slice(0, maxlength));
    });
    function isNumber(evt, element) {
        var charCode = (evt.which) ? evt.which : evt.keyCode;
        if ((charCode != 190 || $(element).val().indexOf('.') != -1)  // “.” CHECK DOT, AND ONLY ONE.
                && (charCode != 110 || $(element).val().indexOf('.') != -1)  // “.” CHECK DOT, AND ONLY ONE.
                && ((charCode < 48 && charCode != 8)
                        || (charCode > 57 && charCode < 96)
                        || charCode > 105))
            return false;
        return true;
    }
    //Set time for delivery API call
    $('.set-time-button').on('click', function () {
        var requiredDate = $(this).attr("data-date");
        requiredDateTime = getDateTimeRequiredFormat(requiredDate) + " " + $(this).attr('data-hr') + ":00:00";
        saveDeliveryTime(requiredDateTime);
    });

    //Separate the today and week buttons
    timeActiveRestriction(".week-content input[type=button]", "checkout-time-button-active", ".today-content input[type=button]");
    timeActiveRestriction(".today-content input[type=button]", "checkout-time-button-active", ".week-content input[type=button]");
    //Today button restriction
    timeActiveRestriction(".today-content .checkout-time-button", "checkout-time-button-active", ".today-content .checkout-time-button");
    timeActiveRestriction(".week-content .checkout-time-button", "checkout-time-button-active", ".week-content .checkout-time-button");

    $(document).on('click', '.order-list-items', function () {
        $('span#remove-cart-item').show();
    });

    //update cart items
    $(document).on('click', '.operator-plus', function () {
        var oldVal = parseInt($(this).parent().find('.quantity').val()),
                newVal = oldVal + 2,
                meal_id = $(this).parents(':eq(1)').attr('data-id'),
                qty = newVal,
                $priceSpanElement = $(this).parents().eq(1).find(".price-container"),
                price = $priceSpanElement.data("price"),
                tax = $priceSpanElement.data("tax");
        if (newVal <= $(this).data("max")) {
            $(this).parent().find('.quantity').val(newVal);
        }
        if (qty <= 10) {
            $(this).parents().eq(1).find(".price-container").text(dollarConvert(((price + tax) * qty).toFixed(2)));
            updateCartItems(meal_id, qty);
            updateReciept();
            $(".item-count").text("(" + updateQuantity() + ")");
        }
    });
//    $(document).on('click', '.operator-plus', function () {
//        var $trElement = $(this).closest('tr');
//        var oldVal = parseInt($trElement.find('.quantity').val()),
//                newVal = oldVal + 2,
//                meal_id = $trElement.attr('data-id'),
//                qty = newVal,
//                $priceSpanElement = $trElement.find(".price-container"),
//                price = $priceSpanElement.data("price"),
//                tax = $priceSpanElement.data("tax");
//        if (newVal <= $(this).data("max")) {
//            $trElement.find('.quantity').val(newVal);
//        }
//        if (qty <= 10) {
//            $trElement.find(".price-container").text(dollarConvert(((price + tax) * qty).toFixed(2)));
//            updateCartItems(meal_id, qty);
//            updateReciept();
//            $(".item-count").text("(" + updateQuantity() + ")");
//        }
//    });

    $(document).on('click', '#save-payment', function () {
        var selectedId = $('input[type=radio][name=change-card]:checked').attr('data-id');
        showSelectedPaymentMethod(selectedId);
        $('.address-payment-list-popup').hide();
    });

    $(document).on('click', '.operator-minus', function () {
        var oldVal = parseInt($(this).parent().find('.quantity').val()),
                newVal = oldVal - 2,
                meal_id = $(this).parents(':eq(1)').attr('data-id'),
                qty = newVal,
                $priceSpanElement = $(this).parents().eq(1).find(".price-container"),
                price = $priceSpanElement.data("price"),
                tax = $priceSpanElement.data("tax");

        if (oldVal > $(this).data("min")) {
            $(this).parent().find('.quantity').val(newVal);
        }
        if (qty >= 1) {
            $(this).parents().eq(1).find(".price-container").text(dollarConvert(((price + tax) * qty).toFixed(2)));
            updateCartItems(meal_id, qty);
            updateReciept();
            $(".item-count").text("(" + updateQuantity() + ")");
        }
    });
//    $(document).on('click', '.operator-minus', function () {
//        var $trElement = $(this).closest('tr');
//        var oldVal = parseInt($trElement.find('.quantity').val()),
//                newVal = oldVal - 2,
//                meal_id = $trElement.attr('data-id'),
//                qty = newVal,
//                $priceSpanElement = $trElement.find(".price-container"),
//                price = $priceSpanElement.data("price"),
//                tax = $priceSpanElement.data("tax");
//
//        if (oldVal > $(this).data("min")) {
//            $trElement.find('.quantity').val(newVal);
//        }
//        if (qty >= 1) {
//            $trElement.find(".price-container").text(dollarConvert(((price + tax) * qty).toFixed(2)));
//            updateCartItems(meal_id, qty);
//            updateReciept();
//            $(".item-count").text("(" + updateQuantity() + ")");
//        }
//    });

    $(document).on('click', 'input[type=radio][name=address]', function () {
        $('#save-delivery-address').removeClass('button-disabled');
    });

    $(document).on('click', '#change-address', function () {
        populateAddressListPopup();
    });
    //add address
    $(document).on('click', '#add-address-popup', function () {
        loadViewDefaults();
        if (localStorage['loggedIn'] != 'true') {
            getProfile();
        }
        $('#new-address-form').validate().resetForm();
        $('.address-payment-list-popup').hide();
        $('.addresspopup-wrapper').show();
    });
    $('#close-new-address-form').on("click", function () {
        $(".regular-checkbox").prop("checked", false);
        $('.addresspopup-wrapper').hide();
    })
    $(document).on('click', '#save-new-address', function (e) {
        e.preventDefault();
        if ($('#new-address-form').valid()) {
            addAddress('popup');
        }
    });

    $(document).on('click', '#cancel', function () {
        $('.address-payment-list-popup').hide();
    });

    $(document).on('click', '#save-delivery-address', function () {
        var selectedId = $('input[type=radio][name=address]:checked').attr('data-id');
        saveDeliveryTime("", selectedId);
        $('.address-payment-list-popup').hide();

    });

    $('#add-guest-address').on("click", function (e) {
        e.preventDefault();
        if ($('#guest-address-info').valid()) {
            if (localStorage['cartItems'] === undefined
                    || localStorage['cartItems'] === null) {
                var errorData = {};
                errorData.message = "Add meals to cart and then proceed";
                showPopup(errorData);
                return false;
            } else {
                addAddress();
            }
        }
    });

    $('#change-payment-method').on("click", function () {
        populateCreditCardDetails();
    })
    $('#promo-gift-input').on("keydown", function (e) {
        if (e.keyCode == 13) {
            $("#apply-promo-gift").trigger("click");
        }
    });

    $('#apply-promo-gift').on("click", function () {
        var button_value = $('#apply-promo-gift').val(),
                code = $('#promo-gift-input').val(),
                code_length = code.length;
        $(".promo-validation-message").empty();
        if (button_value == "APPLY") {
            $('.promo-validation-message').css('color', '#ff7878');
            if (localStorage['loggedIn'] != 'true') {
                $('.promo-validation-message').text("You must be logged in to use coupons.");
            } else if (code == "") {
                $('.promo-validation-message').text("* " + "Please enter Giftcard/Promocode.");
            } else if (code_length > 9) {
                $('.promo-validation-message').text("* " + "Please enter valid Giftcard/Promocode.");
            } else {
                checkPromoCode(code);
            }
        }
        if (button_value == "DELETE") {
            $("#promo-gift-input").val("");
            removePromocode();
        }
    });

    $("#place-order").on("click", function (e) {
        e.preventDefault();
        if (validateOrder()) {
            placeOrder();
        }
    });

    $("#pay-form").submit(function (e) {
        e.preventDefault();
    });
    $('#pickup-radio').on("click", function () {
        resetSlots();
        $(".regular-checkbox").prop("checked", false);
        $('.address-info-guest').show();
        $('.address-info').hide();
        $("#guest-address-info input").removeClass('error');
        $("#guest-address-info").validate().resetForm();
        $("#guest-address-info").find("input").not("#guest-email, #hidden-pickupPhone,#hidden-pickupEmail,#guest-phone,#add-guest-address").val("");
        $("#guest-address-info").find("input").not("#guest-email, #guest-phone,#add-guest-address").addClass("autofillremove");
        $("#guest-address-info").find("input").not("#guest-email, #guest-phone").attr("disabled", "disabled");
        $("#guest-address-info").find("input").not("#guest-email, #guest-phone").addClass("button-disabled");
        $('.pickup-content').show();
        $("#add-guest-address").hide();
        $(".state-selector-container").hide();
        $(".instruction-container .content-heading").hide();
        $(".instruction-container textarea").hide();
        updateReciept();
        if (localStorage['loggedIn'] == 'true') {
            $(".have-account").hide();
        }
    });

    $('#delivery-radio').on("click", function () {
        getDeliverySlots();
        if ($('.address-info').is(':empty')) {
            $('.address-info-guest').show();

            $('.address-info').hide();
        } else {
            $('.address-info').show();
            $('.address-info-guest').hide();
        }
        $(".instruction-container .content-heading").show();
        $(".instruction-container textarea").show();
        $("#guest-address-info").find("input").not("#guest-email, #guest-phone").removeAttr("disabled");
        $("#guest-address-info").find("input").not("#guest-email, #guest-phone").removeClass("button-disabled");
        $("#guest-address-info").find("input").not("#guest-email, #guest-phone").removeClass("autofillremove");
        if (!localStorage['loggedIn'] == 'true') {
            $(".have-account").show()
        }
        $('.pickup-content').hide();
        $("#add-guest-address").show();
        $(".state-selector-container").show();
//        $('span.driver-tip-display').text('$5.00');
//        $('.driver-tip').val(5);
        updateReciept();
        $('#tip-form').validate().resetForm();
        $("#guest-address-info").validate().resetForm();
        loadViewDefaults();
    });

    $('#is-gift-card').on('click', function () {
        $('.isPromocode-wrapper').slideToggle();
    });
});

function haveAccountCheck() {
    var userLoggedin = localStorage["loggedIn"] ? JSON.parse(localStorage["loggedIn"]) : null,
            adminLoggedin = localStorage["admin_loggedIn"] ? JSON.parse(localStorage['admin_loggedIn']) : null;
    loggedIn = (userLoggedin || adminLoggedin);
    if (loggedIn) {
        $(".have-account").hide();
    }
}

function setCurrentTime() {
    currentHourMin = getCurrentHourMin();
    var closingTime = 21,
            minutesToCLose = 15;
    $(".today-content .checkout-time-button").each(function (key, value) {
        currentHour = currentHourMin.substring(0, currentHourMin.length - 3);
        console.log(new Date().getDay());
        if (new Date().getDay() !== 0 && new Date().getDay() !== 6) {
            if (currentHour >= closingTime) {
                $(this).remove();
                $(".shop-status").show();
            } else {
                currentMintues = parseInt(currentHourMin.slice(-2));
                if (parseInt(currentHour) == $(value).data().hr) {
                    $(this).prevAll('.set-time-button').remove();
                    $(this).val("NOW");
                    $(this).addClass("checkout-time-button-active");
                    if (currentMintues >= minutesToCLose) {
                        $(this).addClass("button-disabled");
                        $(this).removeClass("checkout-time-button-active");

                    }
                }
            }
        }
    });

    var currentdate = new Date(),
            days = weekendRestrictionDayCount(currentdate.getDay()),
            currentDateNum = days.firstDateCount, tomorrowDateNum = days.secondDateCount;

    //Setting the correct date.
    var currentDate = getCurrentDateMonth(currentDateNum);
    if (currentDateNum == 0) {
        $(".today-content .content-heading").text("TODAY");
    } else {
        $(".today-content .content-heading").text(currentDate);
    }
    $(".today-content .content-heading").attr("data-date",
            getMonthDate(getCurrentDateTime(currentDateNum)) + "/" + getCurrentYear());
    $('.today-content').find('.checkout-time-button').each(function (key, value) {
        $(value).attr("data-date", getMonthDate(getCurrentDateTime(currentDateNum)) +
                "/" + getCurrentYear());
    });

    //Setting the future dates and blocking the dates other than tomorrow.
    var tomorrowDate = getCurrentDateMonth(tomorrowDateNum);
    $(".week-content .content-heading").text(tomorrowDate);
    $(".week-content .content-heading").attr("data-date",
            getMonthDate(getCurrentDateTime(tomorrowDateNum)) + "/" + getCurrentYear());
    $(".week-content .checkout-time-button").each(function (key, value) {
        $(value).attr("data-date", getMonthDate(getCurrentDateTime(tomorrowDateNum)) +
                "/" + getCurrentYear());
    });
}

//Used for the time selection resrtiction
function timeActiveRestriction(buttonSelector, activeClass, oppositeSelector) {
    $(buttonSelector).on('click', function () {
        $(oppositeSelector).removeClass(activeClass);
        $(this).addClass(activeClass);
    });
}

function populateDate(cartItems) {
    var currentdate = new Date();
    days = weekendRestrictionDayCount(currentdate.getDay());
    dateTime = cartItems.delivery_time.split(" ")[0];
    dateMonth = cartItems.delivery_time.substring(0, 5).replace('-', '/');
    hour = cartItems.delivery_time.substring(11, 13);
    currentDate = getCurrentDateTime(days.firstDateCount).replace(/\//, "-");
    tomorrowDate = getCurrentDateTime(days.secondDateCount).replace(/\//g, "-");
    if (dateTime == currentDate) {
        $('.today-content .checkout-time-button').each(function (key, value) {
            if ($(value).data().hr == parseInt(hour) && !($(value).val() == "N/A")) {
                $('.checkout-time-button-active').removeClass('checkout-time-button-active');
                $(value).addClass("checkout-time-button-active");
            }
        });
    } else if (dateTime == tomorrowDate) {
        //Setting the future date
        tommorrowSelector = $('.week-content .date-content').find('.checkout-time-button')[0];
        $(tommorrowSelector).trigger("click");

        //Setting the future time.
        $('.week-content .set-time-button').each(function (key, value) {
            if ($(value).data().hr == parseInt(hour) && !($(value).val() == "N/A")) {
                $('.week-content .set-time-button').removeClass("checkout-time-button-active");
                $(value).addClass("checkout-time-button-active");
            }
        });
    }
}

function populateDeliverySlotData(deliverySlotData) {
    $.each(deliverySlotData.aaData, function (key, value) {
        var dateCorrected = value.date.replace(/\-/g, "/"),
                currentDateButtons;
        //Traversing through object.
        for (var key in value) {
            if (value.hasOwnProperty(key)) {
                if (value[key] == 0) {
                    currentDateButton = $(".checkout-time-button[data-date='" + dateCorrected + "'][data-slot='" + key + "']");
                    if (currentDateButton.length) {
                        currentDateButton[0].value = 'N/A';
                        currentDateButton.addClass("time-slot-disabled");
                        currentDateButton.removeClass("checkout-time-button-active");
                        currentDateButton.removeClass("button-disabled");
                    } else {
                    }
                }
            }
        }
    });
}

//Get Delivery slots call back
var getDeliverySlotsCallback = {
    success: function (data, textStatus) {
        deliverySlotData = JSON.parse(data);
        if (deliverySlotData.status == 1) {
            if ($("#delivery-radio").prop("checked"))
                populateDeliverySlotData(deliverySlotData);
        } else {
            showPopup(deliverySlotData);
        }
    },
    failure: function (XMLHttpRequest, textStatus, errorThrown) {
    }
}

function getDeliverySlots() {
    var startDate = getDateTimeRequiredFormat($(".today-content .content-heading").attr("data-date")),
            endData = getDateTimeRequiredFormat($(".week-content .content-heading").attr("data-date")),
            url = baseURL + "get_delivery_slots/",
            header = {
                "session-key": localStorage["session_key"]
            },
    params = {
        "from_date": startDate,
        "to_date": endData
    };
    data = JSON.stringify(params);
    var getDeliverySlotsInstance = new AjaxHttpSender();
    getDeliverySlotsInstance.sendPost(url, header, data, getDeliverySlotsCallback);
}

//Get Cart items
var getCartItemsCallback = {
    success: function (data, textStatus) {
        localStorage['cartItems'] = data;
        cartItems = JSON.parse(data);
        if (cartItems.status == 1) {
            $(".emtpy-cart-message").hide();
            if (cartItems.total_count > 0) {
                $(".total-delivery-cost").text("$2.95");
                $(".driver-tip").val(5);
            } else {
                $(".total-delivery-cost").text("$0.00");
                $(".driver-tip").val(0);
            }
            if ($('.driver-tip').val().length > 0) {
                $(".driver-tip-display").text("$" + parseFloat($('.driver-tip').val()).toFixed(2));
            } else {
                $(".total-delivery-cost").text("$0.00");
            }
            populateCartItems(cartItems);
            populateDate(cartItems);
            if (cartItems.coupon != null) {
                populateCoupon(cartItems.coupon);
            }
            if (cartItems.credits) {
                $(".discount-container .discount-amount").css('color', '#8EC657');
            }
            if (cartItems.credit_type === "percentage") {
                $(".discount-container .discount-amount").text("-" + cartItems.credits + "%");
                $('#hidden-credit').val('0');
            } else if (cartItems.credit_type === "amount") {
                if (cartItems.credits > 0) {
                    $(".discount-container .discount-amount").text("-" + "$" + (cartItems.credits).toFixed(2));
                } else {
                    $(".discount-container .discount-amount").text("$" + (cartItems.credits).toFixed(2));
                }
                $('#hidden-credit').val(cartItems.credits);
            }
        } else {
            $('.order-list-items').remove();
//            $("#checkOutItems tbody tr").remove();
            $(".emtpy-cart-message").empty();
            $(".emtpy-cart-message").append("<span>" + cartItems.message + "</span>");
            $(".emtpy-cart-message").show();
            $(".items-container .item-count").text('(0)');
        }
        updateReciept();
    },
    failure: function (XMLHttpRequest, textStatus, errorThrown) {
    }
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
    success: function (data, textStatus, delivery_Id) {
        var userDetails = JSON.parse(data);
        if (userDetails.status == -1) {
            showPopup(userDetails);
        } else {
            if (delivery_Id) {
                changeDeliveryAddress(delivery_Id);
            } else {
            }
        }
    },
    failure: function (XMLHttpRequest, textStatus, errorThrown) {
    }
}

function saveDeliveryTime(date, delivery_Id) {
    var url = baseURL + "save_delivery_time/",
            header = {
                "session-key": localStorage["session_key"]
            };
    if (date) {
        params = {
            "delivery_time": date
        };
    }
    if (delivery_Id) {
        params = {
            "delivery_address": delivery_Id
        };
    }
    data = JSON.stringify(params);
    var saveDeliveryTimeInstance = new AjaxHttpSender();
    saveDeliveryTimeInstance.sendPost(url, header, data, saveDeliveryTimeCallback, delivery_Id);
}

//populate cart items
function populateCartItems(data) {
    $('.order-list-items').remove();
//    $("#checkOutItems tbody tr").remove();
    $(".items-container .item-count").text("(" + data.total_count + ")");
    if (data.total_count > 0) {
        $(".total-delivery-cost").text("$2.95");
        $(".driver-tip").val(5);
    } else {
        $(".total-delivery-cost").text("$0.00");
        $(".driver-tip").val(0);
    }
    if ($('.driver-tip').val().length > 0) {
        $(".driver-tip-display").text("$" + parseFloat($('.driver-tip').val()).toFixed(2));
    } else {
        $(".driver-tip-display").text("$0.00");
    }
//    var element = "";
    $.each(data.aaData, function (key, value) {
        $('.order-list-container').append("<div class='order-list-items' data-id='" + value.id + "'>" +
                "<img src='" + value.image + "'>" + "<span class='body-text-small'>" + value.name + "</span>" +
                "<div class='quantity-container'>" + "<span class='operator-minus' data-min='2'>" + '-' + "</span>" +
                "<input type='text' disabled='disabled' class='quantity' value='" + value.quantity + "'>" +
                "<span class='operator-plus' data-max='10'>" + '+' + "</span>" + "</div>" +
                "<span class='price-container' data-tax='" + value.tax + "' data-price='" + value.price + "'>" +
                dollarConvert(parseFloat((value.tax + value.price) * value.quantity).toFixed(2)) + "</span>" +
                "<img src='../images/hamburger-menu-close.png' id='remove-cart-item'>" + "</div>");
//        element += "<tr class='' data-id='" + value.id + "'>" +
//                "<td><img src='" + value.image + "'></td>" +
//                "<td>" + value.name + "</td>" +
//                "<td><div class='quantity-container'>" + "<span class='operator-minus' data-min='2'>" + '-' + "</span>" +
//                "<input type='text' disabled='disabled' class='quantity' value='" + value.quantity + "'>" +
//                "<span class='operator-plus' data-max='10'>" + '+' + "</span>" + "</div></td>" +
//                "<td class='price-container' data-tax='" + value.tax + "' data-price='" + value.price + "'>" + dollarConvert(parseFloat((value.tax + value.price) * value.quantity).toFixed(2)) + "</td>" +
//                "<td data-id='" + value.id + "'><img src='../images/hamburger-menu-close.png' id='remove-cart-item'></td>" +
//                "</tr>";
    });
//    $("#checkOutItems tbody").append(element);
    updateReciept();
}

function updateQuantity() {
    var parentElement = $(".order-list-items").find(".quantity"),
//    var parentElement = $("#checkOutItems tbody tr").find(".quantity"),
            totalQuantity = 0;
    $(parentElement).each(function (index, elem) {
        totalQuantity += parseInt($(elem).val());
    });
    return totalQuantity;
}

function updateReciept(GiftcardDetails, flag) {
    var totalItemCost = totalDeliveryCost = totalTaxCost = totalCost = 0,
            totalCredits = 0,
            appliedCredit = 0,
            grandTotal = 0,
            appliedUserCredit = 0,
            appliedDiscount = 0,
            totalDriverTip = parseFloat($('.driver-tip').val()),
            totalDeliveryCost = 2.95;
    totalCredits = parseFloat($('#hidden-credit').val());
    totalDeliveryCost = 0;

    if ($('#pickup-radio').prop('checked')) {
        totalDeliveryCost = 0;
        totalDriverTip = 0;
//        tipAmt = $('.driver-tip').val();
//        $('.driver-tip').val(0);
        $(".driver-tip-container").hide();
        $('span.total-delivery-cost').text('$0.00');
    } else {
        if ($(".order-list-items").length > 0) {
//        if ($("#checkOutItems tbody tr").length > 0) {
            totalDeliveryCost = 2.95;
            $('span.total-delivery-cost').text('$2.95');
//            if ($('.driver-tip').is(':visible')) {
//                tipAmt = $('.driver-tip').val();
//            }
//            if (tipAmt) {
//                $('.driver-tip').val(tipAmt);
//            }
            if ($('.driver-tip').val().length > 0) {
                $(".driver-tip-display").text("$" + parseFloat($('.driver-tip').val()).toFixed(2));
            } else {
                $(".driver-tip-display").text("$0.00");
            }

        } else {
            $('span.total-delivery-cost').text('$0.00');
            $('.driver-tip').val(0);
            $(".driver-tip-display").text("$" + parseFloat($('.driver-tip').val()).toFixed(2));
        }
        $(".driver-tip-container").show();
        totalDriverTip = parseFloat($('.driver-tip').val());
    }
    $(".order-list-items").each(function (key, value) {
//    $("#checkOutItems tbody tr").each(function (key, value) {
        quantity = parseInt($(value).find('.quantity').val());
        price = parseFloat($(value).find('.price-container').attr("data-price"));
        tax = parseFloat($(value).find('.price-container').attr("data-tax"));

        totalItemCost += (price * quantity);
        totalTaxCost += (tax * quantity);
    });
    if (isNaN(totalDriverTip)) {
        totalDriverTip = 0;
    }
    grandTotal = totalItemCost + totalTaxCost + totalDeliveryCost;
    var creditType = "amount";
    if (cartItems.credit_type === "percentage") {
        totalDiscount = grandTotal * cartItems.credits / 100;
        creditType = "percentage";
    }
    grandTotal += totalDriverTip;
    if (GiftcardDetails && !flag) {
        totalItemCost = GiftcardDetails.amount;
        totalTaxCost = GiftcardDetails.tax;
        totalDiscount = GiftcardDetails.discount;
        totalCredits = GiftcardDetails.credits;
        creditType = "gift";
    }
    if (flag == "coupon-applied") {
        totalDiscount = GiftcardDetails.discount
        creditType = "gift";
    }
    totalCredits = totalCredits + totalDiscount;
    if (totalCredits > grandTotal) {
        appliedCredit = grandTotal;
        grandTotal = 0;
    } else {
        appliedCredit = totalCredits;
        grandTotal = grandTotal - totalCredits;
    }

    if (appliedCredit > 0) {
        $(".discount-container .discount-amount").text("-" + "$" + (appliedCredit).toFixed(2));
    } else {
        $(".discount-container .discount-amount").text("$" + (appliedCredit).toFixed(2));
    }
    if (creditType === "percentage") {
        $(".discount-container .discount-amount").text("-" + cartItems.credits + "%");
    }
    $(".items-container .total-item-cost").text("$" + (totalItemCost).toFixed(2));
    $(".items-container .total-tax-cost").text("$" + (totalTaxCost).toFixed(2));
    $(".total-cost").text("$" + (grandTotal).toFixed(2));
    $(".total-cost").val(grandTotal);
}

//Remove cart items call back
var removeCartItemsCallback = {
    success: function (data, textStatus) {
        removeData = JSON.parse(data);
        if (removeData.status == 1) {
            CartItemCount();
            getCartItems();
            var message = removeData.message;
            $('.popup-message span').text(message);
            $('.popup-message').show();
            setTimeout(function () {
                $('.popup-message').hide();
            }, 2000);
        } else {
        }
    },
    failure: function (XMLHttpRequest, textStatus, errorThrown) {
    }
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
    success: function (data, textStatus) {
        CartItemCount();
        getCartItems();
    },
    failure: function (XMLHttpRequest, textStatus, errorThrown) {
    }
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
    success: function (data, textStatus) {
        var cartDetails = JSON.parse(data);
        if (cartDetails.status == 1) {
            CartItemCount();
            localStorage['cartItems'] = data;
        }
    },
    failure: function (XMLHttpRequest, textStatus, errorThrown) {
    }
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

//save credit card details call back
var creditCardAddToDbCallback = {
    success: function (data, textStatus) {
        var response = JSON.parse(data);
        if (response.status == 1) {
            savedCardDetails();
        }
    },
    failure: function (XMLHttpRequest, textStatus, errorThrown) {
    }
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
        "cvv2": cvv,
        "first_name": "first_name",
        "last_name": "last_name"
    }
    data = JSON.stringify(params);
    var saveCreditCardDetailsInstance = new AjaxHttpSender();
    saveCreditCardDetailsInstance.sendPost(url, header, data, creditCardAddToDbCallback);
}

//Get saved cards
var savedCardDetailsCallback = {
    success: function (data, textStatus) {
        var last_num;
        cardDetails = JSON.parse(data);
        if (cardDetails.status == 1) {
            if (cardDetails.cards.length != 0) {
                populateCardDetails(cardDetails.cards);
                $('.payment-method-container').show();
                $('.payment-method-guest-container').hide();
            } else {
                $('.payment-method-guest-container').show();
                $("#firstCreditCardBtn").show();
//                $('.payment-info .checkout-header span').css('padding-left', '35px');
            }
        } else {
            showPopup(cardDetails);
        }
    },
    failure: function (XMLHttpRequest, textStatus, errorThrown) {
    }
}

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

function populateCardDetails(cards, selectedId) {
    $('.saved-cards').html("");
    if (selectedId) {
        $.each(cards, function (key, value) {
            last_num = cards[key].number.slice(-4);
            if (selectedId == value.id) {
                $('.saved-cards').append("<div class='saved-card-list'>" +
                        "<input type='radio' class='checkbox-green added-card pullLeft payment-checked' name='saved-card' id='" + value.id +
                        "' class='radio-button-payment'>" +
                        "<label for='" + value.id + "'>" +
                        "<img class='paypal' src='" + value.logo + "'>" +
                        "<span class='body-text-small'>" + value.type + " " + "ending in" + " " + last_num + "</span>" +
                        "<span class='body-text-small'>" + "Expires on" + " " +
                        value.expire_month + "/" + value.expire_year + "</span>" + "</label>" + "</div>");
            }
        });

    } else {
        $.each(cards, function (key, value) {
            last_num = cards[key].number.slice(-4);
            $('.saved-cards').append("<div class='saved-card-list'>" +
                    "<input type='radio' class='checkbox-green added-card pullLeft payment-checked' name='saved-card' id='" + value.id +
                    "' class='radio-button-payment'>" +
                    "<label for='" + value.id + "'>" +
                    "<img class='paypal' src='" + value.logo + "'>" +
                    "<span class='body-text-small'>" + value.type + " " + "ending in" + " " + last_num + "</span>" +
                    "<span class='body-text-small'>" + "Expires on" + " " +
                    value.expire_month + "/" + value.expire_year + "</span>" + "</label>" + "</div>");
        });
    }
}

$(window).resize(function () {
    mobileResponsive();
});

$(window).load(function () {
    mobileResponsive();
});

function mobileResponsive() {
    if ($(window).width() <= 767 && $(window).width() >= 320) {
        $('.delivery-info-container').removeClass('box-border');
        $('.delivery-time-container').removeClass('box-border');
        $('.delivery-info').addClass('box-border');
        $('.payment-info').addClass('box-border');
        $('.time-container').addClass('box-border');
    } else {
        $('.delivery-time-container').addClass('box-border');
        $('.delivery-info-container').addClass('box-border');
        $('.delivery-info').removeClass('box-border');
        $('.payment-info').removeClass('box-border');
        $('.time-container').removeClass('box-border');
    }
}

//ADDRESS LIST
var getAddressCallback = {
    success: function (data, textStatus, flag) {
        userDetails = JSON.parse(data);
        if (userDetails.status == 1) {
            addressList = userDetails.address_list;
            $.each(addressList, function (key, value) {
                if (value.is_primary == 1) {
                    billingAddressId = value.id;
                }
            });
            if (addressList.length === 1 && addressList[0].is_primary === 0) {
                setPrimaryAdd(addressList[0].id);
                billingAddressId = addressList[0].id;
                userDetails.delivery_address = billingAddressId;
            }
            if (flag == "populateAddressToPopUp") {
                appendAddresscontent(userDetails);
            } else {
                popuplateAddressList(JSON.stringify(userDetails));
            }
        } else {
        }
    },
    failure: function (XMLHttpRequest, textStatus, errorThrown) {
    }
}

function getAddress(flag) {
    var url = baseURL + "get_address_list/",
            header = {
                "session-key": localStorage["session_key"]
            },
    userData = {
        "checkout": 1
    };
    data = JSON.stringify(userData);
    var getAddressInstance = new AjaxHttpSender();
    getAddressInstance.sendPost(url, header, data, getAddressCallback, flag);
}

//From API
function popuplateAddressList(data) {
    userDetails = JSON.parse(data);
    if (userDetails.status == 1) {
        if (userDetails.address_list.length != 0) {
            $('.address-info-guest').hide();
            localStorage['delivery_addressess'] = data;
            populateAddresstoInfoContainer(userDetails);
        } else {
            if (!(localStorage.getItem('user_profile') === null)) {
                var userProfile = JSON.parse(localStorage['user_profile']);
                $(".address-info-guest").find("#guest-email").val(userProfile.email);
                $(".address-info-guest").find("#guest-phone").val(userProfile.mobile);
            } else {
                getProfile();
            }
            $('.address-info').hide();
            $('.address-info-guest').show();
            haveAccountCheck();
        }
    } else {
        showErrorPopup(userDetails);
    }
}

function populateAddresstoInfoContainer(userDetails) {
    $('.address-info .contents').remove();
    var selectedId = userDetails.delivery_address;
    if (selectedId) {
        $.each(userDetails.address_list, function (key, value) {
            if (value.id == selectedId) {
                $('.address-info').append("<div class='contents address-added' data-id='" + value.id + "'>" +
                        "<span class='content-heading'>" + "DELIVERY ADDRESS" + "</span>" +
                        "<span>" + value.first_name + " " + value.last_name + "</span>" +
                        ((value.is_business == 1 && value.company.length > 0) ? ("<span>" + value.company + "</span>") : "") +
                        "<span>" + value.street + ", " + value.building + "</span>" +
                        "<span>" + value.city + ", " + value.state + " " + value.zip + "</span>" +
                        "<span>" + value.phone + "</span>" +
                        "<span class='change-address-payment' id='change-address'>" + "CHANGE ADDRESS" + "</span>" + "</div>");
            }
            $("#guest-email").val(value.email);
            $("#guest-phone").val(value.phone);
        });
    }
    $('.address-info-guest').hide();
    $('.address-info').show();
}

//populate address list in popup
function populateAddressListPopup() {
    $('.address-payment-list-popup .popup-container').empty();
    $('.address-payment-list-popup .button').remove();
    $('#save-delivery-address').addClass('button-disabled');
    $('.address-payment-list-popup .popup .header').text("SELECT YOUR DELIVERY ADDRESS");
    if (localStorage['delivery_addressess'] != undefined && localStorage['delivery_addressess'] != null && localStorage['loggedIn'] == "true") {
        var checkLocal = JSON.parse(localStorage['delivery_addressess']).address_list.length;
        addressList = JSON.parse(localStorage['delivery_addressess']);
        appendAddresscontent(addressList);
        $('.address-payment-list-popup').show();
    } else {
        getAddress("populateAddressToPopUp");
        $('.address-payment-list-popup').show();
    }
}

function appendAddresscontent(addressList) {
    $('.address-payment-list-popup .popup-container').append("<div class='delivery-adress-wrapper'>" + "</div>");
    $.each(addressList.address_list, function (key, value) {
        $('.address-payment-list-popup .popup-container .delivery-adress-wrapper').append("<div class='address-container'>" +
                "<input type='radio' name='address' id='" + value.id + 1 + "' data-id='"
                + value.id + "' class='checkbox-green radio-button'>" +
                "<label class='list-address' for='" + value.id + 1 + "' data-email = '"
                + value.email + "' data-phone='" + value.phone + "'>" +
                "<span>" + value.first_name + " " + value.last_name + "</span>" +
                ((value.is_business == 1 && value.company.length > 0) ? ("<span>" + value.company + "</span>") : "") +
                "<span>" + value.street + ", " + value.building + "</span>" +
                "<span>" + value.city + ", " + value.state + " " + value.zip + "</span>" +
                "<span>" + value.phone + "</span>" + "</label>" + "</div>");
    });
    $('.address-payment-list-popup .popup-container').append("<div class='button'>" +
            "<a href='#' id='add-address-popup'>" + "ADD A NEW ADDRESS" + "</a>" +
            "<a href='#' class='btn btn-medium-primary medium-green button-disabled' id='save-delivery-address'>" + "SELECT" + "</a>" +
            "<a href='#' class='btn btn-medium-secondary' id='cancel'>" + "CANCEL" + "</a>" + "</div>");
}

var setPrimaryAddCallback = {
    success: function (data, textStatus) {
        var userDetails = JSON.parse(data);
    },
    failure: function (XMLHttpRequest, textStatus, errorThrown) {
    }
}

function setPrimaryAdd(selectedId) {
    var url = baseURL + "update_address/" + selectedId + "/",
            header = {
                "session-key": localStorage["session_key"]
            },
    userData = {
        "is_primary": 1
    }
    data = JSON.stringify(userData);
    var setPrimaryAddInstance = new AjaxHttpSender();
    setPrimaryAddInstance.sendPost(url, header, data, setPrimaryAddCallback);
}

function changeDeliveryAddress(selectedId) {
    var selectedAddress = $('.address-payment-list-popup .popup-container').find("[data-id='" + selectedId + "']").parent().find('label'),
            htmlContent = '<span class="content-heading" id="' + selectedId + '">DELIVERY ADDRESS</span>' + selectedAddress.html() +
            '<span class="change-address-payment" id="change-address">CHANGE ADDRESS</span>';
    $(".address-added").attr("data-id", selectedId);
    $('.address-info .contents').html(htmlContent);
    $("#guest-email").val(selectedAddress.data("email"));
    $("#guest-phone").val(selectedAddress.data("phone"));
}
var addAddressCallback = {
    success: function (data, textStatus, flag) {
        var userDetails = JSON.parse(data);
        if (userDetails.status == 1) {
            populateAddedAddress(userDetails.id, flag);
            $('.addresspopup-wrapper').fadeOut();
        } else {
            if (flag == 'popup') {
                showPopup(userDetails);
            } else {
                showPopup(userDetails);
                $('.address-info-guest').show();
            }
        }
    },
    failure: function (XMLHttpRequest, textStatus, errorThrown) {
    }
}

function addAddress(flag) {
    var newAddress = getNewAddress(flag),
            url = baseURL + "add_address/",
            header = {
                "session-key": localStorage["session_key"]
            },
    userData = {
        "first_name": newAddress.first_name,
        "last_name": newAddress.last_name,
        "phone": newAddress.phone,
        "zip": newAddress.zip,
        "email": newAddress.email,
        "city_id": newAddress.city_id,
        "state_id": newAddress.state_id,
        "street": newAddress.street,
        "building": newAddress.building,
        "is_primary": newAddress.is_primary,
        "checkout": 1,
        is_business: newAddress.is_business,
        company: newAddress.company
    };
    data = JSON.stringify(userData);
    var addAddressInstance = new AjaxHttpSender();
    addAddressInstance.sendPost(url, header, data, addAddressCallback, flag);
}

function getNewAddress(flag) {
    var $addressContainer;
    if (flag == 'popup') {
        $addressContainer = $('#new-address-form');
    } else {
        $addressContainer = $('#guest-address-info');
    }
    var state_id = $addressContainer.find(".state-selector").val(),
            city_name = $addressContainer.find("input[name*='city']").val(),
            state_name = $addressContainer.find(".state-selector option:selected").text();
    var newAddress = {
        first_name: $addressContainer.find("input[name*='firstname']").val(),
        last_name: $addressContainer.find("input[name*='lastname']").val(),
        phone: $addressContainer.find("input[name*='phonenumber']").val(),
        zip: $addressContainer.find("input[name*='zip']").val(),
        street: $addressContainer.find("input[name*='street']").val(),
        email: $addressContainer.find("input[name*='email']").val(),
        city_id: city_name,
        city: city_name,
        building: $addressContainer.find("input[class*='apartment']").val(),
        is_primary: (flag == 'popup') ? 0 : 1,
        state_id: state_id,
        state: state_name,
        is_business: $addressContainer.find("input[id*='business']").prop("checked") ? 1 : 0,
        company: $addressContainer.find("input[name*='company']").val()
    };
    return newAddress;
}

// Get states API
var getStatesCallback = {
    success: function (data, textStatus) {
        var stateList = JSON.parse(data);
        localStorage['delivery-states'] = data;
        $('.state-selector').html("");
        if (stateList.status == 1) {
            $.each(stateList.state_list, function (index, value) {
                $('.state-selector').append($('<option/>', {
                    value: value.id,
                    text: value.name,
                }));
            });
        } else {
            showErrorPopup(userDetails);
        }
    },
    failure: function (XMLHttpRequest, textStatus, errorThrown) {
    }
}

function getStates() {
    var url = baseURL + "get_states/",
            header = {
            },
            userData = {
                "search": "New York"
            };
    data = JSON.stringify(userData);
    var getStatesInstance = new AjaxHttpSender();
    new AjaxHttpSender().sendPost(url, header, data, getStatesCallback);
}

function populateAddedAddress(delivery_address, flag) {
    var addedAddress = [],
            latest_address = {},
            newAddress = getNewAddress(flag);
    newAddress.id = delivery_address;
    if (localStorage['loggedIn'] == 'true' && localStorage.getItem("delivery_addressess")) {
        latest_address = JSON.parse(localStorage['delivery_addressess']);
        latest_address.address_list.push(newAddress);
        localStorage['delivery_addressess'] = JSON.stringify(latest_address);
    }
    addedAddress.push(newAddress);
    data = {
        "address_list": addedAddress,
        "delivery_address": delivery_address
    },
    populateAddresstoInfoContainer(data);
}

function setEcommerceOrderConfirm(response) {
    var deliveryAddress = response.cart_items.delivery_address;
    if (response.cart_items.delivery_address) {
    } else {
        deliveryAddress = "pickup";
    }
    ga('ecommerce:addTransaction', {
        'id': response.cart_items.transaction_id, // Transaction ID. Required.
        'affiliation': 'Meisterdish', // Affiliation or store name.
        'revenue': response.cart_items.grand_total, // Grand Total.
        'shipping': response.cart_items.shipping, // Shipping.
        'tax': response.cart_items.tax, // Tax.
        'dimension1': deliveryAddress, // Product-scoped custom dimension (string).
    });
    $.each(response.cart_items.aaData, function (key, value) {
        ga('ecommerce:addItem', {
            'id': value.id, // Transaction ID. Required.
            'name': value.name, // Product name. Required.
            'category': value.category, // Category or variation.
            'price': value.price, // Unit price.
            'quantity': value.quantity // Quantity.
        });
    });
    ga('ecommerce:send');
}


var placeOrderCallback = {
    success: function (data, textStatus) {
        var response = JSON.parse(data);
        if (response.status == 1) {
            setEcommerceOrderConfirm(response);
            var userLoggedin = localStorage["loggedIn"] ? JSON.parse(localStorage["loggedIn"]) : null,
                    adminLoggedin = localStorage["admin_loggedIn"] ? JSON.parse(localStorage['admin_loggedIn']) : null,
                    loggedIn = (userLoggedin || adminLoggedin);
            $(".ok-container").show();
            $(".close-container").hide();
            if (loggedIn) {
                $(".ok-container a").attr("href", "orderhistory.html");
                showPopup(response);
            } else {
                $(".ok-container a").attr("href", "../index.html");
                showPopup(response);
            }
            SessionController.fbTrackConversionEvent(SessionController.getPlaceOrderPixel(), response.cart_items.grand_total, 'USD');
        } else {
            showPopup(response);
        }
        $('.loading-indicator').hide();
    },
    failure: function (XMLHttpRequest, textStatus, errorThrown) {
    }
}

function convertDateFormat(selected_day, selected_hour, selected_time) {
    selectedDayDateFormat = stringToDate(selected_day, "mm/dd/yyyy", "/");
    selectedDayDateFormatWithHour = new Date(selectedDayDateFormat.setHours(selected_hour));
    // selectedDateEst = convertToEST(selectedDayDateFormatWithHour);
    return (getEstFormattedForWebService(selectedDayDateFormatWithHour));
}

function createOrderParams() {
    var driverInstr = $("#driver-description").val(),
            driverTip = $('.driver-tip').val(),
            addressId = $(".address-info .contents").attr('data-id'),
            fullname = $('#name-on-card').val().split(" "),
            deliveryType = $("input[name='delivery-method']:checked").data("type"),
            firstname = fullname[0],
            lastname = fullname[1],
            $today_content = $(".today-content").find(".checkout-time-button-active"),
            $weekDatecontent = $(".week-content .date-content").find(".checkout-time-button-active"),
            $weekTimecontent = $(".week-content .time-content").find(".checkout-time-button-active"),
            saveParam = 0,
            payment_type = 0,
            savedCardId = $('.saved-cards .added-card:checked').attr("id"),
            selected_day, selected_time, deliveryTime,
            card_number = $('#card-number').val(),
            cvv = $('#cvv-number').val(),
            Exp_month = $("#ExpMonth").val(),
            Exp_year = $("#ExpYear option:selected").text(),
            phoneNumber = $("#guest-phone").val(),
            email = $("#guest-email").val();

    if ($today_content.length) {
        selected_day = $today_content.attr("data-date");
        selected_hour = $today_content.attr("data-hr");
        selected_time = getHourCorrected(selected_hour) + ":" + "00" + ":" + "00";
        //Convert to EST

        deliveryTime = convertDateFormat(selected_day, selected_hour, selected_time);
    } else {
        selected_day = $weekTimecontent.attr("data-date");
        selected_hour = $weekTimecontent.attr("data-hr");
        selected_time = getHourCorrected($weekTimecontent.attr("data-hr")) + ":" + "00" + ":" + "00";
        deliveryTime = convertDateFormat(selected_day, selected_hour, selected_time);
    }
    if ($('input:checkbox[name=save-card-details]').prop('checked')) {
        saveParam = 1;
    }

    if ($("#cc").prop('checked')) {
        payment_type = "cc";
    }

    return fullOrderParams = {
        "driver_instructions": driverInstr,
        "tip": driverTip,
        "delivery_address": addressId,
        "billing_address": billingAddressId,
        "delivery_type": deliveryType,
        "first_name": firstname,
        "last_name": lastname,
        "delivery_time": deliveryTime,
        "payment_type": payment_type,
        "save_card": saveParam,
        "card_id": savedCardId,
        "number": card_number,
        "exp_month": Exp_month,
        "cvv2": $('#cvv-number').val(),
        "exp_year": Exp_year,
        "email": email,
        "phone": phoneNumber
    }
}

function placeOrder() {
    url = baseURL + "create_order/",
            header = {
                "session-key": localStorage["session_key"]
            };
    //Saved card is present.
    if (!$('.saved-cards').is(':empty')) {
        cardSavedParams();
    } else {
        if ($("#pay-form").valid()) {
            $("#pay-form").submit();
        }
    }
}

function cardSavedParams() {
    var totalOrderParams = createOrderParams();
    orderParams = {
        "delivery_time": totalOrderParams.delivery_time,
        "billing_address": totalOrderParams.billing_address,
        "delivery_address": totalOrderParams.delivery_address,
        "email": totalOrderParams.email,
        "phone": totalOrderParams.phone,
        "payment_type": "cc", // OR "cc"
        "tip": totalOrderParams.tip, //Optional
        "delivery_type": totalOrderParams.delivery_type,
        "driver_instructions": totalOrderParams.driver_instructions,
        "card_id": totalOrderParams.card_id
    }
    if (typeof orderParams === 'undefined') {
        return;
    }
    createOrder(orderParams);
}

function cardNotSavedCreateOrder(token) {
    var totalOrderParams = createOrderParams();
    orderParams = {
        "delivery_time": totalOrderParams.delivery_time,
        "billing_address": totalOrderParams.billing_address,
        "delivery_address": totalOrderParams.delivery_address,
        "email": totalOrderParams.email,
        "phone": totalOrderParams.phone,
        "payment_type": "cc", // OR "cc"
        "tip": totalOrderParams.tip, //Optional
        "delivery_type": totalOrderParams.delivery_type,
        "driver_instructions": totalOrderParams.driver_instructions,
        "stripeToken": token
    }
    createOrder(orderParams);
}

function createOrder(orderParams) {
    data = JSON.stringify(orderParams);
    var placeOrderInstance = new AjaxHttpSender();
    placeOrderInstance.sendPost(url, header, data, placeOrderCallback);
    $('.loading-indicator').show();
}

function populateCreditCardDetails() {
    var cards = cardDetails.cards;
    $('.address-payment-list-popup .button').remove();
    $('.address-payment-list-popup .popup-container').empty();
    $('.address-payment-list-popup .popup .header').text("SELECT YOUR PAYMENT METHOD");
    $('.address-payment-list-popup .popup-container').append("<div class='popup-sub-wrapper'>" + "</div>");
    $.each(cards, function (key, value) {
        $('.address-payment-list-popup .popup-container .popup-sub-wrapper').append("<div class='payment-popup-sub-container'>" +
                "<input type='radio' class='checkbox-green added-card pullLeft' name='change-card' class='radio-button-payment' data-id='" + value.id + "' id='" + value.id + 1 + "'>" +
                "<label for='" + value.id + 1 + "'>" + "<img class='paypal' src='" + value.logo + "'>" +
                "<span class='body-text-small'>" + value.type + " " +
                "ending in" + " " + value.number.slice(-4) + "</span>" +
                "<span class='body-text-small'>" + "Expires on" +
                " " + value.expire_month + "/" + value.expire_year + "</span>" + "</label>" + "</div>")
    });
    $('.address-payment-list-popup .popup-container').append("<div class='button'>" +
            "<a href='#' class='btn btn-medium-primary medium-green' id='save-payment'>" + "SELECT" + "</a>" +
            '<a href="#" class="btn btn-medium-secondary" id="addCreditCard">ADD CREDIT CARD</a>' +
            "<a href='#' class='btn btn-medium-secondary' id='cancel'>" + "CANCEL" + "</a>" + "</div>");
    $('#save-payment').addClass('button-disabled');
    $('.address-payment-list-popup').show();
    $('input[type=radio][name=change-card]').on("click", function () {
        $('#save-payment').removeClass('button-disabled');
    })
}

function showSelectedPaymentMethod(selectedId) {
    $('.credit-card-container').show();
    $('.saved-cards').empty();
    populateCardDetails(cardDetails.cards, selectedId);
}

function validateOrder() {
    var data = {};
    data.message = "";

    if (typeof cartItems === 'undefined' || cartItems.status == "-1") {
        data.message = "Add meals to cart and then proceed";
        showPopup(data);
        return false;
    }
    if (!$(".checkout-time-button-active").length) {
        if ($('#pickup-radio').prop('checked')) {
            data.message = "Add pickup time and then proceed";
        } else {
            data.message = "Add delivery time and then proceed";
        }
        showPopup(data);
        return false;
    }
    if ($(".total-cost").val() > 0) {
        if (!$(".payment-checked:checked").length) {
            data.message = "Add a method of payment and then proceed";
            showPopup(data);
            return false;
        }
    }
    if ($("#delivery-radio").is(":checked")) {
        if (!$(".address-added").length) {
            data.message = "Add an address then proceed";
            showPopup(data);
            return false;
        }
    }
    if ($("#pickup-radio").is(":checked")) {
        if (!$("#guest-address-info").valid()) {
            data.message = "Check your phone number and email";
            showPopup(data);
            return false;
        }
    }

    if (!$("#tip-form").valid()) {
        data.message = "Please enter a valid tip";
        showPopup(data);
        return false;
    }
    return true;
}

//checkpromo code
var checkPromoCodeCallback = {
    success: function (data, textStatus) {
        var userData = JSON.parse(data);
        if (userData.status == 1) {
            $('#apply-promo-gift').removeClass('btn-small-primary medium-green').addClass('btn-small-secondary');
            $('#apply-promo-gift').val('DELETE');
            $('.promo-validation-message').css('color', '#8EC657');
            $('.promo-validation-message').text("* " + userData.message);
            $(".discount-container .discount-amount").css('color', '#8EC657');
            updateReciept(userData);
        }
        if (userData.status == -1) {
            $('.promo-validation-message').css('color', '#ff7878');
            $('.promo-validation-message').text("* " + userData.message);
        }
    },
    failure: function (XMLHttpRequest, textStatus, errorThrown) {
    }
}

function checkPromoCode(code) {
    var url = baseURL + "apply_promocode/",
            header = {
                "session-key": localStorage["session_key"]
            },
    params = {
        "code": code
    };
    data = JSON.stringify(params);
    var checkPromoCodeInstance = new AjaxHttpSender();
    checkPromoCodeInstance.sendPost(url, header, data, checkPromoCodeCallback);
}

//Remove cart items call back
var removePromocodeCallback = {
    success: function (data, textStatus) {
        removeData = JSON.parse(data);
        if (removeData.status == 1) {
            $('#apply-promo-gift').removeClass('btn-small-secondary').addClass('btn-small-primary medium-green');
            $('#apply-promo-gift').val('APPLY');
            $('.promo-validation-message').css('color', '#8EC657');
            if (removeData.credits > 0) {
            } else {
                $('.discount-container .discount-amount').css('color', '#4A4A4A');
            }
            $('.promo-validation-message').text('* ' + removeData.message);
            updateReciept(removeData);
        } else {
        }
    },
    failure: function (XMLHttpRequest, textStatus, errorThrown) {
    }
}

//Remove cart items
function removePromocode() {
    var url = baseURL + "remove_promocode/",
            header = {
                "session-key": localStorage["session_key"]
            },
    params = {};
    data = JSON.stringify(params);
    var removePromocodeInstance = new AjaxHttpSender();
    removePromocodeInstance.sendPost(url, header, data, removePromocodeCallback);
}

function populateCoupon(couponDetails) {
    var code = couponDetails.code,
            discount = couponDetails.amount,
            message = couponDetails.message,
            flag = "coupon-applied";
    var discObj = {};
    discObj.discount = discount;
    $('.isPromocode-wrapper').slideDown();
    $('#promo-gift-input').val(code);
    $('.promo-validation-message').css('color', '#8EC657');
    $('.promo-validation-message').text(message);
    $('#apply-promo-gift').removeClass('btn-small-primary medium-green').addClass('btn-small-secondary');
    $('#apply-promo-gift').val('DELETE');
    $(".discount-container .discount-amount").css('color', '#8EC657');
    updateReciept(discObj, flag);
}

//Get profile API process
var getProfileCallback = {
    success: function (data, textStatus) {
        var userDetails = JSON.parse(data);
        if (userDetails.status == 1) {
            localStorage['user_profile'] = data;
            $(".address-info-guest").find("#guest-email").val(userDetails.email);
            $(".address-info-guest").find("#guest-phone").val(userDetails.mobile);
            if (localStorage['loggedIn'] == 'true') {
                $('#new-address-form').find("input[name*='email']").val(userDetails.email);
            }
        } else {
        }
    },
    failure: function (XMLHttpRequest, textStatus, errorThrown) {
    }
}

function getProfile() {
    var url = baseURL + "get_profile/",
            header = {
                "session-key": localStorage["session_key"]
            },
    userData = {
        "get": 1
    };
    data = JSON.stringify(userData);
    var getProfileInstance = new AjaxHttpSender();
    getProfileInstance.sendPost(url, header, data, getProfileCallback);
}

function detectDevice() {
    var userAgent = navigator.userAgent.toString().toLowerCase();

    var isMobile = {
        Android: function () {
            return /android/i.test(userAgent);
        },
        iOS: function () {
            return /iphone|ipad|ipod/i.test(userAgent);
        },
        Desktop: function () {
            return /windows|linux|macintosh/i.test(userAgent);
        }
    };
    return isMobile;
}

function fixGoogleMapLink() {
    var currentDeviceSet = detectDevice();
    if (currentDeviceSet.iOS()) {
        $("#google-maps-link").attr("href", "http://maps.google.com/maps?daddr=Meisterdish+218+E+81st+St+New+York+NY+10028+United+States");
    } else {
        $("#google-maps-link").attr("href", "http://maps.google.com/maps?saddr=Current+Location&daddr=Meisterdish+218+E+81st+St+New+York+NY+10028+United+States");
    }
}

function resetSlots() {
    var elements = $(".checkout-time-button");
    $.each(elements, function (key, value) {
        $(value).val(slotsObject[$(value).attr("data-slot")]);
        $(value).removeClass("time-slot-disabled").addClass("checkout-time-button").addClass("set-time-button");
    });
    setCurrentTime();
}
function loadViewDefaults() {
    $(".forminput-wrapper input").removeClass("error");
    $("#companyWrapper").hide();
    if ($("#guest-address-info .regular-checkbox").prop("checked")) {
        $("#companyWrapper").toggle();
    }
    $("#companySection").hide();
    if ($("#new-address-form .regular-checkbox").prop("checked")) {
        $("#companySection").toggle();
    }
}
//populate year
function populateYear(element) {
    var currentYear = new Date().getFullYear();
    element.html("");
    for (var i = 1; i <= 20; i++) {
        element.append("<option value='" + currentYear + "'>" + currentYear + "</option>");
        currentYear = currentYear + 1;
    }
}
function bindEvents() {
    $("#guest-address-info .regular-checkbox").on("click", function () {
        $("#companyWrapper").toggle();
    });
    $("#new-address-form .regular-checkbox").on("click", function () {
        $("#companySection").toggle();
    });
    $(document).on('click', "#addCreditCard", function (e) {
        e.preventDefault();
        resetCreditCardDetails();
        $(".credit-card-wrapper").show();
        $(".address-payment-list-popup").hide();
        populateYear($("#expiryYear"));
    });
    $(document).on('click', "#close-new-credit-card-form", function (e) {
        e.preventDefault();
        $('#payForm').validate().resetForm();
        $(".credit-card-wrapper").hide();

    });
//    $("#addPopupCreditCard").on("click", function (e) {
//        e.preventDefault();
//    });
    $("#payForm").on("submit", function (e) {
        e.preventDefault();
    });
    $("#addPopupCreditCard").off().on("click", function (e) {
        e.preventDefault();
        if ($('#payForm').valid()) {
            $("#addPopupCreditCard").prop('disabled', true);
            StripeController.createToken($("#payForm"), creditCardAddToStripeCallback);
        }
    });
    $("#saveFirstCreditCard").on("click", function (e) {
        e.preventDefault();
        var $form = $(".payment-method-guest-container #pay-form");
        if ($form.valid()) {
            var data = {};
            if (localStorage['cartItems'] === undefined
                    || localStorage['cartItems'] === null) {
                data.message = "Add meals to cart and then proceed";
                showPopup(data);
                return false;
            } else {
                $("#saveFirstCreditCard").prop('disabled', true);
                StripeController.createToken($form, creditCardAddToStripeCallback);
            }
        }
    });
    $(document).ajaxStop(function () {
        $('.loading-indicator').hide();
    });
}
function creditCardAddToStripeCallback(status, response, $form) {
    if (response.error) {
        $(".credit-card-wrapper").hide();
        $form.find('button').prop('disabled', false);
        var error = {};
        error.message = (response.error.message);
        showPopup(error);
        return;
    } else {
        creditCardAddToDb(response.id);
    }
}

function creditCardAddToDb(token) {
    var url = baseURL + "save_credit_card/";
    var header = {
        "session-key": localStorage["session_key"]
    },
    params = {
        "stripeToken": token
    };
    var data = JSON.stringify(params);
    new AjaxHttpSender().sendPost(url, header, data, creditCardAddToDbCallback);
}


var creditCardAddToDbCallback = {
    success: function (data, textStatus) {
        $(".credit-card-wrapper").hide();
        var cardDetails = JSON.parse(data);
        if (cardDetails.status == 1) {
            savedCardDetails();
        } else {
            showPopup(cardDetails);
        }
    },
    failure: function (XMLHttpRequest, textStatus, errorThrown) {
    }
};
function resetCreditCardDetails() {
    $(".credit-card-wrapper #payForm #card-number").val("");
    $(".credit-card-wrapper #payForm #nameOnCard").val("");
    $(".credit-card-wrapper #payForm #cvv-number").val("");
    $(".credit-card-wrapper #payForm #ExpMonth option:selected").prop("selected", "1");
    populateYear($('.credit-card-wrapper #payForm #expiryYear'));
    $("#addPopupCreditCard").prop('disabled', false);
}
