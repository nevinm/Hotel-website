var AjaxHttpSender = function() {};

AjaxHttpSender.prototype.sendGet = function(url, callback) {
    $.ajax({
        url: url,
        type: 'GET',
        beforeSend: function() {
            onStartAjaxRequest();
        },
        error: function(XMLHttpRequest, textStatus, errorThrown) {
            callback.failure(XMLHttpRequest, textStatus, errorThrown);
        },
        success: function(data, textStatus) {
            callback.success(data, textStatus);
        },
        complete: function(XMLHttpRequest, textStatus) {
            onEndAjaxRequest();
        }
    });
}

AjaxHttpSender.prototype.sendPost = function(url, header, data, callback, flag) {
    $.ajax({
        url: url,
        type: 'POST',
        headers: header,
        data: data,
        beforeSend: function() {
        currentPage = getCurrentPage("/", ".", window.location.href);
        // if(currentPage !='menu' && currentPage !="How_it_works"){
            if(readCookie("SessionExpireTime")){
                createCookie("SessionExpireTime", "true", 1);
            }else{}
        // }
            onStartAjaxRequest();
        },
        error: function(XMLHttpRequest, textStatus, errorThrown) {
            callback.failure(XMLHttpRequest, textStatus, errorThrown);
        },
        success: function(data, textStatus) {
            callback.success(data, textStatus, flag);
        },
        complete: function(XMLHttpRequest, textStatus) {
            onEndAjaxRequest();
        }
    });
}

function onStartAjaxRequest() {
    // e.g. show spinner
}

function onEndAjaxRequest() {
    // e.g. hide spinner
}

function getCurrentPage(firstChar, secondChar, url) {
    currentPage = url.substring(url.lastIndexOf(firstChar) + 1, url.lastIndexOf(secondChar));
    return currentPage;
}
