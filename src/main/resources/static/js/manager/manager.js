$(document).ready(function() {
    // 탭 초기화
    function showTabContent(tab) {
        $('.tab-link').removeClass('active');
        $('.order-item').hide();
        $('.tab-link[data-tab="' + tab + '"]').addClass('active');
        $('.order-item[data-status="' + tab + '"]').show();
    }

    // 초기 페이지 진입 시 "pending" 탭 활성화
    showTabContent("pending");

    // 탭 클릭 시 이벤트 처리
    $('.tab-link').on('click', function() {
        var tab = $(this).data('tab');
        showTabContent(tab);
    });

    // 주문번호 클릭 시 주문 상세 정보를 보여줄 버튼에 클릭 이벤트 리스너 추가
    $('.order-number').on('click', function() {
        var orderNumber = $(this).text().replace('주문번호 #', '');
        showOrderDetail(orderNumber);
    });

    function acceptOrder(orderNumber) {
        $.ajax({
            type: "GET",
            url: "/accept",
            data: { orderNumber: orderNumber },
            dataType: "json", // 서버에서 JSON 형태로 응답을 보낼 것이므로 dataType을 명시합니다.
            success: function (response) {
                // 서버에서 JSON 형태로 응답이 온 경우에만 실행됩니다.
                if (response.success) {
                    alert(response.message); // "주문이 수락되었습니다."와 같은 메시지를 출력하거나 필요한 동작을 수행합니다.
                    location.href = "/"; // 페이지를 새로고침하여 변경된 데이터를 반영할 수 있도록 합니다.
                } else {
                    alert(response.message); // "주문 수락 처리에 실패했습니다."와 같은 메시지를 출력하거나 필요한 동작을 수행합니다.
                }
            },
            error: function (xhr, status, error) {
                // AJAX 요청이 실패했을 때 실행됩니다.
                alert("서버와 통신 중 오류가 발생했습니다.");
            }
        });
    }
});


function showOrderDetail(orderNumber) {
    // 주문 상세 정보를 보여줄 코드 추가
    // 여기에 주문 상세 정보를 표시하는 로직을 구현하세요.
}
