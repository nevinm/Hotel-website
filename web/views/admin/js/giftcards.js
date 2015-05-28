$(document).ready(function() {
    listGiftCards(0);
    giftcardParams = {};
    $(document).on('click', ".giftcard-delete", function() {
        giftcardParams = {};
        cardId = $(this).data().id;
        if (confirm('Are you sure you want to delete this order?')) {
            giftcardParams.deleteId = cardId;
            manageGiftcards(giftcardParams);
        } else {}
    });

    $(document).on('click', ".giftcard-edit", function() {
        giftcardParams = {};
        $this = $(this);
        var code = $this.parents().eq(1).find('.card-code').text(),
            name = $this.parents().eq(1).find('.card-name').text(),
            amount = $this.parents().eq(1).find('.card-amount').data("amount");
        $("#new-code").val(code);
        $("#new-name").val(name);
        $("#new-amount").val(amount);
        $("#update").data("id", $this.data('id'));
        $(".popup-wrapper").show();
    });

    $("#update").on('click', function() {
        var newCode = $("#new-code").val(),
            newName = $("#new-name").val(),
            newAmount = $("#new-amount").val(),
            giftcardId = $(this).data('id');
        giftcardDetails = {
            "editId": giftcardId,
            "code": newCode,
            "name": newName,
            "amount": newAmount
        }
        manageGiftcards(giftcardDetails);
    });
});

//List gift cards
var listGiftCardsCallback = {
    success: function(data, textStatus) {
        var giftcardList = JSON.parse(data);
        if (giftcardList.status == 1) {
            populateGiftCardsList(giftcardList);
        } else {}
    },
    failure: function(XMLHttpRequest, textStatus, errorThrown) {}
}

function listGiftCards(currentPage) {
    var url = baseURL + "cms/list_gift_cards/";
    header = {
        "session-key": localStorage['session_key']
    }
    params = {
        "nextPage": currentPage
    }
    data = JSON.stringify(params);
    var listGiftCardsInstance = new AjaxHttpSender();
    listGiftCardsInstance.sendPost(url, header, data, listGiftCardsCallback);
}

function populateGiftCardsList(giftcardList) {
    $('#giftcards-list tbody').empty();
    if (giftcardList.aaData.length == 0) {
        $("#giftcard-list-empty").show();
    } else {
        $.each(giftcardList.aaData, function(key, value) {
            $('#giftcards-list tbody').append("<tr data-id='" + value.id + "'>" +
                "<td class='card-code'>" + value.code + "</td>" +
                "<td class='card-name'>" + value.name + "</td>" +
                "<td class='card-amount' data-amount='" + value.amount + "'>" + dollarConvert(value.amount) + "</td>" +
                "<td class='no-popup'><button type='button' class='giftcard-edit' data-id='" + value.id + "'>Edit</button></td>" +
                "<td class='no-popup'><button type='button' class='giftcard-delete' data-id='" + value.id + "'>Delete</button></td></tr>");

            currentStatus = value.status_id;
            $(".order-status:last").val(currentStatus);
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
        var manageGiftcards = JSON.parse(data);
        if (manageGiftcards.status == 1) {
            currentPage = $('.pagination').pagination('getCurrentPage');
            listGiftCards(currentPage);
        } else {}
    },
    failure: function(XMLHttpRequest, textStatus, errorThrown) {}
}

function manageGiftcards(giftcardDetails) {
    var url = baseURL + "cms/manage_gift_card/",
        header = {
            "session-key": localStorage["session_key"]
        },
        giftcards = {
            "edit_id": giftcardDetails.editId,
            "delete_id": giftcardDetails.deleteId,
            "code": giftcardDetails.code,
            "name": giftcardDetails.name,
            "amount": giftcardDetails.amount
        }
    $.each(giftcards, function(key, value) {
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
