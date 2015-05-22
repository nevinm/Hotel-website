   //Get orders API process
   var getOrdersCallback = {
       success: function(data, textStatus) {
           populateOrdersList(JSON.parse(data));
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

   $(document).ready(function() {
       getOrders();
       CartItemCount();
       // &ACCORDION
       $(document).on('click', '.accordion-header', function() {
           $(".accordion-content").slideUp();

           if (!$(this).next().is(":visible")) {
               $(this).next().slideDown();
           }
       });
   });


   function populateOrdersList(ordersList) {
       // ordersList = JSON.parse(dummyData);
       $.each(ordersList.aaData, function(key, value) {
           deliveryAddress = value.delivery_address;
           meals = value.meals;
           $("#accordion ul").append("<li><div class='accordion-header'>" +
               "<h4 style='float: left;padding-right: 116px;'>"+value.order_num+"</h4>" +
               "<h4 class='status'>"+value.status+"</h4></div><div class='accordion-content body-text-small'>" +
               "<div class='row'><div class='accordion-subcontent'>" +
               "<div class='order-head'>ORDER TOTAL</div>" +
               "<div class='order-content'>" + dollarConvert(value.grand_total) + "</div>" +
               "</div>" +
               "<div class='accordion-subcontent'>" +
               "<div class='order-head'>ORDER DATE</div>" +
               "<div class='order-content'>"+value.delivery_time.substring(0,10)+"</div>" +
               "</div>" +
               "<div class='accordion-subcontent'>" +
               "<div class='order-head'>SHIPPING INFROMATION</div>" +
               "<div class='order-content'>" +
               "<span>" + deliveryAddress.first_name + " " + deliveryAddress.last_name + "</span>" +
               "<span>" + deliveryAddress.building + " " + deliveryAddress.street + "</span>" +
               "<span>" + deliveryAddress.city + "</span>" +
               "<span>" + deliveryAddress.zip + "</span></div></div>" +
               "<div class='accordion-subcontent'>" +
               "<div class='order-head'>ITEMS ORDERD</div>" +
               "<div class='order-content'>" +
               "</div></div></div>" +
               "</li>");

            if(value.status== "IN PROGRESS"){
                $("h4.status:last").addClass("green");
            }
           $.each(meals, function(key, meal) {
               $("#accordion .order-content:last").append("<span>" + meal.name + " x " + meal.quantity + "</span>");
           });
       });
    $($(".accordion-header")[0]).trigger('click');
   }

