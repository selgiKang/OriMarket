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
<body>
<div class="order-list">
    <div class="order-history-heading">
        <span>오리마켓</span> 주문내역
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
                                <form action="/accept" method="get" onclick="acceptOrder('${order.orderNumber}')">
                                    <input type="hidden" name="orderNumber" value="${order.orderNumber}">
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
                            <!-- 주문번호 클릭 시 주문 상세 정보를 보여줄 버튼 -->
                            <span class="order-number" onclick="showOrderDetail('${order.orderNumber}')">주문번호 #${order.orderNumber}</span>
                            <div class="order-details">
                                <span class="order-quantity">메뉴 ${order.orderGoodsNum}개</span>
                                <span class="order-price">${order.orderTotalPrice}원</span>
                            </div>
                            <div class="order-menu">${order.orderGoodsName}</div>
                            <div class="action-buttons">
                                <form action="/accept" method="get">
                                    <input type="hidden" name="orderNumber" value="${order.orderNumber}">
                                    <button class="accept-button">픽업 완료</button>
                                </form>
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
    <%--배달 시작--%>
    <div class="order-item" data-status="processing2">
        <c:if test="${not empty orderList}">
            <c:forEach items="${orderList}" var="order">
                <c:forEach items="${rtsResult}" var="rts">
                    <c:if test="${order.orderNumber == rts.orderNumber.orderNumber}">
                        <c:if test="${rts.rtsOrderIng eq 1 && rts.rtsRiderIng eq 1 && rts.rtsRiderFinish eq 0}">
                            <!-- 주문번호 클릭 시 주문 상세 정보를 보여줄 버튼 -->
                            <span class="order-number" onclick="showOrderDetail('${order.orderNumber}')">주문번호 #${order.orderNumber}</span>
                            <div class="order-details">
                                <span class="order-quantity">메뉴 ${order.orderGoodsNum}개</span>
                                <span class="order-price">${order.orderTotalPrice}원</span>
                            </div>
                            <div class="order-menu">${order.orderGoodsName}</div>
                            <div class="action-buttons">
                                <form action="/accept" method="get">
                                    <input type="hidden" name="orderNumber" value="${order.orderNumber}">
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
    <%--배달 완료--%>
    <div class="order-item" data-status="completed">
        <c:if test="${not empty orderList}">
            <c:forEach items="${orderList}" var="order">
                <c:forEach items="${rtsResult}" var="rts">
                    <c:if test="${order.orderNumber == rts.orderNumber.orderNumber}">
                        <c:if test="${rts.rtsOrderIng eq 1  && rts.rtsRiderIng eq 1 && rts.rtsRiderFinish eq 1}">
                            <!-- 주문번호 클릭 시 주문 상세 정보를 보여줄 버튼 -->
                            <span class="order-number" onclick="showOrderDetail('${order.orderNumber}')">주문번호 #${order.orderNumber}</span>
                            <div class="order-details">
                                <span class="order-quantity">메뉴 ${order.orderGoodsNum}개</span>
                                <span class="order-price">${order.orderTotalPrice}원</span>
                            </div>
                            <div class="order-menu">${order.orderGoodsName}</div>
                            <div class="action-buttons">
                                <form action="/accept" method="get">
                                    <input type="hidden" name="orderNumber" value="${order.orderNumber}">
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

    <div class="order-item" data-status="processing" style="display: none;"></div>
    <div class="order-item" data-status="completed" style="display: none;"></div>


    <div class="order-item" data-status="processing" style="display: none;"></div>
    <div class="order-item" data-status="completed" style="display: none;"></div>


</div>

<%--<script>--%>
<%--    $(document).ready(function() {--%>
<%--        // 수락 버튼에 클릭 이벤트 리스너 추가--%>
<%--        $('.accept-button').on('click', function() {--%>
<%--            var orderItem = $(this).closest('.order-item');--%>
<%--            orderItem.attr('data-status', 'processing'); // 주문 항목의 상태를 "처리중"으로 변경--%>
<%--            orderItem.hide(); // 주문 항목을 숨김 처리--%>

<%--            $('.tab-link[data-tab="pending"]').removeClass('active'); // 현재 탭의 활성화 클래스 제거--%>
<%--            $('.tab-link[data-tab="processing"]').addClass('active'); // "처리중" 탭에 활성화 클래스 추가--%>
<%--            $('.tab-link[data-tab="completed"]').removeClass('active'); // "완료" 탭의 활성화 클래스 제거--%>
<%--        });--%>

<%--        // 거절 버튼에 클릭 이벤트 리스너 추가--%>
<%--        $('.reject-button').on('click', function() {--%>
<%--            var orderItem = $(this).closest('.order-item');--%>
<%--            orderItem.attr('data-status', 'completed'); // 주문 항목의 상태를 "완료"로 변경--%>
<%--            orderItem.hide(); // 주문 항목을 숨김 처리--%>

<%--            $('.tab-link[data-tab="pending"]').removeClass('active'); // 현재 탭의 활성화 클래스 제거--%>
<%--            $('.tab-link[data-tab="processing"]').removeClass('active'); // "처리중" 탭의 활성화 클래스 제거--%>
<%--            $('.tab-link[data-tab="completed"]').addClass('active'); // "완료" 탭에 활성화 클래스 추가--%>
<%--        });--%>

<%--        // 탭 링크에 클릭 이벤트 리스너 추가--%>
<%--        $('.tab-link').on('click', function() {--%>
<%--            var tab = $(this).data('tab');--%>
<%--            $('.tab-link').removeClass('active'); // 모든 탭의 활성화 클래스 제거--%>
<%--            $(this).addClass('active'); // 클릭한 탭에 활성화 클래스 추가--%>
<%--            $('.order-item').hide(); // 모든 주문 항목을 숨김 처리--%>

<%--            // 선택된 탭에 해당하는 주문 항목을 표시--%>
<%--            if (tab === 'pending') {--%>
<%--                $('.order-item[data-status="pending"]').show();--%>
<%--            } else if (tab === 'processing') {--%>
<%--                $('.order-item[data-status="processing"]').show();--%>
<%--            } else if (tab === 'completed') {--%>
<%--                $('.order-item[data-status="completed"]').show();--%>
<%--            }--%>
<%--        });--%>
<%--    });--%>
<%--</script>--%>




</body>
</html>
