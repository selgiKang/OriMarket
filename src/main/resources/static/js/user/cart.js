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




/*전체선택 및 해제*/
function  checkAll(){
    if($("#cboxAll").is(':checked')){
        $("input[name=cbox]").prop("checked",true);

    }else{
        $("input[name=cbox]").prop("checked",false);
    }
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

/*총 가격 산출*/

/*선택아이템 삭제*/

/*장바구니 비우기*/

/*전체,선택 상품 주문?*/
