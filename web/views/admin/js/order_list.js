$(document).ready(function() {
    getOrders();
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

//function populate OrderList 
function populateOrderList(data) {
    $('#order-list tbody').empty();
    var fullMealList = JSON.parse(data);
    $.each(fullMealList.aaData, function(key, value) {
        $('#order-list tbody').append("<tr>" +
            "<td>" + value.user_first_name + " " + value.user_last_name + "</td>" +
            "<td>" + dollarConvert(value.total_amount) + "</td>" +
            "<td>" + value.status + "</td>" +
            "<td>" + value.billing_address + "</td>" +
            "<td><img class='profile-image' data-id='" + value.id + "' src='" + value.user_image + "'/></td>" +
            "<td><button type='button' class='meal-delete' data-id='" + value.id + "'>Delete</button></td></tr>");
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
