$(document).ready(function(){
    var currentYear; // 전역 변수로 선언
    calendarInit();
});


function calendarInit() {
    var date = new Date();
    //utc 표준시
    var utc = date.getTime() + (date.getTimezoneOffset() * 60 * 100);
    //한국 kst 기준 시간
    var kstGap = 9 * 60 * 60 * 1000;
    //한국 시가능로 date 객체 (오늘)
    var today = new Date(utc + kstGap);

    //캘린더 출력
    var thisMonth = new Date(today.getFullYear(), today.getMonth(), today.getDate());
    currentYear = thisMonth.getFullYear(); // 전역 변수에 할당
    var currentMonth = thisMonth.getMonth();

    renderCalender(thisMonth);

    // 이전달로 이동
    $('.go-prev').on('click', function () {
        currentMonth--;
        if (currentMonth < 0) {
            currentYear--;
            currentMonth = 11;
        }
        var thisMonth = new Date(currentYear, currentMonth, 1);
        renderCalender(thisMonth);
        sendAjaxRequest();
    });

    // 다음달로 이동
    $('.go-next').on('click', function () {
        currentMonth++;
        if (currentMonth > 11) {
            currentYear++;
            currentMonth = 0;
        }
        var thisMonth = new Date(currentYear, currentMonth, 1);
        renderCalender(thisMonth);
        sendAjaxRequest();
    });
}

function renderCalender(thisMonth) {
    var currentMonthStr = (thisMonth.getMonth() + 1).toString();
    var currentMonthStr2 = (thisMonth.getMonth() + 2).toString();

    //현재 월 표시
    if (currentMonthStr.length === 1) {
        currentMonthStr = '0' + currentMonthStr;
    }
    if (currentMonthStr2.length === 1) {
        currentMonthStr2 = '0' + currentMonthStr2;
    }

    var currentDate = currentYear + currentMonthStr;
    var currentDate_last = currentYear + currentMonthStr2;

    $('#calculate_date').val(currentDate);
    $('#calculate_date_last').val(currentDate_last);
    $('#calculate_search_date').text(currentYear + '.' + currentMonthStr);
}

function sendAjaxRequest(){
    var currentDate = $('#calculate_date').val();
    var currentDate_last = $('#calculate_date_last').val();

    $.ajax({
        type: 'POST',
        url: '/calculate',
        data: { calculate_date: currentDate, calculate_date_last: currentDate_last },
        success: function (response) {
            updateTable(response);
        },
        error: function (xhr, status, error) {
            console.log(error);
        }
    });
}

function updateTable(data) {
    var tableBody = $('#tableBody');
    tableBody.empty();

    for (var i = 0; i < data.length; i++) {
        var row = $('<tr></tr>');
        var dateCell = $('<td class="calculate_main_table_td_1" style="text-align: center;"></td>').text(data[i].date.substr(0,8));
        var amountCell = $('<td class="calculate_main_table_td_2" style="text-align: center;"></td>').text(data[i].amount+"원");

        row.append(dateCell);
        row.append(amountCell);
        tableBody.append(row);
    }
}
