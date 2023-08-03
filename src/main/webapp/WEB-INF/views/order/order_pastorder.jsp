<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%--특정 위치마다 , 넣도록--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <script src="https://kit.fontawesome.com/1cfe6d92db.js" crossorigin="anonymous"></script>
    <link href="../../css/order/order_pastorder.css" rel="stylesheet" media="all">
</head>
<body>
    <div class="main-container">

        <div class="header">
            <jsp:include page="../header/header_index.jsp" />
        </div>

        <%--<h3 style="margin-top: 5px;">회원 주문내역</h3>--%>
        <div class="headermsg_wrap">
        <%--뒤로가기--%>
        <button class="backbtn" onclick="window.location.replace('/mypage')">&lt;</button>
        <h3 style="margin: 15px 5px 5px; font-size: 20px;">회원 주문내역</h3>
        </div>
        <div id="search_area" style="width: 95%;">
            <form class="searchbar_wrap">
                <input type="search" placeholder="주문했던 메뉴와 시장을 검색해보세요." style="width: 88%;">
                <span><i class="fas fa-solid fa-magnifying-glass"></i></span>
            </form>
        </div>
        <div class="tabs">
            <input type="radio" id="tab1" name="tab-control" checked>
            <input type="radio" id="tab2" name="tab-control">
            <ul>
                <li title="현재주문내역"><label for="tab1" role="button"><span>현재주문내역</span></label></li>
                <li title="과거주문내역"><label for="tab2" role="button"><span>과거주문내역</span></label></li>
            </ul>
        <div class="slider">
        <div class="indicator"></div>
        </div>
        <div class="content">
            <section>
                <div class="inside_tabs">
                    <div role="inside_tablist" id="infiniteScrollContainer">
                        <c:set var="stores" scope="page"/>
                        <c:forEach items="${pastOrderList}" var="pastOrder">
                            <c:if test="${!empty pastOrder.newOrderDetails}">
                            <c:if test="${pastOrder.orderStatus != '배달완료' and pastOrder.orderStatus != '주문거절'}">
                                <!-- 주문내역폼 -->
                                <div class="main-box">
                                    <div class="top">
                                        <div class="small-box">
                                            <p style="font-size: 15px;">${pastOrder.deliveryType}</p>
                                        </div>
                                        <div class="date">
                                            <p>
                                                    ${fn:substring(pastOrder.createdDate, 0, 4)}.
                                                    ${fn:substring(pastOrder.createdDate, 4, 6)}.
                                                    ${fn:substring(pastOrder.createdDate, 6, 8)}&nbsp;
                                                    ${fn:substring(pastOrder.createdDate, 8, 10)}:
                                                    ${fn:substring(pastOrder.createdDate, 10, 12)}:
                                                    ${fn:substring(pastOrder.createdDate, 12, 14)}
                                            </p>
                                        </div>
                                    </div>
                                    <div style="position: absolute; top: 10px; right: 10px;color: #4caf50;font-size: 14px;font-weight: 600;">
                                           ${pastOrder.orderStatus}
                                    </div>
                                    <div class="storepicture">
                                        <img src="../../img/store/store.jpg" alt="사진">
                                    </div>
                                    <div class="middle">
                                        <div class="storeinfo">
                                            <c:forEach items="${pastOrder.newOrderDetails}" var="orderDetail">
                                                <c:if test="${!stores.contains(orderDetail.buStoreName)}">
                                                    <c:set var="stores" value="${stores},${orderDetail.buStoreName}" scope="page" />
                                                    <div class="storename">
                                                        <p>${orderDetail.buStoreName}</p>
                                                    </div>
                                                    <c:forEach items="${pastOrder.newOrderDetails}" var="orderDetail1">
                                                        <c:if test="${orderDetail1.buStoreName eq orderDetail.buStoreName}">
                                                            <div class="orderitems">
                                                                <p>${orderDetail.itemName}</p>
                                                            </div>
                                                        </c:if>
                                                    </c:forEach>
                                                </c:if>
                                            </c:forEach>

                                        </div>
                                    </div>
                                    <div class="mybutton">
                                        <div class="reorder" onclick="location.href='/store?favStoreName=${pastOrder.newOrderDetails[0].buStoreName}'">
                                            <p>재주문</p>
                                        </div>
                                        <div class="orderdetailcheck" onclick="location.href='/order_receiptDelivery?orderNumber=${pastOrder.orderNumber}'">
                                            <p>주문상세</p>
                                        </div>
                                    </div>
                                </div>
                            </c:if>
                            </c:if>
                        </c:forEach>
                    </div>
                </div>

            </section>
            <!-- 과거 주문 내역 출력 -->
            <section>
                <div class="inside_tabs">
                    <div role="inside_tablist" id="infiniteScrollContainerPast">
                        <%-- 과거 주문내역 --%>
                        <c:forEach items="${pastOrderList}" var="pastOrder" varStatus="status">
                            <c:if test="${pastOrder.orderStatus eq '배달완료' || pastOrder.orderStatus eq '주문거절'}">
                                <div class="order_1">
                                    <%-- 가게사진 --%>

                                    <!-- 주문 정보 출력 -->
                                    <h2 class="mypage1_h2">${pastOrder.orderMarketName}</h2>
                                    <!-- 날짜 출력 -->
                                    <small class="mypage1_small" style="text-align: left;">
                                        <p>
                                            ${fn:substring(pastOrder.createdDate, 0, 4)}.
                                            ${fn:substring(pastOrder.createdDate, 4, 6)}.
                                            ${fn:substring(pastOrder.createdDate, 6, 8)}&nbsp;
                                            ${fn:substring(pastOrder.createdDate, 8, 10)}:
                                            ${fn:substring(pastOrder.createdDate, 10, 12)}:
                                            ${fn:substring(pastOrder.createdDate, 12, 14)}
                                        </p>
                                    </small>
                                    <!-- 주문 상태 출력 -->
                                        <ul style="text-align: left;">
                                            <c:if test="${pastOrder.orderStatus eq '배달완료'}">
                                                <li style="text-align: end; margin-right:12%; color:red;">배달 완료</li>
                                            </c:if>
                                            <c:if test="${pastOrder.orderStatus eq '주문거절'}">
                                                <li style="text-align: end; margin-right:12%; color:red;">주문 거절</li>
                                            </c:if>
                                        </ul>
                                    <c:forEach items="${pastOrder.newOrderDetails}" var="orderDetail">
                                        <c:if test="${orderDetail.buStoreName != null and orderDetail.itemName != null}">
                                        <!-- 나머지 주문 정보 출력 -->
                                            <ul style="text-align: left;">
                                                <li>${orderDetail.buStoreName}</li>
                                                <li>${orderDetail.itemName}</li>
                                                <li>${orderDetail.itemCount}개</li>
                                            </ul>
                                        </c:if>
                                    </c:forEach>
                                    <h3 style="text-align: right; margin:10px;">합계:<fmt:formatNumber value="${pastOrder.orderTotalPrice}" pattern="#,###"/>원
                                    <!-- 영수증 보기 버튼 -->
                                    <div class="div2" onclick="location.href='/order_receiptDelivery?orderNumber=${pastOrder.orderNumber}'">영수증 보기</div>
                                </div>
                            </c:if>
                        </c:forEach>
                    </div>
                </div>
            </section>
        </div>
    </div>
        <div class="order_pastorder_footer">
            <jsp:include page="../footer/footer.jsp" />
        </div>
    </div>
