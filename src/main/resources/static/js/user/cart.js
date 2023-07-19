<!-- 배달/포장 선택에 따라 보여지는 div가 다르게 -->
$(()=>{
    $('#cart_checkDelivery a').bind('click',function(){
        $('#cart_checkDelivery a.current').removeClass('current');
        $('.cart_section:visible').hide();
        $(this.hash).show();

        $(this).addClass('current');
        e.preventDefault;
    }).filter(':first').click();
});

/*장바구니 상품 수량증가 감소*/

function minusBtn(cartItemId) {
    $.ajax({
        type: 'put',
        url: '/user/cart',
        data: {"cartItemId": cartItemId, "type": "minus"},
        dataType: "text",
        success: function (result) {
            console.log(result);
            if (result === "ok") {
                location.reload();
            }
        },
        error: function () {
            alert('ㅇㅔㄹㅓ');
        }

    });
}

function plusBtn(cartItemId){
    $.ajax({
        type: 'put',
        url: '/user/cart',
        data: {"cartItemId": cartItemId, "type": "plus"},
        dataType: "text",
        success: function (result) {
            console.log(result);
            if (result === "ok") {
                location.reload();
            }
        },
        error: function () {
            alert('ㅇㅔㄹㅓ');
        }

    });
}





/*전체선택 및 해제*/
function  checkAll(){
    if($("#cboxAll").is(':checked')){
        $("input[name=cbox]").prop("checked",true);

    }else{
        $("input[name=cbox]").prop("checked",false);
    }
    setTotalInfo($(".cart_info"));
}

/*
전체선택이 된 상태에서 체크박스가 하나라도 체크해제될 경우 전체선택 체크가 해제되게.*/
$(document).on("click","input:checkbox[name=cbox]",function (e){

    var chks = document.getElementsByName("cbox");
    var chksChecked = 0;

    for(var i=0; i<chks.length; i++){
        var cbox = chks[i];

        if(cbox.checked){
            chksChecked++;
        }
    }
    if(chks.length == chksChecked){
        $("#cboxAll").prop("checked",true);
    }else{
        $("#cboxAll").prop("checked",false);
    }
});


/*선택아이템 삭제*/
function deleteBtn(cartItemId){
    $.ajax({
        type:'delete',
        url:"/user/cart",
        data:{"cartItemId":cartItemId},
        dataType:"text",
        success:function (result){
            console.log(result);
            if(result==="ok"){
                location.reload();
            }
        },
        error:function (){
            alert("에러");
        }
    })
}



/*checked된 값만 가격 불러오기...*/

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
    }else if(totalPrice ==0){
        deliveryPrice=0;
    }else{
        deliveryPrice=3000;
    }
    finalTotalPrice = totalPrice+deliveryPrice;

    $(".cart_cost_totalPrice").text(totalPrice+"원");
    $(".cart_cost_deliveryPrice").text(deliveryPrice+"원");
    $(".cart_cost_finalTotalPrice").text(finalTotalPrice+"원");


}

/*checked된 값만 결제 넘어가게 만들어야함,,*/


/*수량 1개 이하일때는 minus버튼 비활성화*/
