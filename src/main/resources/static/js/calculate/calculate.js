$(document).ready(function(){

    /* 시작 시 종료일이 오늘 날짜로 출력 */
    document.getElementById('calculate_search_end_date').valueAsDate = new Date();

    let now_date = new Date();
    let end_date = new Date(document.getElementById('calculate_search_end_date').value);
    let right_arrow = document.getElementById('calculate_search_rightArrow');
    let right_arrow_a = right_arrow.parentElement;

    /*종료 input date 영역 클릭시 실행*/
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

    });
});