</body>
<script>
    const tabElements = document.querySelectorAll('button[role="tab"]');
    const panelElements = document.querySelectorAll('[role="tabpanel"]');
    let activeIndex = 0;

    tabElements.forEach(function (tab, index) {
        // 탭 클릭 이벤트 처리
        tab.addEventListener("click", function (event) {
            setActiveTab(index);
        });

        // 키보드 이벤트 처리
        tab.addEventListener("keydown", function (event) {
            const lastIndex = tabElements.length - 1;

            if (event.code === "ArrowLeft" || event.code === "ArrowUp") {
                if (activeIndex === 0) {
                    // 첫 번째 요소, 마지막 요소로 이동
                    setActiveTab(lastIndex);
                } else {
                    // 왼쪽으로 이동
                    setActiveTab(activeIndex - 1);
                }
            } else if (event.code === "ArrowRight" || event.code === "ArrowDown") {
                if (activeIndex === lastIndex) {
                    // 마지막 요소, 첫 번째 요소로 이동
                    setActiveTab(0);
                } else {
                    // 오른쪽으로 이동
                    setActiveTab(activeIndex + 1);
                }
            } else if (event.code === "Home") {
                // 첫 번째 요소로 이동
                setActiveTab(0);
            } else if (event.code === "End") {
                // 마지막 요소로 이동
                setActiveTab(lastIndex);
            }
        });
    });

    function setActiveTab(index) {
        // 현재 활성화된 탭을 비활성화 처리
        tabElements[activeIndex].setAttribute("aria-selected", "false");
        tabElements[activeIndex].tabIndex = -1;

        // 새로운 탭을 활성화 처리
        tabElements[index].setAttribute("aria-selected", "true");
        tabElements[index].tabIndex = 0;
        tabElements[index].focus();

        setActivePanel(index);
        activeIndex = index;
    }

    function setActivePanel(index) {
        // 현재 활성화된 패널 숨기기
        panelElements[activeIndex].setAttribute("hidden", "");
        panelElements[activeIndex].tabIndex = -1;

        // 새로운 활성화된 패널 보이기
        panelElements[index].removeAttribute("hidden");
        panelElements[index].tabIndex = 0;
    }

</script>
</html>