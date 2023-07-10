<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
        }

        .order-item {
            display: flex; /* 추가: 주문 아이템을 가로로 배치 */
            flex-direction: column; /* 추가: 주문 아이템을 세로로 정렬 */
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
    </style>
</head>
<body>
<div class="order-list">
    <div class="tab">
        <span>주문대기</span>
    </div>

    <div class="order-item">
        <span class="order-number">주문번호 #1234</span>
        <div class="order-details">
            <span class="order-quantity">메뉴 2개</span>
            <span class="order-price">35000원</span>
        </div>
        <div class="order-menu">김치찌개, 된장찌개</div>

        <div class="action-buttons">
            <button class="accept-button">수락</button>
            <button class="reject-button">거절</button>
        </div>
    </div>



</div>
</body>
</html>
