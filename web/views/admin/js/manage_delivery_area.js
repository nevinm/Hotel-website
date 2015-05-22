var current_tr;
$(document).ready(function() {
	$("#add-new-delivery-area").on("click",function(){
		$("#add-delivery-area").show();
		$("#edit-delivery-area").hide();
		$(".header").text("ADD NEW DELIVERY AREA");
		$('.popup-wrapper').show();
	});
	$("#add-delivery-area").on("click",function(){
		$('.popup-wrapper').hide();
		var zip = $("#new-address").val();
		manageDeliveryArea("","",zip);
		populateAddedZip(zip);
	});
	$("#check-zip").on("click",function(){
		$("span.check-delivery").hide();
		var zip = $("#new-address").val();
		checkDelivery(zip);
	});
	$(document).on('click', '#delete-zip', function() {
		var id = $(this).closest('tr').attr('data-id');
		manageDeliveryArea("",id,"");
		// $(this).closest('tr').remove();
	});
	$(document).on('click', '#edit-zip', function() {
		$("#add-delivery-area").hide();
		$("#edit-delivery-area").show();
		$(".header").text("CHANGE DELIVERY AREA");
		$('.popup-wrapper').show();
		current_tr = $(this).closest('tr');
	});
	$("#edit-delivery-area").on("click",function(){
		$('.popup-wrapper').hide();
		var id = current_tr.attr('data-id'),
			zip = $('#new-address').val();
		manageDeliveryArea(id,"",zip);
	})
	getDeliveryAreas(1);
});
// get delivery areas
var getDeliveryAreasCallback = {
	success: function(data, textStatus) {
		var deliveryData = JSON.parse(data);
		populateDeliveryAreas(deliveryData);
	},
	failure: function(XMLHttpRequest, textStatus, errorThrown) {}
}
function getDeliveryAreas(nextPage){
	var url = baseURL + 'get_delivery_areas/';
	header = {
		"session-key": localStorage['session_key']
	},
	params = {
		"nextPage": nextPage
	},
	data = JSON.stringify(params);

	var getgetDeliveryAreas = new AjaxHttpSender();
	getgetDeliveryAreas.sendPost(url, header, data, getDeliveryAreasCallback);
}
function populateDeliveryAreas(deliveryData){
    $('#delivery-area tbody tr').remove();
    var count= 0;
    $.each(deliveryData.aaData, function(key, value) {
        $('#delivery-area tbody').append("<tr data-id='" + count + "'>" +
            "<td class='zip-value'>" + value + "</td>" +
            "<td>" + "<input type='button' class='btn btn-small-primary medium-green' id='edit-zip' value='EDIT'>" + "</td>" +
            "<td>" + "<input type='button' class='btn btn-small-primary medium-green' id='delete-zip' value='DELETE'>" + "</td>" +
            "</tr>");
        count++;
    });

    $(".pagination").pagination({
        items: deliveryData.total_count,
        itemsOnPage: deliveryData.per_page,
        currentPage: deliveryData.current_page,
        cssStyle: 'light-theme',
        onPageClick: function(pageNumber, event) {
            getDeliveryAreas(pageNumber);
        }
    });
}

//manage delivery areas
var manageDeliveryAreaCallback = {
	success: function(data, textStatus) {
		var deliveryData = JSON.parse(data);
		if(deliveryData.status == -1){
			showPopupMessage(deliveryData);
		}else{
			populateEditChanges();

		}
	},
	failure: function(XMLHttpRequest, textStatus, errorThrown) {}
}
function manageDeliveryArea(edit_id,delete_id,zip){
	var url = baseURL + 'manage_delivery_area/';
	header = {
		"session-key": localStorage['session_key']
	},
	params = {
		"edit_id":edit_id,
		"delete_id":delete_id,
		"zip":zip
	},
	data = JSON.stringify(params);
	var manageDeliveryArea = new AjaxHttpSender();
	manageDeliveryArea.sendPost(url, header, data, manageDeliveryAreaCallback);
}

//check delivery
var checkDeliveryCallback = {
	success: function(data, textStatus) {
		var deliveryData = JSON.parse(data);
		if(deliveryData.status == 1){
			$("span.check-delivery").text(deliveryData.message);
			$("span.check-delivery").show();
			$("#edit-delivery-area,#add-delivery-area").removeClass("button-disabled");
		}else{
			$("span.check-delivery").text(deliveryData.message);
			$("span.check-delivery").show();
		}
	},
	failure: function(XMLHttpRequest, textStatus, errorThrown) {}
}
function checkDelivery(zip){
	var url = baseURL + 'check_delivery/';
	header = {
		"session-key": localStorage['session_key']
	},
	params = {
		"zip":zip
	},
	data = JSON.stringify(params);

	var checkDelivery = new AjaxHttpSender();
	checkDelivery.sendPost(url, header, data, checkDeliveryCallback);
}

function showPopupMessage(data){
	$('.popup-message span').text(data.message);
			$('.popup-message').show();
            setTimeout(function() {
                $('.popup-message').hide();
            }, 2000);
}
function populateEditChanges(){
	var newZip = $('#new-address').val();
	current_tr.find('.zip-value').text(newZip);
}
function populateAddedZip(zip){
	$('#delivery-area tbody').append("<tr>"+
		 "<td class='zip-value'>" + zip + "</td>" +
            "<td>" + "<input type='button' class='btn btn-small-primary medium-green' id='edit-zip' value='EDIT'>" + "</td>" +
            "<td>" + "<input type='button' class='btn btn-small-primary medium-green' id='delete-zip' value='DELETE'>" + "</td>" +
		+"</tr>")
}