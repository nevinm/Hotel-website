    // Remove address API
    var removeAddressCallback = {
        success: function(data, textStatus) {
            var userDetails = JSON.parse(data);
            if (userDetails.status == 1) {
                getAddress();
            } else {}
        },
        failure: function(XMLHttpRequest, textStatus, errorThrown) {}
    }

    function removeAddress(id) {
        console.log("Are you sure you want to remove?");
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

    $(document).on('click', '.remove-address', function() {
        var deleteId = $(this).data().id;
        removeAddress(deleteId);
    });

    var getAddressCallback = {
        success: function(data, textStatus) {
            var userDetails = JSON.parse(data);
            if (userDetails.status == 1) {
                localStorage['delivery_addressess']=data;
                autoPopulateAdressess(userDetails);
            } else {}
        },
        failure: function(XMLHttpRequest, textStatus, errorThrown) {}
    }

    function getAddress(id) {
        console.log("Are you sure you want to remove?");
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

    getAddress();

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
            username: $addressPopup.find("input[name*='fullname']").val(),
            phone: $addressPopup.find("input[name*='phonenum']").val(),
            zip: $addressPopup.find("input[name*='zip']").val(),
            street: $addressPopup.find("input[name*='street']").val(),
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
                "name": newAddress.username,
                "phone": newAddress.phone,
                "zip": newAddress.zip,
                "city_id": 6,
                "street": newAddress.street,
                "building": newAddress.building,
                "is_primary": newAddress.is_primary
            };
        debugger;
        data = JSON.stringify(userData);
        var addAddressInstance = new AjaxHttpSender();
        addAddressInstance.sendPost(url, header, data, addAddressCallback);
    }

    $("#addpopup-data").on('click', function() {
        addAddress();
    })



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

    function populateAdressToForm(id) {
        var $addressPopup = $(".addaddress-popup"),
            deliveryAddressList = JSON.parse(localStorage['delivery_addressess']);
        $.each(deliveryAddressList.address_list, function(key, value){
            if(value.id == id){
                $addressPopup.find("input[name*='fullname']").val(value.name);
                $addressPopup.find("input[name*='phonenum']").val(value.phone);
                $addressPopup.find("input[name*='zip']").val(value.zip);
                $addressPopup.find("input[name*='street']").val(value.street);
                $addressPopup.find("input[name*='building']").val(value.building);
                if(value.is_primary==1){
                    $addressPopup.find("input[type*='checkbox']").prop("checked", true);
                }else{
                    $addressPopup.find("input[type*='checkbox']").prop("checked", false);
                }
            }
        });
    }

    function editAddress(currentId) {
        var newAddress = getNewAddressFromForm(),
            url = baseURL + "update_address/" + currentId+ "/",
            header = {
                "session-key": localStorage["session_key"]
            },
            userData = {
                "name": newAddress.username,
                "phone": newAddress.phone,
                "zip": newAddress.zip,
                "city_id": 6,
                "street": newAddress.street,
                "building": newAddress.building,
                "is_primary": newAddress.is_primary
            };
        data = JSON.stringify(userData);
        var editAddressInstance = new AjaxHttpSender();
        editAddressInstance.sendPost(url, header, data, editAddressCallback);
    }

    $("#savepopup-data").on('click', function() {
        var currentId = $(this).data().id;
        editAddress(currentId);
    })
