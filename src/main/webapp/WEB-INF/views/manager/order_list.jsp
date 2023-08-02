<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--특정 위치마다 , 넣도록--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>Orimarket_managerOrderList</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="../../css/manager/order_list.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="../../js/manager/manager.js"></script>
    <script src="../../js/order/order_list.js"></script>
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
    <script>
        function loadPage(pageNumber) {
            $.ajax({
                url: '/orderListResult',
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
</head>
<body id="orderList_body">
    <div class="order-list">
        <div class="order-history-heading">
            <span>오리마켓</span> 주문내역
        </div>
        <div class="order_list_mypage">
            <div><a href="/manager_mypage">회원 정보 확인하기</a>
            <a href="/manager_logout">로그아웃</a></div>
        </div>
        <div class="tab">
            <span class="tab-link active" data-tab="pending">주문 요청 목록</span>
            <span class="tab-link" data-tab="processing1">픽업중</span>
            <span class="tab-link" data-tab="processing2">배달중</span>
            <span class="tab-link" data-tab="completed">배달 완료</span>
        </div>
        <%--주문 요청 목록--%>
        <div class="order-item" data-status="pending">
            <form action="/manager_order_search" method="post"><button type="submit">주문 내역 검색</button></form>
            <c:if test="${not empty orderList}">
                <c:forEach items="${orderList}" var="order">
                    <c:if test="${order.orderStatus eq null}">
                        <!-- 주문번호 클릭 시 주문 상세 정보를 보여줄 버튼 -->
                        <span class="order-number" onclick="showOrderDetail('${order.orderNumber}')">
                            <a href="/manager_receiptDelivery?orderNumber=${order.orderNumber}" style="color: #4caf50">주문번호: ${order.orderNumber}</a>
                        </span>
                        <span class="order-quantity">메뉴</span>
                        <c:forEach var="store" items="${order.newOrderDetails}">
                            <div class="order-details">
                                <span>${store.itemName} 총 ${store.itemCount}개</span>
                            </div>
                        </c:forEach>
                        <div>
                            <span class="order-price">총 금액 <fmt:formatNumber value="${order.orderTotalPrice}" pattern="#,###"/>원</span>
                        </div>

                        <%-- <div class="order-menu"></div>--%>
                        <div class="action-buttons">
                            <form action="/accept" method="get">
                                <input type="hidden" name="orderNumber" value="${order.orderNumber}">
                                <input type="hidden" name="managerUser" value="${sessionScope.managerSeq}">
                                <button class="accept-button">수락</button>
                            </form>
                            <form action="/reject" method="get">
                                <input type="hidden" name="orderNumber" value="${order.orderNumber}">
                                <input type="hidden" name="managerUser" value="${sessionScope.managerSeq}">
                                <button class="reject-button">거절</button>
                            </form>
                        </div>
                    </c:if>
                </c:forEach>
            </c:if>
            <c:if test="${empty orderList}">
                <p>주문이 없습니다.</p>
            </c:if>
        </div>
        <%--픽업중 목록--%>
        <div class="order-item" data-status="processing1">
            <c:if test="${not empty orderList}">
                <c:forEach items="${orderList}" var="order">
                    <c:if test="${order.orderStatus eq '주문수락'}">
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
                        <div class="action-buttons">
                            <form action="/acceptPickup" method="get">
                                <input type="hidden" name="orderNumber" value="${order.orderNumber}">
                                <button class="accept-button">픽업 완료</button>
                            </form>
                        </div>
                    </c:if>
                </c:forEach>
            </c:if>
            <c:if test="${empty orderList}">
                <p>주문이 없습니다.</p>
            </c:if>
        </div>
        <%--배달 시작--%>
        <div class="order-item" data-status="processing2">
            <c:if test="${not empty orderList}">
                <c:forEach items="${orderList}" var="order">
                    <c:if test="${order.orderStatus eq '배달시작'}">
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
            </c:if>
            <c:if test="${empty orderList}">
                <p>주문이 없습니다.</p>
            </c:if>
        </div>
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
<%--
        <div class="order-item" data-status="completed">
            <c:if test="${not empty orderList}">
                <c:forEach items="${orderList}" var="order">
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
            </c:if>
            <c:if test="${empty orderList}">
                <p>주문이 없습니다.</p>
            </c:if>
        </div>
--%>
    </div>
</body>

</html>
