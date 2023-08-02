<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>Orimarket_managerOrderList</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="../../css/manager/order_list.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="../../js/manager/manager.js"></script>
    <style>
        .order-number>a{
            color: #333333;
            text-decoration: none;
        }
        .order-number>a:hover {
            cursor: pointer;
            opacity: 0.7;
        }
        /* 페이지네이션 가로 정렬 스타일 */
        .pagination {
            display: flex;
            list-style: none;
            padding: 0;
            margin: 0;
        }

        .pagination li {
            margin: 0 5px;
        }
    </style>
</head>
<script>
    function loadPage(pageNumber) {
        $.ajax({
            url: '/riderResult',
            type: 'POST',
            data: {
                'page': pageNumber,
            },
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

</script>
<body id="orderList_body">
<div class="order-list">
    <div class="order-history-heading">
        <span>오리마켓</span> (라이더)
    </div>
    <div class="order_list_mypage">
        <div><a href="/manager_mypage">마이페이지</a>
            <a href="/manager_logout">로그아웃</a></div>
    </div>
    <div class="tab">
        <span class="tab-link" data-tab="pending">배달요청 목록</span>
        <span class="tab-link" data-tab="processing1">배달 시작</span>
        <span class="tab-link" data-tab="processing2">배달 중</span>
        <span class="tab-link" data-tab="completed">배달 완료</span>
    </div>
    <%--배달 요청 목록--%>
    <div class="order-item" data-status="pending">
        <form action="/rider_order_search" method="get"><button type="submit">배달요청검색</button></form>
        <c:forEach var="order" items="${orders}">
            <div>
            <h3>요청시장: ${order.orderMarketName} <a href="/MarketLocation?marketName=${order.orderMarketName}">위치보기</a></h3>
            <h4>주문번호: ${order.orderNumber}</h4>
                <c:if test="${empty order.forRider}">
                <h4>요청사항이 없습니다.!</h4>
                </c:if>
                <c:if test="${!empty order.forRider}">
                    <h4>요청사항: ${order.forRider}</h4>
                </c:if>
                <h3>배달지: ${order.orderAddress} <a href="/deliveryLocation?orderAddress=${order.orderAddress}">위치보기</a></h3>
                <a href="/rider_order_accept?orderNumber=${order.orderNumber}"><button type="submit">요청 수락</button></a>
            </div>
        </c:forEach>
    </div>
    <%--배달 시작 목록--%>
    <div class="order-item" data-status="processing1">
        <c:if test="${!empty orderaccept}">
            <div>
                <h3>요청시장: ${orderaccept.orderMarketName} <a href="/MarketLocation?marketName=${orderaccept.orderMarketName}">위치보기</a></h3>
                <h4>주문번호: ${orderaccept.orderNumber}</h4>
                <c:if test="${empty orderaccept.forRider}">
                    <h4>요청사항이 없습니다.!</h4>
                </c:if>
                <c:if test="${!empty orderaccept.forRider}">
                    <h4>요청사항: ${orderaccept.forRider}</h4>
                </c:if>
                <h3>배달지: ${orderaccept.orderAddress} <a href="/deliveryLocation?orderAddress=${order.orderAddress}">위치보기</a></h3>
                <a href="/rider_order_accept1?orderNumber=${orderaccept.orderNumber}"><button type="submit">배달시작</button></a>
            </div>
        </c:if>
    </div>
    <%--배달 중 목록--%>
    <div class="order-item" data-status="processing2">
        <c:if test="${!empty orderaccept1}">
            <div>
                <h3>요청시장: ${orderaccept1.orderMarketName} <a href="/MarketLocation?marketName=${orderaccept1.orderMarketName}">위치보기</a></h3>
                <h4>주문번호: ${orderaccept1.orderNumber}</h4>
                <c:if test="${empty orderaccept1.forRider}">
                    <h4>요청사항이 없습니다.!</h4>
                </c:if>
                <c:if test="${!empty orderaccept1.forRider}">
                    <h4>요청사항: ${orderaccept1.forRider}</h4>
                </c:if>
                <h3>배달지: ${orderaccept1.orderAddress} <a href="/deliveryLocation?orderAddress=${orderaccept1.orderAddress}">위치보기</a></h3>
                <a style="text-align: right;" href="/rider_order_accept2?orderNumber=${orderaccept1.orderNumber}"><button type="submit">배달완료</button></a>
            </div>
        </c:if>
    </div>
    <!-- 배달 완료 -->
    <%--배달 완료--%>
    <div class="order-item" data-status="completed">
        <div class="order_pageing">
            <c:if test="${not empty resultPage}">
            <c:forEach items="${resultPage.content}" var="order">
                <c:if test="${order.orderStatus eq '배달완료' or order.orderStatus eq '주문거절'}">
                    <!-- 주문번호 클릭 시 주문 상세 정보를 보여줄 버튼 -->
                    <span class="order-number" onclick="showOrderDetail('${order.orderNumber}')">
                        <a href="/manager_receiptDelivery?orderNumber=${order.orderNumber}" style="color: #4caf50">주문번호: ${order.orderNumber}</a>
                </span>
                    <c:forEach var="store" items="${order.newOrderDetails}">
                        <div class="order-details">
                            <span>${store.itemName} 총 ${store.itemCount}개</span>
                        </div>
                    </c:forEach>
                    <div>
                        <span class="order-price">총 금액 <fmt:formatNumber value="${order.orderTotalPrice}" pattern="#,###"/>원</span>
                    </div>
                </c:if>
            </c:forEach>
        </div>
        <c:if test="${resultPage.totalPages > 1}">
            <ul class="pagination">
                <c:choose>
                    <c:when test="${not resultPage.first}">
                        <li><a href="javascript:void(0);" onclick="loadPage(${resultPage.number - 1})">이전</a></li>
                    </c:when>
                    <c:otherwise>
                        <li class="disabled"><span>이전</span></li>
                    </c:otherwise>
                </c:choose>

                <c:forEach var="i" begin="0" end="${resultPage.totalPages - 1}">
                    <c:choose>
                        <c:when test="${i == resultPage.number}">
                            <li class="active"><span>${i + 1}</span></li>
                        </c:when>
                        <c:otherwise>
                            <li><a href="javascript:void(0);" onclick="loadPage(${i})">${i + 1}</a></li>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>

                <c:choose>
                    <c:when test="${not resultPage.last}">
                        <li><a href="javascript:void(0);" onclick="loadPage(${resultPage.number + 1})">다음</a></li>
                    </c:when>
                    <c:otherwise>
                        <li class="disabled"><span>다음</span></li>
                    </c:otherwise>
                </c:choose>
            </ul>
        </c:if>
        </c:if>
        <c:if test="${empty resultPage}">
            <p>주문이 없습니다.</p>
        </c:if>
    </div>
</div>
</body>
</html>
