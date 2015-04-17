//global variable 
var nutrient_sub_category = 0,
    nutrient_main_category = 0,
     tipsAndTricksData=[];
$(document).ready(function() {

    $('.add-list-button,.add-preparation-button').on("click", function() {
        var element_id = $(this).prev().attr('id');
        var container = $(this).parent().attr('class');
        populateListData(element_id, container);
    });

    //ADD MAIN NUTRIENTS DETAILS
    $('.add-nutrition-content').on("click", function() {
        var nutrients = $('#nutrients').val(),
            per_serving = $('#nutrients-per-serving').val(),
            daily_value = $('#nutrients-daily-value').val();

        populateNutrients(nutrients, per_serving, daily_value);
    });

    $('#create-meal-button').on("click", function() {
        createMeal();
    });

    //Add nutrient table sub category
    $(document).on('click', 'img.add-tr', function() {
        $('.nutrients-popup-wrapper').show();
        var parent_tr = $(this).parents().eq(1);
        var nutrients_td = parent_tr.find('td:first-child'),
            per_serving_td = parent_tr.find('td:nth-child(2)'),
            daily_value_td = parent_tr.find('td:nth-child(3)');
        addSubNutrients(nutrients_td, per_serving_td, daily_value_td);
    });

    $('#cancel-nurient-popup').on("click", function() {
        $('.nutrients-popup-wrapper').hide();
    });

    //remove nutrient and tips sub part 
    $(document).on('click', 'img.remove-tr', function() {
        $(this).parents.eq(1).remove();
    });

    //remove nutrient table sb-tr
    $(document).on('click', '.del-sub-list', function() {
        var currentCategory = $(this).parent().attr("data-category");
        $('*[data-category="' + currentCategory + '"]').remove();
    });

    //remove nutrient table li
    $(document).on('click', 'img.remove', function() {
        $(this).parent().remove();
    });

    //Add tips n tricks main
    $('#add-tips-main').on("click", function() {
        var video_URL = $('#tips-video-url').val(),
            tips_heading = $('#tips-and-tricks').val();
        $('#tips-and-tricks-table').append('<tr>' + '<td><span class="video-url">' + video_URL + '</span></td><td><span class="video-heading">' +
            tips_heading + '</span><img class="add-tips-sublist" src="../../images/add-button-md.png">' +
            '<img class="del-tips-sub-list" src = "../../images/del.png"><ul></ul></td></tr>')
    });

    //Add sublist field to tips & ticks
    $(document).on('click', '.add-tips-sublist', function() {
        $(".tips-tricks-wrapper").show();
        var parentElement = $(this).parent();
        addSubTipsTricks(parentElement);
    });

    //Add  sublist pointers tips and tricks
    function addSubTipsTricks(parentElement) {
        $('#save-tips').unbind();
        $('#save-tips').on('click', function() {
            var newTipTrick = $("#tips_tricks_content").val();
            parentElement.find('ul').append('<li>' + $('#tips_tricks_content').val() +
                '<img class="remove" src="../../images/del.png">' + '</li>');
            $(".tips-tricks-wrapper").hide();
        });
    }

    //Del sub category (tips and tricks)
    $(document).on('click', '.del-tips-sub-list', function() {
        $(this).parents().eq(1).remove();
    });

    //Close add tips and tricks popup.
    $(document).on('click', '#cancel-tips-popup', function() {
        $(".tips-tricks-wrapper").hide();
    })

    //Image Uploads
    $("#meal-image-input").on('click', function() {
        uploadImage("meal-image-input", "meal-image");
    });

    $("#chef-image-input").on('click', function() {
        uploadImage("chef-image-input", "chef-image");
    });

    $("#kitchen-image-input").on('click', function() {
        uploadImage("kitchen-image-input", "kitchen-image");
    });

    $("#ingredients-image-input").on('click', function() {
        uploadImage("ingredients-image-input", "ingredients-image");
    });

    getFilterContent();
});

function traverseTipsTricks() {
   
    $("#tips-and-tricks-table tbody tr").map(function() {
        var $row = $(this);
        $row.each(function() {
            var tipsAndTricksSingleRow = extractTipsAndTricks(this);
            tipsAndTricksData.push(tipsAndTricksSingleRow);
        });
    });
            return tipsAndTricksData;
}

function extractTipsAndTricks(self) {
            var videoPointers = [],
                videoUrl = $(self).find(".video-url").text(),
                videoHeading = $(self).find(".video-heading").text();
            $(this).find("ul li").each(function() {
                videoPointers.push($(self).text());
            });
            return  {
                "video_url":videoUrl,
                "title":videoHeading,
                "description":videoPointers
            };
    }
    //CREATE MEAL API
var createMealCallback = {
    success: function(data, textStatus) {
        console.log(data);
    },
    failure: function(XMLHttpRequest, textStatus, errorThrown) {}
}

function uploadImage(imageElementSelect, imageElement) {
    $('#' + imageElementSelect).fileupload({
        dataType: 'json',
        headers: {
            "session-key": localStorage["session_key"]
        },
        formData: {
            example: 'test'
        },
        done: function(e, data) {
            $("#" + imageElement).attr('src', data.result.thumbnail_url);
            $("#" + imageElement).attr('data-id', data.result.id);
            $("#" + imageElement).show();
        }
    });
}

