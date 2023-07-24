$(document).ready(function() {
    // 탭 링크에 클릭 이벤트 리스너 추가
    $('.tab-link').on('click', function() {
        var tab = $(this).data('tab');
        $('.tab-link').removeClass('active'); // 모든 탭의 활성화 클래스 제거
        $(this).addClass('active'); // 클릭한 탭에 활성화 클래스 추가
        $('.order-item').hide(); // 모든 주문 항목을 숨김 처리

        // 선택된 탭에 해당하는 주문 항목을 표시
        $('.order-item[data-status="' + tab + '"]').show();
    });

    showTabContent("pending");

    // 주문번호 클릭 시 주문 상세 정보를 보여줄 버튼에 클릭 이벤트 리스너 추가
    $('.order-number').on('click', function() {
        var orderNumber = $(this).text().replace('주문번호 #', '');
        showOrderDetail(orderNumber);
    });
});


function showOrderDetail(orderNumber) {
    // 주문 상세 정보를 보여줄 코드 추가
    // 여기에 주문 상세 정보를 표시하는 로직을 구현하세요.
}
