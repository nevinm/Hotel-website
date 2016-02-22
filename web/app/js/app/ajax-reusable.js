var AjaxHttpSender = function () {
};
AjaxHttpSender.prototype = function () {
    var sendGet = function (url, callback) {
        $.ajax({
            url: url,
            type: 'GET',
            beforeSend: function () {
                onStartAjaxRequest();
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                callback.failure(XMLHttpRequest, textStatus, errorThrown);
            },
            success: function (data, textStatus) {
                callback.success(data, textStatus);
            },
            complete: function (XMLHttpRequest, textStatus) {
                onEndAjaxRequest();
            }
        });
    };
    var sendPost = function (url, header, data, callback, flag) {
        $.ajax({
            url: url,
            type: 'POST',
            headers: header,
            data: data,
            beforeSend: function () {
                currentPage = getCurrentPage("/", ".", window.location.href);
                if (readCookie("SessionExpireTime")) {
                    createCookie("SessionExpireTime", "true", sessionExpiryTime);
                } else {
                }
                onStartAjaxRequest();
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                callback.failure(XMLHttpRequest, textStatus, errorThrown);
            },
            success: function (data, textStatus) {
                callback.success(data, textStatus, flag);
            },
            complete: function (XMLHttpRequest, textStatus) {
                onEndAjaxRequest();
            }
        });
    };
    var onStartAjaxRequest = function () {
        // e.g. show spinner
    };

    var onEndAjaxRequest = function () {
        // e.g. hide spinner
    };
    var getCurrentPage = function (firstChar, secondChar, url) {
        currentPage = url.substring(url.lastIndexOf(firstChar) + 1, url.lastIndexOf(secondChar));
        return currentPage;
    };
    return {
        sendGet: sendGet,
        sendPost: sendPost
    };
}();