function createMeal() {
        var name = $('#meal-name').val(),
            price = $('#meal-price').val(),
            tax = $('#meal-tax').val(),
            prep_time = $('#meal-prep-time').val(),
            saved_time = $('#meal-saved-time').val(),
            descptn = $('#description').val(),
            availability = $('#create-meal-available option:selected').attr('value'),
            category = $('#create-meal-category option:selected').attr('value'),
            meal_image_id = $('#meal-image').attr("data-id"),
            pre_requisites_image = $('#kitchen-image').attr("data-id"),
            chef_image = $('#chef-image').attr("data-id"),
            ingredients_image = $('#ingredients-image').attr("data-id");
        var ingredients = [], // ingredient array
            temp = '',
            pre_requesties = [],meal_type=[],
            toDo = [],
            prepared = [],tips=traverseTipsTricks();
        $('.ingredients-container .list-container ul').find('li').each(function() {
            temp = $(this).text();
            ingredients.push(temp);
        });
        $('.pre-requisties-container .list-container ul').find('li').each(function() {
            temp = $(this).text();
            pre_requesties.push(temp);
        });
        $('.preperation-container-1 .list-container ul').find('li').each(function() {
            temp = $(this).text();
            toDo.push(temp);
        });
        $('.preperation-container-2 .list-container ul').find('li').each(function() {
            temp = $(this).text();
            prepared.push(temp);
        });

        $('#create-meal-mealType option:selected').each(function(){
           meal_type.push($(this).attr('value'));
        });

        var url = baseURL + "cms/create_meal/";
        header = {
            "session-key": localStorage['session_key']
        }
        params = {
            "name": name,
            "description": descptn,
            "price": price,
            "tax": tax,
            "chef_image": chef_image,
            "meal_image_id": meal_image_id,
            "category_id": category,
            "filter_id": meal_type,
            "available": availability,
            "ingredients": ingredients,
            "pre_requisites": pre_requesties,
            "pre_requisites_image": pre_requisites_image,
            "user_to_do": toDo,
            "ingredients_image": ingredients_image,
            "preparation_time": prep_time,
            "finished_preparation": prepared,
            "saved_time": saved_time,
            "tips": tips
        }
        data = JSON.stringify(params);
        var createMealInstance = new AjaxHttpSender();
        createMealInstance.sendPost(url, header, data, createMealCallback);
    }
    // populate list data 
function populateListData(element_id, container) {
    var addTo_list = $('#' + element_id).val();
    $('.' + container).find('.list-container ul').append('<li>' + addTo_list +
        '<img class="remove" src="../../images/del.png">' + '</li>');
}

//populate to table 
function populateNutrients(nutrients, per_serving, daily_value) {
    $('#nutrient-table').append(
        "<tr><td><span data-category='main-nutrient-category-" + nutrient_main_category + "'>" + nutrients + "</span>" +
        "<img class='add-tr' src='../../images/add-button-md.png'>" +
        "<img class='remove-tr' src='../../images/del.png'><ul></ul></td>" +
        "<td><span data-category='main-nutrient-category-" + nutrient_main_category + "'>" + per_serving + "</span><ul></ul></td>" +
        "<td><span data-category='main-nutrient-category-" + nutrient_main_category + "'>" + daily_value + "</span><ul></ul></td></tr>");
    nutrient_main_category++;
}

//populate category , meal_type select button
var getFilterContentCallback = {
    success: function(data, textStatus) {
        var filterContent = JSON.parse(data),
            meal_type = filterContent.meal_types,
            categories = filterContent.categories;
        populateCreateMealFilter(meal_type, categories);
    },
    failure: function(XMLHttpRequest, textStatus, errorThrown) {}
}

function getFilterContent() {
    var url = baseURL + "get_categories/";
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
    $.each(meal_type, function(key, value) {
        $('#create-meal-mealType ').append("<option value='" + value.id + "'>" + value.name + "</option>");
    })
    $.each(categories, function(key, value) {
        $('#create-meal-category').append("<option value='" + value.id + "'>" + value.name + "</option>");
    })
}

function addSubNutrients(nutrients_td, per_serving_td, daily_value_td) {
    $('#save-nutrients').unbind("click");
    main_category_class = $(per_serving_td).find('span').attr("data-category");
    $('#save-nutrients').on("click", function() {
        $(nutrients_td).find('ul').append("<li>" + "<span data-category='" + main_category_class + "-" + nutrient_sub_category + "'>" + $('#sub-nutrients').val() + "</span>" + "<img class='del-sub-list' src ='../../images/del.png'></li>");
        $(per_serving_td).find('ul').append("<li>" + "<span data-category='" + main_category_class + "-" + nutrient_sub_category + "'>" +
            $('#sub-per-serving').val() + "</span>" + "</li>");
        $(daily_value_td).find('ul').append("<li>" + "<span data-category='" + main_category_class + "-" + nutrient_sub_category + "'>" +
            $('#sub-daily-value').val() + "</span>" + "</li>");
        $('.nutrients-popup-wrapper').hide();
        nutrient_sub_category++;
    });
}
