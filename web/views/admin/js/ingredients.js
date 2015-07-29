// Ingredients add
var listIngredientsCallback = {
    success: function(data, textStatus) {
        var mealManageData = JSON.parse(data);
        if (mealManageData.status == -1) {
            showCallBackStatusPre();
            showPopup(mealManageData);
        } else {
            getMealtypes(1);
        }
    },
    failure: function(XMLHttpRequest, textStatus, errorThrown) {}
}

function listIngredients(ingredientSearch) {
    var url = baseURL + 'cms/list_ingredients/';
    header = {
            "session-key": localStorage['session_key']
        },
        params = {
            "search" : ingredientSearch
        };
    if (mealTypeId) {
        params['attribute_id'] = mealTypeId;
    }
    data = JSON.stringify(params);
    var listIngredients = new AjaxHttpSender();
    listIngredients.sendPost(url, header, data, listIngredientsCallback);
}