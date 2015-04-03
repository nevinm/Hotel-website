$(document).ready(function() {
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
                    "session-key": localStorage['admin_session_key']
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

    function populateUserlist(userListData) {
        $("#userlist tbody").empty()
        $.each(userListData.aaData, function(key, value) {
            $("#userlist tbody").append("<tr>" +
                "<td class='id'>" + value.id + "</td>" +
                "<td class='name'>" + value.name + "</td>" +
                "<td class='credits'>" + value.credits + "</td>" +
                "<td class='email'>" + value.email + "</td>" +
                "<td class='is_admin'>" + value.is_admin + "</td>" +
                "<td class='mobile'>" + value.mobile + "</td>" +
                "<td class='profile_image'>" + value.profile_image + "</td>" +
                "</tr>");
            
            $(".pagination").pagination({
                items: userListData.total_count,
                itemsOnPage: userListData.per_page,
                currentPage: userListData.current_page,
                cssStyle: 'light-theme',
                onPageClick: function(pageNumber, event) {
                    getUserlist(pageNumber);
                }
            });
        })
    }
 })
   
