//Get UserList
var getUserlistCallback = {
    success: function (data, textStatus) {
        var userListData = JSON.parse(data);
        populateUserlist(userListData);
    },
    failure: function (XMLHttpRequest, textStatus, errorThrown) {
    }
}

function getUserlist(nextPage, userName, emailId) {
    var url = baseURL + 'cms/get_users/';
    header = {
        "session-key": localStorage['session_key']
    },
    params = {
        "nextPage": nextPage,
        "search" : userName,
        "email" :emailId
    },
    data = JSON.stringify(params);

    var getUserlistInstance = new AjaxHttpSender();
    getUserlistInstance.sendPost(url, header, data, getUserlistCallback);
}

// Activate User 
var updateUserStatusCallback = {
    success: function (data, textStatus) {
        var updateUserStatusData = JSON.parse(data);
        if (updateUserStatusData.is_active == false) {
            userActive = false;
        } else {
            userActive = true;
        }
    },
    failure: function (XMLHttpRequest, textStatus, errorThrown) {
    }
}

function updateUserStatus(id, status) {
    var url = baseURL + 'cms/change_user_status/';
    header = {
        "session-key": localStorage['session_key']
    },
    params = {
        "id": id,
        'is_active': status
    },
    data = JSON.stringify(params);

    var getUserlistInstance = new AjaxHttpSender();
    getUserlistInstance.sendPost(url, header, data, updateUserStatusCallback);
}

function populateUserlist(userListData) {
    $("#userlist tbody").empty();
    $.each(userListData.aaData, function (key, value) {
        var element = "<tr class='row'>" +
                "<td class='name'>" + value.name + "</td>" +
                "<td class='credits'>" + value.credits + "<p data-credits='" +
                parseFloat(value.credits.substring(2)) + "' data-id='" + value.id +
                "' data-name='" + value.name + "' class='credits-edit'>EDIT</p></td>" +
                "<td class='email'>" + value.email + "</td>" +
                "<td class='is_admin'>" + value.is_admin + "</td>" +
                "<td class='is_ambassador'>";
//        element += value.is_ambassador
//                ? "<a href='#' class='ambassador' data-id='" + value.id + "' id='ambassador-" + value.ambassador_code + "'>YES</a>"
//                : "<a href='#' class='not-ambassador' data-id='" + value.id + "' id='ambassador-" + value.ambassador_code + "'>NO</a>";
        element += "<div>" + value.ambassador_code + "</div></td>" +
                "<td class='mobile'>" + value.mobile + "</td>" +
                "<td class='profile_image'><img src='" + value.profile_image + "'/></td>" +
                "<td align='center' class='delete-user'><a data-id='" + value.id + "'class='cross'></a></td>" +
                "</tr>";
        $("#userlist tbody").append(element);
        if (value.is_active) {
            $("tbody .row:last").append("<td><button data-id='" + value.id + "' class='status down'>Active</button></td>");
        } else {
            $("tbody .row:last").append("<td><button data-id='" + value.id + "' class='status'>Inactive</button></td>")
        }
        if (value.profile_image == "Not Available") {
            $(".profile_image img:last").remove();
            $(".profile_image:last").html("Not Available");
        }
    });

    $(".credits-edit").on("click", function () {
        showUserCreditEditPopup(this);
    });

    $(".pagination").pagination({
        items: userListData.total_count,
        itemsOnPage: userListData.per_page,
        currentPage: userListData.current_page,
        cssStyle: 'light-theme',
        onPageClick: function (pageNumber, event) {
            getUserlist(pageNumber, searchParams.userName, searchParams.emailId);
        },
        onInit: function () {
            if (getStringAfterHash(location.href, "#")) {
                var pageString = getStringAfterHash(location.href, "#");
                if (pageString.indexOf('page') != -1) {
                    pageNumber = getStringAfterHash(pageString, "-");
                    if ($(".pagination").pagination('getCurrentPage') == pageNumber) {
                    } else {
                        $(".pagination").pagination('selectPage', pageNumber);
                    }
                }
            } else {
            }
        }
    });

    $(".status").click(function () {
        var id, status;
        if ($(this).hasClass("down")) {
            id = $(this).data().id;
            status = false;
            updateUserStatus(id, status);
            $(this).removeClass("down");
            $(this).text("Inactive");
        } else {
            id = $(this).data().id;
            status = true;
            updateUserStatus(id, status);
            $(this).addClass("down");
            $(this).text("Active");
        }
    });

    $("a[id^=ambassador-]").on("click", function (e) {
        e.preventDefault();
        setAmbassadorStatus(e, this);
    });
}

