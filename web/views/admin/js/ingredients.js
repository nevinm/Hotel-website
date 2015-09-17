$(document).ready(function() {
    Ingredients.initView();
});
var Ingredients = (function() {
    function initView() {
        bindEvents();
        loadDefaults();
    }

    function loadDefaults() {
        setUploadUrl('ingredient-image-upload-element');
        loadIngredientsList("", 1);
    }

    function bindEvents() {
        $("#addNewIngredients").off().on("click", function() {
            showIngredientPopup();
            $(".popup-input-wrapper .ingredient-icon").attr("src", "");
            $("#newIngredient").val("");
            $("#addIngredient").show();
            $(".popup-input-wrapper .ingredient-icon").attr("data-id", "");
            $("#editIngredient").hide();
            $(".header").text("ADD NEW INGREDIENT");
            $('.popup-wrapper').show();
            if ($("#newIngredient").hasClass("error")) {
                $('form.popup-container').valid();
            }
            $("form").data('validator').resetForm();
        });
        $("#no-button").off().on("click",function(e){
            e.preventDefault();
            $(".confirm-popup-wrapper").removeAttr("style");
        });
        $("#addIngredient").off().on("click", function(e) {
            e.preventDefault();
            if ($(".popup-container").valid()) {
                $('.popup-wrapper').hide();
                var ingredientName = $('#newIngredient').val(),
                    imageId = $(".popup-input-wrapper .ingredient-icon").attr("data-id");
                addIngredient(ingredientName, imageId);
            }
        });
        $("#ingredientChangeIcon").off().on("click", function() {
            $(this).next(".ingredient-image-upload-element").trigger("click");
        });
        $(".ingredient-image-upload-element").on('click', function() {
            var inputElement = $(this),
                imageElement = $(this).parent().find(".ingredient-icon");
            uploadImage(inputElement, imageElement);
        });
        $("input[id^=editIngredientName-]").off().on("click", function() {
            var ingredientName = $(this).closest('tr').find('.ingredient-name').text(),
                imageUrl = $(this).data("url"),
                imageId = $(this).data("imageid");
            showIngredientPopup();
            $("#addIngredient").hide();
            $("#editIngredient").show();
            $(".header").text("EDIT INGREDIENT");
            $("#newIngredient").val(ingredientName);
            $(".popup .ingredient-icon").attr("data-id", imageId);
            $('.popup-wrapper').show();
            if ($("#newIngredient").hasClass("error")) {
                $('form.popup-container').valid();
            }
            $(".popup .ingredient-icon").attr("src", imageUrl);
            $("#editIngredient").attr("data-id", $(this).closest('tr').attr("data-id"));
        });
        $("#editIngredient").off().on("click", function(e) {
            e.preventDefault();
            if ($(".popup-container").valid()) {
                $('.popup-wrapper').hide();
                var id = $("#editIngredient").attr("data-id"),
                    ingredient = $('#newIngredient').val(),
                    imageId = $(".popup-input-wrapper .ingredient-icon").attr("data-id");
                updateIngredient(ingredient, imageId, id);
            }
        });
        $("input[id^=deleteIngredient-]").off().on("click", function() {
            $('.popup-wrapper').hide();
            $(".confirm-popup-wrapper .header").text("Delete");
            $(".confirm-popup-wrapper .content span").text("Are you sure you want to delete?");
            var id = $(this).closest('tr').attr('data-id');
            $("#yes-button").attr('data-id', id)
            $(".confirm-popup-wrapper").show();
        });
        $("#yes-button").off().on("click", function() {
            var id = $(this).attr('data-id');
            $(".confirm-popup-wrapper").hide();
            deleteIngredient(id);
        });
    }

    function showIngredientPopup() {
        $("#close").removeClass("clear");
        $(".popup-input-wrapper").show();
        $(".callback-status").hide();
    }

    function addIngredient(ingredientName, ingredientIcon) {
        var url = baseURL + 'cms/add_ingredient/';
        header = {
                "session-key": localStorage['session_key']
            },
            params = {
                "ingredient": ingredientName,
                "image_id": ingredientIcon
            };
        data = JSON.stringify(params);
        var api = new AjaxHttpSender();
        api.sendPost(url, header, data, Ingredients.addIngredientCallback);
    }
    var addIngredientCallback = {
        success: function(data, textStatus) {
            var responseData = JSON.parse(data);
            if (responseData.status == -1) {
                showCallBackStatusPre();
                showPopup(responseData);
            } else {
                loadIngredientsList("", $(".pagination").pagination('getCurrentPage'));
            }
        },
        failure: function(XMLHttpRequest, textStatus, errorThrown) {}
    }

    function uploadImage(imageElementSelect, imageElement) {
        $(imageElementSelect).fileupload({
            add: function(e, data) {
                var acceptFileTypes = /^image\/(gif|jpe?g|png)$/i,
                    error = [];
                if (data.originalFiles[0]['type'] && !acceptFileTypes.test(data.originalFiles[0]['type'])) {
                    error.message = 'Not an accepted file type';
                    showCallBackStatusPre();
                    showPopup(error);
                    return;
                }
                if (data.originalFiles[0]['size'] && data.originalFiles[0]['size'] > 2000000) {
                    error.message = 'Filesize is too big';
                    showCallBackStatusPre();
                    showPopup(error);
                    return;
                } else {
                    data.submit();
                }
            },
            dataType: 'json',
            headers: {
                "session-key": localStorage["session_key"]
            },
            formData: {
                example: 'test'
            },
            start: function(e) {
                $(".upload-gif").show();
            },
            done: function(e, data) {
                $(".upload-gif").hide();
                if (data.result.status == 1) {
                    $(imageElement).attr('src', data.result.thumbnail_url);
                    $(imageElement).attr('data-id', data.result.id);
                    $(imageElement).show();
                } else {
                    showCallBackStatusPre();
                    showPopup(data.result);
                }
            }
        });
    }

    function showCallBackStatusPre() {
        $(".popup-input-wrapper").hide();
        $("#addIngredient, #editIngredient").hide();
        $(".callback-status").show();
        $(".header").text("MESSAGE");
        $("#close").addClass("clear");
    }

    function setUploadUrl(element) {
        $("." + element).attr("data-url", baseURL + "cms/upload_image/");
    }

    function loadIngredientsList(ingredientName, pageNumber) {
        var url = baseURL + 'cms/list_ingredients/';
        // var url = baseURL + 'cms/list_attributes/';
        var header = {
            "session-key": localStorage['session_key']
        };
        var params = {
            "search": ingredientName
        };
        if (pageNumber !== undefined) {
            params = {
                "search": ingredientName,
                "nextPage": pageNumber
            }
        }
        var data = JSON.stringify(params);
        var getIngredientsList = new AjaxHttpSender();
        getIngredientsList.sendPost(url, header, data, Ingredients.getIngredientsListCallback);
    }
    var getIngredientsListCallback = {
        success: function(data, textStatus) {
            var ingredientsList = JSON.parse(data);
            if (ingredientsList.status == 1) {
                populateIngredients(ingredientsList);
            } else {
                showCallBackStatusPre();
                showPopup(ingredientsList);
            }
        },
        failure: function(XMLHttpRequest, textStatus, errorThrown) {}
    }

    function populateIngredients(ingredientsList) {
        $('#ingredientsArea tbody tr').remove();
        $.each(ingredientsList.aaData, function(key, value) {
            $('#ingredientsArea tbody').append("<tr class='row' data-id='" + value.id + "'>" + "<td class='ingredient-name mealtype-name-value'>" + value.name + "</td>" + "<td>" + "<input type='button' data-url='" + value.image_url + "' class='btn btn-small-primary medium-green'" + " id='editIngredientName-" + value.image_id + "' data-imageid='" + value.image_id + "' value='EDIT'>" + "</td>" + "<td>" + "<input type='button' class='btn btn-small-primary medium-green'" + " id='deleteIngredient-" + value.image_id + "' value='DELETE'>" + "</td>" + "<td><img class='mealtype-icon ingredient-icon' src='" + value.image_url + "'/>" + "<input class='ingredient-image-upload-element' value='' type='file' name='image_upload'/></td>" + "</tr>");
        });
        $(".pagination").pagination({
            pages: ingredientsList.num_pages,
            currentPage: ingredientsList.current_page,
            cssStyle: 'light-theme',
            onPageClick: function(pageNumber, event) {
                loadIngredientsList("", pageNumber);
            },
            onInit: function() {
                if (getStringAfterHash(location.href, "#")) {
                    var pageString = getStringAfterHash(location.href, "#");
                    pageNumber = getStringAfterHash(pageString, "-");
                    if ($(".pagination").pagination('getCurrentPage') == pageNumber) {} else
                    if (pageNumber > 0) {
                        $(".pagination").pagination('selectPage', pageNumber);
                    }
                } else {}
            }
        });
        bindEvents();
        setUploadUrl('ingredient-image-upload-element');
    }

    function updateIngredient(ingredient, imageId, id) {
        var url = baseURL + 'cms/update_ingredient/' + id + '/';
        header = {
                "session-key": localStorage['session_key']
            },
            params = {
                "ingredient": ingredient,
                "image_id": imageId
            };
        data = JSON.stringify(params);
        var api = new AjaxHttpSender();
        api.sendPost(url, header, data, Ingredients.updateIngredientCallback);
    }
    var updateIngredientCallback = {
        success: function(data, textStatus) {
            var responseData = JSON.parse(data);
            if (responseData.status == -1) {
                showCallBackStatusPre();
                showPopup(responseData);
            } else {
                loadIngredientsList("", $(".pagination").pagination('getCurrentPage'));
            }
        },
        failure: function(XMLHttpRequest, textStatus, errorThrown) {}
    }

    function deleteIngredient(id) {
        var url = baseURL + 'cms/delete_ingredient/' + id + '/';
        header = {
                "session-key": localStorage['session_key']
            },
            params = {},
            data = JSON.stringify(params);
        var api = new AjaxHttpSender();
        api.sendPost(url, header, data, Ingredients.deleteIngredientCallback);
    }
    var deleteIngredientCallback = {
        success: function(data, textStatus) {
            var responseData = JSON.parse(data);
            if (responseData.status == -1) {
                showCallBackStatusPre();
                showPopup(responseData);
            } else {
                loadIngredientsList("", 1);
            }
        },
        failure: function(XMLHttpRequest, textStatus, errorThrown) {}
    }
    return {
        initView: initView,
        addIngredientCallback: addIngredientCallback,
        getIngredientsListCallback: getIngredientsListCallback,
        updateIngredientCallback: updateIngredientCallback,
        deleteIngredientCallback: deleteIngredientCallback
    };
})();