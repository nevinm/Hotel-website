$(document).ready(function() {
    DeliverySlots.initView();
});
//Define DeliverySlots namespace
var DeliverySlots = (function() {
    var dataObject = {
        dateWeek: {
            thisStart: "",
            thisEnd: "",
            nextStart: "",
            nextEnd: ""
        }
    };
    //Init the view
    function initView() {
        loadViewDefaults();
        bindEvents();
    }
    //Load the default UI elements
    function loadViewDefaults() {
        loadAllocatedSlots();
    }
    //Bind events to the elements
    function bindEvents() {
        $('.week-section input[type="text"]').off().keyup(function(e) {
            if (/\D/g.test(this.value)) {
                // Filter non-digits from input value.
                this.value = this.value.replace(/\D/g, '');
            } else if (this.value > 0) {
                $(this).removeAttr('style');
            } else if (this.value == 0) {
                $(this).attr("style", "color:#E86565;");
            }
        });
        $("#applySlots").off().on("click", function(e) {
            e.preventDefault();
            applySlots();
        })
    }
    //Initiate Allocated slots API call
    function loadAllocatedSlots() {
        var url = baseURL + 'cms/get_delivery_slots/';
        var header = {
            "session-key": localStorage['session_key']
        };
        var data = JSON.stringify(getDateRangeRequest());
        var getIngredientsList = new AjaxHttpSender();
        getIngredientsList.sendPost(url, header, data, DeliverySlots.getThisWeekCallback);
        data = JSON.stringify(getDateRangeRequest("next"));
        getIngredientsList.sendPost(url, header, data, DeliverySlots.getNextWeekCallback);
    }
    //Get the allocated slots formatted request
    function getDateRangeRequest(week) {
        var startDay = 1; //0=sunday, 1=monday etc.
        var currentDay = new Date().getDay(); //get the current day
        var weekStart = new Date(new Date().valueOf() - (currentDay <= 0 ? 7 - startDay : currentDay - startDay) * 86400000); //rewind to start day
        var weekEnd = getNthDate(weekStart, 6);
        dataObject.dateWeek.thisStart = weekStart;
        dataObject.dateWeek.thisEnd = weekEnd;
        if (week === "next") {
            weekStart = getNthDate(weekEnd, 1);
            weekEnd = getNthDate(weekStart, 6);
            dataObject.dateWeek.nextStart = weekStart;
            dataObject.dateWeek.nextEnd = weekEnd;
        }
        var fromDate = getFormattedDate(weekStart, "MM-DD-YYYY");
        var toDate = getFormattedDate(weekEnd, "MM-DD-YYYY");
        return {
            "from_date": fromDate,
            "to_date": toDate
        };
    }
    //get nth day's date from an input date
    function getNthDate(date, n) {
        return new Date(date.valueOf() + n * 86400000);
    }
    //Get formatted date
    function getFormattedDate(date, format) {
        if (format === "MM-DD-YYYY") {
            return ('0' + (date.getMonth() + 1)).slice(-2) + '-' + ('0' + date.getDate()).slice(-2) + '-' + date.getFullYear();
        } else if (format === "date") {
            return new Date(date.replace(/(\d{2})-(\d{2})-(\d{4})/, "$1/$2/$3"));
        }
    }
    //Populate the allocated slots data from API
    function populateWeeklyData(responseData, table) {
        var dataArray = responseData.aaData;
        var dayArray = ["SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"];
        var html = "";
        var date = new Date();
        var currentDate = new Date().setHours(0, 0, 0, 0);
        $.each(dataArray, function(key, value) {
            date = getFormattedDate(value.date, "date");
            if (date.valueOf() == currentDate) {
                html += '<tr><th style="color:#8EC657;">' + dayArray[date.getDay()] + ' ' + date.getDate() + '</th>';
            } else {
                html += '<tr><th>' + dayArray[date.getDay()] + ' ' + date.getDate() + '</th>';
            }
            if (date.valueOf() < currentDate) {
                html += '<td><input type="text" value="' + value.slot1 + '" maxlength="3" disabled></td>' + '<td><input maxlength="3" type="text" value="' + value.slot2 + '" disabled></td>' + '<td><input  maxlength="3" type="text" value="' + value.slot3 + '" disabled></td>' + '<td><input  maxlength="3" type="text" value="' + value.slot4 + '" disabled></td>' + '<td><input  maxlength="3" type="text" value="' + value.slot5 + '" disabled></td></tr>';
            } else {
                html += isZeroSlot(value.slot1) + isZeroSlot(value.slot2) + isZeroSlot(value.slot3) + isZeroSlot(value.slot4) + isZeroSlot(value.slot5) + '</tr>';
            }
        });
        html += addHolday(getNthDate(date, 1), dayArray);
        html += addHolday(getNthDate(date, 2), dayArray);
        $(table + " tbody").html(html);
        bindEvents();
    }
    //Add Holiday disabled slots
    function addHolday(date, dayArray) {
        return '<tr class="holidays"><th>' + dayArray[date.getDay()] + ' ' + date.getDate() + '</th>' + '<td><input  maxlength="3" type="text" disabled></td>' + '<td><input  maxlength="3" type="text" disabled></td>' + '<td><input maxlength="3" type="text" disabled></td>' + '<td><input maxlength="3" type="text" disabled></td>' + '<td><input type="text"  maxlength="3" disabled></td></tr>';
    }
    //Add slot values according to priority
    function isZeroSlot(slot) {
        if (slot !== undefined && parseInt(slot) === 0) {
            return '<td><input type="text" value="' + slot + '" style="color:#E86565;" maxlength="3"></td>';
        } else {
            return '<td><input type="text" value="' + slot + '" maxlength="3"></td>';
        }
    }
    //Apply slots on Apply button click
    function applySlots() {
        var thisWeekObject = getDateRangeRequest();
        var nextWeekObject = getDateRangeRequest("next");
        var requestObject = {
            "from_date": thisWeekObject.from_date,
            "to_date": nextWeekObject.to_date,
            "slots_list": new Array()
        }
        requestObject = getSlotsArray($("#thisWeek tbody tr:not(.holidays)"), requestObject, dataObject.dateWeek.thisStart);
        requestObject = getSlotsArray($("#nextWeek tbody tr:not(.holidays)"), requestObject, dataObject.dateWeek.nextStart);
        var url = baseURL + 'cms/manage_delivery_slots/';
        var header = {
            "session-key": localStorage['session_key']
        };
        var data = JSON.stringify(requestObject);
        var getIngredientsList = new AjaxHttpSender();
        getIngredientsList.sendPost(url, header, data, DeliverySlots.getApplySlotsCallback);
    }
    //to get the slots array in request format
    function getSlotsArray(element, requestObject, startDate) {
        $.each(element, function(rowKey, rowValue) {
            var tdArray = $(rowValue).find('td input[type=text]');
            var object = {
                "date": getFormattedDate(getNthDate(startDate, rowKey), "MM-DD-YYYY"),
                "slot1": $(tdArray[0]).val() !== "" ? $(tdArray[0]).val() : 0,
                "slot2": $(tdArray[1]).val() !== "" ? $(tdArray[1]).val() : 0,
                "slot3": $(tdArray[2]).val() !== "" ? $(tdArray[2]).val() : 0,
                "slot4": $(tdArray[3]).val() !== "" ? $(tdArray[3]).val() : 0,
                "slot5": $(tdArray[4]).val() !== "" ? $(tdArray[4]).val() : 0
            };
            requestObject["slots_list"].push(object);
        });
        return requestObject;
    }
    //callback to 'This Week Slot data'
    var getThisWeekCallback = {
            success: function(data, textStatus) {
                var responseData = JSON.parse(data);
                if (responseData.status == 1) {
                    populateWeeklyData(responseData, "#thisWeek");
                } else {
                    showPopup(responseData);
                }
            },
            failure: function(XMLHttpRequest, textStatus, errorThrown) {}
        }
        //callback to 'Next Week Slot data'
    var getNextWeekCallback = {
            success: function(data, textStatus) {
                var responseData = JSON.parse(data);
                if (responseData.status == 1) {
                    populateWeeklyData(responseData, "#nextWeek");
                } else {
                    showPopup(responseData);
                }
            },
            failure: function(XMLHttpRequest, textStatus, errorThrown) {}
        }
        //callback to apply slots callback
    var getApplySlotsCallback = {
        success: function(data, textStatus) {
            var responseData = JSON.parse(data);
            if (responseData.status == 1) {
                loadAllocatedSlots();
                responseData.message = "Delivery slots are updated successfully.";
                showPopup(responseData);
            } else {
                
                showPopup(responseData);
            }
        },
        failure: function(XMLHttpRequest, textStatus, errorThrown) {}
    }
    return {
        initView: initView,
        getThisWeekCallback: getThisWeekCallback,
        getNextWeekCallback: getNextWeekCallback,
        getApplySlotsCallback: getApplySlotsCallback
    };
})();