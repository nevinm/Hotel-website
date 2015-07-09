var current_tr;
$(document).ready(function() {
    $("#add-new-mealtype").on("click", function() {
        $("#new-mealtype").val("");
        $("#add-mealtype").show();
        $("#edit-mealtype").hide();
        $(".header").text("ADD NEW MEAL TYPE");
        $('.popup-wrapper').show();
        if ($("#new-mealtype").hasClass("error")) {
            $('form.popup-container').valid();
        }
        $("form").data('validator').resetForm();
    });

    $("#add-mealtype").on("click", function(e) {
        e.preventDefault();
        if ($(".popup-container").valid()) {
            $('.popup-wrapper').hide();
            var mealtype = $('#new-mealtype').val(),
                imageId = $(".mealtype-image").data("id");
            manageMealtype("", mealtype, imageId);
        }
    });

    $(document).on('click', '#delete-mealtype', function() {
        $('.popup-wrapper').hide();
        var id = $(this).closest('tr').attr('data-id');
        $("#yes-button").attr('data-id', id)
        $(".confirm-popup-wrapper").show();
    });

    $("#yes-button").on("click", function() {
        var mealtypeId = $(this).attr('data-id');
        $(".confirm-popup-wrapper").hide();
        deleteMealtype(mealtypeId);
    });

    $("#no-button").on("click", function() {
        $(".confirm-popup-wrapper").hide();
    });

    $(document).on('click', '#edit-mealtype-name', function() {
        var mealtype = $(this).closest('tr').find('.mealtype-name-value').text(),
            imageUrl = $(this).data("url");
        $("#add-mealtype").hide();
        $("#edit-mealtype").show();
        $(".header").text("CHANGE DELIVERY AREA");
        $("#new-mealtype").val(mealtype);
        $('.popup-wrapper').show();
        if ($("#new-mealtype").hasClass("error")) {
            $('form.popup-container').valid();
        }
        $(".mealtype-image").attr("src", imageUrl)
        current_tr = $(this).closest('tr');
    });

    $("#edit-mealtype").on("click", function(e) {
        e.preventDefault();
        if ($(".popup-container").valid()) {
            $('.popup-wrapper').hide();
            var id = current_tr.attr('data-id'),
                mealtype = $('#new-mealtype').val(),
                imageId = $(".mealtype-image").data("id");
            manageMealtype(id, mealtype, imageId);
        }
    });

    $(".mealtype-change-icon").on("click", function() {
        $(this).next(".mealtype-image-upload-element").trigger("click");
    });

    getMealtypes(1);
});

function addDynamicApiUrlUploadPicture(element) {
    $("." + element).attr("data-url", baseURL + "cms/upload_image/");
}

function uploadImage(imageElementSelect, imageElement) {
    $(imageElementSelect).fileupload({
        dataType: 'json',
        headers: {
            "session-key": localStorage["session_key"]
        },
        formData: {
            example: 'test'
        },
        done: function(e, data) {
            $(imageElement).attr('src', data.result.thumbnail_url);
            $(imageElement).attr('data-id', data.result.id);
            $(imageElement).show();
        }
    });
}

// get delivery areas
var getMealtypesCallback = {
    success: function(data, textStatus) {
        var mealTypeList = JSON.parse(data);
        if (mealTypeList.status) {
            populateMealtypes(mealTypeList);
        } else {
            showPopup(mealTypeList);
        }
    },
    failure: function(XMLHttpRequest, textStatus, errorThrown) {}
}

function getMealtypes(nextPage, attributeId) {
    var url = baseURL + 'cms/list_attributes/';
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

function populateMealtypes(mealTypeList) {
    $('#mealtype-area tbody tr').remove();
    $.each(mealTypeList.aaData, function(key, value) {
        $('#mealtype-area tbody').append("<tr class='row' data-id='" + value.id + "'>" +
            "<td class='mealtype-name-value'>" + value.name + "</td>" +
            "<td>" + "<input type='button' data-url='" + value.image + "' class='btn btn-small-primary medium-green'" +
            " id='edit-mealtype-name' value='EDIT'>" + "</td>" +
            "<td>" + "<input type='button' class='btn btn-small-primary medium-green'" +
            " id='delete-mealtype' value='DELETE'>" + "</td>" +
            "<td><img class='mealtype-icon' src='" + value.image + "'/>" +
            "<span class='mealtype-image-upload'> EDIT</span>" +
            "<input class='mealtype-image-upload-element' value='' type='file' name='image_upload'/></td>" +
            "</tr>");
    });

    $(".mealtype-image-upload").on("click", function() {
        $(this).parent().find(".mealtype-image-upload-element").click();
    });

    $(".pagination").pagination({
        items: mealTypeList.total_count,
        itemsOnPage: mealTypeList.per_page,
        currentPage: mealTypeList.current_page,
        cssStyle: 'light-theme',
        onPageClick: function(pageNumber, event) {
            getMealtypes(pageNumber);
        }
    });

    $(".mealtype-image-upload-element").on('click', function() {
        var inputElement = $(this),
            imageElement = $(this).parent().find(".mealtype-icon");
        uploadImage(inputElement, imageElement);
    });

    addDynamicApiUrlUploadPicture("mealtype-image-upload-element");
}

//add/edit mealtypes.
var manageMealtypeCallback = {
    success: function(data, textStatus) {
        var mealManageData = JSON.parse(data);
        if (mealManageData.status == -1) {
            showPopup(mealManageData);
        } else {
            getMealtypes(1);
        }
    },
    failure: function(XMLHttpRequest, textStatus, errorThrown) {}
}

function manageMealtype(mealTypeId, mealTypeName, mealTypeIcon) {
    var url = baseURL + 'cms/create_attribute/';
    header = {
            "session-key": localStorage['session_key']
        },
        params = {
            "attribute_name": mealTypeName,
            "attribute_image": mealTypeIcon
        };
    if (mealTypeId) {
        params['attribute_id'] = mealTypeId;
    }
    data = JSON.stringify(params);
    var manageMealtype = new AjaxHttpSender();
    manageMealtype.sendPost(url, header, data, manageMealtypeCallback);
}

//delete meal types
var deleteMealtypeCallback = {
    success: function(data, textStatus) {
        var deleteMealTypeData = JSON.parse(data);
        if (deleteMealTypeData.status == -1) {
            showPopup(deleteMealTypeData);
        } else {
            getMealtypes(1);
        }
    },
    failure: function(XMLHttpRequest, textStatus, errorThrown) {}
}

function deleteMealtype(mealTypeId) {
    var url = baseURL + 'cms/delete_attribute/' + mealTypeId + '/';
    header = {
            "session-key": localStorage['session_key']
        },
        params = {},
        data = JSON.stringify(params);
    var deleteMealtype = new AjaxHttpSender();
    deleteMealtype.sendPost(url, header, data, deleteMealtypeCallback);
}

function showPopupMessage(data) {
    $('.popup-message span').text(data.message);
    $('.popup-message').show();
    setTimeout(function() {
        $('.popup-message').hide();
    }, 2000);
}

function deleteZip(delete_id) {
    $("tr[data-id='" + delete_id + "']").remove();
}
