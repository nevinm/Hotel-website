$(document).ready(function () {
    getOrders();
    //auto refresh
    setInterval(function () {
        getOrders();
    }, 60000);

    $(document).on('click', "#order-list td:not(.no-popup)", function () {
        currentOrderId = $(this).parent().data().id;
        getOrderDetails(currentOrderId);
    });

    $(".remove").on('click', function () {
        $('.order-detail-popup').hide();
    });

    $(document).on('click', ".meal-delete", function () {
        OrderId = $(this).data().id;
        if (confirm('Are you sure you want to delete this order?')) {
            deleteOrder(OrderId);
        } else {
        }
    });

    $("#search-orders").on('click', function () {
        searchParams = returnSearchParams();
        getOrders(1, searchParams.userName, searchParams.orderNum, searchParams.status, searchParams.total, searchParams.phone_num, searchParams.date, searchParams.delivery_type);
    });

    $(document).on('change', ".order-status", function () {
        var status = this.value,
                orderId = $(this).data().id;
        updateOrders(status, orderId);
    });
    $("#date").datepicker();

    downloadOrderCSV("cms/export_orders/", "download-orders-form");
});

function returnSearchParams() {
    var userName = $("#user-name").val(),
            orderNum = $("#order-num").val(),
            total = $("#total-amount").val(),
            phone_num = $("#phone-num").val(),
            date = $("#date").val(),
            deliveryType = $("#delivery-type").val();
    status = $("#order-status-filter option:selected").val(),
            searchParams = {};
    searchParams = {
        "userName": userName,
        "orderNum": orderNum,
        "total": total,
        "phone_num": phone_num,
        "date": date,
        "status": status,
        "delivery_type": deliveryType
    }
    return searchParams;
}

//Update orders API process
var updateOrdersCallback = {
    success: function (data, textStatus) {
        console.log("Order Updated");
    },
    failure: function (XMLHttpRequest, textStatus, errorThrown) {
    }
}

function updateOrders(statusId, orderId) {
    var url = baseURL + "cms/update_order/" + orderId + "/",
            header = {
                "session-key": localStorage["session_key"]
            },
    params = {
        "status": statusId
    }
    data = JSON.stringify(params);
    var updateOrdersInstance = new AjaxHttpSender();
    updateOrdersInstance.sendPost(url, header, data, updateOrdersCallback);
}

//Get orders API process
var getOrdersCallback = {
    success: function (data, textStatus) {
        var order = JSON.parse(data);
        if (order.status == 1) {
            if (order.aaData.length > 0) {
                $(".order-list-empty").hide();
                populateOrderList(data);
            } else {
                $(".order-list-empty").show();
                $(".pagination").pagination({
                    pages: 0,
                    cssStyle: 'light-theme',
                });
            }
        } else {
        }
    },
    failure: function (XMLHttpRequest, textStatus, errorThrown) {
    }
}

function getOrders(nextPage, userName, orderNum, status, total_amount, phone_num, date, delivery_type) {
    $('#order-list tbody').empty();
    var url = baseURL + "cms/get_orders/",
            header = {
                "session-key": localStorage["session_key"]
            },
    params = {
        "nextPage": nextPage,
        "search": userName,
        "num": orderNum,
        "status": status,
        "phone": phone_num,
        "date": date,
        "amount": total_amount,
        "delivery_type": delivery_type
    }
    data = JSON.stringify(params);
    var getOrdersInstance = new AjaxHttpSender();
    getOrdersInstance.sendPost(url, header, data, getOrdersCallback);
}

//Get order details API process
var getOrderDetailsCallback = {
    success: function (data, textStatus) {
        var orderDetails = JSON.parse(data);
        if (orderDetails.status == 1) {
            $(".order-detail-popup").show();
            populateOrderDetails(orderDetails);
        } else {
        }
    },
    failure: function (XMLHttpRequest, textStatus, errorThrown) {
    }
}

function getOrderDetails(currentOrderId) {
    var url = baseURL + "cms/get_order_details/" + currentOrderId + "/",
            header = {
                "session-key": localStorage["session_key"]
            },
    params = {}
    data = JSON.stringify(params);
    var getOrderDetailsInstance = new AjaxHttpSender();
    getOrderDetailsInstance.sendPost(url, header, data, getOrderDetailsCallback);
}

//Delete orders API process
var deleteOrderCallback = {
    success: function (data, textStatus) {
        var deleteOrder = JSON.parse(data);
        if (deleteOrder.status == 1) {
            var searchParams = returnSearchParams();
            currentPage = $('.pagination').pagination('getCurrentPage');
            getOrders(currentPage, searchParams.userName, searchParams.orderNum, searchParams.status, searchParams.total, searchParams.phone_num, searchParams.date, searchParams.delivery_type);
        } else {
        }
    },
    failure: function (XMLHttpRequest, textStatus, errorThrown) {
    }
}

