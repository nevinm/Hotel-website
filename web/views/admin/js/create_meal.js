$(document).ready(function() {
	$('.add-list-button,.add-preparation-button').on("click",function(){
		var element_id = $(this).prev().attr('id');
		var container = $(this).parent().attr('class');
		populateListData(element_id,container);
	});
	//ADD NUTRIENTS DETAILS
	$('.add-nutrition-content').on("click",function(){
		var nutrients = $('#nutrients').val(),
			per_serving = $('#nutrients-per-serving').val(),
			daily_value = $('#nutrients-daily-value').val();
		populateNutrients(nutrients,per_serving,daily_value); 
	});
	$('#create-meal-button').on("click",function(){
		createMeal();
	});
	//remove li
	$(document).on('click','img.remove',function(){
		debugger;
		$(this).parent().remove();
	});
	getFilterContent();
});
//CREATE MEAL API
var createMealCallback = {
	success : function(data,textStatus){
		debugger;
		console.log(data);
	},
	failure : function(XMLHttpRequest,textStatus,errorThrown){}
}

function createMeal(){
	var name = $('#meal-name').val(),
		price = $('#meal-price').val(),
		tax = $('#meal-tax').val(),
		prep_time = $('#meal-prep-time').val(),
		saved_time = $('#meal-saved-time').val(),
		descptn = $('#description').val(),
		availability = $('#create-meal-available option:selected').attr('value'),
		category = $('#create-meal-category option:selected').attr('value'),
		meal_type  = $('#create-meal-mealType option:selected').attr('value');
		var ingredients = []; // ingredient array
			var temp='';
			$('.ingredients-container .list-container ul').find('li').each(function(){
				temp=$(this).text();
				ingredients.push(temp); 
			});
	    var pre_requesties = [];
	    	$('.pre-requisties-container .list-container ul').find('li').each(function(){
	    		temp=$(this).text();
				pre_requesties.push(temp); 
			});
		var toDo = [];
			$('.preperation-container-1 .list-container ul').find('li').each(function(){
	    		temp=$(this).text();
				toDo.push(temp); 
			});
		var prepared = [];
			$('.preperation-container-2 .list-container ul').find('li').each(function(){
	    		temp=$(this).text();
				prepared.push(temp); 
			});

		var url = baseURL+"cms/create_meal/";
		header = {
			"session-key": localStorage['session_key']
		}
		params ={
			"name" :name,
			"description" :descptn,
			"price" :price,
			"tax" :tax,
			"category_id" :category,
			"filter_id" :meal_type,
			"available" :availability,
			"ingredients":ingredients,
			"pre_requisites":pre_requesties,
			"user_to_do" :toDo,
			"preparation_time" :prep_time,
			"finished_preparation":prepared,
			"saved_time":saved_time		
		}
		data = JSON.stringify(params);
		var createMealInstance = new AjaxHttpSender();
		createMealInstance.sendPost(url, header, data, createMealCallback);
}
// populate list data 
function populateListData(element_id,container){
	var addTo_list =  $('#'+element_id).val();
	$('.'+container).find('.list-container ul').append('<li>'+addTo_list+'<img class="remove" src="../../images/del.png">'+'</li>'); 
}

//populate to table 
function populateNutrients(nutrients,per_serving,daily_value){
	$('#nutrient-table').append('<tr>'+'<td>'+nutrients+'</td>'+
		'<td>'+per_serving+'</td>'+'<td>'+daily_value+'</td>'+'</tr>')
}

//populate category , meal_type select button
var getFilterContentCallback = {
	success:function(data,textStatus){
		var filterContent = JSON.parse(data),
			meal_type = filterContent.meal_types,
			categories = filterContent.categories;
		populateCreateMealFilter(meal_type,categories);
	},
	failure : function(XMLHttpRequest, textStatus, errorThrown) {}
}
function getFilterContent(){
	var url = baseURL+"get_categories/";
	header = {
		"session-key": localStorage['session_key']
	}
	params ={
		"get":"1"
	}
	data = JSON.stringify(params);
	var getFilterContentInstance = new AjaxHttpSender();
		getFilterContentInstance.sendPost(url, header, data, getFilterContentCallback);
}
function populateCreateMealFilter(meal_type,categories){
	$.each(meal_type,function(key,value){
		$('#create-meal-mealType ').append("<option value='"+value.id+"'>"+value.name+"</option>");
	})
	$.each(categories,function(key,value){
		$('#create-meal-category').append("<option value='"+value.id+"'>"+value.name+"</option>");
	})
}

//remove li

$('.list-container ul img').on('click',function(){

});