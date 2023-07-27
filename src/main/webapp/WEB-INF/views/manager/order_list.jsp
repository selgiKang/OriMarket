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
            <span class="tab-link active" data-tab="pending">주문</span>
            <span class="tab-link" data-tab="processing1">주문 시작</span>
            <span class="tab-link" data-tab="processing2">배달 시작</span>
            <span class="tab-link" data-tab="completed">완료</span>
        </div>
        <%--주문--%>
        <div class="order-item" data-status="pending">
            <c:if test="${not empty orderList}">
                <c:forEach items="${orderList}" var="order">
                    <c:forEach items="${rtsResult}" var="rts">
                        <c:if test="${order.orderNumber == rts.orderNumber.orderNumber}">
                            <c:if test="${rts.rtsOrderIng eq 0 && rts.rtsRiderIng eq 0 && rts.rtsRiderFinish eq 0}">
                                <!-- 주문번호 클릭 시 주문 상세 정보를 보여줄 버튼 -->
                                <span class="order-number" onclick="showOrderDetail('${order.orderNumber}')">주문번호 #${order.orderNumber}</span>
                                <span class="order-quantity">메뉴</span>
                                <div class="order-details">
                                    <span>${order.orderGoodsName} 총 ${order.orderGoodsNum}개</span>
                                    <span class="order-price">총 금액 ${order.orderTotalPrice}원</span>
                                </div>
                               <%-- <div class="order-menu"></div>--%>
                                <div class="action-buttons">
                                    <form action="/accept" method="get">
                                        <input type="hidden" name="orderNumber" value="${order.orderNumber}">
                                        <input type="hidden" name="managerUser" value="${userResult.managerSeq}">
                                        <button class="accept-button">수락</button>
                                    </form>
                                    <button class="reject-button">거절</button>
                                </div>
                            </c:if>
                        </c:if>
                    </c:forEach>
                </c:forEach>
            </c:if>
            <c:if test="${empty orderList}">
                <p>주문이 없습니다.</p>
            </c:if>
        </div>
        <%--주문 시작--%>
        <div class="order-item" data-status="processing1">
            <c:if test="${not empty orderList}">
                <c:forEach items="${orderList}" var="order">
                    <c:forEach items="${rtsResult}" var="rts">
                        <c:if test="${order.orderNumber == rts.orderNumber.orderNumber}">
                            <c:if test="${rts.rtsOrderIng eq 1 && rts.rtsRiderIng eq 0 && rts.rtsRiderFinish eq 0}">
                                <%--주문내역 매니저 seq랑 현재 매니저 seq가 같은 것만--%>
                               <%-- <c:if test="${order.managerUser.managerSeq eq userResult.managerSeq}">--%>
                                <!-- 주문번호 클릭 시 주문 상세 정보를 보여줄 버튼 -->
                                    <span class="order-number" onclick="showOrderDetail('${order.orderNumber}')">주문번호 #${order.orderNumber}</span>
                                    <div class="order-details">
                                        <span class="order-quantity">메뉴 ${order.orderGoodsNum}개</span>
                                        <span class="order-price">${order.orderTotalPrice}원</span>
                                    </div>
                                    <div class="order-menu">${order.orderGoodsName}</div>
                                    <div class="action-buttons">
                                        <form action="/acceptPickup" method="get">
                                            <input type="hidden" name="orderNumber" value="${order.orderNumber}">
                                            <button class="accept-button">픽업 완료</button>
                                        </form>
                                    </div>
                                </c:if>
                            <%--</c:if>--%>
                        </c:if>
                    </c:forEach>
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
                    <c:forEach items="${rtsResult}" var="rts">
                        <c:if test="${order.orderNumber == rts.orderNumber.orderNumber}">
                            <c:if test="${rts.rtsOrderIng eq 1 && rts.rtsRiderIng eq 1 && rts.rtsRiderFinish eq 0}">
                             <%--   <c:if test="${order.managerUser.managerSeq eq userResult.managerSeq}">--%>
                                    <!-- 주문번호 클릭 시 주문 상세 정보를 보여줄 버튼 -->
                                    <span class="order-number" onclick="showOrderDetail('${order.orderNumber}')">주문번호 #${order.orderNumber}</span>
                                    <div class="order-details">
                                        <span class="order-quantity">메뉴 ${order.orderGoodsNum}개</span>
                                        <span class="order-price">${order.orderTotalPrice}원</span>
                                    </div>
                                    <div class="order-menu" style="margin-bottom: 10px;">${order.orderGoodsName}</div>
                                </c:if>
                            <%--</c:if>--%>
                        </c:if>
                    </c:forEach>
                </c:forEach>
            </c:if>
            <c:if test="${empty orderList}">
                <p>주문이 없습니다.</p>
            </c:if>
        </div>
        <%--배달 완료--%>
        <div class="order-item" data-status="completed">
            <c:if test="${not empty orderList}">
                <c:forEach items="${orderList}" var="order">
                    <c:forEach items="${rtsResult}" var="rts">
                        <c:if test="${order.orderNumber == rts.orderNumber.orderNumber}">
                            <c:if test="${rts.rtsOrderIng eq 1  && rts.rtsRiderIng eq 1 && rts.rtsRiderFinish eq 1}">
                                <c:if test="${!empty order.managerUser.managerSeq}">
                                    <c:if test="${order.managerUser.managerSeq eq userResult.managerSeq}">
                                        <!-- 주문번호 클릭 시 주문 상세 정보를 보여줄 버튼 -->
                                        <span class="order-number" onclick="showOrderDetail('${order.orderNumber}')">주문번호 #${order.orderNumber}</span>
                                        <div class="order-details">
                                            <span class="order-quantity">메뉴 ${order.orderGoodsNum}개</span>
                                            <span class="order-price">${order.orderTotalPrice}원</span>
                                        </div>
                                        <div class="order-menu">${order.orderGoodsName}</div>
                                    </c:if>
                                </c:if>
                            </c:if>
                        </c:if>
                    </c:forEach>
                </c:forEach>
            </c:if>
            <c:if test="${empty orderList}">
                <p>주문이 없습니다.</p>
            </c:if>
        </div>

        <div class="order-item" data-status="processing" style="display: none;"></div>
        <div class="order-item" data-status="completed" style="display: none;"></div>


        <div class="order-item" data-status="processing" style="display: none;"></div>
        <div class="order-item" data-status="completed" style="display: none;"></div>


    </div>
</body>
</html>
