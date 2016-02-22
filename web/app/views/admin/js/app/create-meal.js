//global variable 
var nutrient_sub_category = 0,
        nutrient_main_category = 0,
        tipsAndTricksData = [],
        createMealParams = {},
        mealId,
        ingredientsList = {};
$(document).ready(function () {
    $('#create-meal-button').on("click", function (e) {
        e.preventDefault();
        var ingredientElements = $("#ingredientsContent .list-container li[id^=list-]");
        if ($('form#create-meal').valid() && ingredientElements !== undefined && ingredientElements.length > 0) {
            createMeal();
        }
        if (ingredientElements !== undefined && ingredientElements.length === 0) {
            $("#selectIngredients").addClass("error");
            $("#selectIngredientsError").show();
        } else {
            $("#selectIngredients").removeClass("error");
            $("#selectIngredientsError").hide();
        }
    });
    $("#selectIngredients").on("change", function () {
        $("#selectIngredientsError").attr("style", "display:none !important;");
    });
    $('.add-list-button,.add-preparation-button').on("click", function () {
        var element_id = $(this).prev().find('.create-meal-input').attr('id');
        var container = $(this).parent().attr('class');
        populateListData(element_id, container);
    });
    $(".add-ingredients-list-button").off().on("click", function () {
        addIngredient();
    });
    //ADD MAIN NUTRIENTS DETAILS
    $('.add-nutrition-content').on("click", function () {
        var nutrients = $('#nutrients').val(),
                per_serving = $('#nutrients-per-serving').val(),
                daily_value = $('#nutrients-daily-value').val(),
                numberOnly = /^\d+$/;
        if (nutrients != undefined && nutrients != "") {
            populateNutrients(nutrients, per_serving, daily_value);
            $("#nutrients").val("");
            $("#nutrients-per-serving").val("");
            $("#nutrients-daily-value").val("");
        }
    });
    //Add nutrient sub category
    $(document).on('click', '.add-nutrient-sublist', function () {
        $('.nutrients-popup-wrapper').show();
        addSubNutrients(this);
    });
    $('#cancel-nurient-popup').on("click", function () {
        $('.nutrients-popup-wrapper').hide();
    });
    //remove nutrient and tips sub part 
    $(document).on('click', '.remove', function () {
        $(this).parents().eq(0).remove();
    });
    //Add tips n tricks main
    $('#add-tips-main').on("click", function (e) {
        e.preventDefault();
        var video_URL = $('#tips-video-url').val().trim(),
                tips_heading = $('#tips-and-tricks').val(),
                valid_url, valid_title;
        valid_url = ytVidId(video_URL) || imgValidation(video_URL);
        valid_title = emptyvalidation(tips_heading);
        if (valid_url && valid_title) {
            addMainTipsTricks(video_URL, tips_heading);
            $("#tips-video-url,#tips-and-tricks").removeClass('error');
            $("#tips-video-url-label-error,#tips-and-tricks-label-error").hide();
        } else {
            $("#tips-video-url,#tips-and-tricks").addClass('error');
            $("#tips-video-url-label-error,#tips-and-tricks-label-error").show();
            if (valid_url) {
                $("#tips-video-url").removeClass('error');
                $("#tips-video-url-label-error").hide();
            }
            if (valid_title) {
                $("#tips-and-tricks").removeClass('error');
                $("#tips-and-tricks-label-error").hide();
            }
        }
    });
    //Add sublist field to tips & ticks
    $(document).on('click', '.add-tips-sublist', function () {
        $(".tips-tricks-wrapper").show();
        var parentElement = $(this).parent();
        addSubTipsTricks(parentElement);
    });
    //Del sub category (tips and tricks)
    $(document).on('click', '.del-tips-sub-list', function () {
        $(this).parents().eq(1).remove();
    });
    //Close add tips and tricks popup.
    $(document).on('click', '#cancel-tips-popup', function () {
        $(".tips-tricks-wrapper").hide();
    })
    //Image Uploads
    $("#meal-image-input").on('click', function () {
        uploadImage("meal-image-input", "meal-image");
    });
    $("#chef-image-input").on('click', function () {
        uploadImage("chef-image-input", "chef-image");
    });
    $("#kitchen-image-input").on('click', function () {
        uploadImage("kitchen-image-input", "kitchen-image");
    });
    $("#ingredients-image-input").on('click', function () {
        uploadImage("ingredients-image-input", "ingredients-image");
    });
    $('.forminput-wrapper').on("keydown", function (e) {
        if (e.keyCode == 13) {
            var button_class = $(this).parent().find('input[type=button][value=add]'),
                    input_id = $(this).find('input').attr('id');
            if (button_class.length) {
                e.preventDefault();
                $(button_class).trigger('click');
                if (input_id == "meal-saved-time" || input_id == "meal-prep-time") {
                } else {
                    $('#' + input_id).val('');
                }
            }
        }
    })
    $("#nutritionSection tbody input").on('input', function (e) {
        var value = $(this).val();
        if (!(/^[0-9]{0,15}(\.[0-9]{0,2})?$/g.test($(this).val()))) {
            $(this).val(value.slice(0, value.length - 1));
        }
    }).on('keydown', function (evt) {
        var charCode = (evt.which) ? evt.which : evt.keyCode;
        if ((charCode != 190 || $(this).val().indexOf('.') != -1)
                && (charCode != 110 || $(this).val().indexOf('.') != -1)
                && ((charCode < 48 && charCode > 9)
                        || (charCode > 57 && charCode < 96)
                        || charCode > 105)) {
            return false;
        } else if (/^[0-9]{0,15}(\.[0-9]{0,2})?$/g.test($(this).val())) {
            return true;
        }
    });
    addDynamicApiUrlUploadPicture("meal-image-input");
    addDynamicApiUrlUploadPicture("chef-image-input");
    addDynamicApiUrlUploadPicture("kitchen-image-input");
    addDynamicApiUrlUploadPicture("ingredients-image-input");
    getFilterContent();
    getAllIngredients();
});

