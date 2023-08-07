<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="../../css/store/delivery_pickup.css">
    <script src="https://kit.fontawesome.com/1cfe6d92db.js" crossorigin="anonymous"></script>
    <link href="../../css/order/order_pastorder.css" rel="stylesheet" media="all">
</head>
<body>
<div class="main-container">
    <div class="header">
        <jsp:include page="../header/header_index.jsp"/>
    </div>
    <div class="headermsg_wrap">
        <%--뒤로가기--%>
        <button class="backbtn" onclick="window.location.replace('/mypage')">&lt;</button>
        <h3 style="margin: 15px 5px 5px; font-size: 20px;">회원 리뷰관리</h3>
    </div>
    <div class="tabs">
        <input type="radio" id="tab1" name="tab-control" checked>
        <input type="radio" id="tab2" name="tab-control">
        <ul>
            <li title="배달"><label for="tab1" role="button"><span>배달</span></label></li>
            <li title="포장"><label for="tab2" role="button"><span>포장</span></label></li>
        </ul>
        <div class="slider">
            <div class="indicator"></div>
        </div>
        <div class="content">
            <section>
                <div class="inside_tabs">
                    <div role="inside_tablist">
                        <button id="tab-1" aria-selected="true" aria-controls="tab-panel-1" role="tab" type="button"
                                tabindex="0">
                            작성 가능한 리뷰(__)
                        </button>
                        <button id="tab-2" aria-selected="false" aria-controls="tab-panel-2" role="tab" type="button"
                                tabindex="-1">
                            작성한 리뷰(__)
                        </button>
                    </div>
                    <div class="createable_review_wrapbox">
                        <div id="tab-panel-1" aria-labelledby="tab-1" role="tabpanel" tabindex="0"
                             class="createable_review_wrap">
                            <c:forEach items="${newOrders}" var="pastOrder">
                                <c:if test="${pastOrder.deliveryType eq '배달'}">
                                    <c:set var="processedStoreNames" value="" scope="page"/>
                                    <c:set var="firstStoreName" value="true" scope="page"/>
                                    <c:forEach items="${pastOrder.newOrderDetails}" var="orderDetail">
                                        <c:if test="${orderDetail.reviewtrue ne '리뷰'}">
                                            <c:if test="${!processedStoreNames.contains(orderDetail.buStoreName)}">
                                                <c:set var="processedStoreNames"
                                                       value="${processedStoreNames},${orderDetail.buStoreName}"
                                                       scope="page"/>
                                                <div class="createable_review_box">
                                                    <p style="font-size: 16px; margin-top: ${firstStoreName eq 'true' ? '0' : '10px'}; /*margin-bottom: -11px;*/
                                                            border-top: ${firstStoreName eq 'true' ? 'none' : '1px solid #eee;'}; position: relative; padding-top:10px;">
                                                            ${orderDetail.buStoreName}
                                                        <button style="position: absolute; right: 0;border: none;padding: 3px 8px;background-color: #4caf50;color: #fff;border-radius: 4px;"
                                                                onclick="location.href='/user_review?buStoreName=${orderDetail.buStoreName}&orderNumber=${orderDetail.orderNumber}'">
                                                            리뷰 쓰기
                                                        </button>
                                                    </p>
                                                    <c:set var="firstStoreName" value="false" scope="page"/>
                                                    <span style="font-size: x-small; padding-left: 3px;">구매상품 :${orderDetail.itemName}</span>
                                                </div>
                                            </c:if>
                                        </c:if>
                                    </c:forEach>
                                </c:if>
                            </c:forEach>
                        </div>
                    </div>
                    <div id="tab-panel-2" aria-labelledby="tab-2" role="tabpanel" tabindex="-1" hidden>
                        <c:forEach items="${re}" var="r">
                            <c:if test="${r.newOrder.deliveryType eq '배달'}">
                                <div style="width: 315px; margin-top: 10px;border-radius: 7px;box-shadow: 0px 1px 10px rgba(0,0,0,0.2);">
                                    <img src="../../img/store/${r.businessStore.buStoreImageUrl}"
                                         style="max-width: 90%;margin: 11px 11px 0;padding: 5px;/* padding: 5px; */height: auto;border-radius: 8px;">
                                    <div class="review_item_wrap">
                                        <p style="font-size: 16px; margin-top: ${firstStoreName eq 'true' ? '0' : '10px'};/* margin-bottom: -11px;*/
                                                border-top: ${firstStoreName eq 'true' ? 'none' : '1px solid #46A973'}; position: relative;">
                                                ${r.buStoreName} <span
                                                style="font-size: x-small;">구매상품 : ${r.itemName}</span>
                                        </p>
                                        <div class="review_chk_wrap">
                                            <p>별점 : ${r.rating}점 </p>
                                            <p>맛 : ${r.taste}점 </p>
                                            <p>양 : ${r.amount}점 </p>
                                        </div>
                                        <div class="review_txt_wrap">
                                            <p>${r.content}</p>
                                        </div>
                                    </div>
                                </div>
                            </c:if>
                        </c:forEach>
                    </div>
                </div>
            </section>
            <section>
                <div class="inside_tabs">
                    <div role="inside_tablist">
                        <button id="tab-3" aria-selected="true" aria-controls="tab-panel-3" role="tab" type="button"
                                tabindex="0">
                            작성 가능한 리뷰(__)
                        </button>
                        <button id="tab-4" aria-selected="false" aria-controls="tab-panel-4" role="tab" type="button"
                                tabindex="-1">
                            작성한 리뷰(__)
                        </button>
                    </div>
                    <div class="createable_review_wrapbox">
                        <div id="tab-panel-3" aria-labelledby="tab-3" role="tabpanel" tabindex="0"
                             class="createable_review_wrap">
                            <c:forEach items="${newOrders}" var="pastOrder">
                                <c:if test="${pastOrder.deliveryType eq '포장'}">
                                    <c:set var="processedStoreNames" value="" scope="page"/>
                                    <c:set var="firstStoreName" value="true" scope="page"/>
                                    <c:forEach items="${pastOrder.newOrderDetails}" var="orderDetail">
                                        <c:if test="${orderDetail.reviewtrue ne '리뷰'}">
                                            <c:if test="${!processedStoreNames.contains(orderDetail.buStoreName)}">
                                                <c:set var="processedStoreNames"
                                                       value="${processedStoreNames},${orderDetail.buStoreName}"
                                                       scope="page"/>
                                                <div class="createable_review_box">
                                                <p style="font-size: 16px; margin-top: ${firstStoreName eq 'true' ? '0' : '10px'}; /*margin-bottom: -11px;*/
                                                        border-top: ${firstStoreName eq 'true' ? 'none' : '1px solid #eee;'}; position: relative; padding-top:10px;">
                                                        ${orderDetail.buStoreName}
                                                    <button style="position: absolute; right: 0;border: none;padding: 3px 8px;background-color: #4caf50;color: #fff;border-radius: 4px;"
                                                            onclick="location.href='/user_review?buStoreName=${orderDetail.buStoreName}&orderNumber=${orderDetail.orderNumber}'">
                                                        리뷰 쓰기
                                                    </button>
                                                </p>
                                                <c:set var="firstStoreName" value="false" scope="page"/>
                                            </c:if>
                                            <span style="font-size: x-small; padding-left: 3px;">구매상품 :${orderDetail.itemName}</span>
                                        </c:if>
                                    </c:forEach>
                                    </div>
                                </c:if>
                            </c:forEach>
                        </div>
                    </div>
                    <div id="tab-panel-4" aria-labelledby="tab-4" role="tabpanel" tabindex="-1" hidden>
                        <c:forEach items="${re}" var="r">
                            <c:if test="${r.newOrder.deliveryType eq '포장'}">
                                <div style="width: 315px; margin-top: 10px;border-radius: 7px;box-shadow: 0px 1px 10px rgba(0,0,0,0.2);">
                                    <img src="../../img/store/${r.businessStore.buStoreImageUrl}"
                                         style="max-width: 90%;margin: 11px 11px 0;padding: 5px;/* padding: 5px; */height: auto;border-radius: 8px;">
                                    <div class="review_item_wrap">
                                        <p style="font-size: 16px; margin-top: ${firstStoreName eq 'true' ? '0' : '10px'};/* margin-bottom: -11px;*/
                                                border-top: ${firstStoreName eq 'true' ? 'none' : '1px solid #46A973'}; position: relative;">
                                                ${r.buStoreName} <span
                                                style="font-size: x-small;">구매상품 : ${r.itemName}</span>
                                        </p>
                                        <div class="review_chk_wrap">
                                            <p>별점 : ${r.rating}점 </p>
                                            <p>맛 : ${r.taste}점 </p>
                                            <p>양 : ${r.amount}점 </p>
                                        </div>
                                        <div class="review_txt_wrap">
                                            <p>${r.content}</p>
                                        </div>
                                    </div>
                                </div>
                            </c:if>
                        </c:forEach>
                    </div>
                </div>
            </section>
        </div>
    </div>
    <div class="order_pastorder_footer">
        <jsp:include page="../footer/footer.jsp"/>
    </div>
</div>
<script src="../../js/store/delivery_pickup.js"></script>
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
</body>
</html>
