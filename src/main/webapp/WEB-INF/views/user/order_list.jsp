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

        .tab-content:not(.active) .order-item {
            display: none;
        }
    </style>
</head>
<body>
<div class="order-list">
    <div class="tab">
        <span class="tab-link active" data-tab="pending">주문대기</span>
        <span class="tab-link" data-tab="processing">처리중</span>
        <span class="tab-link" data-tab="rejected">거절</span>
    </div>

    <div class="order-item" data-status="pending">
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

    //수락버튼을 누르기전에 처리탭에 아무것도 안보이게
    <div class="order-item" data-status="processing" style="display: none;"></div>
    //거절버튼을 누르기전에 거절탭에 아무것도 안보이게
    <div class="order-item" data-status="rejected" style="display: none;"></div>
</div>

<script>
    //모든 탭 링크 선택
    const tabLinks = document.querySelectorAll('.tab-link');
    //모든 주문 메뉴 선택
    const orderItems = document.querySelectorAll('.order-item');

    tabLinks.forEach(tabLink => {
        tabLink.addEventListener('click', () => {
            //클릭한 탭의 data-tab 속성값 가져오기
            const tab = tabLink.getAttribute('data-tab');

            tabLinks.forEach(link => {
                if (link.getAttribute('data-tab') === tab) {
                    link.classList.add('active');       //탭 클릭된 상태일때 색변경
                    link.style.color = '#46a973';
                } else {
                    link.classList.remove('active');    // 탭 미클릭된 상태일때 스타일 제거
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
                const processingTab = document.querySelector('.tab-link[data-tab="processing"]');
                processingTab.click();
                orderItem.setAttribute('data-status', 'processing');

                //처리중 탭에 즉시 업데이트 되도록
                setTimeout(() => {
                    processingTab.click();
                }, 0);
            }
        });
    });

    const rejectButtons = document.querySelectorAll('.reject-button');
    rejectButtons.forEach(button => {
        button.addEventListener('click', () => {
            const orderItem = button.closest('.order-item');
            const currentStatus = orderItem.getAttribute('data-status');

            if (currentStatus === 'pending') {
                const rejectedTab = document.querySelector('.tab-link[data-tab="rejected"]');
                rejectedTab.click();
                orderItem.setAttribute('data-status', 'rejected');

                //거절버튼 클릭후 탭표시가 즉시 되도록
                setTimeout(() => {
                    rejectedTab.click();
                }, 0);
            }
        });
    });
</script>
</body>
</html>
