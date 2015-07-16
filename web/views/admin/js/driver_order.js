$(document).ready(function() {
    getDeliveryOrders(0);
});

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

function populateDeliveryOrderList(order_data){
    $.each(order_data.aaData, function(key, value) {
        
         var phone = undefinedCheck(value.phone),
            name = undefinedCheck(value.user_first_name + " " + value.user_last_name),
            deliverytime = undefinedCheck(value.delivery_time),
            zip = undefinedCheck(value.delivery_address.zip),
            email = undefinedCheck(value.email),
            grand_total = undefinedCheck(value.grand_total),
            delivery_address = {},
            delivery_address = value.delivery_address,
            address_name = delivery_address.first_name +" "+ delivery_address.last_name,
            building = delivery_address.building,
            street = delivery_address.street,
            city = delivery_address.city,
            state = delivery_address.state,
            address_phone = delivery_address.phone, 
            address_zip = delivery_address.zip,
            meals = value.meals;


        $('table#delivery-order tbody').append("<tr>"+"<td>"+deliverytime+"</td>"+
            "<td>"+value.order_num+"</td>"+
            "<td>"+zip+"</td>"+
            "<td>"+"<span>"+building+", "+street+"</span>"+"</td>"+
            "<td>"+"<span>"+city+", "+state+"</span>"+"</td>"+
            "<td>"+name+"</td>"+
            "<td>"+phone+"</td>"+
            "<td class='meals'>"+"</td>"+
            "<td>"+""+"</td>"+
            "<td>"+"<select data-id='" + value.id + "'class='order-status' name='status'>" +
            "<option value='0'>Placed</option>" +
            "<option value='1'>Packed</option>" +
            "<option value='2'>Dispatched</option>" +
            "<option value='3'>Delivered</option>" +
            "<option value='4'>Cancelled</option>" +
            "</select>"+"</td>"+
            +"</tr>");
        $.each(meals, function(key, value) {
            $("#delivery-order td.meals").append("<span>"+value.name +","+"</span>")
        });
    });
}

function undefinedCheck(param) {
    return (typeof param === 'undefined') ? "NULL" : param;
}