$(document).ready(function() {
	$('#searchinMeal').on("click",function(){
		var search_name = $('#searchBy-name').val(),
			category = $('#category option:selected').attr('value'),
			mealtype = $('#meal-type option:selected').attr('value');
					$("#meal-list tr td").detach();
		getmealList(search_name,category,mealtype);	
	});
	getmealList();
	getFilterContent();
});

//get meal list
	var getmealListCallback = {
		success : function(data,textStatus){
			var mealLIst = JSON.parse(data);
			console.log(data);
			populateMealList(mealLIst);
		},
		failure: function(XMLHttpRequest, textStatus, errorThrown) {}
	}
function getmealList (search_name,category,mealtype){
	var url = baseURL+"cms/get_meals/";
		header = {
			"session-key": localStorage['session_key']
		}
		params ={
			"search":search_name,
			 "category_id":category,
			 "type_id":mealtype
		}
		data = JSON.stringify(params);
		console.log(data);
		var getmeallistInstance = new AjaxHttpSender();
            getmeallistInstance.sendPost(url, header, data, getmealListCallback);
}
//populate category & meal type
var getFilterContentCallback = {
	success:function(data,textStatus){
		var filterContent = JSON.parse(data);
		// console.log(filterContent);
		populateFilterData(filterContent);
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
function populateFilterData(data){
	var meal_type = data.meal_types,
		categories = data.categories;
	$.each(meal_type,function(k,v){
		$('.filter-container #meal-type').append('<option value="'+v.id+'">'+v.name+'</option');
	});
	$.each(categories,function(k,v){
 		$('.filter-container #category').append("<option value='"+v.id+"'>"+v.name+"</option>");
 	});
}

//function populate MealList 
function populateMealList(data){
	var fullMealList = data;
	$.each(fullMealList.aaData,function(key,value){
		console.log(value);

		$('#meal-list thead').append("<tr>"+"<td>"+value.name+"</td>"+
									"<td>"+value.description+"</td>"+
									"<td>"+value.available+"</td>"+
									"<td>"+value.category+"</td>"+
									"<td>"+value.meal_type[0].name+"</td>"+
									"<td>"+value.price+"</td>"+"</tr>");
	});
}


