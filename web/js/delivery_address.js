    //Remove address API
// var removeAddressCallback = {
//     success: function(data, textStatus) {
//         var userDetails = JSON.parse(data);
//         if (userDetails.status == 1) {
//             removeAddressLocally(userDetails.id);
//             autoPopulateAdressess();
//         } else {}
//     },
//     failure: function(XMLHttpRequest, textStatus, errorThrown) {}
// }

// function removeAddress(id) {
//     console.log("Are you sure you want to remove?");
//     var url = baseURL + "remove_address/",
//         header = {
//             "session-key": localStorage["session_key"]
//         },
//         userData = {
//             "id": id
//         };
//     data = JSON.stringify(userData);
//     var removeAddressInstance = new AjaxHttpSender();
//     removeAddressInstance.sendPost(url, header, data, removeAddressCallback);
// }

// $(document).on('click', '.remove-address', function() {
//     var deleteId = $(this).data().id;
//     removeAddress(deleteId);
// });

//     //Remove address API
// var getAddressCallback = {
//     success: function(data, textStatus) {
//         var userDetails = JSON.parse(data);
//         if (userDetails.status == 1) {
//                 debugger;
//         } else {}
//     },
//     failure: function(XMLHttpRequest, textStatus, errorThrown) {}
// }

// function getAddress(id) {
//     console.log("Are you sure you want to remove?");
//     var url = baseURL + "get_address_list/",
//         header = {
//             "session-key": localStorage["session_key"]
//         },
//         userData = {
//             "id": id
//         };
//     data = JSON.stringify(userData);
//     var getAddressInstance = new AjaxHttpSender();
//     getAddressInstance.sendPost(url, header, data, getAddressCallback);
// }

function autoPopulateAdressess() {
    $("#editaddress-container ol").empty();
    var userProfile = JSON.parse(localStorage['user_profile']);
    $.each(userProfile.address_list, function(key, value) {
        var userProfile = JSON.parse(localStorage['user_profile']);
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
autoPopulateAdressess();
// getAddress();

//Add address API
// var addAddressCallback = {
//     success: function(data, textStatus) {
//         var userDetails = JSON.parse(data);
//         if (userDetails.status == 1) {
//             addAddressLocally(userDetails);
//             autoPopulateAdressess();
//             $(".addresspopup-wrapper").hide();
//         } else {}
//     },
//     failure: function(XMLHttpRequest, textStatus, errorThrown) {}
// }

// function getNewAddressFromForm() {
//     var newAddress = {
//         username: $(".addaddress-popup").find("input[name*='fullname']").val(),
//         phone: $(".addaddress-popup").find("input[name*='phonenum']").val(),
//         zip: $(".addaddress-popup").find("input[name*='zip']").val(),
//         street: $(".addaddress-popup").find("input[name*='street']").val(),
//         building: $(".addaddress-popup").find("input[name*='building']").val(),
//     }
//     return newAddress;
// }

// function addAddress() {
//     var newAddress = getNewAddressFromForm(),
//         url = baseURL + "add_address/",
//         header = {
//             "session-key": localStorage["session_key"]
//         },
//         userData = {
//             "name": newAddress.username,
//             "phone": newAddress.phone,
//             "zip": newAddress.zip,
//             "city_id": 6,
//             "street": newAddress.street,
//             "building": newAddress.building,

//         };
//     data = JSON.stringify(userData);
//     var addAddressInstance = new AjaxHttpSender();
//     addAddressInstance.sendPost(url, header, data, addAddressCallback);
// }

// $("#addpopup-data").on('click', function() {
//     addAddress();
// })
