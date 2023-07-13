$(document).ready(function() {
    var detailmenu_count = parseInt($(".detailmenu_count").text());
    /* 사람 필터 증가, 감소 */
    $(".menu_btn_minus").off().click(function () {
        console.log("Button clicked!");
        if (detailmenu_count > 0) {
            detailmenu_count--;
            $(".hotelList_filter_table_man").text(detailmenu_count);
        } else {
            detailmenu_count = 0;
        }
    });

    $(".menu_btn_plus").off().click(function () {
        console.log("Button clicked!");
        detailmenu_count++;
        $(".detailmenu_count").text(detailmenu_count);
    });

});