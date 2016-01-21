$(document).ready(function () {
    getOrders();
    downloadOrderCSV("cms/export_orders/", "download-orders-form");
    setInterval(function () {
        getOrders();
    }, 60000);
});

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
    var url = baseURL + "cms/get_kitchen_orders/",
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
    var getOrdersInstance = new AjaxHttpSender();
    getOrdersInstance.sendPost(url, header, data, getOrdersCallback);
}

//Update orders API process
var updateOrdersCallback = {
    success: function (data, textStatus, element) {
        updatedOrders = JSON.parse(data);
        if (updatedOrders.status) {
            if ($(element).is(":checked")) {
                $(element).parents().eq(1).addClass("produced-meal")
            } else {
                $(element).parents().eq(1).removeClass("produced-meal")
            }
        } else {
            showPopup(data);
        }
    },
    failure: function (XMLHttpRequest, textStatus, errorThrown) {
    }
}

function updateOrders(producedMeals, orderId, currentMealStatusId, element) {
    var url = baseURL + "cms/update_order/" + orderId + "/",
            header = {
                "session-key": localStorage["session_key"]
            },
    params = {
        "produced_meals": producedMeals,
        "meal_status": currentMealStatusId
    }
    data = JSON.stringify(params);
    var updateOrdersInstance = new AjaxHttpSender();
    updateOrdersInstance.sendPost(url, header, data, updateOrdersCallback, element);
}

function undefinedCheck(param) {
    return (typeof param === 'undefined') ? "NULL" : param;
}

//function populate OrderList 
function populateOrderList(data) {
    $('#order-list tbody').empty();
    var fullMealList = JSON.parse(data);
    $.each(fullMealList.aaData, function (key, value) {
        var phone = undefinedCheck(value.phone),
                name = undefinedCheck(value.user_first_name + " " + value.user_last_name),
                deliverytime = (undefinedCheck(value.delivery_time)),
                zip = undefinedCheck(value.delivery_address.zip),
                minTime = undefinedCheck(value.time),
                orderNum = undefinedCheck(value.id),
                minTime = undefinedCheck(value.minutes),
                orderStatus = undefinedCheck(value.status),
                meridianDeliveryTime = convertToMeridianTime(deliverytime);

        $.each(value.meals, function (mealKey, mealValue) {
            var prevOrderNum = $($("#order-list tbody .row:nth-last-child(2)")[0]).data("order-id");
            if (prevOrderNum && (prevOrderNum == orderNum)) {
            } else {
                $('#order-list tbody').append("<tr class='row space'" +
                        " data-order-id='" + orderNum + "' data-meal-id='" + mealValue.id + "'>" +
                        "<td></td><td></td><td></td><td></td>" +
                        "<td></td><td></td><td></td>" +
                        "<td></td><td></td>" +
                        "</tr>");
            }

            $('#order-list tbody').append("<tr class='row'" +
                    " data-order-id='" + orderNum + "' data-meal-id='" + mealValue.id + "'>" +
                    "<td>" + meridianDeliveryTime.date + "<br>" + meridianDeliveryTime.time + "</td>" +
                    "<td>" + orderNum + "</td>" +
                    "<td>" + mealValue.quantity + "</td>" +
                    "<td>" + mealValue.name + "</td>" +
                    "<td>" + minTime + "</td>" +
                    "<td>" + zip + "</td>" +
                    "<td>" + name + "</td>" +
                    "<td>" + phone + "</td>" +
                    "<td><b>" + orderStatus + "</b></td>" +
                    "</tr>");
        });
    });

    $(".pagination").pagination({
        pages: fullMealList.num_pages,
        currentPage: fullMealList.current_page,
        cssStyle: 'light-theme',
        onPageClick: function (pageNumber, event) {
            getOrders(pageNumber);
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

    $(".order-status").on("change", function () {
        var orderId = $(this).data('order-id'),
                mealId = $(this).data('meal-id'),
                mealStatus = $(this).val(),
                producedMealsElements = $("select[data-order-id='" + orderId + "']"),
                producedMeals = [];
        producedMeals.push($(this).data("meal-id"));
        updateOrders(producedMeals, orderId, mealStatus, this);
    });
}
