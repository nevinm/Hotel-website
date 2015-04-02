$(document).ready(function() {
    //Get Categories
    var getCategoriesCallback = {
        success: function(data, textStatus) {
            var categoriesData = JSON.parse(data);
            populateCategories(categoriesData);
        },
        failure: function(XMLHttpRequest, textStatus, errorThrown) {}
    }


    function getCategories(nextPage) {
            var url = baseURL + 'cms/get_categories/';
            header = {
                    "session-key": localStorage['admin_session_key']
                },
                params = {
                    "nextPage": nextPage
                },
                data = JSON.stringify(params);

            var getCategoriesInstance = new AjaxHttpSender();
            getCategoriesInstance.sendPost(url, header, data, getCategoriesCallback);
        }
        //By deafault call 1 as starting.
    getCategories(1);

    function populateCategories(categoriesData) {
        $("#categories tbody").empty()
        $.each(categoriesData.aaData, function(key, value) {
            $("#categories tbody").append("<tr>" +
                "<td class='id'>" + value.id + "</td>" +
                "<td class='category'>" + value.name + "</td>" +
                "</tr>");
            $(".pagination").pagination({
                items: categoriesData.total_count,
                itemsOnPage: categoriesData.per_page,
                currentPage: categoriesData.current_page,
                cssStyle: 'light-theme',
                onPageClick: function(pageNumber, event) {
                    getCategories(pageNumber);
                }
            });
        })
    }

    var addCategoriesCallback = {
        success: function(data, textStatus) {
            var data = JSON.parse(data);
            if (data.status) {
                $(".add-status").text("Status:"+data.message);
        		$(".add-status").show();
                $("#new-category").val("");
            } else {
                $(".add-status").text("Status:"+data.message);
            }
        },
        failure: function(XMLHttpRequest, textStatus, errorThrown) {
            alert("Error in adding category");
        }
    }


    function addCategories() {
   		$(".add-status").hide();
        newCategory = $("#new-category").val();
        var url = baseURL + 'cms/add_category/';
        header = {
                "session-key": localStorage['admin_session_key']
            },
            params = {
                "category": newCategory
            },
            data = JSON.stringify(params);

        var addCategoriesInstance = new AjaxHttpSender();
        addCategoriesInstance.sendPost(url, header, data, addCategoriesCallback);
    }

    function hideAddCategory() {
   		$(".add-status").hide();
        $(".add-category-container").removeClass("showAddCategory");
    }
    
    $("#add-category").on('click', function() {
	        $(".add-category-container").addClass("showAddCategory");
    });

    $("#add-cancel").on('click', hideAddCategory);
    $("#add-confirm").on('click', function(){
    	if($("#new-category").val().length===0){
			$(".add-status").text("No category present");
    	}
    	else{
    	addCategories();
    	}
    });
});
