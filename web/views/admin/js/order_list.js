$(document).ready(function() {
    getOrders();
    $(document).on('click', "#order-list td:not(.no-popup)", function() {
    	console.log("clicked");
        currentOrderId = $(this).parent().data().id;
        // getOrderDetails(currentOrderId);
    });

    $(".remove").on('click', function() {
        $('.order-detail-popup').hide();
    });

    $(document).on('click', ".meal-delete", function() {
        OrderId = $(this).data().id;
        deleteMeal(OrderId);
    });
});

//Get orders API process
var getOrdersCallback = {
    success: function(data, textStatus) {
        populateOrderList(data);
    },
    failure: function(XMLHttpRequest, textStatus, errorThrown) {}
}

function getOrders(nextPage) {
    var url = baseURL + "get_orders/",
        header = {
            "session-key": localStorage["session_key"]
        },
        params = {
            "nextPage": nextPage
        }
    data = JSON.stringify(params);
    var getOrdersInstance = new AjaxHttpSender();
    getOrdersInstance.sendPost(url, header, data, getOrdersCallback);
}

//Get order details API process
var getOrderDetailsCallback = {
    success: function(data, textStatus) {
        orderDetails = JSON.parse(data);
        $(".order-detail-popup").show();
        populateOrderDetails(orderDetails);
    },
    failure: function(XMLHttpRequest, textStatus, errorThrown) {}
}

function getOrderDetails(currentOrderId) {
    var url = baseURL + "get_order_details/" + currentOrderId + "/",
        header = {
            "session-key": localStorage["session_key"]
        },
        params = {}
    data = JSON.stringify(params);
    var getOrderDetailsInstance = new AjaxHttpSender();
    getOrderDetailsInstance.sendPost(url, header, data, getOrderDetailsCallback);
}

//function populate OrderList 
function populateOrderList(data) {
    $('#order-list tbody').empty();
    var fullMealList = JSON.parse(data);
    $.each(fullMealList.aaData, function(key, value) {
        $('#order-list tbody').append("<tr data-id='" + value.id + "'>" +
            "<td>" + value.id + "</td>" +
            "<td>" + value.user_first_name + " " + value.user_last_name + "</td>" +
            "<td>" + value.billing_address.phone + "</td>" +
            "<td>12/12/2015 10:00:00</td>" +
            "<td>" + dollarConvert(value.total_amount) + "</td>" +
            "<td class='no-popup'><select id='order-status' name='status'>"+
				"<option value='0'>Incomplete</option>"+
				"<option value='1'>Payment failed</option>"+
				"<option value='2' selected='selected'>Paid, not verified</option>"+
				"<option value='3'>Payment verified</option>"+
				"<option value='4'>Order placed</option>"+
				"<option value='5'>Not delivered</option>"+
				"<option value='6'>Complete</option>"+
				"</select></td>"+
            "<td class='no-popup'><button type='button' class='meal-delete' data-id='" + value.id + "'>Delete</button></td></tr>");
    });

    $(".pagination").pagination({
        items: fullMealList.total_count,
        itemsOnPage: fullMealList.per_page,
        currentPage: fullMealList.current_page,
        cssStyle: 'light-theme',
        onPageClick: function(pageNumber, event) {
            getOrders(pageNumber);
        }
    });
}

function populateOrderDetails(orderDetails) {
    var $orderAddress = $('.order-detail-popup').find(".order-address"),
        $orderPopup = $('.order-detail-popup');
    $orderPopup.find(".order-id").text("#" + orderDetails.order.id);
    $orderPopup.find(".order-status").text(orderDetails.order.status);
    $orderPopup.find(".order-name").text(orderDetails.order.user_first_name + " " + orderDetails.order.user_last_name);
    $orderPopup.find(".order-total").text(dollarConvert(orderDetails.order.grand_total));
    $orderAddress.find('.building').text(orderDetails.order.delivery_address.building);
    $orderAddress.find('.building').text(orderDetails.order.delivery_address.building);
    $orderAddress.find('.street').text(orderDetails.order.delivery_address.street);
    $orderAddress.find('.city-state').text(orderDetails.order.delivery_address.city + " " +
        orderDetails.order.delivery_address.state);
    $orderAddress.find('.zip').text(orderDetails.order.delivery_address.zip);
}
