// Remove address API
var removeAddressCallback = {
    success: function(data, textStatus) {
        var userDetails = JSON.parse(data);
        if (userDetails.status == 1) {
            getAddress();
            isAddress();
        } else {}
    },
    failure: function(XMLHttpRequest, textStatus, errorThrown) {}
}

function removeAddress(id) {
    var url = baseURL + "remove_address/",
        header = {
            "session-key": localStorage["session_key"]
        },
        userData = {
            "id": id
        };
    data = JSON.stringify(userData);
    var removeAddressInstance = new AjaxHttpSender();
    removeAddressInstance.sendPost(url, header, data, removeAddressCallback);
}


var getAddressCallback = {
    success: function(data, textStatus) {
        var userDetails = JSON.parse(data);
        if (userDetails.status == 1) {
            localStorage['delivery_addressess'] = data;
            autoPopulateAdressess(userDetails);
            isAddress();
        } else {}
    },
    failure: function(XMLHttpRequest, textStatus, errorThrown) {}
}

function getAddress(id) {
    var url = baseURL + "get_address_list/",
        header = {
            "session-key": localStorage["session_key"]
        },
        userData = {
            "id": id
        };
    data = JSON.stringify(userData);
    var getAddressInstance = new AjaxHttpSender();
    getAddressInstance.sendPost(url, header, data, getAddressCallback);
}

function autoPopulateAdressess(userDetails) {
    $("#editaddress-container ol").empty();
    $.each(userDetails.address_list, function(key, value) {
        $("#editaddress-container ol").append('<li class="address">' +
            '<div class ="button">' +
            '<a href="#" data-id="' + value.id + '" class="edit-address btn btn-small-secondary">EDIT</a>' +
            '<a href="#" data-id="' + value.id + '" class="remove-address btn btn-small-secondary">REMOVE</a></div>' +
            '<div class="address-content">' +
            '<span class="address-name">' + value.first_name +" "+ value.last_name + '</span>' +
            '<span class="address-street">' + value.street + ', ' + value.building + '</span>' +
            '<span class="address-city">' + value.city + ', ' + value.state + '</span>' +
            '<span class="address-mobile">' + value.phone + '</span>' +
            '<span class="green primary-address add-primary" data-id="' + value.id + '">PRIMARY ADDRESS</span>' +
            '<span class="non-primary-address add-primary" data-id="' + value.id + '">MAKE THIS YOUR PRIMARY ADDRESS</span>' +
            '</div></li>');

        if (value.is_primary == 1) {
            $('.primary-address:last').addClass("show");
        } else {
            $('.non-primary-address:last').addClass("show");
        }
    });
}

//Add address API
var addAddressCallback = {
    success: function(data, textStatus) {
        var userDetails = JSON.parse(data);
        if (userDetails.status == 1) {
            getAddress();
            $(".addresspopup-wrapper").hide();
        } else {}
    },
    failure: function(XMLHttpRequest, textStatus, errorThrown) {}
}

function getNewAddressFromForm() {
    var $addressPopup = $(".addaddress-popup");
    var newAddress = {
        first_name: $addressPopup.find("input[name*='FirstName']").val(),
        last_name: $addressPopup.find("input[name*='LastName']").val(),
        phone: $addressPopup.find("input[name*='phonenumber']").val(),
        zip: $addressPopup.find("input[name*='zip']").val(),
        street: $addressPopup.find("input[name*='street']").val(),
        city_id: $addressPopup.find(".city-selector").val(),
        building: $addressPopup.find("input[name*='building']").val(),
        is_primary: $addressPopup.find("input[type*='checkbox']").val() == "on" ? 1 : 0,
    }
    return newAddress;
}

function addAddress() {
    var newAddress = getNewAddressFromForm(),
        url = baseURL + "add_address/",
        header = {
            "session-key": localStorage["session_key"]
        },
        userData = {
            "first_name": newAddress.first_name,
            "last_name": newAddress.last_name,
            "phone": newAddress.phone,
            "zip": newAddress.zip,
            "city_id": newAddress.city_id,
            "street": newAddress.street,
            "building": newAddress.building,
            "is_primary": newAddress.is_primary
        };
    data = JSON.stringify(userData);
    var addAddressInstance = new AjaxHttpSender();
    addAddressInstance.sendPost(url, header, data, addAddressCallback);
}



//Edit address API
var editAddressCallback = {
    success: function(data, textStatus) {
        var userDetails = JSON.parse(data);
        if (userDetails.status == 1) {
            getAddress();
            $(".addresspopup-wrapper").hide();
        } else {}
    },
    failure: function(XMLHttpRequest, textStatus, errorThrown) {}
}

