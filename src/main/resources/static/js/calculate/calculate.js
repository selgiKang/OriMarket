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
        if(currentMonth==today.getMonth()&&currentYear==today.getFullYear()){
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
    // 테이블
    var tableBody = $('#tableBody');
    tableBody.empty();
    $('#calculate_main_totalIncome h3').empty();
    $('#calculate_main_totalIncome div').empty();

    if (data === null || data.length === 0) {
        var row = $('<tr></tr>');
        var noDataCell = $('<td colspan="2" class="no-data-cell" style="text-align: center;">정산 내역이 없습니다.</td>');
        row.append(noDataCell);
        tableBody.append(row);

        // 총 수입과 주문 횟수도 0으로 표시
        $('#calculate_main_totalIncome h3').text('총 수입 0원');
        $('#calculate_main_totalIncome div').text('주문 횟수 0번');
    }else{
        // 총합, 개수
        var totalCome = 0;
        var orderCount = data.length;

        for (var i = 0; i < data.length; i++) {
            totalCome += parseInt(data[i].totalPrice);
        }

        for (var i = 0; i < data.length; i++) {
            var dateString = data[i].date;
            var year = dateString.substr(0, 4);
            var month = dateString.substr(4, 2);
            var day = dateString.substr(6, 2);
            var formatDate  = year+"년 "+month+"월 "+day+"일";
            var row = $('<tr></tr>');
            var dateCell = $('<td class="calculate_main_table_td_1" style="text-align: center;"></td>');
            if (data[i].date) {
                // 기존 날짜 출력 부분 대신 아래 코드로 날짜를 링크로 만들어줍니다.
                var dateLink = $('<a></a>')
                    .attr('href', '/details?orderNumber=' + data[i].orderNumber)
                    .text(formatDate)
                dateCell.append(dateLink);
            } else {
                dateCell.text("");
            }
            var formattedTotalPrice = formatNumberWithCommas(data[i].totalPrice);
            var amountCell = $('<td class="calculate_main_table_td_2" style="text-align: center;"></td>').text(formattedTotalPrice + "원");

            row.append(dateCell);
            row.append(amountCell);
            tableBody.append(row);
        }

        // 숫자를 3자리마다 ','로 구분하여 한글로 표시하는 함수
        function formatNumberWithCommas(number) {
            return new Intl.NumberFormat('ko-KR').format(number);
        }

        var formattedTotalCome = formatNumberWithCommas(totalCome);
        $('#calculate_main_totalIncome h3').text('총 수입 ' + formattedTotalCome + '원');
        $('#calculate_main_totalIncome div').text('주문 횟수 ' + orderCount + '번');
    }

    //날짜 선택
   // $('#tableBody').on('click', 'tr', function () {
//         var date = $(this).find('.calculate_main_table_td_1').text().trim(); // 클릭한 날짜 가져오기
//         console.log('Clicked date:', date);
//
//         // 새 페이지로 이동하는 URL 생성
//         var url = '/details?date=' + date;
//         window.location.href = url; // 새 페이지로 이동
//     });
}


