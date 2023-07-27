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
            dataType: "json",
            success: function (response) {
                if (response.success) {
                    alert(response.message);
                    // 주문을 수락한 후 주문 목록을 다시 가져오는 AJAX 요청
                    $.ajax({
                        type: "GET",
                        url: "/managerLoginResult",
                        dataType: "json",
                        success: function (orderList) {
                            updateOrderList(data.orderList, data.rtsResult);
                        },
                        error: function (xhr, status, error) {
                            alert("주문 목록을 가져오는 데 실패했습니다.");
                        }
                    });
                } else {
                    alert(response.message);
                }
            },
            error: function (xhr, status, error) {
                alert("서버와 통신 중 오류가 발생했습니다.");
            }
        });
    }

    function updateOrderList(orderList, rtsResult) {
        // 주문 목록을 표시하는 테이블의 DOM 요소를 선택
        var orderTable = $('#orderTable');

        // 기존에 테이블에 있던 내용을 모두 비우기
        orderTable.empty();

        // 새로운 주문 목록 데이터를 기반으로 테이블 다시 구성
        for (var i = 0; i < orderList.length; i++) {
            var order = orderList[i];
            var rts = rtsResult[i]; // 각 주문에 해당하는 상태 데이터

            // 새로운 행(tr) 추가
            var newRow = $('<tr>');

            // 주문 번호 열(td) 추가
            var orderNumberCell = $('<td>').text(order.orderNumber);
            newRow.append(orderNumberCell);

            // 주문 상태 열(td) 추가
            var orderStatusCell = $('<td>').text(getOrderStatus(rts));
            newRow.append(orderStatusCell);

            // 메뉴 열(td) 추가 (이하 필요한 열들도 마찬가지로 추가 가능)
            var menuCell = $('<td>').text(order.orderGoodsName + ' 총 ' + order.orderGoodsNum + '개');
            newRow.append(menuCell);

            // 주문 테이블에 새로운 행 추가
            orderTable.append(newRow);
        }
    }

// 주문 상태에 따라 표시할 문자열 반환 함수 (예시로 만든 함수)
    function getOrderStatus(rts) {
        if (rts.rtsOrderIng === 0 && rts.rtsRiderIng === 0 && rts.rtsRiderFinish === 0) {
            return '주문';
        } else if (rts.rtsOrderIng === 1 && rts.rtsRiderIng === 0 && rts.rtsRiderFinish === 0) {
            return '주문 시작';
        } else if (rts.rtsOrderIng === 1 && rts.rtsRiderIng === 1 && rts.rtsRiderFinish === 0) {
            return '배달 시작';
        } else if (rts.rtsOrderIng === 1 && rts.rtsRiderIng === 1 && rts.rtsRiderFinish === 1) {
            return '완료';
        } else {
            return '알 수 없음';
        }
    }

});


function showOrderDetail(orderNumber) {
    // 주문 상세 정보를 보여줄 코드 추가
    // 여기에 주문 상세 정보를 표시하는 로직을 구현하세요.
}


