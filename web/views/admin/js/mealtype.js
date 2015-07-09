var current_tr;
$(document).ready(function() {
	$("#add-new-mealtype").on("click",function(){
		$("#new-mealtype").val("");
		$("#add-mealtype").show();
		$("#edit-mealtype").hide();
		$(".header").text("ADD NEW MEAL TYPE");
		$('.popup-wrapper').show();
		if($("#new-mealtype").hasClass("error")){
			$('form.popup-container').valid();
		}
		$("form").data('validator').resetForm();		
	});
	$("#add-mealtype").on("click",function(e){
		e.preventDefault();
		if($(".popup-container").valid()){
			$('.popup-wrapper').hide();
			var mealtype = $("#new-mealtype").val();
			manageMealtype("","",mealtype,"add");
		}
	});
	$(document).on('click', '#delete-mealtype', function() {
		$('.popup-wrapper').hide();
		var id = $(this).closest('tr').attr('data-id');
		$("#yes-button").attr('data-id',id)
		$(".confirm-popup-wrapper").show();
	});
	$("#yes-button").on("click",function(){
		var id = $(this).attr('data-id');
		$(".confirm-popup-wrapper").hide();
		manageMealtype("",id,"","delete");
	});

	$("#no-button").on("click",function(){
		$(".confirm-popup-wrapper").hide();
	});
	$(document).on('click', '#edit-mealtype-name', function() {
		var mealtype = $(this).closest('tr').find('.mealtype-name-value').text();
		$("#add-mealtype").hide();
		$("#edit-mealtype").show();
		$(".header").text("CHANGE DELIVERY AREA");
		$("#new-mealtype").val(mealtype);
		$('.popup-wrapper').show();
		if($("#new-mealtype").hasClass("error")){
			$('form.popup-container').valid();
		}	
		current_tr = $(this).closest('tr');
	});
	$("#edit-mealtype").on("click",function(e){
		e.preventDefault();
		if($(".popup-container").valid()){
			$('.popup-wrapper').hide();
			var id = current_tr.attr('data-id'),
				mealtype = $('#new-mealtype').val();
			manageMealtype(id,"",mealtype,"edit");
		}
	})
	getMealtypes(1);
});
// get delivery areas
var getMealtypesCallback = {
	success: function(data, textStatus) {
		var deliveryData = JSON.parse(data);
		populateDeliveryAreas(deliveryData);
	},
	failure: function(XMLHttpRequest, textStatus, errorThrown) {}
}
function getMealtypes(nextPage){
	var url = baseURL + 'cms/get_delivery_areas/';
	header = {
		"session-key": localStorage['session_key']
	},
	params = {
		"nextPage": nextPage
	},
	data = JSON.stringify(params);

	var getMealtypes = new AjaxHttpSender();
	getMealtypes.sendPost(url, header, data, getMealtypesCallback);
}
function populateDeliveryAreas(deliveryData){
    $('#delivery-area tbody tr').remove();
    $.each(deliveryData.aaData, function(key, value) {
        $('#delivery-area tbody').append("<tr class='row' data-id='" + value.id + "'>" +
            "<td class='mealtype-name-value'>" + value.mealtype + "</td>" +
            "<td>" + "<input type='button' class='btn btn-small-primary medium-green'"+
            " id='edit-mealtype-name' value='EDIT'>" + "</td>" +
            "<td>" + "<input type='button' class='btn btn-small-primary medium-green'"+
            " id='delete-mealtype' value='DELETE'>" + "</td>" +
            "<td><img class='mealtype-icon' src='../../images/Vegetarian.png'/>"+
            "<span class='mealtype-image-upload'>EDIT</span></td>"+
            "</tr>");
    });

    $(".pagination").pagination({
        items: deliveryData.total_count,
        itemsOnPage: deliveryData.per_page,
        currentPage: deliveryData.current_page,
        cssStyle: 'light-theme',
        onPageClick: function(pageNumber, event) {
            getMealtypes(pageNumber);
        }
    });
}

//manage delivery areas
var manageMealtypeCallback = {
	success: function(data, textStatus, deliveryArea) {
		var deliveryData = JSON.parse(data);
		if(deliveryData.status == -1){
			showPopupMessage(deliveryData);
			return 0;
		}else{
			if(deliveryArea == "delete"){
				deleteZip(deliveryData.id);
			}else{
				getMealtypes(1);
			}
		}
	},
	failure: function(XMLHttpRequest, textStatus, errorThrown) {}
}
function manageMealtype(edit_id,delete_id,mealtype, deliveryArea){
	var url = baseURL + 'cms/manage_delivery_area/';
	header = {
		"session-key": localStorage['session_key']
	},
	params = {
		"edit_id":edit_id,
		"delete_id":delete_id,
		"mealtype":mealtype
	},
	data = JSON.stringify(params);
	var manageMealtype = new AjaxHttpSender();
	manageMealtype.sendPost(url, header, data, manageMealtypeCallback, deliveryArea);
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