function deleteOrder(orderId) {
    var url = baseURL + "cms/delete_order/" + orderId + "/",
            header = {
                "session-key": localStorage["session_key"]
            },
    params = {}
    data = JSON.stringify(params);
    var deleteOrderInstance = new AjaxHttpSender();
    deleteOrderInstance.sendPost(url, header, data, deleteOrderCallback);
}

//function populate OrderList 
function populateOrderList(data) {
    var fullMealList = JSON.parse(data);
    $.each(fullMealList.aaData, function (key, value) {
        var deliverytime = value.delivery_time,
                meridianDeliveryTime = convertToMeridianTime(deliverytime);
        $('#order-list tbody').append("<tr data-id='" + value.id + "'>" +
                "<td>" + value.order_num + "</td>" +
                "<td>" + value.user_first_name + " " + value.user_last_name + "</td>" +
                "<td>" + value.phone + "</td>" +
                "<td>" + meridianDeliveryTime.date + "<br>" + meridianDeliveryTime.time + "</td>" +
                "<td>" + value.delivery_type + "</td>" +
                "<td>" + dollarConvert(parseFloat(value.grand_total).toFixed(2)) + "</td>" +
                "<td class='no-popup'><select data-id='" + value.id + "'class='order-status' name='status'>" +
                "<option value='0'>Placed</option>" +
                "<option value='1'>Packed</option>" +
                "<option value='2'>Dispatched</option>" +
                "<option value='3'>Delivered</option>" +
                "<option value='4'>Cancelled</option>" +
                "</select></td>" +
                "<td class='no-popup'><a class='meal-delete cross' data-id='" + value.id + "'></a></td></tr>");

        currentStatus = value.status_id;
        $(".order-status:last").val(currentStatus);
    });

    $(".pagination").pagination({
        pages: fullMealList.num_pages,
        currentPage: fullMealList.current_page,
        cssStyle: 'light-theme',
        onPageClick: function (pageNumber, event) {
            searchParams = returnSearchParams();
            getOrders(pageNumber, searchParams.userName, searchParams.orderNum, searchParams.status, searchParams.total, searchParams.phone_num, searchParams.date);
        },
        onInit: function () {
            if (getStringAfterHash(location.href, "#")) {
                var pageString = getStringAfterHash(location.href, "#");
                if (pageString.indexOf('page') != -1) {
                    pageNumber = getStringAfterHash(pageString, "-");
                    if ($(".pagination").pagination('getCurrentPage') == pageNumber) {
                    } else {
                        $(".pagination").pagination('selectPage', pageNumber);
                    }
                }
            } else {
            }
        }
    });
}



function populateOrderDetails(orderDetails) {
    var $orderAddress = $('.order-detail-popup').find(".order-address"),
            $orderPopup = $('.order-detail-popup');
    $(".order-list-items").remove();
    var deliverytime = orderDetails.order.delivery_time,
            meridianDeliveryTime = convertToMeridianTime(deliverytime),
            paymentdate = orderDetails.order.payment_date;
    if (paymentdate !== "Not Available") {
        medidianPaymentTime = convertToMeridianTime(paymentdate);
        $orderPopup.find(".order-payment_date").text(medidianPaymentTime.date + " " + medidianPaymentTime.time);
    } else {
        $orderPopup.find(".order-payment_date").text(paymentdate);
    }
    $orderPopup.find(".order-num").text("#" + orderDetails.order.order_num);
    $orderPopup.find(".order-status-message").text(orderDetails.order.status);
    $orderPopup.find(".order-name").text(orderDetails.order.user_first_name + " " + orderDetails.order.user_last_name);
    $orderPopup.find(".order-total").text(dollarConvert(orderDetails.order.grand_total));
    $orderPopup.find(".order-date").text(meridianDeliveryTime.date + " " + meridianDeliveryTime.time);
    $orderPopup.find(".order-payment_type").text(orderDetails.order.delivery_type);
    $orderPopup.find(".order-transaction_id").text(orderDetails.order.transaction_id);
    if (orderDetails.order.delivery_type == "Pickup") {
        $orderAddress.find('.building').text("Pickup");
    } else {
        $orderAddress.find('.company').text(orderDetails.order.delivery_address.company === undefined ? "" : orderDetails.order.delivery_address.company);
        $orderAddress.find('.building').text(orderDetails.order.delivery_address.building);
        $orderAddress.find('.street').text(orderDetails.order.delivery_address.street);
        $orderAddress.find('.city-state').text(orderDetails.order.delivery_address.city + " " +
                orderDetails.order.delivery_address.state);
        $orderAddress.find('.zip').text(orderDetails.order.delivery_address.zip);
    }
    $.each(orderDetails.order.meals, function (key, value) {
        $(".order-meal").append("<div class='order-list-items' data-id='" + value.id + "'>" +
                "<img src='" + value.image + "'>" + "<span class='body-text-small'>" + value.name + "</span>" +
                "<div class='quantity-container'>" +
                "<input type='text' disabled='disabled' class='quantity' value='" + value.quantity + "'></div>" +
                "<span class='price-container' data-tax='" + value.tax + "'>" + dollarConvert(parseFloat(value.tax + value.price).toFixed(2)) + "</span></div>");
    });
}
