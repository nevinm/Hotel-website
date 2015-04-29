$(document).ready(function() {
    getCartItems();
    
    //Remove cart items
    $(document).on('click', '#remove-cart-item', function() {
        var meal_id = $(this).parent().attr('data-id'); //may change
        removeCartItems(meal_id);
    });
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
            newVal = oldVal+1,
            meal_id = $(this).parents(':eq(1)').attr('data-id'),
            qty = newVal;
        if (oldVal < $(this).data("max")) {
            $(this).parent().find('.quantity').val(newVal);
            }
        updateCartItems(meal_id,qty);
    });
    $(document).on('click', '.operator-minus', function() {
        var oldVal = parseInt($(this).parent().find('.quantity').val()),
            newVal = oldVal-1,
            meal_id = $(this).parents(':eq(1)').attr('data-id'),
            qty = newVal;
        if (oldVal > $(this).data("min")) {
            $(this).parent().find('.quantity').val(newVal);
            }
        updateCartItems(meal_id,qty);
    });
});

//Get Cart items
var getCartItemsCallback = {
    success: function(data, textStatus) {
        var cartItems = JSON.parse(data);
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
function populateCartItems(data){
    $('.order-list-items').empty();
    $.each(data.aaData,function(key,value){
            $('.order-list-container').append("<div class='order-list-items' data-id='"+value.id+"'>"+
                "<img src='"+value.image+"'>"+"<span class='body-text-small'>"+value.name+"</span>"+
                "<div class='quantity-container'>"+"<span class='operator-minus' data-min='1'>"+'-'+"</span>"+
                "<input type='text' class='quantity' value='"+value.quantity+"'>"+
                "<span class='operator-plus' data-max='10'>"+'+'+"</span>"+"</div>"+
                "<span class='price-container'>"+"$"+value.price+"</span>"+
                "<span class='body-text-small' id='remove-cart-item'>"+'REMOVE'+"</span>"+"</div>");
        });
}


//Remove cart items call back
var removeCartItemsCallback = {
    success: function(data, textStatus) {
        CartItemCount();
        getCartItems();
    },
    failure: function(XMLHttpRequest, textStatus, errorThrown) {}
}

//Remove cart items
function removeCartItems(meal_id){
    var url = baseURL + "remove_from_cart/",
        header = {
            "session-key": localStorage["session_key"]
        },
        params = {
            "meal_id":meal_id
        };
    data = JSON.stringify(params);
    var removeCartItemsInstance = new AjaxHttpSender();
    removeCartItemsInstance.sendPost(url, header, data, removeCartItemsCallback);
}

//clear cart
var clearCartCallback = {
    success: function(data, textStatus) {
        
    },
    failure: function(XMLHttpRequest, textStatus, errorThrown) {}
}

function clearCart(){
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
        debugger;
    },
    failure: function(XMLHttpRequest, textStatus, errorThrown) {}
}

//update cart items
function updateCartItems(meal_id,quantity){
    var url = baseURL + "update_cart/",
        header = {
            "session-key": localStorage["session_key"]
        },
        params = {
            "meal_id":meal_id,
            "quantity":quantity
        };
    data = JSON.stringify(params);
    var updateCartItemsInstance = new AjaxHttpSender();
    updateCartItemsInstance.sendPost(url, header, data, updateCartItemsCallback);
}