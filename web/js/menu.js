$(document).ready(function() {
    if ($(".subMenu").length) {
        $(".subMenu ul li a").on("click", function() {
            $(".subMenu ul li a").removeClass("activeOption");
            $(this).addClass("activeOption");
        });
    }
    getCategory();
});

var getCategoryCallback = {
    success: function(data, textStatus) {
        userDetails = JSON.parse(data);
        if (userDetails.status == 1) {
            $.each(userDetails.categories, function(key, value){
            	$('.category-wrapper ul').append("<li><a href='#' data-id='"+value.id+"'>"+value.name+"</a></li>")
            });
        } else {
        	console.log("somthing wrong with categories");
        }
    },
    failure: function(XMLHttpRequest, textStatus, errorThrown) {}
}

function getCategory() {
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
