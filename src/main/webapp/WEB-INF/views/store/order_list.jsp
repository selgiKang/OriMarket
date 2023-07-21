<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.choongang.OriMarket.order.Order" %>
<%@ page import="java.util.List" %>
<%
    List<Order> orders = (List<Order>) request.getAttribute("orders");
    String orderNumber = (String) request.getAttribute("orderNumber");
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
        }

        .order-list {
            max-width: 375px;
            margin: 0 auto;
        }

        .tab {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: #f2f2f2;
            padding: 10px;
        }

        .tab span {
            font-weight: bold;
            cursor: pointer;
        }

        .tab span.active {
            color: #46a973;
        }

        .order-item {
            display: flex;
            flex-direction: column;
            padding: 10px;
            border-bottom: 1px solid #ccc;
        }

        .order-item:last-child {
            border-bottom: none;
        }

        .order-item .order-number {
            font-weight: bold;
        }

        .order-item .order-details {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-top: 5px;
        }

        .order-item .order-quantity {
            font-size: 14px;
            color: #666;
        }

        .order-item .order-menu {
            margin-top: 5px;
            font-size: 16px;
            font-weight: bold;
        }

        .action-buttons {
            display: flex;
            justify-content: flex-end;
            margin-top: 10px;
        }

        .action-buttons button {
            margin-left: 10px;
            padding: 5px 10px;
        }

        .accept-button {
            background-color: #4caf50;
            color: white;
            border: none;
        }

        .reject-button {
            background-color: #f44336;
            color: white;
            border: none;
        }

        .complete-button {
            background-color: #4caf50;
            color: white;
            border: none;
        }

        .tab-content:not(.active) .order-item {
            display: none;
        }

        .rejected-text {
            font-size: 12px;
            color: red;
        }

        .completed-text {
            font-size: 12px;
            color: #4caf50;
        }

        .order-history-heading {
            font-size: 18px;
            color: black;
        }

        .order-history-heading span {
            color: #4caf50;
        }
    </style>
</head>
<body>
<div class="order-list">
    <div class="order-history-heading">
        <span>오리마켓</span> 주문내역
    </div>

    <div class="tab">
        <span class="tab-link active" data-tab="pending">주문</span>
        <span class="tab-link" data-tab="processing">처리중</span>
        <span class="tab-link" data-tab="completed">완료</span>
    </div>
    <% if (orders != null && !orders.isEmpty()) { %>
    <% for (com.choongang.OriMarket.order.Order order : orders) { %>
    <div class="order-item" data-status="<%= order.getOrderType()  %>">
        <span class="order-number">주문번호 #<%=order.getOrderNumber()%></span>
        <!-- 다른 주문 정보 출력 -->
        <div class="order-details">
            <span class="order-quantity">메뉴 <%= order.getOrderGoodsNum() %>개</span>
            <span class="order-price"><%= order.getOrderTotalPrice() %>원</span>
        </div>
        <div class="order-menu"><%= order.getOrderGoodsName() %></div>
        <div class="action-buttons">
            <button class="accept-button">수락</button>
            <button class="reject-button">거절</button>
        </div>
    </div>
    <% } %>
    <% } else { %>
    <p>주문이 없습니다.</p>
    <% } %>


    <div class="order-item" data-status="processing" style="display: none;"></div>
    <div class="order-item" data-status="completed" style="display: none;"></div>


    <div class="order-item" data-status="processing" style="display: none;"></div>
    <div class="order-item" data-status="completed" style="display: none;"></div>


</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    $(document).ready(function() {
        // 수락 버튼에 클릭 이벤트 리스너 추가
        $('.accept-button').on('click', function() {
            var orderItem = $(this).closest('.order-item');
            orderItem.attr('data-status', 'processing'); // 주문 항목의 상태를 "처리중"으로 변경
            orderItem.hide(); // 주문 항목을 숨김 처리

            $('.tab-link[data-tab="pending"]').removeClass('active'); // 현재 탭의 활성화 클래스 제거
            $('.tab-link[data-tab="processing"]').addClass('active'); // "처리중" 탭에 활성화 클래스 추가
            $('.tab-link[data-tab="completed"]').removeClass('active'); // "완료" 탭의 활성화 클래스 제거
        });

        // 거절 버튼에 클릭 이벤트 리스너 추가
        $('.reject-button').on('click', function() {
            var orderItem = $(this).closest('.order-item');
            orderItem.attr('data-status', 'completed'); // 주문 항목의 상태를 "완료"로 변경
            orderItem.hide(); // 주문 항목을 숨김 처리

            $('.tab-link[data-tab="pending"]').removeClass('active'); // 현재 탭의 활성화 클래스 제거
            $('.tab-link[data-tab="processing"]').removeClass('active'); // "처리중" 탭의 활성화 클래스 제거
            $('.tab-link[data-tab="completed"]').addClass('active'); // "완료" 탭에 활성화 클래스 추가
        });

        // 탭 링크에 클릭 이벤트 리스너 추가
        $('.tab-link').on('click', function() {
            var tab = $(this).data('tab');
            $('.tab-link').removeClass('active'); // 모든 탭의 활성화 클래스 제거
            $(this).addClass('active'); // 클릭한 탭에 활성화 클래스 추가
            $('.order-item').hide(); // 모든 주문 항목을 숨김 처리

            // 선택된 탭에 해당하는 주문 항목을 표시
            if (tab === 'pending') {
                $('.order-item[data-status="pending"]').show();
            } else if (tab === 'processing') {
                $('.order-item[data-status="processing"]').show();
            } else if (tab === 'completed') {
                $('.order-item[data-status="completed"]').show();
            }
        });

        // 탭 링크에 클릭 이벤트 리스너 추가
        $('.tab-link').on('click', function() {
            var tab = $(this).data('tab');
            $('.tab-link').removeClass('active'); // 모든 탭의 활성화 클래스 제거
            $(this).addClass('active'); // 클릭한 탭에 활성화 클래스 추가
            $('.order-item').hide(); // 모든 주문 항목을 숨김 처리

            // 선택된 탭에 해당하는 주문 항목을 표시
            if (tab === 'pending') {
                $('.order-item[data-status="pending"]').show();
                $('.order-item[data-status="processing"]').hide();
                $('.order-item[data-status="completed"]').hide();
            } else if (tab === 'processing') {
                $('.order-item[data-status="pending"]').hide();
                $('.order-item[data-status="processing"]').show();
                $('.order-item[data-status="completed"]').hide();
            } else if (tab === 'completed') {
                $('.order-item[data-status="pending"]').hide();
                $('.order-item[data-status="processing"]').hide();
                $('.order-item[data-status="completed"]').show();
            }
        });

    });
</script>




</body>
</html>