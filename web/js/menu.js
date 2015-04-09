$(document).ready(function() {
    if ($(".subMenu").length) {
        $(".subMenu ul li a").on("click", function() {
            $(".subMenu ul li a").removeClass("activeOption");
            $(this).addClass("activeOption");
        });
    }
    getCategory();
});

//Get Category list of food items.
var getCategoryCallback = {
    success: function(data, textStatus) {
        userDetails = JSON.parse(data);
        if (userDetails.status == 1) {
            $.each(userDetails.categories, function(key, value){
            	$('.category-wrapper .category-menu').append("<li class='menu-categories-list'><a href='#'"+
                    " class='menu-categories' data-id='"+value.id+"'>"+value.name+"</a></li>")
            });
            $.each(userDetails.meal_types, function(key, value){
                $(".filter-drop-down ul").append("<li><div><input id='check"+key+"' type='checkbox' "+
                "name='check"+key+"' value='"+value.id+"'>"+
                "<label for='check"+key+"'>"+value.name+"</label></div></li>");
            });
        } else {
        	console.log("somthing wrong with categories");
        }
    },
    failure: function(XMLHttpRequest, textStatus, errorThrown) {}
}

function getCategory(cat, meal, search) {
    var url = baseURL + 'get_categories/',
        header = {
            "session-key": localStorage["session_key"]
        },
        userInfo = {
            "get" : 1
        },
        data = JSON.stringify(userInfo);

    var getCategoryInstance = new AjaxHttpSender();
    getCategoryInstance.sendPost(url, header, data, getCategoryCallback);
}

