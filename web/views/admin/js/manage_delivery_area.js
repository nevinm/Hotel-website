var current_tr;
$(document).ready(function() {
	$("#add-new-delivery-area").on("click",function(){
		$('#add-edit-button').val("ADD");
		$(".header").text("ADD NEW DELIVERY AREA");
		$('.popup-wrapper').show();
		$('form#manage-zip').validate().resetForm();	
	});
	// $("#add-delivery-area, #edit-delivery-area").on('submit',function(e){
	// 	e.preventDefault();
	// });
	$("#add-edit-button").on("click",function(e){
		e.preventDefault();
		if($("#manage-zip").valid()){
			if($(this).val() == "ADD"){
				var zip = $("#new-address").val();
				manageDeliveryArea("","",zip);	
			}
			if($(this).val() == "UPDATE"){
				var id = current_tr.attr('data-id'),
				zip = $('#new-address').val();
				manageDeliveryArea(id,"",zip);
			}	
		}
	});
	$(document).on('click', '#delete-zip', function() {
		
		$('.popup-wrapper').hide();
		var id = $(this).closest('tr').attr('data-id');
		$("#yes-button").attr('data-id',id)
		$(".confirm-popup-wrapper").show();
	});
	$("#yes-button").on("click",function(){
		var id = $(this).attr('data-id');
		$(".confirm-popup-wrapper").hide();
		manageDeliveryArea("",id,"","delete");
	});

	$("#no-button").on("click",function(){
		$(".confirm-popup-wrapper").hide();
	});
	$(document).on('click', '#edit-zip', function() {	
		var zip = $(this).closest('tr').find('.zip-value').text();
		$('#add-edit-button').val('UPDATE');
		$(".header").text("CHANGE DELIVERY AREA");
		$("#new-address").val(zip);
		$('.popup-wrapper').show();	
		current_tr = $(this).closest('tr');
		$("#manage-zip").validate().resetForm();
	});
	getDeliveryAreas(1);

	$("#download-zip-unsupported-csv").on("click",function(){
        downloadOrderCSV("cms/export_zips_unsupported/");
	});
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
	var url = baseURL + 'cms/get_delivery_areas/';
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
    $.each(deliveryData.aaData, function(key, value) {
        $('#delivery-area tbody').append("<tr data-id='" + value.id + "'>" +
            "<td class='zip-value'>" + value.zip + "</td>" +
            "<td>" + "<input type='button' class='btn btn-small-primary medium-green' id='edit-zip' value='EDIT'>" + "</td>" +
            "<td>" + "<input type='button' class='btn btn-small-primary medium-green' id='delete-zip' value='DELETE'>" + "</td>" +
            "</tr>");
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
	success: function(data, textStatus, deliveryArea) {
		var deliveryData = JSON.parse(data);
		if(deliveryData.status == -1){
			showPopupMessage(deliveryData);
			return 0;
		}else{
			if(deliveryArea == "delete"){
				deleteZip(deliveryData.id);
			}else{
				getDeliveryAreas(1);
			}
		}
		$('.popup-wrapper').hide();
	},
	failure: function(XMLHttpRequest, textStatus, errorThrown) {}
}
function manageDeliveryArea(edit_id,delete_id,zip, deliveryArea){
	var url = baseURL + 'cms/manage_delivery_area/';
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
	manageDeliveryArea.sendPost(url, header, data, manageDeliveryAreaCallback, deliveryArea);
}

function showPopupMessage(data){
	$('.popup-message span').text(data.message);
			$('.popup-message').show();
            setTimeout(function() {
                $('.popup-message').hide();
            }, 2000);
}
function deleteZip(delete_id){
	$("tr[data-id='"+delete_id+"']").remove();
}
