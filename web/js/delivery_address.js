// Remove address API
var removeAddressCallback = {
    success: function(data, textStatus) {
        var userDetails = JSON.parse(data);
        if (userDetails.status == 1) {
            getAddress();
            isAddress();
        } else {
            showErrorPopup(userDetails);
        }
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
        } else {
            showErrorPopup(userDetails);
        }
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
            '<span class="address-name">' + value.first_name + " " + value.last_name + '</span>' +
            '<span class="address-street">' + value.street + ', ' + value.building + '</span>' +
            '<span class="address-city">' + value.city + ', ' + value.state + '</span>' +
            '<span class="address-mobile">' + value.phone + '</span>' +
            '<span class="address-zip">' + value.zip + '</span>' +
            '<span class="green primary-address add-primary" data-id="' + value.id + '">PRIMARY ADDRESS</span>' +
            '<span class="non-primary-address add-primary" data-id="' + value.id + '">MAKE THIS YOUR PRIMARY ADDRESS</span>' +
            '</div></li>');

        if (value.is_primary == 1) {
            $('.primary-address:last').addClass("show");
            $('.remove-address:last').addClass("hide");
        } else {
            $('.non-primary-address:last').addClass("show");
            $('.remove-address:last').addClass("show");
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
        } else {
            showErrorPopup(userDetails);
        }
    },
    failure: function(XMLHttpRequest, textStatus, errorThrown) {}
}

function getNewAddressFromForm() {
    var $addressPopup = $(".addaddress-popup");
    var newAddress = {
        first_name: $addressPopup.find("input[name*='firstname']").val(),
        last_name: $addressPopup.find("input[name*='lastname']").val(),
        phone: $addressPopup.find("input[name*='phonenumber']").val(),
        zip: $addressPopup.find("input[name*='zip']").val(),
        street: $addressPopup.find("input[name*='street']").val(),
        city_id: $addressPopup.find(".city-selector").val(),
        state_id: $addressPopup.find(".state-selector").val(),
        building: $addressPopup.find("input[name*='building']").val(),
        is_primary: $addressPopup.find("input[type*='checkbox']").is(":checked") == true ? 1 : 0,
        email: $addressPopup.find("input[name*='email']").val()
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
            "is_primary": newAddress.is_primary,
            "email": newAddress.email,
            "state_id": newAddress.state_id,
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
        } else {
            showErrorPopup(userDetails);
        }
    },
    failure: function(XMLHttpRequest, textStatus, errorThrown) {}
}

function populateAddressToForm(id) {
    var $addressPopup = $(".addaddress-popup"),
        deliveryAddressList = JSON.parse(localStorage['delivery_addressess']);
    $.each(deliveryAddressList.address_list, function(key, value) {
        if (value.id == id) {
            $addressPopup.find(".state-selector").val(value.state_id);
            $addressPopup.find("input[name*='firstname']").val(value.first_name);
            $addressPopup.find("input[name*='lastname']").val(value.last_name);
            $addressPopup.find("input[name*='phonenumber']").val(value.phone);
            $addressPopup.find("input[name*='zip']").val(value.zip);
            $addressPopup.find("input[name*='street']").val(value.street);
            $addressPopup.find("input[name*='building']").val(value.building);
            $addressPopup.find("input[name*='email']").val(value.email);
            if (value.is_primary == 1) {
                $addressPopup.find("input[type*='checkbox']").prop("checked", true);
            } else {
                $addressPopup.find("input[type*='checkbox']").prop("checked", false);
            }
        }
    });
}

function editAddress(currentId, primaryAdd, selector) {
    var url = baseURL + "update_address/" + currentId + "/",
        header = {
            "session-key": localStorage["session_key"]
        },
        userData = {};
    if (primaryAdd) {
        userData.is_primary = primaryAdd;
    }else{
        userData.is_primary =0;
    }
    if (selector != "justId") {
        var newAddress = getNewAddressFromForm();
        userData.first_name = newAddress.first_name;
        userData.last_name = newAddress.last_name;
        userData.phone = newAddress.phone;
        userData.zip = newAddress.zip;
        userData.city_id = newAddress.city_id;
        userData.street = newAddress.street;
        userData.building = newAddress.building;
        userData.email = newAddress.email;
        userData.state_id = newAddress.state_id;
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
        } else {
            showErrorPopup(userDetails);
        }
    },
    failure: function(XMLHttpRequest, textStatus, errorThrown) {}
}

function getStates() {
    var url = baseURL + "get_states/",
        header = {
            "session-key": localStorage["session_key"]
        },
        userData = {
            "search": ""
        };
    data = JSON.stringify(userData);
    var getStatesInstance = new AjaxHttpSender();
    getStatesInstance.sendPost(url, header, data, getStatesCallback);
}

//check is there any addresses exist 
function isAddress() {
    if ($('#editaddress-container .content ol').is(':empty')) {
        $('#editaddress-container .content .message').show();
        $('.update-delivery-address').hide();
    } else {
        $('#editaddress-container .content .message').hide();
        $('.update-delivery-address').show();
    }
}

$(document).ready(function() {
    $(document).on('change', '.state-selector', function() {
        var stateSelectedId = $(this).val();
    });

    $("#savepopup-data").on('click', function(e) {
        e.preventDefault();
        var currentId = $(this).attr("data-id"),
            isPrimary = 0;
        if ($('form.addaddress-popup').valid()) {
            if ($("input[name='is-primary']").is(":checked")) {
                isPrimary = 1;
            }
            editAddress(currentId, isPrimary);
        }
    });


    $(document).on('click', '.non-primary-address.add-primary', function() {
        var currentId = $(this).data().id;
        // populateAddressToForm(currentId);
        editAddress(currentId, 1, "justId");
    });

    $("#addpopup-data").on('click', function(e) {
        e.preventDefault();
        if ($('form.addaddress-popup').valid()) {
            addAddress();
        }
    });

    $(document).on('click', '.remove-address', function() {
        $(".popup-wrapper .content").find("span").text("Are you sure want to remove this address?");
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
    CartItemCount();
});
