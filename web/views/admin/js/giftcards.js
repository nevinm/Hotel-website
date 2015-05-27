$(document).ready(function() {
    listGiftCards();
	giftcardParams={};
    $(document).on('click', ".giftcard-delete", function() {
        cardId = $(this).data().id;
        if (confirm('Are you sure you want to delete this order?')) {
			giftcardDetails.deleteId = cardId;
            manageGiftcards(giftcardDetails);
        } else {}
    });

});
var listGiftCardsResponse = {
    "status": 1,
    "actual_count": 4,
    "num_pages": 1,
    "current_page": 1,
    "page_range": [
        1
    ],
    "per_page": 10,
    "aaData": [{
            "id": 1,
            "code": "ABCD",
            "name": "asdasd"
        }, {
            "id": 1,
            "code": "ABCD",
            "expiry_date": "02/23/2015 10:10:10"
        },

    ]
};
//List gift cards
var listGiftCardsCallback = {
    success: function(data, textStatus) {

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

function populateGiftCardsList(data) {
    // var giftcardsList = JSON.parse(data);
    $.each(data.aaData, function(key, value) {
        $('#giftcards-list tbody').append("<tr data-id='" + value.id + "'>" +
            "<td>" + value.code + "</td>" +
            "<td>" + value.name + "</td>" +
            "<td>" + value.expiry_date + "</td>" +
            "<td>" + value.date + "</td>" +
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
            "expiry_date": giftcardDetails.date,
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
    if (value.length != 0) {
        giftcardParams[key] = value;
    } else {}
}
