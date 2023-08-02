    function loadPage(pageNumber) {
    $.ajax({
        url: '/orderListResult',
        type: 'POST',
        data: { 'page': pageNumber},
        dataType: 'json',
        success: function (response) {
            try {
                // 서버에서 전달된 JSON 데이터를 JavaScript 객체로 파싱
                // jsonData에서 필요한 정보를 추출하여 페이지에 추가하는 로직을 작성
                var orderList = response.content;
                // // 주문 정보를 표시할 HTML을 생성하는 함수
                // function generateOrderHTML(order) {
                //     // ... 주문 정보를 HTML 문자열로 변환하는 코드 ...
                // }
                // 주문 정보를 추가할 요소를 선택하고, 기존 내용을 지우고 새로운 주문 정보를 추가
                var orderItemDiv = $('.order_pageing').eq(0);
                orderItemDiv.empty(); // 기존 내용 초기화

                orderList.forEach(function(order) {
                    console.log(4);
                    if (order.orderStatus === '배달완료' || order.orderStatus === '주문거절') {
                        orderItemDiv.append(generateOrderHTML(order));
                    }
                });
                var paginationHTML = generatePaginationHTML(response);
                $('.pagination').replaceWith(paginationHTML);
            } catch (e) {
                console.log("e");
            }
        },
        error: function (xhr, status, errorThrown) {
            console.log(errorThrown);
            alert('서버와 통신 중 오류가 발생했습니다.');
        }
    });
}

    function generateOrderHTML(order) {
    // 주문번호 클릭 시 주문 상세 정보를 보여줄 버튼
    var orderNumberLink = $('<a></a>')
    .attr('href', '/manager_receiptDelivery?orderNumber=' + order.orderNumber)
    .text('주문번호: ' + order.orderNumber)
    .css('color', '#4caf50');

    var orderNumberSpan = $('<span></span>')
    .addClass('order-number')
    .append(orderNumberLink);

    var orderDetailsDiv = $('<div></div>').addClass('order-details');
    order.newOrderDetails.forEach(function(detail) {
    var itemInfoSpan = $('<span></span>')
    .text(detail.itemName + ' 총 ' + detail.itemCount + '개');
    orderDetailsDiv.append(itemInfoSpan);
});

    var orderPriceSpan = $('<span></span>')
    .addClass('order-price')
    .text('총 금액 ' + order.orderTotalPrice + '원');

    var orderDiv = $('<div></div>')
    .addClass('order-item')
    .attr('data-status', 'completed1')
    .append(orderNumberSpan, orderDetailsDiv, orderPriceSpan);
    return orderDiv;
}

    function generatePaginationHTML(resultPage) {
    var paginationHTML = $('<ul></ul>').addClass('pagination');

    if (!resultPage.first) {
    paginationHTML.append($('<li></li>').append($('<a href="javascript:void(0);">이전</a>').attr('onclick', 'loadPage(' + (resultPage.number - 1) + ')')));
} else {
    paginationHTML.append($('<li></li>').addClass('disabled').append($('<span>이전</span>')));
}

    for (var i = 0; i < resultPage.totalPages; i++) {
    if (i === resultPage.number) {
    paginationHTML.append($('<li></li>').addClass('active').append($('<span>' + (i + 1) + '</span>')));
} else {
    paginationHTML.append($('<li></li>').append($('<a href="javascript:void(0);">' + (i + 1) + '</a>').attr('onclick', 'loadPage(' + i + ')')));
}
}

    if (!resultPage.last) {
    paginationHTML.append($('<li></li>').append($('<a href="javascript:void(0);">다음</a>').attr('onclick', 'loadPage(' + (resultPage.number + 1) + ')')));
} else {
    paginationHTML.append($('<li></li>').addClass('disabled').append($('<span>다음</span>')));
}

    return paginationHTML;
}
