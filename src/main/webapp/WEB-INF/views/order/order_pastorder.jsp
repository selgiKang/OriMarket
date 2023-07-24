<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link href="../../css/order/order_pastorder.css" rel="stylesheet" media="all">
</head>
<body>
<div id="order">
    <h3 id="h3">과거 주문 내역</h3>
    <hr>
    <div id="search_area">
        <form>
            <input type="search" placeholder="주문했던 메뉴와 시장을 검색해보세요.">
            <span>검색</span>
        </form>
    </div>
    <!-- 주문 목록 출력 -->
    <c:forEach items="${pastOrderList}" var="pastOrder" varStatus="status">
        <div class="order_1">
            <!-- 주문 정보 출력 -->
            <h2 class="mypage1_h2">${pastOrder.marketSeq.marketName}</h2>
            <!-- 날짜 출력 -->
            <small class="mypage1_small" style="text-align: left;">
                    ${fn:substring(pastOrder.orderDate, 0, 4)}년
                    ${fn:substring(pastOrder.orderDate, 4, 6)}월
                    ${fn:substring(pastOrder.orderDate, 6, 8)}일
            </small>

            <!-- RealTimeStatus 가져오기 -->

            <!-- 주문 상태 출력 -->
            <c:if test="${pastOrder.realTimeStatus.rtsRiderFinish != null}">
                <ul style="text-align: left;">
                    <!-- RealTimeStatus의 내용 출력 -->
                        <c:if test="${pastOrder.realTimeStatus.rtsRiderFinish eq 0}">
                            <li>배송중</li>
                        </c:if>
                        <c:if test="${pastOrder.realTimeStatus.rtsRiderFinish eq 1}">
                            <li>배달 완료</li>
                        </c:if>
                        <!-- 여기에 추가적인 RealTimeStatus 정보 출력 -->
                </ul>
            </c:if>

            <!-- 나머지 주문 정보 출력 -->
            <ul style="text-align: left;">
                <li>${pastOrder.orderStoreName}</li>
                <li>${pastOrder.orderGoodsName}</li>
            </ul>
            <h3 style="text-align: left;">합계: ${pastOrder.orderGoodsTotalPrice}원</h3>

            <!-- 영수증 보기 버튼 -->
            <div class="div2" onclick="location.href='/order_receipt?orderNumber=${pastOrder.orderNumber}'">영수증 보기</div>
        </div>
    </c:forEach>


</div>
<footer>&lt; 푸터 &gt;</footer>

</body>
</html>