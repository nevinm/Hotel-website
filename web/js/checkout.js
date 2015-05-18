var billingAddressId,cardDetails;
$(document).ready(function() {
    if(localStorage["session_key"]){
        getCartItems();
        populateYear();
        savedCardDetails();
        setCurrentTime();
        getAddress();
    }else{
        $('.address-info-guest').show();
        $('.address-info').hide();
        $('.payment-method-guest-container').show();
    }
    
    var cartItems;

    //Remove cart items
    $(document).on('click', '#remove-cart-item', function() {
        var meal_id = $(this).parent().attr('data-id'); //may change
        removeCartItems(meal_id);
        updateReciept();
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
    // $(".paypal").on('click', function() {
       
    // });

    //populate year
    function populateYear() {
        var currentYear = new Date().getFullYear();
        for (var i = 1; i <= 20; i++) {
            $('#ExpYear').append("<option value='" + i + "'>" + currentYear + "</option>");
            currentYear = currentYear + 1;
        }
    }
    // $('#save-credit-card').on("click",function(){      
    //     if ($('input:checkbox[name=save-card-details]:checked')) {             
    //         saveCreditCardDetails();
    //     }
    // })

    $(document).on('click', '#change-address', function() {
        populateAddressListPopup();
    });

    $(document).on('click', '#cancel', function() {
        $('.address-payment-list-popup').hide();
    });

    $(document).on('click', '#save-delivery-address', function() {
        var selectedId = $('input[type=radio][name=address]:checked').attr('id');
        changeDeliveryAddress(selectedId);
        saveDeliveryTime("",selectedId);

    });
    $(document).on('click', '#save-payment', function() {
        var selectedId = $('input[type=radio][name=change-card]:checked').attr('id');
        showSelectedPaymentMethod(selectedId);
        $('.address-payment-list-popup').hide();
        $('#place-order').addClass('button-disabled');
    });

    $('#add-guest-address').on("click", function(e) {
        e.preventDefault();
        if ($('#guest-address-info').valid()) {
            addAddress();
        }
    });

    $('#change-payment-method').on("click",function(){
        populateCreditCardDetails();
    })

    $("#place-order").on("click", function(e) {
        e.preventDefault();
        placeOrder();
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
    $('.today-content').find('.checkout-time-button').each(function(key, value) {
        $(value).attr("data-date", getMonthDate(getCurrentDateTime(0)) + "/" + getCurrentYear());
    });
    //Setting the future dates and blocking the dates other than tomorrow.
    $(".date-content .checkout-time-button").each(function(key, value) {
        var tomorrowDate = getMonthDate(getCurrentDateTime(key + 1));
        $(value).val(tomorrowDate);
        if (key != 0) {
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
            var date = $(this).val() + "/" + getCurrentYear();
            console.log(date);
            $(this).parents().eq(1).find('.time-content .checkout-time-button').each(function(key, value) {
                $(value).attr('data-date', date);
            });
            firstDate = $(buttonSelector).parents().eq(1).find('.time-content .checkout-time-button')[0];
            $(firstDate).trigger("click");
        }
    });
}

function populateDate(cartItems) {
    dateTime = cartItems.delivery_time.split(" ")[0];
    dateMonth = cartItems.delivery_time.substring(0, 5).replace('-', '/');
    hour = cartItems.delivery_time.substring(11, 13);
    currentDate = getCurrentDateTime(0).replace(/\//g, "-");
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
            $(".emtpy-cart-message").append("<span>"+cartItems.message+"</span>");
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

function saveDeliveryTime(date,delivery_Id) {
    var url = baseURL + "save_delivery_time/",
        header = {
            "session-key": localStorage["session_key"]
        };
        if(date){
            params = {
                "delivery_time": date
            };
        }
        if(delivery_Id){
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
            "<input type='text' class='quantity' value='" + value.quantity + "'>" +
            "<span class='operator-plus' data-max='10'>" + '+' + "</span>" + "</div>" +
            "<span class='price-container' data-tax='" + value.tax + "'>" + dollarConvert(value.price) + "</span>" +
            "<img src='../images/cross_black.png' id='remove-cart-item'>" + "</div>");
    });
    updateReciept();
}

function updateReciept() {
    var totalItemCost = totalDeliveryCost = totalTaxCost = totalCost = 0,
        totalDriverTip = parseInt($('.driver-tip option:selected').text().substring(1)),
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
        window.location.href = 'menu.html';
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
        data['custom'] = JSON.stringify(data);
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
        var response = JSON.parse(data);
        if(response.status == 1){
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

function populateCardDetails(cards,selectedId) {
    if(selectedId){
        $.each(cards, function(key, value) {
            last_num = cards[key].number.slice(-4);
            if(selectedId == value.id){
                $('.saved-cards').append("<div class='saved-card-list'>"+
                    "<input type='radio' class='added-card pullLeft' name='saved-card' id='" + value.id + 
                    "' class='radio-button-payment'>" +
                    "<label for='" + value.id + "'>" +
                    "<img class='paypal' src='" + value.logo + "'>" +
                    "<span class='body-text-small'>" + value.type + " " + "ending in" + " " + last_num + "</span>" +
                    "<span class='body-text-small'>" + "Expires on" + " " + 
                    value.expire_month + "/" + value.expire_year + "</span>" + "</label>"+"</div>");
                }
            });
        
    }else{
        $.each(cards, function(key, value) {
            last_num = cards[key].number.slice(-4);
            $('.saved-cards').append("<div class='saved-card-list'>"+
                "<input type='radio' class='added-card pullLeft' name='saved-card' id='" + value.id + 
                "' class='radio-button-payment'>" +
                "<label for='" + value.id + "'>" +
                "<img class='paypal' src='" + value.logo + "'>" +
                "<span class='body-text-small'>" + value.type + " " + "ending in" + " " + last_num + "</span>" +
                "<span class='body-text-small'>" + "Expires on" + " " + 
                value.expire_month + "/" + value.expire_year + "</span>" + "</label>"+"</div>");
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
        $('.delivery-info').addClass('box-border');
        $('.payment-info').addClass('box-border');
    } else {
        $('.delivery-info-container').addClass('box-border');
        $('.delivery-info').removeClass('box-border');
        $('.payment-info').removeClass('box-border');
    }
}

//ADDRESS LIST
var getAddressCallback = {
    success: function(data, textStatus, flag) {
         userDetails = JSON.parse(data);
         addressList = userDetails.address_list;
         $.each(addressList,function(key,value){
            if(value.is_primary == 1){
                billingAddressId = value.id;
            }
         })
        if (flag == "populateAddressToPopUp") {
            appendAddresscontent(userDetails);
        } else {
            popuplateAddressList(data);
        }
    },
    failure: function(XMLHttpRequest, textStatus, errorThrown) {}
}

function getAddress(flag) {
    var url = baseURL + "get_address_list/",
        header = {
            "session-key": localStorage["session_key"]
        },
        userData = {};
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
            $('.address-info').hide();
            $('.address-info-guest').show();
            getCities();
        }
    } else {
        showErrorPopup(userDetails);
    }
}

function populateAddresstoInfoContainer(data) {
    $('.address-info .contents').remove();
    var selectedId = data.delivery_address;
    if(selectedId){
        $.each(data.address_list, function(key, value) {
            if (value.id == selectedId) {
                $('.address-info').append("<div class='contents' data-id='"+value.id+"'>" +
                    "<span class='content-heading'>" + "DELIVERY ADDRESS" + "</span>" +
                    "<span>" + value.first_name + " " + value.last_name + "</span>" +
                    "<span>" + value.building + "," + value.street + "</span>" +
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
    $('.popup-container').empty();
    $('.address-payment-list-popup .button').remove();
    $('#save-delivery-address').addClass('button-disabled');
    var checkLocal = JSON.parse(localStorage['delivery_addressess']).address_list.length;
    if (checkLocal) {   
        addressList = JSON.parse(localStorage['delivery_addressess']);
        appendAddresscontent(addressList);
        // $('.address-payment-list-popup .popup-container').append("<div class='button'>" +
        //     "<a href='#' class='btn btn-medium-primary medium-green' id='save-delivery-address'>" + "SELECT" + "</a>" +
        //     "<a href='#' class='btn btn-medium-secondary' id='cancel'>" + "CANCEL" + "</a>" + "</div>");
        $('.address-payment-list-popup').show();
    } else {
        getAddress("populateAddressToPopUp");
        $('.address-payment-list-popup').show();
    }
    $('input[type=radio][name=address]').on("focus",function(){
        $('#save-delivery-address').removeClass('button-disabled');
    }) 
        
        
}

function appendAddresscontent(addressList) {
    $.each(addressList.address_list, function(key, value) {
        $('.address-payment-list-popup .popup-container').append("<div class='address-container'>" + "<input type='radio' name='address' id='" + value.id + "' class='radio-button'>" +
            "<label class='list-address' for='" + value.id + "'>" +
            "<span>" + value.first_name + " " + value.last_name + "</span>" +
            "<span>" + value.building + "," + value.street + "</span>" +
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
    var selectedAddress =$('.popup-container').find('#'+selectedId).parent().find('label'),
        htmlContent = '<span class="content-heading" id="' + selectedId + '">DELIVERY ADDRESS</span>' + selectedAddress.html() +
        '<span class="change-address-payment" id="change-address">CHANGE ADDRESS</span>';
    $('.address-info .contents').html(htmlContent);
    $('.address-payment-list-popup').hide();
}
var addAddressCallback = {
    success: function(data, textStatus) {
        var userDetails = JSON.parse(data);
        if(userDetails.status == 1){
            populateAddedAddress(userDetails.id);
        }
        else{
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
            "city_id": newAddress.city_id,
            "street": newAddress.street,
            "building": newAddress.building,
            "is_primary": newAddress.is_primary,
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
    newAddress.id =delivery_address; 
    // localStorage['delivery_addressess'] = newAddress;
    addedAddress.push(newAddress);
    data = {
        "address_list": addedAddress,
        "delivery_address":delivery_address
    },
    populateAddresstoInfoContainer(data);
}

var placeOrderCallback = {
    success: function(data, textStatus) {
       var response = JSON.parse(data);
       if(response.status == 1){
        clearCart();
       }
       else{
        showPopup(response);
       }
    },
    failure: function(XMLHttpRequest, textStatus, errorThrown) {}
}

function placeOrder() {
    var driverInstr = $("#driver-description").val(),
        driverTip = $('.driver-tip').find('option:selected').data().amount,
        addressId = $(".address-info .contents").attr('data-id');
    var $today_content = $(".today-content").find(".checkout-time-button-active"),
        $weekDatecontent = $(".week-content .date-content").find(".checkout-time-button-active"),
        $weekTimecontent = $(".week-content .time-content").find(".checkout-time-button-active"),
        saveParam = 0,payment_type = 0,savedCardId,
        selected_day, selected_time, deliveryTime;
    
    if ($today_content.length) {
        selected_day = $today_content.attr("data-date");
        selected_time = "0" + $today_content.attr("data-hr") + ":" + "00" + ":" + "00";
        deliveryTime = selected_day + " " + selected_time;
    } else {
        selected_day = $weekDatecontent.val();
        selected_time = "0" + $weekTimecontent.attr("data-hr") + ":" + "00" + ":" + "00";
        deliveryTime = selected_day + "/" + getCurrentYear() + " " + selected_time;
    }
    if($('input:checkbox[name=save-card-details]').prop('checked')){
        saveParam = 1;
    }

    

    if($("#pp").prop('checked') || $("#pp-guest").prop('checked')){
        payment_type = "pp";
        var payPalEmail = "nazz007online-facilitator@gmail.com",
            //returnUrl = "http://meisterdish.qburst.com/views/menu.html",
            returnUrl = "http://10.7.1.64:86/backend/api/paypal_success/",
            cancelReturnUrl = "http://meisterdish.qburst.com/views/checkout.html",
            notifyUrl = "http://meisterdish.qburst.com/backend/api/paypal_ipn/";
        checkOutPayPal("PayPal", payPalEmail, {
            "return": returnUrl,
            "cancel_return": cancelReturnUrl,
            "notify_url": notifyUrl,
            "my_temp_id": "hai nazz"
        });
    }else{
        if($("#cc").prop('checked')){
            payment_type = "cc";
        }
        url = baseURL + "create_order/",
        header = {
            "session-key": localStorage["session_key"]
        };
        if(!$('.saved-cards').is(':empty')){
            payment_type = "cc";
            savedCardId = $('.saved-cards .added-card').attr('id');
            params = {
                "delivery_time": deliveryTime,
                "billing_address": billingAddressId,
                "delivery_address": addressId,
                "payment_type": payment_type, // OR "cc"
                "tip": driverTip, //Optional
                "driver_instructions": driverInstr,
                "card_id": savedCardId
            }
        }else{
            var card_number = $('#card-number').val(),
                cvv = $('#cvv-number').val(),
                Exp_month = $("#ExpMonth").val(),
                Exp_year = $("#ExpYear option:selected").text();
                params = {
                    "delivery_time": deliveryTime,
                    "billing_address": billingAddressId,
                    "delivery_address": addressId,
                    "payment_type": payment_type,
                    "tip": driverTip, 
                    "driver_instructions": driverInstr,
                    "save_card":saveParam,
                    "number" : card_number, 
                    "exp_month" : Exp_month,
                    "exp_year" : Exp_year,
                    "cvv2" : $('#cvv-number').val(), 
                    "first_name" : "Abdul",
                    "last_name" : "Nasar",
                }
        }
    data = JSON.stringify(params);
    var placeOrderInstance = new AjaxHttpSender();
    placeOrderInstance.sendPost(url, header, data, placeOrderCallback);
}    
}
$("#cc").on("click",function(){
    if($("#cc").prop('checked')){
        $('#save-credit-card').removeAttr("disabled");
    }
});
$("#pp").on("click",function(){   
    if($("#pp").prop('checked')){
        $('#save-credit-card').attr("disabled","disabled");
    }
})

function populateCreditCardDetails(){
    var cards = cardDetails.cards;
    $('.address-payment-list-popup .button').remove();
    $('.popup-container').empty();
    $('.address-payment-list-popup .popup .header').text("SELECT YOUR PAYMENT METHOD");
       $('.address-payment-list-popup .popup-container').append("<div class='payment-popup-sub-container'>"+
            "<input type='radio' id='paypal-radio'class='added-card pullLeft' name='change-card' class='radio-button-payment'>" +
            "<label>"+"<img class='paypal' src='../images/paypal_button.png'>"+"</label>"+"</div>");
       $.each(cards,function(key,value){
            $('.address-payment-list-popup .popup-container').append("<div class='payment-popup-sub-container'>"+
                "<input type='radio' class='added-card pullLeft' name='change-card' class='radio-button-payment' id='"+value.id+"'>"+
                "<label>"+"<img class='paypal' src='"+value.logo+"'>"+
                "<span class='body-text-small'>" + value.type + " " + 
                "ending in" + " " + last_num + "</span>" +
                "<span class='body-text-small'>" + "Expires on" + 
                " " + value.expire_month + "/" + value.expire_year + "</span>" +"</label>"+"</div>")
       });
       $('.address-payment-list-popup .popup-container').append("<div class='button'>" +
        "<a href='#' class='btn btn-medium-primary medium-green' id='save-payment'>" + "SELECT" + "</a>" +
        "<a href='#' class='btn btn-medium-secondary' id='cancel'>" + "CANCEL" + "</a>" + "</div>");
       $('#save-payment').addClass('button-disabled');
       $('.address-payment-list-popup').show();
        $('input[type=radio][name=change-card]').on("focus",function(){
            $('#save-payment').removeClass('button-disabled');
        })
    }
 function showSelectedPaymentMethod(selectedId){
       
    if(selectedId == "paypal-radio"){
        $('.saved-cards').empty();
        $('.paypal-container').show();
        $('.credit-card-container').hide();

    }

    else{
        $('.credit-card-container').show();
        $('.paypal-container').hide();
        $('.saved-cards').empty();
        populateCardDetails(cardDetails.cards,selectedId);
    }
 }

 //  create oredr button disabled on uncheck 

 $(document).on('click', '#pp,#pp-guest,#cc,.added-card', function() {
    $("#place-order").removeClass('button-disabled');
 });