function bindEnterSubmittion() {
    $(".tips-enter-submit").on("keydown", function search(e) {
        if (e.keyCode == 13) {
            $("#add-tips-main").trigger("click");
        }
    });
}

function addDynamicApiUrlUploadPicture(element) {
    $("#" + element).attr("data-url", baseURL + "cms/upload_image/");
}

function addMainTipsTricks(video_URL, tips_heading, isEditingdescription, tipsId) {
    $('#tips-and-tricks-table').append('<tr data-id="' + tipsId + '">' + '<td><span class="video-url">' + video_URL + '</span></td><td><span class="video-heading">' + tips_heading + '</span><img class="add-tips-sublist" src="../../images/add-button-md.png">' + '<img class="del-tips-sub-list" src = "../../images/del.png"><ul class="sub-tips-tricks"></ul></td></tr>')
    if (isEditingdescription) {
        $.each(isEditingdescription, function (key, value) {
            parentElement = $(".sub-tips-tricks:last").parent();
            addSubTipsTricks(parentElement, value);
        });
    } else {
    }
}
//Add  sublist pointers tips and tricks
function addSubTipsTricks(parentElement, isEditingdescription) {
    if (isEditingdescription) {
        parentElement.find('ul').append('<li>' + isEditingdescription + '<img class="remove" src="../../images/del.png">' + '</li>');
    } else {
        $('#save-tips').unbind();
        $('#save-tips').on('click', function () {
            var newTipTrick = $("#tips_tricks_content").val();
            if (newTipTrick.length) {
                parentElement.find('ul').append('<li>' + $('#tips_tricks_content').val() + '<img class="remove" src="../../images/del.png">' + '</li>');
                $(".tips-tricks-wrapper").hide();
            } else {
            }
        });
    }
}

function checkIfMealEdit() {
    mealId = getParameterFromUrl("mealId");
    if (mealId.length) {
        getMeals(mealId);
        createMealParams['edit_id'] = mealId;
        return true;
    } else {
        return false;
    }
}

