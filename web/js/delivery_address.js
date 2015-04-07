  //Remove address API
  var removeAddressCallback = {
      success: function(data, textStatus) {
          var userDetails = JSON.parse(data);
          if (userDetails.status == 1) {
              debugger;
          } else {}
      },
      failure: function(XMLHttpRequest, textStatus, errorThrown) {}
  }

  function removeAddress() {
      var url = baseURL + "get_profile/",
          header = {
              "session-key": localStorage["session_key"]
          },
          userData = {
              "get": 1
          };
      data = JSON.stringify(userData);
      var removeAddressInstance = new AjaxHttpSender();
      removeAddressInstance.sendPost(url, header, data, removeAddressCallback);
  }

  function autoPopulateAdressess() {
    $("#editaddress-container ol").empty();
    var userProfile = JSON.parse(localStorage['user_profile']);
        $.each(userProfile.address_list, function(key, value) {
            var userProfile = JSON.parse(localStorage['user_profile']);
            $("#editaddress-container ol").append('<li class="address">' +
            '<div class ="button">' +
            '<a href="#" data-id="'+value.id+'" class="edit-button btn btn-small-secondary">EDIT</a>' +
            '<a href="#" data-id="'+value.id+'" class="remove-button btn btn-small-secondary">REMOVE</a></div>' +
            '<div class="address-content">' +
            '<span class="address-name">' + value.name + '</span>' +
            '<span class="address-street">' + value.street + ', ' + value.building + '</span>' +
            '<span class="address-city">' + value.city + ', ' + value.state + '</span>' +
            '<span class="address-mobile">' + value.phone + '</span>' +
            '<span class="green primary-address">PRIMARY ADDRESS</span>' +
            '<span class="non-primary-address">MAKE THIS YOUR PRIMARY ADDRESS</span>' +
            '</div></li>');
            if (value.is_primary == 1) {
                $('.primary-address:last').addClass("show");
              } else {
                $('.non-primary-address:last').addClass("show");
            }
        });
  }
  autoPopulateAdressess();