function setAmbassadorStatus(event, instance) {
    var url = baseURL + 'cms/set_ambassador/';
    header = {
        "session-key": localStorage['session_key']
    },
    params = {
        "id": $(instance).attr("data-id"),
        "is_ambassador": $(instance).hasClass("not-ambassador") ? 1 : 0
    },
    data = JSON.stringify(params);

    new AjaxHttpSender().sendPost(url, header, data, setAmbassadorCallback, instance);
}
var setAmbassadorCallback = {
    success: function (data, textStatus, instance) {
        var usersData = JSON.parse(data);
        if (usersData.status == 1) {
            var ambassadorData = JSON.parse(data);
            if (ambassadorData.is_ambassador) {
                $(instance).text("YES");
                $(instance).removeClass("not-ambassador").addClass("ambassador");
            } else {
                $(instance).removeClass("ambassador").addClass("not-ambassador");
                $(instance).text("NO");
            }
        }
    },
    failure: function (XMLHttpRequest, textStatus, errorThrown) {
    }
};

function showUserCreditEditPopup(elem) {
    $("#user-credit-form .credits").show();
    $("#update-user-credits").show();
    $("#user-credit-form .content").hide();
    $(".user-list-popup .header").text("Update User Credits");
    var currentId = $(elem).data("id"),
            credits = $(elem).find(".credits").val(),
            userName = $(elem).data("name");
    $("#new-credits").val($(elem).data("credits"));
    $("#update-user-credits").data("id", currentId);
    $("#update-user-credits").data("user", userName);
    $("#current-user").text(userName);
    $('.popup-wrapper').show();
}

function showUserCreditPoup() {
    $(".user-list-popup .header").text("Message");
    $("#user-credit-form .credits").hide();
    $("#update-user-credits").hide();
    $("#user-credit-form .content").show();
    showPopup(usersData);
}

//Remove Users
var removeUsersCallback = {
    success: function (data, textStatus) {
        var usersData = JSON.parse(data);
        if (usersData.status == 1) {
            currentPage = $('.pagination').pagination('getCurrentPage');
            getUserlist(currentPage, searchParams.userName, searchParams.emailId);
        } else {
            showUserCreditPoup(usersData);
        }
    },
    failure: function (XMLHttpRequest, textStatus, errorThrown) {
    }
}

function removeUsers(id) {
    if (confirm('Are you sure you want to delete this user?')) {
        var url = baseURL + 'cms/delete_user/';
        header = {
            "session-key": localStorage['session_key']
        },
        params = {
            "id": id
        },
        data = JSON.stringify(params);

        var removeUsersInstance = new AjaxHttpSender();
        removeUsersInstance.sendPost(url, header, data, removeUsersCallback);
    } else {
    }
}

//Remove Users
var manageCreditsCallback = {
    success: function (data, textStatus) {
        var creditsData = JSON.parse(data);
        if (creditsData.status == 1) {
            currentPage = $('.pagination').pagination('getCurrentPage');
            getUserlist(currentPage, searchParams.userName, searchParams.emailId);
            $('.popup-wrapper').hide();
        } else {
            showUserCreditPoup(creditsData);
        }
    },
    failure: function (XMLHttpRequest, textStatus, errorThrown) {
    }
}

//Search Functions
function returnSearchParams() {
    var userName = $("#user-name").val(),
            emailId = $("#email-id").val(),
            searchParams = {};
    searchParams = {
        "userName": userName,
        "emailId": emailId
    }
    return searchParams;
}
function doSearch() {
    searchParams = returnSearchParams();
    getUserlist(1, searchParams.userName, searchParams.emailId);
}

function manageCredits(id, credits) {
    var url = baseURL + 'cms/manage_credits/';
    header = {
        "session-key": localStorage['session_key']
    },
    params = {
        "user_id": id,
        "credit": credits
    },
    data = JSON.stringify(params);

    var manageCreditsInstance = new AjaxHttpSender();
    manageCreditsInstance.sendPost(url, header, data, manageCreditsCallback);
}

$(document).ready(function () {
    var userActive;
    //By default call 1 as starting.
    getUserlist(1);

    $(document).on('click', '.cross', function () {
        var deleteId = $(this).data().id;
        removeUsers(deleteId);
    });

    $("#update-user-credits").on("click", function (e) {
        e.preventDefault();
        var currentId = $(this).data("id"),
                newCredits = $("#new-credits").val(),
                userName = $(this).data("name");
        if ($("#user-credit-form").valid()) {
            manageCredits(currentId, newCredits);
        } else {
        }
    });
    $("#search-users").on('click', doSearch);
    $(document).keypress(function(e) {
        if(e.which == 13) {
            doSearch();
        }
    });
    downloadOrderCSV("cms/export_users/", "download-users-form");
    downloadOrderCSV("cms/export_users_for_promotion/", "download-users-promotion-form");
});