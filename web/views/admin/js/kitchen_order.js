$(document).ready(function() {
    getOrders();
});


//Get orders API process
var getOrdersCallback = {
    success: function(data, textStatus) {
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
        } else {}
    },
    failure: function(XMLHttpRequest, textStatus, errorThrown) {}
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

function undefinedCheck(param) {
    return (typeof param === 'undefined') ? "NULL" : param;
}

//function populate OrderList 
function populateOrderList(data) {
    var fullMealList = JSON.parse(data);
    $.each(fullMealList.aaData, function(key, value) {
        var phone = undefinedCheck(value.phone),
            name = undefinedCheck(value.user_first_name + " " + value.user_last_name),
            deliverytime = undefinedCheck(value.delivery_time),
            zip = undefinedCheck(value.delivery_address.zip),
            minTime = undefinedCheck(value.time),
            orderNum = undefinedCheck(value.order_num),
            minTime = undefinedCheck(value.minutes);
        $.each(value.meals, function(mealKey, mealValue) {
            $('#order-list tbody').append("<tr data-id='" + mealValue.id + "'>" +
                "<td>" + deliverytime + "</td>" +
                "<td>" + orderNum + "</td>" +
                "<td>" + mealValue.name + "</td>" +
                "<td>" + minTime + "</td>" +
                "<td>" + zip + "</td>" +
                "<td>" + name + "</td>" +
                "<td>" + phone + "</td>" +
                "<td><button type='button' class='meal-produced meal-delete btn btn-small-primary medium-green'" +
                "data-id='" + mealValue.id + "'>Produced</button></td></tr>");
        });

        currentStatus = value.status_id;
        $(".order-status:last").val(currentStatus);
    });

    $(".pagination").pagination({
        pages: fullMealList.num_pages,
        currentPage: fullMealList.current_page,
        cssStyle: 'light-theme',
        onPageClick: function(pageNumber, event) {
            searchParams = returnSearchParams();
            getOrders(pageNumber, searchParams.userName, searchParams.orderNum, searchParams.status, searchParams.total, searchParams.phone_num, searchParams.date);
        }
    });
}
