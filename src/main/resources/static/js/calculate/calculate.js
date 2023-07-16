$(document).ready(function(){
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
    var currentYear = thisMonth.getFullYear();
    var currentMonth = thisMonth.getMonth();

    renderCalender(thisMonth);

    function renderCalender(thisMonth) {

        currentYear = thisMonth.getFullYear();
        currentMonth = thisMonth.getMonth();
        var currentMonthStr = (currentMonth + 1).toString();
        var  currentMonthStr2 = (currentMonth + 2).toString();

        //현재 월 표시
        if (currentMonthStr.length === 2) {
            /* 비교 달이 2자리 수 일 경우(10,11,12)*/
            if (currentMonthStr2.length === 2) {
                var currentDate = $('#calculate_date').val(currentYear + (currentMonth + 1));
                /* 해당 달 1달 후 */
                var currentDate_last = $('#calculate_date_last').val(currentYear + (currentMonth + 2));
                $('#calculate_search_date').text(currentYear + '.' + (currentMonth + 1));
                sendAjaxRequest(currentDate, currentDate_last);
                /* 비교 달이 1자리 수 일 경우*/
            } else {
                var currentDate = $('#calculate_date').val(currentYear + (currentMonth + 1));
                /* 해당 달 1달 후 */
                var currentDate_last = $('#calculate_date_last').val(currentYear + '0' + (currentMonth + 2));
                $('#calculate_search_date').text(currentYear + '.0' + (currentMonth + 1));
                sendAjaxRequest(currentDate, currentDate_last);
            }
        } else {
            if (currentMonthStr2.length === 2) {
                var currentDate = $('#calculate_date').val(currentYear + '0' + (currentMonth + 1));
                /* 해당 달 1달 후 */
                var currentDate_last = $('#calculate_date_last').val(currentYear + (currentMonth + 2));
                $('#calculate_search_date').text(currentYear + '.0' + (currentMonth + 1));
                sendAjaxRequest(currentDate, currentDate_last);
                /* 비교 달이 1자리 수 일 경우*/
            } else {
                var currentDate = $('#calculate_date').val(currentYear + '0' + (currentMonth + 1));
                /* 해당 달 1달 후 */
                var currentDate_last = $('#calculate_date_last').val(currentYear + '0' + (currentMonth + 2));
                $('#calculate_search_date').text(currentYear + '.0' + (currentMonth + 1));
                sendAjaxRequest(currentDate, currentDate_last);
            }

        }

    }

    // 이전달로 이동
    $('.go-prev').on('click', function () {
        thisMonth = new Date(currentYear, currentMonth - 1, 1);
        renderCalender(thisMonth);
    });

    // 다음달로 이동
    $('.go-next').on('click', function () {
        thisMonth = new Date(currentYear, currentMonth + 1, 1);
        renderCalender(thisMonth);
    });

}
function sendAjaxRequest(currentDate,currentDate_last){
    $.ajax({
        type: 'GET',
        url: '/calculate',
        data:{calculate_date: currentDate,
            calculate_date_last: currentDate_last},
        success: function (response){
           updateTable(response);
           //$('#totalIncomeAmount').text(response.totalIncome);
          // $('#orderCount').text('주문 횟수 '+response.orderCount+'회');
           //$('.calculate_main_table_td_1').text(response.)
        },
        error:function (xhr, status, error){

        }
    });
}

function  updateTable(data){
    var tableBody = $('#tableBody');
    tableBody.empty();

    for(var i = 0; i< data.length;i++){
        var row = $('<tr></tr>');
        var dateCell = $('<td class="calculate_main_table_td_1" style="text-align: center;"></td>').text(data[i].date);
        var amountCell = $('<td class="calculate_main_table_td_2" style="text-align: center;"></td>').text(data[i].amount);

        row.append(dateCell);
        row.append(amountCell);
        tableBody.append(row);
    }
}
