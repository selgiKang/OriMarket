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

<!-- 장바구니 상품 수량증가 감소-->