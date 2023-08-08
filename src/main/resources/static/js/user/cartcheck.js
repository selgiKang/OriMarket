
$(document).ready(function (){
    setTotalInfo();
});

//체크여부에 따라 total정보 변환
$(".individual_checkbox").on("change",function (){
    setTotalInfo($(".cart_info"));
});


//총 주문 정보 세팅

function setTotalInfo(){
    /*총 가격*/
    let totalPrice=0;
    /*총 갯수*/
    let totalCount=0;
    /*배달료*/
    let deliveryPrice=0;
    /*최종가격(총가격+배달료)*/
    let finalTotalPrice=0;

    $(".cart_info").each(function (index,element){
        if($(element).find(".individual_checkbox").is(":checked")===true){
            totalPrice += parseInt($(element).find(".individual_totalPrice").val());
            totalCount += parseInt($(element).find(".individual_totalCount").val());

        }
    });


    if(totalPrice >= 30000){
        deliveryPrice = 0;
    }else if(totalPrice == 0) {
        deliveryPrice = 0;
    }else{
        deliveryPrice=3000;
    }
    finalTotalPrice = totalPrice+deliveryPrice;

    $(".cart_cost_totalPrice").text(addCommasToNumber(totalPrice)+"원");
    $(".cart_cost_deliveryPrice").text(addCommasToNumber(deliveryPrice)+"원");
    $(".cart_cost_finalTotalPrice").text(addCommasToNumber(finalTotalPrice)+"원");
}

function addCommasToNumber(number) {
    let numStr = number.toString();
    if (numStr.length <= 3) {
        return numStr;
    }

    let reversedStr = numStr.split('').reverse().join('');
    let formattedStr = reversedStr.match(/.{1,3}/g).join(',');
    return formattedStr.split('').reverse().join('');
}