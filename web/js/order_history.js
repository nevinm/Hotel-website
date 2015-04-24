   //Get orders API process
var getOrdersCallback = {
    success: function(data, textStatus) {
        debugger;       
    },
    failure: function(XMLHttpRequest, textStatus, errorThrown) {}
}

function getOrders() {
    var url = baseURL + "get_orders/",
        header = {
            "session-key": localStorage["session_key"]
        },
        userData = {
            
        };
    data = JSON.stringify(userData);
    var getOrdersInstance = new AjaxHttpSender();
    getOrdersInstance.sendPost(url, header, data, getOrdersCallback);
}

var dummyData ={
    "status": 1,
    "num_pages": 1,
    "actual_count": 1,
    "aaData": [
        {
            "user_last_name": "last",
            "total_tax": 34,
            "grand_total": 2323,
            "status": 0,
            "user_id": 1,
            "total_amount": 34,
            "user_image": "http://10.7.1.64:86/backend//media/images/bg_thumbnail_tOhUyPE.jpg",
            "user_first_name": "firsdt",
            "tip": 5,
            "id": 1,
            "delivery_address": {
                "id": 1,
                "first_name": "first_name",
                "last_name": "last_name",
                "street": "street",
                "building": "building",
                "city": "city.name",
                "state": "state.name",
                "zip": "zip",
                "phone": 132465
            },
            "billing_address": {
                "id": 1,
                "first_name": "first_name",
                "last_name": "last_name",
                "street": "street",
                "building": "building",
                "city": "city.name",
                "state": "state.name",
                "zip": "zip",
                "phone": 132465
            },
            "meals": [
                {
                    "id": 1,
                    "name": "asdas",
                    "description": "asdasdasdasdasdas asd asdas d",
                    "image": "http://10.1.2.0/asdasd.img.jpg",
                    "available": 1,
                    "category": "My Cat",
                    "price": 10,
                    "tax": 2,
                    "quantity": 2
                },
                {
                    "id": 1,
                    "name": "asdas",
                    "description": "asdasdasdasdasdas asd asdas d",
                    "image": "http://10.1.2.0/asdasd.img.jpg",
                    "available": 1,
                    "category": "My Cat",
                    "price": 10,
                    "tax": 2,
                    "quantity": 2
                }
            ]
        }
    ],
    "page_range": [
        1
    ],
    "per_page": 10,
    "total_count": 1,
    "current_page": 1
}