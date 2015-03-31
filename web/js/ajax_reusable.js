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
      complete: function (XMLHttpRequest, textStatus) {
         onEndAjaxRequest();
      }
   });
}
 
AjaxHttpSender.prototype.sendPost = function(url, data, callback) {
   $.ajax({
      url: url,
      type: 'POST',
      // header: header,
      data: data,
      beforeSend: function() {
         onStartAjaxRequest();
      },
      error: function(XMLHttpRequest, textStatus, errorThrown) { 
         callback.failure(XMLHttpRequest, textStatus, errorThrown);
      },
      success: function(data, textStatus) {
         callback.success(data, textStatus);
      },
      complete: function (XMLHttpRequest, textStatus) {
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