function populateAddressToForm(id) {
    var $addressPopup = $(".addaddress-popup"),
        deliveryAddressList = JSON.parse(localStorage['delivery_addressess']);
    $.each(deliveryAddressList.address_list, function(key, value) {
        if (value.id == id) {
            $addressPopup.find(".state-selector").val(value.state_id);
            $addressPopup.find("input[name*='FirstName']").val(value.first_name);
            $addressPopup.find("input[name*='LastName']").val(value.last_name   );
            $addressPopup.find("input[name*='phonenumber']").val(value.phone);
            $addressPopup.find("input[name*='zip']").val(value.zip);
            $addressPopup.find("input[name*='street']").val(value.street);
            $addressPopup.find("input[name*='building']").val(value.building);
            if (value.is_primary == 1) {
                $addressPopup.find("input[type*='checkbox']").prop("checked", true);
            } else {
                $addressPopup.find("input[type*='checkbox']").prop("checked", false);
            }
            getCities(value.state_id, value.city_id);
        }
    });
}

function editAddress(currentId, primaryAdd) {
    var url = baseURL + "update_address/" + currentId + "/",
       header = {
            "session-key": localStorage["session_key"]
        },userData;
    if(primaryAdd){
        userData={
            "is_primary": primaryAdd
        }
    }
    else{
         var newAddress = getNewAddressFromForm();
         userData = {
            "first_name": newAddress.first_name,
            "last_name": newAddress.last_name,
            "phone": newAddress.phone,
            "zip": newAddress.zip,
            "city_id": newAddress.city_id,
            "street": newAddress.street,
            "building": newAddress.building,
        };
    }
    data = JSON.stringify(userData);
    var editAddressInstance = new AjaxHttpSender();
    editAddressInstance.sendPost(url, header, data, editAddressCallback);
}

// Get states API
var getStatesCallback = {
    success: function(data, textStatus) {
        var stateList = JSON.parse(data);
        localStorage['delivery-states'] = data;
        if (stateList.status == 1) {
            $.each(stateList.state_list, function(index, value) {
                $('.state-selector').append($('<option/>', {
                    value: value.id,
                    text: value.name,
                }));
            });
        } else {}
    },
    failure: function(XMLHttpRequest, textStatus, errorThrown) {}
}

function getStates() {
    var url = baseURL + "get_states/",
        header = {
            "session-key": localStorage["session_key"]
        },
        userData = {
            "search": "a"
        };
    data = JSON.stringify(userData);
    var getStatesInstance = new AjaxHttpSender();
    getStatesInstance.sendPost(url, header, data, getStatesCallback);
}

// Get City API
var getCitiesCallback = {
    success: function(data, textStatus, cityId) {
        var cityList = JSON.parse(data);
        if (cityList.status == 1) {
            $('.city-selector').empty();
            $.each(cityList.city_list, function(index, value) {
                $('.city-selector').append($('<option/>', {
                    value: value.id,
                    text: value.name,
                }));
            });
            if (cityId) {
                $('.city-selector').val(cityId);
            }
        } else {}
    },
    failure: function(XMLHttpRequest, textStatus, errorThrown) {}
}

function getCities(stateId, cityId) {
    var url = baseURL + "get_cities/",
        header = {
            "session-key": localStorage["session_key"]
        },
        userData = {
            "state_id": stateId
        };
    data = JSON.stringify(userData);
    var getCitiesInstance = new AjaxHttpSender();
    getCitiesInstance.sendPost(url, header, data, getCitiesCallback, cityId);
}

//check is ther any addresses exist 
function isAddress() {
    if ($('#editaddress-container .content ol').is(':empty')) {
        $('#editaddress-container .content .message').show();
    } else {
        $('#editaddress-container .content .message').hide();
    }
}

$(document).ready(function() {
    $(document).on('change', '.state-selector', function() {
        var stateSelectedId = $(this).val();
        getCities(stateSelectedId);
    });

    $("#savepopup-data").on('click', function(e) {
        e.preventDefault();
        var currentId = $(this).data().id;
        if ($('form.addaddress-popup').valid()) {
            editAddress(currentId);
        }
    });

   
    $(document).on('click','.non-primary-address.add-primary',function(){
        var currentId = $(this).data().id;
        editAddress(currentId, 1);
    });

    $("#addpopup-data").on('click', function(e) {
        e.preventDefault();
        if ($('form.addaddress-popup').valid()) {
            addAddress();
        }
    });

    $(document).on('click', '.remove-address', function() {
        $(".popup-wrapper").show();
        var deleteId = $(this).data().id;
        $('#yes-button').on('click', function() {
            $(".popup-wrapper").hide();
            removeAddress(deleteId);
        });
        $('#no-button').on('click', function() {
            $(".popup-wrapper").hide();
        });
    });

    getStates();
    getAddress();
});
