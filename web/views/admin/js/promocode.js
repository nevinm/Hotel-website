$(document).ready(function() {
    listPromoCode(0);
    giftcardParams = {};
    $(document).on('click', ".promocard-delete", function() {
        giftcardParams = {};
        cardId = $(this).data().id;
        if (confirm('Are you sure you want to delete this order?')) {
            giftcardParams.deleteId = cardId;
            managePromoCodes(giftcardParams);
        } else {}
    });

    $(document).on('click', ".promocard-edit", function() {
        giftcardParams = {};
        $this = $(this);
        var code = $this.parents().eq(1).find('.card-code').text(),
            date = $this.parents().eq(1).find('.card-name').data().date,
            amount = $this.parents().eq(1).find('.card-amount').data("amount");
        $("#new-code").val(code);
        $("#new-date").val(date);
        $("#new-amount").val(amount);
        $("#update").data("id", $this.data('id'));
        $("#update").text("update");
        $(".popup-wrapper").show();
    });

    $(document).on('click', "#add-new-promo", function() {
        $("#update").text("add");
        $('form.popup-container')[0].reset();
        $(".popup-wrapper").show();
    })

    $("#update").on('click', function() {
        if ($("#promocode-form").valid()) {
            if ($("#update").text() == "add") {
                var newCode = $("#new-code").val(),
                    newDate = $("#new-date").val(),
                    newAmount = $("#new-amount").val(),
                    promoaddDetails = {
                        "code": newCode,
                        "name": newDate,
                        "amount": newAmount
                    }
                managePromoCodes(promoaddDetails);
            } else {
                var newCode = $("#new-code").val(),
                    newDate = $("#new-date").val(),
                    newAmount = $("#new-amount").val(),
                    giftcardId = $(this).data('id');
                giftcardDetails = {
                    "editId": giftcardId,
                    "code": newCode,
                    "name": newDate,
                    "amount": newAmount
                }
                managePromoCodes(giftcardDetails);
            }
        }
    });
});

//List gift cards
var listPromoCodeCallback = {
    success: function(data, textStatus) {
        var promoCodes = JSON.parse(data);
        if (promoCodes.status == 1) {
            populatePromoCodes(promoCodes);
        } else {
            showErrorPopup(promoCodes);
        }
    },
    failure: function(XMLHttpRequest, textStatus, errorThrown) {}
}

function listPromoCode(currentPage) {
    var url = baseURL + "cms/list_promocodes/";
    header = {
        "session-key": localStorage['session_key']
    }
    params = {
        "nextPage": currentPage
    }
    data = JSON.stringify(params);
    var listPromoCodeInstance = new AjaxHttpSender();
    listPromoCodeInstance.sendPost(url, header, data, listPromoCodeCallback);
}

function populatePromoCodes(promoCodes) {
    $('#promocodes-list tbody').empty();
    if (promoCodes.aaData.length == 0) {
        $("#promocodes-list-empty").show();
    } else {
        $.each(promoCodes.aaData, function(key, value) {
            $('#promocodes-list tbody').append("<tr data-id='" + value.id + "'>" +
                "<td class='card-code'>" + value.code + "</td>" +
                "<td class='card-name' data-date='" + value.expiry_date_format + "'>" + value.expiry_date + "</td>" +
                "<td class='card-amount' data-amount='" + value.amount + "'>" + dollarConvert(value.amount) + "</td>" +
                "<td class='no-popup'><button type='button' class='promocard-edit btn btn-small-primary medium-green' data-id='" + value.id + "'>Edit</button></td>" +
                "<td class='no-popup'><button type='button' class='promocard-delete btn btn-small-primary medium-green' data-id='" + value.id + "'>Delete</button></td></tr>");
        });

        $(".pagination").pagination({
            items: data.total_count,
            itemsOnPage: data.per_page,
            currentPage: data.current_page,
            cssStyle: 'light-theme',
            onPageClick: function(pageNumber, event) {
                getOrders(pageNumber);
            }
        });
    }
    $(".popup-wrapper").hide();
}

//Delete giftcards API process
var manageGiftcardsCallback = {
    success: function(data, textStatus) {
        var managePromoCodes = JSON.parse(data);
        if (managePromoCodes.status == 1) {
            currentPage = $('.pagination').pagination('getCurrentPage');
            listPromoCode(currentPage);
        } else {
            showErrorPopup(managePromoCodes);
        }
    },
    failure: function(XMLHttpRequest, textStatus, errorThrown) {}
}

function managePromoCodes(giftcardDetails) {
    var url = baseURL + "cms/manage_promocode/",
        header = {
            "session-key": localStorage["session_key"]
        },
        giftcardParams = {
            "edit_id": giftcardDetails.editId,
            "delete_id": giftcardDetails.deleteId,
            "code": giftcardDetails.code,
            "expiry_date": giftcardDetails.name,
            "amount": giftcardDetails.amount
        }
    $.each(giftcardParams, function(key, value) {
        giftcardEmptyCheck(key, value);
    });
    data = JSON.stringify(giftcardParams);
    var manageGiftcardsInstance = new AjaxHttpSender();
    manageGiftcardsInstance.sendPost(url, header, data, manageGiftcardsCallback);
}

function giftcardEmptyCheck(key, value) {
    if (value) {
        giftcardParams[key] = value;
    } else {}
}
