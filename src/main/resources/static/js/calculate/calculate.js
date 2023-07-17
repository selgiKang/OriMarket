$(document).ready(function(){
    var currentYear; // 전역 변수로 선언
    calendarInit();
    // var currentDate = getCurrentDate();
    // var currentDateLast = getCurrentDateLast();
    // sendAjaxRequestGet(currentDate,currentDateLast);
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
        if (currentMonth < 0) {
            currentYear--;
            currentMonth = 11;
        }
        currentMonth--;
        var thisMonth = new Date(currentYear, currentMonth, 1);
        renderCalender(thisMonth);
        sendAjaxRequest();
    });

    // 다음달로 이동
    $('.go-next').on('click', function () {
        if (currentMonth > 11) {
            currentYear++;
            currentMonth = 0;
        }
        if(currentMonth==today.getMonth()){
            currentMonth--;
        }
        currentMonth++;
        var thisMonth = new Date(currentYear, currentMonth, 1);
        renderCalender(thisMonth);
        sendAjaxRequest();
    });
}

function getCurrentDate(){
    var date = new Date();
    var currentYear = date.getFullYear();
    var currentMonth = date.getMonth()+1;
    if(currentMonth<10){
        currentMonth="0"+currentMonth;
    }
    return currentYear+currentMonth;
}
function getCurrentDateLast(){
    var date = new Date();
    var currentYear = date.getFullYear();
    var currentMonth = date.getMonth()+2;
    if(currentMonth<10){
        currentMonth="0"+currentMonth;
    }
    return currentYear+currentMonth;
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
// function sendAjaxRequestGet(calculateDate, calculateDateLast){
//     $.ajax({
//         type: 'GET',
//         url: '/calculate',
//         data: {
//             calculate_date: calculateDate,
//             calculate_date_last: calculateDateLast
//         },
//         success: function (response){
//             updateTable(response)
//         },
//         error(xhr, status, error){
//             console.log(error);
//         }
//     })
// }

function updateTable(data) {

    //테이블
    var tableBody = $('#tableBody');
    tableBody.empty();
    $('#calculate_main_totalIncome h3').empty();
    $('#calculate_main_totalIncome div').empty();

    //총합, 개수
    var totalCome = 0;
    var orderCount  = data.length;


    for(var i=0;i<data.length;i++){
        totalCome += parseInt(data[i].amount);
    }

    for (var i = 0; i < data.length; i++) {
        var row = $('<tr></tr>');
        var dateCell = $('<td class="calculate_main_table_td_1" style="text-align: center;"></td>');
        if(data[i].date){
            dateCell.text(data[i].date.substr(0,8));
        }else {
            dateCell.text("")
        }
        var amountCell = $('<td class="calculate_main_table_td_2" style="text-align: center;"></td>').text(data[i].amount+"원");

        row.append(dateCell);
        row.append(amountCell);
        tableBody.append(row);
    }

    $('#calculate_main_totalIncome h3').text(totalCome+'원');
    $('#calculate_main_totalIncome div').text('주문 횟수 '+orderCount+'번');


}
