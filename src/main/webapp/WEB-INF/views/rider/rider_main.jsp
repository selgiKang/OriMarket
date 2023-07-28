<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.choongang.OriMarket.order.Order" %>
<%@ page import="java.util.List" %>
<%@ page import="com.choongang.OriMarket.RealTimeStatus.RealTimeStatus" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    </style>
</head>
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
        <span class="tab-link" data-tab="processing1">요청수락 목록</span>
        <span class="tab-link" data-tab="processing2">배달 시작</span>
        <span class="tab-link" data-tab="completed">배달 완료</span>
    </div>
    <%--배달 요청 목록--%>
    <div class="order-item" data-status="pending">
        <form action="/rider_order_search" method="get"><button type="submit">배달요청검색</button></form>
        <c:forEach var="order" items="${orders}">
            <div>
            <h3>요청시장: ${order.orderMarketName}</h3>
            <h4>주문번호: ${order.orderNumber}</h4>
                <c:if test="${empty order.forRider}">
                <h4>요청사항이 없습니다.!</h4>
                </c:if>
                <c:if test="${!empty order.forRider}">
                    <h4>${order.forRider}</h4>
                </c:if>
                <h3>배달지: ${order.orderAddress}</h3>
                <a href="/rider_order_accept?orderNumber=${order.orderNumber}"><button type="submit">수락</button></a>
            </div>
        </c:forEach>
    </div>
    <%--요청 수락 목록--%>
    <div class="order-item" data-status="processing1">
        <c:if test="${!empty orderaccept}">
            ${orderaccept.orderNumber}
            <a href="/rider_order_accept1?orderNumber=${orderaccept.orderNumber}"><button type="submit">수락</button></a>
        </c:if>
    </div>
    <%--배달 시작--%>
    <div class="order-item" data-status="processing2">
    </div>
    <%--배달 완료--%>
    <div class="order-item" data-status="completed">
        <c:if test="${!empty orderaccept1}">
            <p>${orderaccept1.orderNumber}</p>
            <p>주문 현황:${orderaccept1.orderStatus}</p>
        </c:if>
    </div>
    <div class="order-item" data-status="processing" style="display: none;"></div>
    <div class="order-item" data-status="completed" style="display: none;"></div>
</div>
</body>
</html>
