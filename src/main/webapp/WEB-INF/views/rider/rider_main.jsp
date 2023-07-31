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
        <span class="tab-link" data-tab="processing1">배달 시작</span>
        <span class="tab-link" data-tab="processing2">배달 중</span>
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
                    <h4>요청사항: ${order.forRider}</h4>
                </c:if>
                <h3>배달지: ${order.orderAddress}</h3>
                <a href="/rider_order_accept?orderNumber=${order.orderNumber}"><button type="submit">요청 수락</button></a>
            </div>
        </c:forEach>
    </div>
    <%--배달 시작 목록--%>
    <div class="order-item" data-status="processing1">
        <c:if test="${!empty orderaccept}">
            <div>
                <h3>요청시장: ${orderaccept.orderMarketName}</h3>
                <h4>주문번호: ${orderaccept.orderNumber}</h4>
                <c:if test="${empty orderaccept.forRider}">
                    <h4>요청사항이 없습니다.!</h4>
                </c:if>
                <c:if test="${!empty orderaccept.forRider}">
                    <h4>요청사항: ${orderaccept.forRider}</h4>
                </c:if>
                <h3>배달지: ${orderaccept.orderAddress}</h3>
                <a href="/rider_order_accept1?orderNumber=${orderaccept.orderNumber}"><button type="submit">배달시작</button></a>
            </div>
        </c:if>
    </div>
    <%--배달 중 목록--%>
    <div class="order-item" data-status="processing2">
        <c:if test="${!empty orderaccept1}">
            <div>
                <h3>요청시장: ${orderaccept1.orderMarketName}</h3>
                <h4>주문번호: ${orderaccept1.orderNumber}</h4>
                <c:if test="${empty orderaccept1.forRider}">
                    <h4>요청사항이 없습니다.!</h4>
                </c:if>
                <c:if test="${!empty orderaccept1.forRider}">
                    <h4>요청사항: ${orderaccept1.forRider}</h4>
                </c:if>
                <h3>배달지: ${orderaccept1.orderAddress}</h3>
                <a style="text-align: right;" href="/rider_order_accept2?orderNumber=${orderaccept1.orderNumber}"><button type="submit">배달완료</button></a>
            </div>
        </c:if>
    </div>
    <%--배달 완료--%>
    <div class="order-item" data-status="completed">
        <c:forEach var="riderOrder" items="${orderaccept2}">
        <c:if test="${riderOrder.orderStatus eq '배달완료'}">
            <div style="border-bottom: ${loopStatus.last ? 'none' : '1px solid #000000;'}">
                <h3>요청시장: ${riderOrder.orderMarketName}</h3>
                <h4>주문번호: ${riderOrder.orderNumber}</h4>
                <c:if test="${empty riderOrder.forRider}">
                    <h4>요청사항이 없습니다.!</h4>
                </c:if>
                <c:if test="${!empty riderOrder.forRider}">
                    <h4>요청사항: ${riderOrder.forRider}</h4>
                </c:if>
                <h3>배달지: ${riderOrder.orderAddress}</h3>
                <h3>배달상태: ${riderOrder.orderStatus}</h3>
            </div>
        </c:if>
        </c:forEach>
        <button onclick="goprevpage()">이전페이지</button><button onclick="location.href='/nextpage'">다음페이지</button>
    </div>
    <div class="order-item" data-status="processing" style="display: none;"></div>
    <div class="order-item" data-status="completed" style="display: none;"></div>
</div>
</body>
<script>
    var cntpage = 1;
    function goprevpage(){
        cntpage--;
            $.ajax({
                type: "POST",
                url: "/usermarketSearch",
                data: {
                    page: cntpage,
                    size: 3
                },
                success: function (response) {
                },
                error: function (error) {
                },
            });
         }
</script>
</html>
