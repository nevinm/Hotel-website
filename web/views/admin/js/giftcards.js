$(document).ready(function() {
    listGiftCards(0);
    giftcardParams = {};
    $(document).on('click', ".giftcard-delete", function() {
        giftcardParams = {};
        cardId = $(this).data().id;
        if (confirm('Are you sure you want to delete this giftcard?')) {
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
         $('#update').val("update");
        $(".popup-wrapper").show();
        $('form.edit-gift-card').validate().resetForm();
    });

    $("#update").on('click', function(e) {        
        e.preventDefault();
        if($('#update').val() == "add"){
            var newCode = $("#new-code").val(),
            newName = $("#new-name").val(),
            newAmount = $("#new-amount").val();
            giftcardaddDetails = {
            "code": newCode,
            "name": newName,
            "amount": newAmount
            }
            if($('form').valid()){
                manageGiftcards(giftcardaddDetails);
            }
            
        }else{
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
            if($('form').valid()){ 
                manageGiftcards(giftcardDetails);
            }
        }
    });

    $(document).on('click', "#add-gift-card", function() {  
        $('#update').val("add");
        $('form.edit-gift-card')[0].reset();
        $(".popup-wrapper").show();
        $('form.edit-gift-card').validate().resetForm();
    });

    //search in gift card
    $('#search-coupon-code').on("click",function(){
        var name = $('#gift-card-name').val(),
            code = $('#coupon-code').val();
        listGiftCards("",name,code);
    });
});

//List gift cards
var listGiftCardsCallback = {
    success: function(data, textStatus) {
        var giftcardList = JSON.parse(data);
        if (giftcardList.status == 1) {
            populateGiftCardsList(giftcardList);
        } else {
            showErrorPopup(giftcardList);
        }
    },
    failure: function(XMLHttpRequest, textStatus, errorThrown) {}
}

function listGiftCards(currentPage,name,code) {
    var url = baseURL + "cms/list_gift_cards/";
    header = {
        "session-key": localStorage['session_key']
    }
    params = {
        "nextPage": currentPage,
        "name" : name,
        "code" : code
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
                "<td class='no-popup'><button type='button' class='giftcard-edit btn btn-small-primary medium-green' data-id='" + value.id + "'>Edit</button></td>" +
                "<td class='no-popup'><button type='button' class='giftcard-delete btn btn-small-primary medium-green' data-id='" + value.id + "'>Delete</button></td></tr>");

            currentStatus = value.status_id;
            $(".order-status:last").val(currentStatus);
        });

        $(".pagination").pagination({
            pages: giftcardList.num_pages,
            currentPage: giftcardList.current_page,
            cssStyle: 'light-theme',
            onPageClick: function(pageNumber, event) {
                listGiftCards(pageNumber);
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
        } else {
            showErrorPopup(manageGiftcards);
        }
        $('.popup-wrapper').hide();
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