function extractNutrients() {
    var totalNutrientData = [];
    $(".nutrient-main-container").map(function () {
        var mainNutrient = $(this);
        var nutrientMain = $(mainNutrient).find(".nutrient-main"),
                nutrientSub = $(mainNutrient).find(".nutrient-sub"),
                totalSubNutrientData = [];
        nutrientMainDetails = extractNutrientInnerDetails(nutrientMain);
        $(mainNutrient).find(".nutrient-sub").each(function () {
            var subNutrient = $(this),
                    nutrientSubDetails = extractNutrientInnerDetails(nutrientSub, subNutrient);
            totalSubNutrientData.push(nutrientSubDetails);
        });
        oneNutrientTotal = {
            "mainNutrient": nutrientMainDetails.nutrientsName,
            "perServing": nutrientMainDetails.servingValue,
            "dailyValue": nutrientMainDetails.dailyValue,
            "subNutrients": totalSubNutrientData
        }
        totalNutrientData.push(oneNutrientTotal);
    });
    return totalNutrientData;
}

function extractNutrientInnerDetails(parentElement, childElement) {
    var elementNeeded;
    if (childElement) {
        elementNeeded = childElement;
    } else {
        elementNeeded = parentElement;
    }
    var nutrientsValue = $(elementNeeded).find(".nutrients-value").text(),
            servingValue = $(elementNeeded).find(".serving-value").text(),
            dailyValue = $(elementNeeded).find(".daily-value").text();
    return {
        "nutrientsName": nutrientsValue,
        "servingValue": servingValue,
        "dailyValue": dailyValue
    }
}

function traverseTipsTricks() {
    tipsAndTricksData = [];
    $("#tips-and-tricks-table tbody tr").map(function () {
        var $row = $(this);
        $row.each(function () {
            var tipsAndTricksSingleRow = extractTipsAndTricks(this);
            tipsAndTricksData.push(tipsAndTricksSingleRow);
        });
    });
    return tipsAndTricksData;
}

function extractTipsAndTricks(self) {
    var videoPointers = [],
            tipsID = $(self).attr("data-id"),
            videoUrl = $(self).find(".video-url").text(),
            videoHeading = $(self).find(".video-heading").text();
    $(self).find("ul li").each(function () {
        videoPointers.push($(this).text());
    });
    var tipsObject = {
        "video_url": videoUrl,
        "title": videoHeading,
        "description": videoPointers
    };
    if (tipsID != "undefined") {
        tipsObject['id'] = tipsID;
    } else {
    }
    return tipsObject;
}

