$(document).ready(function(){

    calendarInit();
    /* 시작 시 종료일이 오늘 날짜로 출력 */
  /*  document.getElementById('calculate_search_end_date').valueAsDate = new Date();

    let now_date = new Date();
    let end_date = new Date(document.getElementById('calculate_search_end_date').value);
    let right_arrow = document.getElementById('calculate_search_rightArrow');
    let right_arrow_a = right_arrow.parentElement;

    /!*종료 input date 영역 클릭시 실행*!/
    $("#calculate_search_end_date").on("click", function(){

        console.log("click!")
        if(end_date.toDateString() === now_date.toDateString()) {
            right_arrow.style.color='#545757';
            right_arrow_a.style.cursor='default';
            right_arrow_a.removeAttribute('href');
        }else{
            right_arrow.style.color='#CACCCE';
            right_arrow_a.style.cursor='pointer';
        }

    });*/

});


function calendarInit() {

    var date = new Date();
    //utc 표준시
    var utc = date.getTime()+(date.getTimezoneOffset()*60*100);
    //한국 kst 기준 시간
    var kstGap = 9*60*60*1000;
    //한국 시가능로 date 객체 (오늘)
    var today = new Date(utc+kstGap);


    //캘린더 출력
    var thisMonth = new Date(today.getFullYear(),today.getMonth(),today.getDate());
    var currentYear = thisMonth.getFullYear();
    var currentMonth = thisMonth.getMonth();

    renderCalender(thisMonth);

    function renderCalender(thisMonth) {

        currentYear = thisMonth.getFullYear();
        currentMonth = thisMonth.getMonth();


        //현재 월 표시
        $('#calculate_search_start_date').val(currentYear + '.' + (currentMonth + 1));

    }

    // 이전달로 이동
    $('.go-prev').on('click', function() {
        thisMonth = new Date(currentYear, currentMonth - 1, 1);
        renderCalender(thisMonth);
    });

        // 다음달로 이동
    $('.go-next').on('click', function() {
        thisMonth = new Date(currentYear, currentMonth + 1, 1);
        renderCalender(thisMonth);
    });

}
