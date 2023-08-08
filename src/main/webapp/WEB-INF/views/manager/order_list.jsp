<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
    <%-- <style>
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
     </style>--%>
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
        <form action="/manager_order_search" method="post">
            <button type="submit">주문 내역 검색</button>
        </form>
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
                        <span class="order-price">총 금액 <fmt:formatNumber value="${order.orderTotalPrice}"
                                                                         pattern="#,###"/>원</span>
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
                <c:if test="${order.orderStatus eq '주문수락' or order.orderStatus eq '픽업완료'}">
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
                        <span class="order-price">총 금액 <fmt:formatNumber value="${order.orderTotalPrice}"
                                                                         pattern="#,###"/>원</span>
                    </div>
                    <c:if test="${order.orderStatus eq '주문수락'}">
                        <div class="action-buttons">
                            <form action="/acceptPickup" method="get">
                                <input type="hidden" name="orderNumber" value="${order.orderNumber}">
                                <button class="accept-button">픽업 완료</button>
                            </form>
                        </div>
                    </c:if>
                    <c:if test="${order.orderStatus eq '픽업완료' and order.deliveryType ne '포장'}">
                        <div class="action-buttons">
                            <button class="accept-button">배차 요청중..</button>
                        </div>
                    </c:if>
                    <c:if test="${order.orderStatus eq '픽업완료' and order.deliveryType eq '포장'}">
                        <div class="action-buttons">
                            <form action="/acceptPickupman" method="get">
                                <input type="hidden" name="orderNumber" value="${order.orderNumber}">
                                <button class="accept-button">전달 완료</button>
                            </form>
                        </div>
                    </c:if>
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
                        <span class="order-price">총 금액 <fmt:formatNumber value="${order.orderTotalPrice}"
                                                                         pattern="#,###"/>원</span>
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
                        <span class="order-price">총 금액 <fmt:formatNumber value="${order.orderTotalPrice}"
                                                                         pattern="#,###"/>원</span>
                    </div>
                    <hr style="color: #666666">
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