function uploadImage(imageElementSelect, imageElement) {
    $('#' + imageElementSelect).fileupload({
        add: function (e, data) {
            var acceptFileTypes = /^image\/(gif|jpe?g|png)$/i,
                    error = [];
            if (data.originalFiles[0]['type'] && !acceptFileTypes.test(data.originalFiles[0]['type'])) {
                error.message = 'Please enter gif/jpg/png';
                // showCallBackStatusPre();
                showPopup(error);
                return;
            }
            if (data.originalFiles[0]['size'] && data.originalFiles[0]['size'] > 2000000) {
                error.message = 'Filesize is too big';
                // showCallBackStatusPre();
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
        done: function (e, data) {
            $("#" + imageElement).attr('src', data.result.thumbnail_url);
            $("#" + imageElement).attr('data-id', data.result.id);
            $("#" + imageElement).show();
        }
    });
}
//CREATE MEAL API
var createMealCallback = {
    success: function (data, textStatus) {
        var meal_message = JSON.parse(data);
        showPopup(meal_message);
        if (meal_message.status == 1) {
            if (!checkIfMealEdit()) {
                $("#create-meal")[0].reset();
            } else {
            }
        } else {
        }
    },
    failure: function (XMLHttpRequest, textStatus, errorThrown) {
    }
}

function createMeal() {
    var name = $('#meal-name').val(),
            price = $('#meal-price').val(),
            tax = $('#meal-tax').val(),
            calories = $('#meal-calories').val(),
            prep_time = $('#meal-prep-time').val(),
            saved_time = $('#meal-saved-time').val(),
            descptn = $('#description').val(),
            availability = $('#create-meal-available').val(),
            category = $('#create-meal-category option:selected').attr('value'),
            meal_image_id = $('#meal-image').attr("data-id"),
            pre_requisites_image = $('#kitchen-image').attr("data-id"),
            chef_image = $('#chef-image').attr("data-id"),
            ingredients_image = $('#ingredients-image').attr("data-id"),
            chef_comments = $("#chef-comments").val(),
            chef_name = $("#chef-name").val(),
            sold_out = $('#soldOut option:selected').attr('value');
    meal_sub = $("#meal-sub-name").val();
    var ingredients = [], // ingredient array
            temp = '',
            pre_requesties = [],
            meal_type = [],
            toDo = [],
            prepared = [],
            tips = nutrients = [];
    tips.length = 0;
    nutrients.length = 0;
    tips = traverseTipsTricks();
//    nutrients = extractNutrients()
    nutrients = getNutrients();
    $('.ingredients-container .list-container ul').find('li').each(function () {
        temp = $(this).text();
        var ingredientId = $(this).attr("id").split("list-")[1];
        if (ingredientId !== undefined) {
            ingredients.push(ingredientId);
        }
    });
    $('.pre-requisties-container .list-container ul').find('li').each(function () {
        temp = $(this).text();
        pre_requesties.push(temp);
    });
    $('.preperation-container-1 .list-container ul').find('li').each(function () {
        temp = $(this).text();
        toDo.push(temp);
    });
    $('.preperation-container-2 .list-container ul').find('li').each(function () {
        temp = $(this).text();
        prepared.push(temp);
    });
    $('#create-meal-mealType option:selected').each(function () {
        meal_type.push($(this).attr('value'));
    });
    var url = baseURL + "cms/create_meal/";
    header = {
        "session-key": localStorage['session_key']
    }
    createMealFields = {
        "name": name,
        "description": descptn,
        "price": price,
        "tax": tax,
        "calories": calories,
        "chef_image": chef_image,
        "chef_name": chef_name,
        "chef_comments": chef_comments,
        "main_image": meal_image_id,
        "cat_id": category,
        "filter_ids": meal_type,
        "available": availability,
        "ingredients": ingredients,
        "pre_requisites": pre_requesties,
        "pre_requisites_image": pre_requisites_image,
        "user_to_do": toDo,
        "ingredients_image": "",
        "preparation_time": prep_time,
        "finished_preparation": prepared,
        "saved_time": saved_time,
        "tips": tips,
        "sub": meal_sub,
        "nutrients": nutrients,
        "sold_out": sold_out
    }
    $.each(createMealFields, function (key, value) {
        createMealEmptyCheck(key, value);
    });
    data = JSON.stringify(createMealParams);
    var createMealInstance = new AjaxHttpSender();
    createMealInstance.sendPost(url, header, data, createMealCallback);
}

function createMealEmptyCheck(key, value) {
    if (value.length != 0) {
        createMealParams[key] = value;
    } else {
        delete createMealParams[key];
    }
}
// populate to do- list data 
function populateListData(element_id, container, dataFromApi) {
    if (dataFromApi) {
        $('.' + container).find('.list-container ul').empty();
        $.each(dataFromApi, function (key, value) {
            $('.' + container).find('.list-container ul').append('<li>' + value + '<img class="remove" src="../../images/del.png">' + '</li>');
        });
    } else {
        var addTo_list = $('#' + element_id).val(),
                meal_prep_time = $('#meal-prep-time').val(),
                saved_time = $('#meal-saved-time').val();
        if (addTo_list != undefined && addTo_list != "") {
            $('.' + container).find('.list-container ul').append('<li>' + addTo_list + '<img class="remove" src="../../images/del.png">' + '</li>');
        }
    }
}
//populate category , meal_type select button
var getFilterContentCallback = {
    success: function (data, textStatus) {
        var filterContent = JSON.parse(data),
                meal_type = filterContent.meal_types,
                categories = filterContent.categories;
        populateCreateMealFilter(meal_type, categories);
    },
    failure: function (XMLHttpRequest, textStatus, errorThrown) {
    }
}

function getFilterContent() {
    var url = baseURL + "cms/get_categories_filters/";
    header = {
        "session-key": localStorage['session_key']
    }
    params = {
        "get": "1"
    }
    data = JSON.stringify(params);
    var getFilterContentInstance = new AjaxHttpSender();
    getFilterContentInstance.sendPost(url, header, data, getFilterContentCallback);
}

function populateCreateMealFilter(meal_type, categories) {
    $.each(meal_type, function (key, value) {
        $('#create-meal-mealType ').append("<option value='" + value.id + "'>" + value.name + "</option>");
    });
    $.each(categories, function (key, value) {
        $('#create-meal-category').append("<option value='" + value.id + "'>" + value.name + "</option>");
    });
    //Check if its a meal editing ,only afer the filters and categories are populated.
    checkIfMealEdit("mealFilter");
}
//populate to Div 
function populateNutrients(nutrients, per_serving, daily_value, isEditingMealDetails) {
    $(".nutrients-total").append("<div class='nutrient-main-container'>" + "<div class='nutrient-main'>" + "<div><span>Nutrients</span><span class='nutrients-value'>" + nutrients + "</span></div>" + "<div><span>Per Serving</span><span class='serving-value'>" + per_serving + "</span></div>" + "<div><span>Daily Value</span><span class='daily-value'>" + daily_value + "</span></div>" + "<img class='add-nutrient-sublist' src='../../images/add-button-md.png'>" + "</div><img class='remove remove-main-nutrients remove-nutrients' src='../../images/cross-black.png'></div>");
    if (isEditingMealDetails) {
        parentElement = $(".nutrient-main-container:last");
        $.each(isEditingMealDetails.subNutrients, function (key, value) {
            populateSubNutrients(value.nutrientsName, value.servingValue, value.dailyValue, parentElement);
        });
    } else {
    }
}

function populateSubNutrients(subNutrientName, subPerServing, subDailyValue, parentElement) {
    $(parentElement).append("<div class='nutrient-sub'>" + "<div><span>Nutrients</span><span class='nutrients-value'>" + subNutrientName + "</span></div>" + "<div><span>Per Serving</span><span class='serving-value'>" + subPerServing + "</span></div>" + "<div><span>Daily Value</span><span class='daily-value'>" + subDailyValue + "</span></div>" + "<img class='remove remove-sub-nutrients remove-nutrients' src='../../images/cross-black.png'></div></div>");
    $('.nutrients-popup-wrapper').hide();
}

function addSubNutrients(self) {
    parentElement = $(self).parents().eq(1);
    $('#save-nutrients').unbind("click");
    $("#save-nutrients").on("click", function () {
        var subNutrientName = $("#sub-nutrients").val(),
                subPerServing = $("#sub-per-serving").val(),
                subDailyValue = $("#sub-daily-value").val();
        populateSubNutrients(subNutrientName, subPerServing, subDailyValue, parentElement);
    })
}
//Get Meal
var getMealsContentCallback = {
    success: function (data, textStatus) {
        mealDetails = JSON.parse(data);
        populateMealDetails(mealDetails);
    },
    failure: function (XMLHttpRequest, textStatus, errorThrown) {
    }
}

function getMeals(mealId) {
    var url = baseURL + "cms/get_meal_details/" + mealId + "/";
    header = {
        "session-key": localStorage['session_key']
    }
    params = {}
    data = JSON.stringify(params);
    var getFilterContentInstance = new AjaxHttpSender();
    getFilterContentInstance.sendPost(url, header, data, getMealsContentCallback);
}

function populateMealDetails(mealDetails) {
    $("#meal-name").val(mealDetails.name);
    $("#description").val(mealDetails.description);
    $("#chef-image").attr("src", mealDetails.chef_image.url);
    $("#chef-image").attr("data-id", mealDetails.chef_image.id);
    $("#meal-image").attr("src", mealDetails.main_image.url);
    $("#meal-image").attr("data-id", mealDetails.main_image.id);
    $("#meal-sub-name").val(mealDetails.sub);
    $("#meal-price").val(parseFloat(mealDetails.price).toFixed(2));
    $("#meal-tax").val(parseFloat(mealDetails.tax_percentage));
    $("#meal-calories").val(mealDetails.calories);
    $("#chef-name").val(mealDetails.chef_name);
    $("#chef-comments").val(mealDetails.chef_comments);
    $("#create-meal-available").val(mealDetails.available);
    $("#create-meal-category").val(mealDetails.cat_id.id);
    $.each(mealDetails.filters, function (key, value) {
        $($("#create-meal-mealType option")[0]).attr("selected", false);
        $("#create-meal-mealType option[value='" + value.id + "']").prop("selected", true);
    });
    $('#soldOut option').removeAttr("selected");
    $("#soldOut option[value='" + mealDetails.sold_out + "']").prop("selected", true);
    $('#meal-prep-time').val(mealDetails.preparation_time);
    $('#meal-saved-time').val(mealDetails.saved_time);
    populateListData('', "preperation-container-1", mealDetails.user_to_do);
    populateListData('', "preperation-container-2", mealDetails.finished_preparation);
    populateListData('', "pre-requisties-container", mealDetails.pre_requisites);
    $("#kitchen-image").attr("src", mealDetails.pre_requisites_image.url);
    // populateListData('', "ingredients-container", mealDetails.ingredients);
    // $("#ingredients-image").attr("src", mealDetails.ingredients_image.url);
    $(".nutrients-total").empty();
    setNutrients(mealDetails.nutrients);
//    $.each(mealDetails.nutrients, function (key, value) {
//        if (!(mealDetails.nutrients == '')) {
//            populateNutrients(value.mainNutrient, value.perServing, value.dailyValue, value);
//        } else {
//        }
//    });
    $('#tips-and-tricks-table').find("tbody").empty();
    $.each(mealDetails.tips, function (key, value) {
        addMainTipsTricks(value.video_url, value.title, value.description, value.id);
    });
    addIngredient(mealDetails.ingredients);
}

function ytVidId(url) {
    var p = /^(?:https?:\/\/)?(?:www\.)?(?:youtu\.be\/|youtube\.com\/(?:embed\/|v\/|watch\?v=|watch\?.+&v=))((\w|-){11})(?:\S+)?$/;
    return (url.match(p)) ? true : false;
}

function emptyvalidation(value) {
    var p = /^[\s\t\r\n]*\S+/ig;
    return (value.match(p)) ? true : false;
}

function imgValidation(img_url) {
    var result = (/\.(jpeg|jpg|gif|png)$/).test(img_url);
    return result;
}

function getAllIngredients() {
    var url = baseURL + "cms/list_ingredients/";
    header = {
        "session-key": localStorage['session_key']
    }
    var params = {
        "search": ""
    }
    data = JSON.stringify(params);
    var api = new AjaxHttpSender();
    api.sendPost(url, header, data, ingredientsListCallback);
}
var ingredientsListCallback = {
    success: function (data, textStatus) {
        var response = JSON.parse(data);
        if (response.status == 1) {
            ingredientsList = new Object();
            $.each(response.aaData, function (key, value) {
                ingredientsList[value.id] = value;
            });
            populateIngredientsDropdown(ingredientsList)
        }
    },
    failure: function (XMLHttpRequest, textStatus, errorThrown) {
    }
}

function populateIngredientsDropdown(data) {
    $("#selectIngredients").html("<option value='0' selected>Select</option>");
    $.each(data, function (key, value) {
        $("#selectIngredients").append('<option value="' + value.id + '">' + value.name + '</option>');
    });
}

function addIngredient(savedIngredients) {
    var addTo_list = $("#selectIngredients :selected").text(),
            id = $("#selectIngredients :selected").val(),
            meal_prep_time = $('#meal-prep-time').val(),
            saved_time = $('#meal-saved-time').val();
    if (savedIngredients !== undefined) {
        $.each(savedIngredients, function (key, value) {
            if ($("#list-" + value.id).length == 0) {
                $('.ingredients-container .list-container ul').append('<li id="list-' + value.id + '">' + value.name + '<img class="remove" src="../../images/del.png">' + '</li>');
                $('.ingredients-container').closest('.content-1').find('.img-container ul').append('<li id="for-list-' + value.id + '"><div><img src="' + value.image_url + '"><span>' + value.name + '</span></div></li>');
            }
        });
    } else if ($("#selectIngredients :selected").text().toLowerCase() !== "select") {
        var listId = $('.ingredients-container .list-container ul li').length + 1;
        var data = ingredientsList[id];
        if (addTo_list != undefined && addTo_list != "" && $("#list-" + id).length == 0) {
            $('.ingredients-container .list-container ul').append('<li id="list-' + id + '">' + addTo_list + '<img class="remove" src="../../images/del.png">' + '</li>');
            $('.ingredients-container').closest('.content-1').find('.img-container ul').append('<li id="for-list-' + id + '"><div><img src="' + data.image_url + '"><span>' + data.name + '</span></div></li>');
        }
    }
    $("li[id^=list-] .remove").off().on("click", function (e) {
        removeIngredient(e);
    });
}

function removeIngredient(e) {
    var id = $(e.target).parent().attr("id");
    $("#" + id).remove();
    $("#for-" + id).remove();
}
function getNutrients() {
    var dataTableRows = $("#nutritionSection table tbody tr");
    var nutrients = new Array();
    var nutrient = new Object();
    var subNutrients = new Array();
    $.each(dataTableRows, function (key, value) {
        if ($(value).hasClass("main-nutrient-tr")) {
            if (!$.isEmptyObject(nutrient)) {
                nutrient.subNutrients = subNutrients;
                nutrients.push(nutrient);
            }
            nutrient = subNutrient = {};
            subNutrients = [];
            nutrient.mainNutrient = $(value).find('th').attr("data-attr");
            nutrient.perServing = getData($(value), '.per-serving-input');
            nutrient.dailyValue = getData($(value), '.daily-value-input');
        } else if ($(value).hasClass("sub-nutrient-tr")) {
            var subNutrient = {};
            subNutrient.nutrientsName = $(value).find('td').first().attr("data-attr");
            subNutrient.servingValue = getData($(value), '.per-serving-input');
            subNutrient.dailyValue = getData($(value), '.daily-value-input');
            subNutrients.push(subNutrient);
        }
    });
    if (!$.isEmptyObject(nutrient)) {
        nutrient.subNutrients = subNutrients;
        nutrients.push(nutrient);
    }
    return nutrients;
    function getData($selector, classSelector) {
        console.log($selector.find(classSelector + " input").val());
        return ($selector.find(classSelector + " input").val() !== undefined && $selector.find(classSelector + " input").val().length > 0)
                ? $selector.find(classSelector + ' input').val() + " " + $selector.find(classSelector + ' span').text().trim()
                : "";
    }
}
function setNutrients(nutrients) {
    $.each($(".main-nutrient-tr"), function (key, value) {
        $.each(nutrients, function (nutrientKey, nutrient) {
            if (nutrient.mainNutrient == $(value).find('th').attr("data-attr")) {
                $(value).find('.daily-value-input input').val(getData(nutrient.dailyValue));
                $(value).find('.per-serving-input input').val(getData(nutrient.perServing));
                if (nutrient.subNutrients.length > 0) {
                    $.each(nutrient.subNutrients, function (subNutrientKey, subNutrient) {
                        $.each($(".sub-nutrient-tr"), function (subKey, subElement) {
                            if (subNutrient.nutrientsName == $(subElement).find('td').first().attr("data-attr")) {
                                $(subElement).find('.daily-value-input input').val(getData(subNutrient.dailyValue));
                                $(subElement).find('.per-serving-input input').val(getData(subNutrient.servingValue));
                                return false;
                            }
                        });
                    });
                }
                return false;
            }
        });
    });
    function getData(string) {
        return string.indexOf(" ") > 0 ? string.substring(0, string.lastIndexOf(" ")) : ($.isNumeric(string) ? string : "");
    }
}