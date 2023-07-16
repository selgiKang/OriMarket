<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.choongang.OriMarket.order.Order" %>
<%
    List<Order> orders = (List<Order>) request.getAttribute("orders");
%>
<%@ page import="java.util.List" %>
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
    <div class="order-item" data-status="<%= order.getOrderType() %>">
        <span class="order-number">주문번호 #<%= order.getOrderNumber() %></span>
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


<script>
    const tabLinks = document.querySelectorAll('.tab-link');
    const orderItems = document.querySelectorAll('.order-item');

    tabLinks.forEach(tabLink => {
        tabLink.addEventListener('click', () => {
            const tab = tabLink.getAttribute('data-tab');

            tabLinks.forEach(link => {
                if (link.getAttribute('data-tab') === tab) {
                    link.classList.add('active');
                    link.style.color = '#46a973';
                } else {
                    link.classList.remove('active');
                    link.style.color = '';
                }
            });

            orderItems.forEach(item => {
                if (item.getAttribute('data-status') === tab) {
                    item.style.display = 'flex';
                } else {
                    item.style.display = 'none';
                }
            });
        });
    });

    const acceptButtons = document.querySelectorAll('.accept-button');
    acceptButtons.forEach(button => {
        button.addEventListener('click', () => {
            const orderItem = button.closest('.order-item');
            const currentStatus = orderItem.getAttribute('data-status');

            if (currentStatus === 'pending') {
                orderItem.setAttribute('data-status', 'processing');
                const processingTab = document.querySelector('.tab-link[data-tab="processing"]');
                processingTab.click();

                // 버튼 변경
                const actionButtons = orderItem.querySelector('.action-buttons');
                actionButtons.innerHTML = '<button class="complete-button">완료</button>';

                // 완료 버튼 클릭 이벤트 등록
                const completeButton = orderItem.querySelector('.complete-button');
                completeButton.addEventListener('click', () => {
                    orderItem.setAttribute('data-status', 'completed');
                    const completedTab = document.querySelector('.tab-link[data-tab="completed"]');
                    completedTab.click();

                    // 주문완료 텍스트 추가
                    const orderNumber = orderItem.querySelector('.order-number');
                    orderNumber.innerHTML = '주문번호 #1234<span class="completed-text">주문완료</span>';
                });
            }
        });
    });

    const rejectButtons = document.querySelectorAll('.reject-button');
    rejectButtons.forEach(button => {
        button.addEventListener('click', () => {
            const orderItem = button.closest('.order-item');
            const currentStatus = orderItem.getAttribute('data-status');

            if (currentStatus === 'pending') {
                orderItem.setAttribute('data-status', 'completed');
                const completedTab = document.querySelector('.tab-link[data-tab="completed"]');
                completedTab.click();

                // 버튼 변경
                const actionButtons = orderItem.querySelector('.action-buttons');
                actionButtons.innerHTML = '<button class="reject-button">거절</button>';

                // 주문거절 텍스트 추가
                const orderNumber = orderItem.querySelector('.order-number');
                orderNumber.innerHTML += '<span class="rejected-text">주문거절</span>';
            }
        });
    });
</script>
</body>
</html>
