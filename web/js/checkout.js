var billingAddressId, cardDetails,
    payPalEmail = "nazz007online-facilitator@gmail.com",
    returnUrl = baseURL + "paypal_success/",
    cancelReturnUrl = homeUrl + "/views/checkout.html",
    notifyUrl = baseURL + "paypal_ipn/";

$(document).ready(function() {
    if (localStorage["session_key"]) {
        getCartItems();
        savedCardDetails();
        CartItemCount();
        getAddress();
    } else {
        $('.address-info-guest').show();
        $('.address-info').hide();
        $('.payment-method-guest-container').show();
        $('.payment-info .checkout-header span').css('padding-left','35px');
        $(".emtpy-cart-message").text("There are no items in cart.");
        $(".emtpy-cart-message").show();
    }
    stripeIntegration();
    setCurrentTime();
    populateYear();
    var cartItems;

    //Remove cart items
    $(document).on('click', '#remove-cart-item', function() {
        var meal_id = $(this).parent().attr('data-id'); //may change
        removeCartItems(meal_id);
    });

    $('.driver-tip').on('change', function() {
        selectedTip = $(this).find('option:selected').text();
        $('.driver-tip-display').text(selectedTip + ".00");
        updateReciept();
    });

    //Set time for delivery API call
    $('.set-time-button').on('click', function() {
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

    $(document).on('click', '.order-list-items', function() {
        $('span#remove-cart-item').show();
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

    $(document).on('click', '#save-payment', function() {
        var selectedId = $('input[type=radio][name=change-card]:checked').attr('data-id');
        showSelectedPaymentMethod(selectedId);
        $('.address-payment-list-popup').hide();
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

    //populate year
    function populateYear() {
        var currentYear = new Date().getFullYear();
        for (var i = 1; i <= 20; i++) {
            $('#ExpYear').append("<option value='" + currentYear + "'>" + currentYear + "</option>");
            currentYear = currentYear + 1;
        }
    }

    $(document).on('click', '#change-address', function() {
        populateAddressListPopup();
    });

    $(document).on('click', '#cancel', function() {
        $('.address-payment-list-popup').hide();
    });

    $(document).on('click', '#save-delivery-address', function() {
        var selectedId = $('input[type=radio][name=address]:checked').attr('data-id');
        changeDeliveryAddress(selectedId);
        saveDeliveryTime("", selectedId);
    });

    $('#add-guest-address').on("click", function(e) {
        e.preventDefault();
        if ($('#guest-address-info').valid()) {
            addAddress();
        }
    });

    $('#change-payment-method').on("click", function() {
        populateCreditCardDetails();
    })

    $('#apply-promo-gift').on("click",function(){
        var code = $('#promo-gift-input').val();
        if(code == ""){
            $('.promo-validation-message').text("* "+"Please enter Giftcard/Promocode");
        }else{
            checkPromoCode(code);
        }
    })

    $("#place-order").on("click", function(e) {
        e.preventDefault();
        if (validateOrder()) {
            placeOrder();
        }
    });

    $("#pay-form").submit(function(e) {
        e.preventDefault();
    });
    $('#pickup-radio').on("click", function() {
        $('.address-info-guest').show();
        $('.address-info').hide();
        $("#guest-address-info").validate().resetForm();
        $("#guest-address-info input").removeClass('error');
        $("#guest-address-info").find("input").not("#guest-email, #guest-phone").attr("disabled", "disabled");
        $("#guest-address-info").find("input").not("#guest-email, #guest-phone").addClass("button-disabled");
        $('.pickup-content').show();
        $("#add-guest-address").hide();
        $(".city-selector-container").hide();
    })
    $('#delivery-radio').on("click", function() {
        if ($('.address-info').is(':empty')) {
             $('.address-info-guest').show();
            $('.address-info').hide();
        }else{
            $('.address-info').show();
            $('.address-info-guest').hide();
        }
        $("#guest-address-info").find("input").not("#guest-email, #guest-phone").removeAttr("disabled");
        $("#guest-address-info").find("input").not("#guest-email, #guest-phone").removeClass("button-disabled");
        $('.pickup-content').hide();
        $("#add-guest-address").show();
        $(".city-selector-container").show();
    })
    $('#is-gift-card').on('click',function(){
        $('.isPromocode-wrapper').toggle();
    })
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
    currentHour = getCurrentHour();
    $(".today-content .checkout-time-button").each(function(key, value) {
        currentHour = getCurrentHour();
        meridiem = currentHour.substring(currentHour.length - 2);
        if (meridiem == "pm") {
            currentHour = currentHour.substring(0, currentHour.length - 2);
            if (parseInt(currentHour) == $(value).data().hr) {
                $(this).prevAll('.set-time-button').remove();
                $(this).val("NOW");
                $(this).addClass("checkout-time-button-active");
            }
        }
    });

    //Setting the correct date.
    var currentDate = getCurrentDateMonth(0);
    $(".today-content .content-heading").text("TODAY - " + currentDate);
    $('.today-content').find('.checkout-time-button').each(function(key, value) {
        $(value).attr("data-date", getMonthDate(getCurrentDateTime(0)) + "/" + getCurrentYear());
    });

    //Setting the future dates and blocking the dates other than tomorrow.
    var tomorrowDate = getCurrentDateMonth(1);
    $(".week-content .content-heading").text("TOMORROW - " + tomorrowDate);
    $(".week-content .checkout-time-button").each(function(key, value) {
        $(value).attr("data-date", getMonthDate(getCurrentDateTime(1)) + "/" + getCurrentYear());
    });
}

//Used for the time selection resrtiction
function timeActiveRestriction(buttonSelector, activeClass, oppositeSelector) {
    $(buttonSelector).on('click', function() {
        $(oppositeSelector).removeClass(activeClass);
        $(this).addClass(activeClass);
    });
}

function populateDate(cartItems) {
    dateTime = cartItems.delivery_time.split(" ")[0];
    dateMonth = cartItems.delivery_time.substring(0, 5).replace('-', '/');
    hour = cartItems.delivery_time.substring(11, 13);
    currentDate = getCurrentDateTime(0).replace(/\//, "-");
    tomorrowDate = getCurrentDateTime(1).replace(/\//g, "-");
    if (dateTime == currentDate) {
        $('.today-content .checkout-time-button').each(function(key, value) {
            if ($(value).data().hr == parseInt(hour)) {
                $('.checkout-time-button-active').removeClass('checkout-time-button-active');
                $(value).addClass("checkout-time-button-active");
            }
        });
    } else if (dateTime == tomorrowDate) {
        //Setting the future date
        tommorrowSelector = $('.week-content .date-content').find('.checkout-time-button')[0];
        $(tommorrowSelector).trigger("click");

        //Setting the future time.
        $('.week-content .set-time-button').each(function(key, value) {
            if ($(value).data().hr == parseInt(hour)) {
                $('.week-content .set-time-button').removeClass("checkout-time-button-active");
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
            $(".emtpy-cart-message").empty();
            $(".emtpy-cart-message").append("<span>" + cartItems.message + "</span>");
            $(".emtpy-cart-message").show();
            updateReciept();
            $(".items-container .item-count").text('(0)');
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
    success: function(data, textStatus) {},
    failure: function(XMLHttpRequest, textStatus, errorThrown) {}
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
            "<input type='text' disabled='disabled' class='quantity' value='" + value.quantity + "'>" +
            "<span class='operator-plus' data-max='10'>" + '+' + "</span>" + "</div>" +
            "<span class='price-container' data-tax='" + value.tax + "' data-price='"+value.price+"'>" + dollarConvert(value.price+value.tax) + "</span>" +
            "<img src='../images/hamburger-menu-close.png' id='remove-cart-item'>" + "</div>");
    });
    updateReciept();
}

function updateReciept(GiftcardDetails) {
    var totalItemCost = totalDeliveryCost = totalTaxCost = totalCost = 0, 
        totalDiscount =0,totalCredits = 0,
        totalDriverTip = parseInt($('.driver-tip option:selected').text().substring(1)),
        totalDeliveryCost = 2;
    $(".order-list-items").each(function(key, value) {
        debugger;
        quantity = parseInt($(value).find('.quantity').val());
        price = parseInt($(value).find('.price-container').attr("data-price"));
        tax = parseInt($(value).find('.price-container').attr("data-tax"));

        totalItemCost += (price * quantity);
        totalTaxCost += (tax * quantity);
    });
    if(GiftcardDetails){
        totalItemCost = GiftcardDetails.amount;
        totalTaxCost = GiftcardDetails.tax;
        totalDiscount = GiftcardDetails.discount;
        totalCredits = GiftcardDetails.credits;
    }
    totalCost = totalItemCost + totalTaxCost + totalDriverTip + totalDeliveryCost -totalDiscount-totalCredits;

    $(".items-container .total-item-cost").text("$" + (totalItemCost).toFixed(2));
    $(".items-container .total-tax-cost").text("$" + (totalTaxCost).toFixed(2));
    $(".total-cost").text("$" + (totalCost).toFixed(2));
}

//Remove cart items call back
var removeCartItemsCallback = {
    success: function(data, textStatus) {
        removeData = JSON.parse(data);
        if (removeData.status == 1) {
            CartItemCount();
            getCartItems();
            var message = removeData.message;
            $('.popup-message span').text(message);
            $('.popup-message').show();
            setTimeout(function() {
                $('.popup-message').hide();
            }, 2000);
        } else {}
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

//save credit card details call back
var saveCreditCardDetailsCallback = {
    success: function(data, textStatus) {
        var response = JSON.parse(data);
        if (response.status == 1) {
            savedCardDetails();
        }
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
            "cvv2": cvv,
            "first_name": "first_name",
            "last_name": "last_name"
        }
    data = JSON.stringify(params);
    var saveCreditCardDetailsInstance = new AjaxHttpSender();
    saveCreditCardDetailsInstance.sendPost(url, header, data, saveCreditCardDetailsCallback);
}

//Get saved cards
var savedCardDetailsCallback = {
    success: function(data, textStatus) {
        var last_num;
        cardDetails = JSON.parse(data);
        if (cardDetails.status == 1) {
            if (cardDetails.cards.length != 0) {
                populateCardDetails(cardDetails.cards);
                $('.payment-method-container').show();
                $('.payment-method-guest-container').hide();
            } else {
                $('.payment-method-guest-container').show();
                $('.payment-info .checkout-header span').css('padding-left','35px');
            }
        } else {
            showPopup(cardDetails);
        }
    },
    failure: function(XMLHttpRequest, textStatus, errorThrown) {}
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
    if (selectedId) {
        $.each(cards, function(key, value) {
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
        $.each(cards, function(key, value) {
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

$(window).resize(function() {
    mobileResponsive();
});

$(window).load(function() {
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
    success: function(data, textStatus, flag) {
        userDetails = JSON.parse(data);
        if (userDetails.status == 1) {
            addressList = userDetails.address_list;
            $.each(addressList, function(key, value) {
                if (value.is_primary == 1) {
                    billingAddressId = value.id;
                }
            })
            if (flag == "populateAddressToPopUp") {
                appendAddresscontent(userDetails);
            } else {
                popuplateAddressList(data);
            }
        } else {}
    },
    failure: function(XMLHttpRequest, textStatus, errorThrown) {}
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
            } else {}
            $('.address-info').hide();
            $('.address-info-guest').show();
            haveAccountCheck();
            getCities();
        }
    } else {
        showErrorPopup(userDetails);
    }
}

function populateAddresstoInfoContainer(data) {
    $('.address-info .contents').remove();
    var selectedId = data.delivery_address;
    if (selectedId) {
        $.each(data.address_list, function(key, value) {
            if (value.id == selectedId) {
                $('.address-info').append("<div class='contents address-added' data-id='" + value.id + "'>" +
                    "<span class='content-heading'>" + "DELIVERY ADDRESS" + "</span>" +
                    "<span>" + value.first_name + " " + value.last_name + "</span>" +
                    "<span>" + value.street + "," + value.building + "</span>" +
                    "<span>" + value.city + "," + value.state + " " + value.zip + "</span>" +
                    "<span>" + value.phone + "</span>" +
                    "<span class='change-address-payment' id='change-address'>" + "CHANGE ADDRESS" + "</span>" + "</div>");
            }
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
    if(localStorage['delivery_addressess']!=undefined && localStorage['delivery_addressess']!=null){
        var checkLocal = JSON.parse(localStorage['delivery_addressess']).address_list.length;
        addressList = JSON.parse(localStorage['delivery_addressess']);
        appendAddresscontent(addressList);
        $('.address-payment-list-popup').show();  
    } else {
        getAddress("populateAddressToPopUp");
        $('.address-payment-list-popup').show();
    }
    $('input[type=radio][name=address]').on("click", function() {
        $('#save-delivery-address').removeClass('button-disabled');
    })


}

function appendAddresscontent(addressList) {
    $('.address-payment-list-popup .popup-container').append("<div class='delivery-adress-wrapper'>"+"</div>");
    $.each(addressList.address_list, function(key, value) {
        $('.address-payment-list-popup .popup-container .delivery-adress-wrapper').append("<div class='address-container'>" + "<input type='radio' name='address' id='"+value.id+1+"' data-id='" + value.id + "' class='checkbox-green radio-button'>" +
            "<label class='list-address' for='"+value.id+1+"'>" +
            "<span>" + value.first_name + " " + value.last_name + "</span>" +
            "<span>" + value.street + "," + value.building + "</span>" +
            "<span>" + value.city + "," + value.state + " " + value.zip + "</span>" +
            "<span>" + value.phone + "</span>" + "</label>" + "</div>");
    });
    $('.address-payment-list-popup .popup-container').append("<div class='button'>" +
        "<a href='#' class='btn btn-medium-primary medium-green button-disabled' id='save-delivery-address'>" + "SELECT" + "</a>" +
        "<a href='#' class='btn btn-medium-secondary' id='cancel'>" + "CANCEL" + "</a>" + "</div>");
}

var setPrimaryAddCallback = {
    success: function(data, textStatus) {
        var userDetails = JSON.parse(data);
    },
    failure: function(XMLHttpRequest, textStatus, errorThrown) {}
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
    var selectedAddress = $('.address-payment-list-popup .popup-container').find("[data-id='"+selectedId+"']").parent().find('label'),
        htmlContent = '<span class="content-heading" id="' + selectedId + '">DELIVERY ADDRESS</span>' + selectedAddress.html() +
        '<span class="change-address-payment" id="change-address">CHANGE ADDRESS</span>';
    $('.address-info .contents').html(htmlContent);
    $('.address-payment-list-popup').hide();
}
var addAddressCallback = {
    success: function(data, textStatus) {
        var userDetails = JSON.parse(data);
        if (userDetails.status == 1) {
            populateAddedAddress(userDetails.id);
        } else {
            showPopup(userDetails);
            $('.address-info-guest').show();
        }
    },
    failure: function(XMLHttpRequest, textStatus, errorThrown) {}
}

function addAddress() {
    var newAddress = getNewAddress(),
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
            "street": newAddress.street,
            "building": newAddress.building,
            "is_primary": newAddress.is_primary,
            "checkout": 1
        };
    data = JSON.stringify(userData);
    var addAddressInstance = new AjaxHttpSender();
    addAddressInstance.sendPost(url, header, data, addAddressCallback);
}

function getNewAddress() {
    var $addressContainer = $('#guest-address-info'),
        cityId = $addressContainer.find(".city-selector").val(),
        city_name = $(".city-selector").find("#" + cityId).text();
    var newAddress = {
        first_name: $addressContainer.find("input[name*='firstname']").val(),
        last_name: $addressContainer.find("input[name*='lastname']").val(),
        phone: $addressContainer.find("input[name*='phonenumber']").val(),
        zip: $addressContainer.find("input[name*='zip']").val(),
        street: $addressContainer.find("input[name*='street']").val(),
        email: $("#guest-email").val(),
        city_id: cityId,
        building: $addressContainer.find("input[name*='building']").val(),
        is_primary: $addressContainer.find("input[type*='checkbox']").val() == "on" ? 1 : 0,
        state: "Alabama",
        city: city_name
    }
    return newAddress;
}

// Get City API
var getCitiesCallback = {
    success: function(data, textStatus, cityId) {
        var cityList = JSON.parse(data);
        if (cityList.status == 1) {
            $('.city-selector').empty();
            $.each(cityList.city_list, function(index, value) {
                $('.city-selector').append($('<option/>', {
                    value: value.id,
                    text: value.name,
                    id: value.id
                }));
            });
        } else {
            showErrorPopup(cityList);
        }
    },
    failure: function(XMLHttpRequest, textStatus, errorThrown) {}
}

function getCities(cityId) {
    var url = baseURL + "get_cities/",
        header = {
            "session-key": localStorage["session_key"]
        },
        userData = {
            "state_id": 52
        };
    data = JSON.stringify(userData);
    var getCitiesInstance = new AjaxHttpSender();
    getCitiesInstance.sendPost(url, header, data, getCitiesCallback, cityId);
}

function populateAddedAddress(delivery_address) {
    var addedAddress = [],
        newAddress = getNewAddress();
    newAddress.id = delivery_address;
    // localStorage['delivery_addressess'] = newAddress;
    addedAddress.push(newAddress);
    data = {
            "address_list": addedAddress,
            "delivery_address": delivery_address
        },
        populateAddresstoInfoContainer(data);
}

var placeOrderCallback = {
    success: function(data, textStatus) {
        var response = JSON.parse(data);
        if (response.status == 1) {
            // clearCart();
            var userLoggedin = localStorage["loggedIn"] ? JSON.parse(localStorage["loggedIn"]) : null,
                adminLoggedin = localStorage["admin_loggedIn"] ? JSON.parse(localStorage['admin_loggedIn']) : null,
            loggedIn = (userLoggedin || adminLoggedin);
            dataAfterOrdering = {};
            dataAfterOrdering.message = "Your orders are successfully placed.";
            $(".ok-container").show();
            $(".close-container").hide();
            if (loggedIn) {
                $(".ok-container a").attr("href", "orderhistory.html");
                showPopup(dataAfterOrdering);
            } else {
                $(".ok-container a").attr("href", "../index.html");
                showPopup(dataAfterOrdering);
            }
        } else {
            showPopup(response);
        }
    },
    failure: function(XMLHttpRequest, textStatus, errorThrown) {}
}

function createOrderParams() {
    var driverInstr = $("#driver-description").val(),
        driverTip = $('.driver-tip').find('option:selected').data().amount,
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
        selected_time = "0" + $today_content.attr("data-hr") + ":" + "00" + ":" + "00";
        deliveryTime = selected_day + " " + selected_time;
    } else {
        selected_day = $weekTimecontent.attr("data-date");
        selected_time = "0" + $weekTimecontent.attr("data-hr") + ":" + "00" + ":" + "00";
        deliveryTime = selected_day + " " + selected_time;
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
}

function populateCreditCardDetails() {
    var cards = cardDetails.cards;
    $('.address-payment-list-popup .button').remove();
    $('.address-payment-list-popup .popup-container').empty();
    $('.address-payment-list-popup .popup .header').text("SELECT YOUR PAYMENT METHOD");
    $('.address-payment-list-popup .popup-container').append("<div class='popup-sub-wrapper'>"+"</div>");
    $.each(cards, function(key, value) {
        $('.address-payment-list-popup .popup-container .popup-sub-wrapper').append("<div class='payment-popup-sub-container'>" +
            "<input type='radio' class='checkbox-green added-card pullLeft' name='change-card' class='radio-button-payment' data-id='"+value.id+"' id='" + value.id+1 + "'>" +
            "<label for='"+value.id+1+"'>" + "<img class='paypal' src='" + value.logo + "'>" +
            "<span class='body-text-small'>" + value.type + " " +
            "ending in" + " " + last_num + "</span>" +
            "<span class='body-text-small'>" + "Expires on" +
            " " + value.expire_month + "/" + value.expire_year + "</span>" + "</label>" + "</div>")
    });
    $('.address-payment-list-popup .popup-container').append("<div class='button'>" +
        "<a href='#' class='btn btn-medium-primary medium-green' id='save-payment'>" + "SELECT" + "</a>" +
        "<a href='#' class='btn btn-medium-secondary' id='cancel'>" + "CANCEL" + "</a>" + "</div>");
    $('#save-payment').addClass('button-disabled');
    $('.address-payment-list-popup').show();
    $('input[type=radio][name=change-card]').on("click", function() {
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
    if ( $(".saved-card-list").length && !$(".payment-checked:checked").length) {
        data.message = "Add a method of payment and then proceed";
        showPopup(data);
        return false;
    }
    if (typeof cartItems === 'undefined') {} else {
        if (cartItems.status == "-1") {
            data.message = "Add Meals to cart and then proceed";
            showPopup(data);
            return false;
        }
    }
    if (!$(".checkout-time-button-active").length) {
        data.message = "Add delivery time and then proceed";
        showPopup(data);
        return false;
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
            data.message = "Check your phonenumber and email";
            showPopup(data);
            return false;
        }
    }
    return true;
}

//checkpromo code
var checkPromoCodeCallback = {
    success: function(data, textStatus) {
        var userData = JSON.parse(data);
        if(userData.status == 1){
            $('.promo-validation-message').css('color','#8EC657');
            $('.promo-validation-message').text("* "+userData.message);
            updateReciept(userData);
        } 
        if (userData.status == -1) {
            $('.promo-validation-message').css('color','#ff7878');
            $('.promo-validation-message').text("* "+userData.message);
        }
    },
    failure: function(XMLHttpRequest, textStatus, errorThrown) {}
}

function checkPromoCode(code){
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