$(document).ready(function() {
    var userActive;
    //Get UserList
    var getUserlistCallback = {
        success: function(data, textStatus) {
            var userListData = JSON.parse(data);
            populateUserlist(userListData);
        },
        failure: function(XMLHttpRequest, textStatus, errorThrown) {}
    }

    function getUserlist(nextPage) {
            var url = baseURL + 'cms/get_users/';
            header = {
                    "session-key": localStorage['session_key']
                },
                params = {
                    "nextPage": nextPage
                },
                data = JSON.stringify(params);

            var getUserlistInstance = new AjaxHttpSender();
            getUserlistInstance.sendPost(url, header, data, getUserlistCallback);
        }
        //By deafault call 1 as starting.
    getUserlist(1);

    // Activate User 
    var updateUserStatusCallback = {
        success: function(data, textStatus) {
            var updateUserStatusData = JSON.parse(data);
            if (updateUserStatusData.is_active == false) {
                userActive = false;
            } else {
                userActive = true;
            }
            // populateUserlist(updateUserStatusData);
        },
        failure: function(XMLHttpRequest, textStatus, errorThrown) {}
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
        $("#userlist tbody").empty()
        $.each(userListData.aaData, function(key, value) {
            $("#userlist tbody").append("<tr class='row'>" +
                "<td class='name'>" + value.name + "</td>" +
                "<td class='credits'>" + value.credits + "</td>" +
                "<td class='email'>" + value.email + "</td>" +
                "<td class='is_admin'>" + value.is_admin + "</td>" +
                "<td class='mobile'>" + value.mobile + "</td>" +
                "<td class='profile_image'><img src='" + value.profile_image + "'/></td>" +
                "<td align='center' class='delete-user'><a data-id='" + value.id + "'class='cross'></a></td>" +
                "</tr>");

            if (value.is_active) {
                $("tbody .row:last").append("<td><button data-id='" + value.id + "' class='status down'>Active</button></td>");
            } else {
                $("tbody .row:last").append("<td><button data-id='" + value.id + "' class='status'>Inactive</button></td>")
            }
            if(value.profile_image=="Not Available"){
                $(".profile_image img:last").remove();
                $(".profile_image:last").html("Not Available");
            }
        })
        $(".pagination").pagination({
            items: userListData.total_count,
            itemsOnPage: userListData.per_page,
            currentPage: userListData.current_page,
            cssStyle: 'light-theme',
            onPageClick: function(pageNumber, event) {
                getUserlist(pageNumber);
            }
        });

        $(".status").click(function() {
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
                updateUserStatus(id, status)
                $(this).addClass("down");
                $(this).text("Active");
            }
        });
    }

    $(document).on('click', '.cross', function() {
        var deleteId = $(this).data().id;
        removeUsers(deleteId);
    });

    //Remove Users
    var removeUsersCallback = {
        success: function(data, textStatus) {
            var usersData = JSON.parse(data);
            debugger;
            if (usersData.status == 1) {
                currentPage = $('.pagination').pagination('getCurrentPage');
                getUserlist(currentPage);
            } else {
                alert("Something went wrong")
            }
        },
        failure: function(XMLHttpRequest, textStatus, errorThrown) {}
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
        } else {}
    }
})
