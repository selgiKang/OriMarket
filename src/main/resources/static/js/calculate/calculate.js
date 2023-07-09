$(document).ready(function(){
    document.getElementById('calculate_search_end_date').valueAsDate = new Date();
});

function end_date(){

    let now_date = new Date();
    let end_date = document.getElementById('calculate_search_end_date').valueAsDate;
    let right_arrow = document.getElementById('calculate_search_rightArrow');

    if(end_date == now_date) {
        right_arrow.style.color="#CACCCE";
        document.getElementById('calculate_right_arrow').disabled=true;
    }
}
