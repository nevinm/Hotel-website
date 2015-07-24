$(document).ready(function() {
    getDeliveryOrders(0);

    setInterval(function() {
        getDeliveryOrders();
    }, 60000);
});

//Update orders API process
var updateOrdersCallback = {
    success: function(data, textStatus, element) {
        updatedOrders = JSON.parse(data);
        if (updatedOrders.status) {

        } else {
            showPopup(data);
        }
    },
    failure: function(XMLHttpRequest, textStatus, errorThrown) {}
}

function updateOrders(orderId, currentMealStatusId, element) {
    var url = baseURL + "cms/update_order/" + orderId + "/",
        header = {
            "session-key": localStorage["session_key"]
        },
        params = {
            "status": currentMealStatusId
        }
    data = JSON.stringify(params);
    var updateOrdersInstance = new AjaxHttpSender();
    updateOrdersInstance.sendPost(url, header, data, updateOrdersCallback, element);
}

//Get orders API process
var getDeliveryOrdersCallback = {
    success: function(data, textStatus) {
        var order = JSON.parse(data);
        if (order.status == 1) {
            if (order.aaData.length > 0) {
                // $(".order-list-empty").hide();
                populateDeliveryOrderList(order);
            } else {
                // $(".order-list-empty").show();
                $(".pagination").pagination({
                    pages: 0,
                    cssStyle: 'light-theme',
                });
            }
        } else {}
    },
    failure: function(XMLHttpRequest, textStatus, errorThrown) {}
}

function getDeliveryOrders(nextPage, userName, orderNum, status, total_amount, phone_num, date, delivery_type) {
    // $('#order-list tbody').empty();
    var url = baseURL + "cms/get_delivery_orders/",
        header = {
            "session-key": localStorage["session_key"]
        },
        params = {
            "nextPage": nextPage,
            "search": userName,
            "num": orderNum,
            "status": status
        }
    data = JSON.stringify(params);
    var getDeliveryOrdersInstance = new AjaxHttpSender();
    getDeliveryOrdersInstance.sendPost(url, header, data, getDeliveryOrdersCallback);
}

function populateDeliveryOrderList(order_data) {
    $('table#delivery-order tbody').empty();
    $.each(order_data.aaData, function(key, value) {

        var phone = undefinedCheck(value.phone),
            name = undefinedCheck(value.user_first_name + " " + value.user_last_name),
            deliverytime = (undefinedCheck(value.delivery_time)).slice(0, -3),
            zip = undefinedCheck(value.delivery_address.zip),
            email = undefinedCheck(value.email),
            grand_total = undefinedCheck(value.grand_total),
            delivery_address = {},
            delivery_address = value.delivery_address,
            address_name = delivery_address.first_name + " " + delivery_address.last_name,
            building = delivery_address.building,
            street = delivery_address.street,
            city = delivery_address.city,
            state = delivery_address.state,
            address_phone = delivery_address.phone,
            address_zip = delivery_address.zip,
            meals = value.meals;

        if (value.driver_instructions.length) {
            instructions = value.driver_instructions;
        } else {
            instructions = "None";
        }



        $('table#delivery-order tbody').append("<tr data-id='" + value.id + "'><td>" + deliverytime + "</td>" +
            "<td>" + value.order_num + "</td>" +
            "<td>" + zip + "</td>" +
            "<td>" + "<span>" + building + ", " + street + "</span>" + "</td>" +
            "<td>" + "<span>" + city + ", " + state + "</span>" + "</td>" +
            "<td>" + name + "</td>" +
            "<td>" + phone + "</td>" +
            "<td class='meals'>" + "</td>" +
            "<td>" + instructions + "</td>" +
            "<td>" + "<select data-id='" + value.id + "'class='order-status' name='status'>" +
            "<option value='0'>Placed</option>" +
            "<option value='1'>Packed</option>" +
            "<option value='2'>Dispatched</option>" +
            "<option value='3'>Delivered</option>" +
            "<option value='4'>Cancelled</option>" +
            "</select></td>" +
            +"</tr>");

        mealLength = meals.length;
        $.each(meals, function(key, value) {
            if (key + 1 == mealLength) {
                $("#delivery-order td.meals:last").append("<span>" + value.name + " " + "</span>")
            } else {
                $("#delivery-order td.meals:last").append("<span>" + value.name + "," + "</span>")
            }
        });

        currentStatus = value.status_id;
        $(".order-status:last").val(currentStatus);
    });

    $(".pagination").pagination({
        items: order_data.total_count,
        itemsOnPage: order_data.per_page,
        currentPage: order_data.current_page,
        cssStyle: 'light-theme',
        onPageClick: function(pageNumber, event) {
            getDeliveryOrders(pageNumber);
        },
        onInit: function() {
            if (getStringAfterHash(location.href, "#")) {
                var pageString = getStringAfterHash(location.href, "#");
                pageNumber = getStringAfterHash(pageString, "-");
                if ($(".pagination").pagination('getCurrentPage') == pageNumber) {} else {
                    $(".pagination").pagination('selectPage', pageNumber);
                }
            } else {}
        }
    });

    $(".order-status").on("change", function() {
        var orderId = $(this).data('id'),
            mealStatus = $(this).val();
        //     producedMealsElements = $("input[data-order-id='" + orderId + "']"),
        //     producedMeals = [];
        // $.each(producedMealsElements, function(key, value) {
        //     if ($(value).is(":checked")) {
        //         producedMeals.push($(value).data("meal-id"));
        //     } else {}
        // });
        updateOrders(orderId, mealStatus, this);
    });
}

function undefinedCheck(param) {
    return (typeof param === 'undefined') ? "NULL" : param;
}
