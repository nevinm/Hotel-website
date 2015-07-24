$(document).ready(function() {
    //By deafault call 1 as starting.
    getCategories(1);

    $("#add-category").on('click', function() {
        $(".add-category-container, .update-category-container").hide();
        $(".add-category-container").show();
        $('form#add-new-category').validate().resetForm();

    });

    $("#add-cancel, #update-cancel").on('click', hideAddCategory);
    $("#add-confirm").on('click', function(e) {
        e.preventDefault();
        if($('#add-new-category').valid()){
            addCategories();
        }            
    });

    $("#update-confirm").on('click', function(e) {
        e.preventDefault();
        var newCategory = $(".update-category-container .new-category").val(),
            Id = $(".update-category-container .new-category").attr('data-id');
        if($('#update-category-form').valid()){
            updateCategories(Id, newCategory);
        } 
    })

    $(document).on('click', '.cross', function() {
        var deleteId = $(this).data().id;
        removeCategories(deleteId);
    });
    $(document).on('click', '.update', function() {
        $(".add-category-container, .update-category-container").hide();
        var updateId = $(this).data().id,
            initialCategory = $(this).data().name;
        $(".update-category-container").show();
        $(".update-category-container .new-category").attr("data-id", updateId);
        $(".update-category-container .new-category").val(initialCategory);
        $('form#update-category-form').validate().resetForm();
    });

});
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
            "session-key": localStorage['session_key']
        },
        params = {
            "nextPage": nextPage
        },
        data = JSON.stringify(params);

    var getCategoriesInstance = new AjaxHttpSender();
    getCategoriesInstance.sendPost(url, header, data, getCategoriesCallback);
}


//Remove Categories
var removeCategoriesCallback = {
    success: function(data, textStatus) {
        var categoriesData = JSON.parse(data);
        if (categoriesData.status == 1) {
            currentPage = $('.pagination').pagination('getCurrentPage');
            getCategories(currentPage);
        } else {
            alert("Something went wrong")
        }
    },
    failure: function(XMLHttpRequest, textStatus, errorThrown) {}
}

function removeCategories(id) {
    if (confirm('Are you sure you want to delete this category?')) {
        var url = baseURL + 'cms/remove_category/';
        header = {
                "session-key": localStorage['session_key']
            },
            params = {
                "id": id
            },
            data = JSON.stringify(params);

        var removeCategoriesInstance = new AjaxHttpSender();
        removeCategoriesInstance.sendPost(url, header, data, removeCategoriesCallback);
    } else {}
}

//Update Categories
var updateCategoriesCallback = {
    success: function(data, textStatus) {
        var categoriesData = JSON.parse(data);
        if (categoriesData.status == 1) {
            totalPage = $('.pagination').pagination('getPagesCount');
            $('.pagination').pagination('selectPage', totalPage);
            $(".new-category").val("");
            $(".update-category-container").hide();
        } else {
            alert("Something went wrong")
        }
    },
    failure: function(XMLHttpRequest, textStatus, errorThrown) {}
}

function updateCategories(id, category) {
    var url = baseURL + 'cms/update_category/';
    header = {
            "session-key": localStorage['session_key']
        },
        params = {
            "id": id,
            "category": category
        },
        data = JSON.stringify(params);

    var updateCategoriesInstance = new AjaxHttpSender();
    updateCategoriesInstance.sendPost(url, header, data, updateCategoriesCallback);
}


function populateCategories(categoriesData) {
    $("#categories tbody").empty();
    $.each(categoriesData.aaData, function(key, value) {
        $("#categories tbody").append("<tr>" +
            "<td class='category' data-name='" + value.name + "'>" + value.name + "</td>" +
            "<td class='delete'><a data-id='" + value.id + "'class='cross'></a></td>" +
            "<td class=''><button class='update btn btn-small-primary medium-green' type='button' data-name='" + value.name + "' data-id='" + value.id + "'>Update</button></td>" +
            "</tr>");
    })
    $(".pagination").pagination({
        items: categoriesData.total_count,
        itemsOnPage: categoriesData.per_page,
        currentPage: categoriesData.current_page,
        cssStyle: 'light-theme',
        onPageClick: function(pageNumber, event) {
            getCategories(pageNumber);
        },
        onInit: function() {
            if (getStringAfterHash(location.href, "#")) {
                var pageString = getStringAfterHash(location.href, "#");
                pageNumber = getStringAfterHash(pageString, "-");
                if ($(".pagination").pagination('getCurrentPage') == pageNumber) {} else {
                    $(".pagination").pagination('selectPage', pageNumber);
                }
            } else {}
        }
    });

}

//Add category
var addCategoriesCallback = {
    success: function(data, textStatus) {
        var data = JSON.parse(data);
        if (data.status) {
            totalPage = $('.pagination').pagination('getPagesCount');
            $(".add-status").text("Status:" + data.message);
            $(".add-status").show();
            $(".new-category").val("");
            $('.pagination').pagination('selectPage', totalPage);
        } else {
            $(".add-status").text("Status:" + data.message);
        }
    },
    failure: function(XMLHttpRequest, textStatus, errorThrown) {
        alert("Error in adding category");
    }
}


function addCategories() {
    $(".add-status").hide();
    var newCategory = $(".add-category-container .new-category").val(),
        url = baseURL + 'cms/add_category/',
        header = {
            "session-key": localStorage['session_key']
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
    $(".add-category-container, .update-category-container").hide();
}
