<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%--특정 위치마다 , 넣도록--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Ori_Delivery</title>
    <script src="https://kit.fontawesome.com/59f45736e5.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="../../css/order/order_delivery.css">
</head>
<body>

<main id="orderDelivery_main">
    <div id="orderDelivery_btn_cancel"><a href="/managerMain"><i class="fas fa-regular fa-xmark"></i></a></div>
    <h2>실시간 주문 내역</h2>
    <ul id="orderDelivery_ing">
        <!-- 배달표시 circle 아이콘 -->
        <!-- 2023-07-04 스크립트로 값 들어오면 아이콘 변경되게 추후 적용 -->
        <!-- 2023-07-07 if문으로 색상 변경: -->

        <%--주문 - 주문수락--%>
        <c:if test="${orderDelivery.orderStatus eq null}">
            <li><i class="fa-sharp fa-regular fa-circle" style="color: #b8b8b8;"></i></li>
            <li class="orderDelivery_li_1">픽업중</li>
        </c:if>
        <c:if test="${orderDelivery.orderStatus eq '주문수락' or orderDelivery.orderStatus eq '배달시작' or orderDelivery.orderStatus eq '배달완료'}">
            <li><i class="fa-sharp fa-solid fa-circle" style="color: #46a973;"></i></li>
            <li class="orderDelivery_li_1" style="color: #46A973;">픽업중</li>
        </c:if>
        <!-- 배달중 -->
        <c:if test="${orderDelivery.orderStatus eq null or orderDelivery.orderStatus eq '주문수락'}">
            <li><i class="fa-sharp fa-regular fa-circle" style="color: #b8b8b8;"></i></li>
            <li class="orderDelivery_li_1">배달중</li>
        </c:if>
        <c:if test="${orderDelivery.orderStatus eq '배달시작' or orderDelivery.orderStatus eq '배달완료'}">
            <li><i class="fa-sharp fa-solid fa-circle" style="color: #46a973;"></i></li>
            <li class="orderDelivery_li_1" style="color: #46a973;">배달중</li>
        </c:if>
        <c:if test="${orderDelivery.orderStatus eq null or orderDelivery.orderStatus eq '배달시작' or newOrder.orderStatus eq '주문수락'}">
            <!-- 배달완료 -->
            <li><i class="fa-sharp fa-regular fa-circle" style="color: #46a973;"></i></li>
            <li>배달 완료</li>
        </c:if>
        <c:if test="${orderDelivery.orderStatus eq '배달완료'}">
            <!-- 배달완료 -->
            <li><i class="fa-sharp fa-solid fa-circle" style="color: #46a973;"></i></li>
            <li style="color: #46a973;">배달 완료</li>
        </c:if>
    </ul>
    <ul>
        <c:if test="${orderDelivery.orderStatus eq '주문거절'}">
            <!-- 배달완료 -->
            <li style="color: red;">주문이 거절되었습니다.</li>
        </c:if>
    </ul>
    <div id="orderDelivery_orderInfo">
        <h3>${orderDelivery.orderMarketName}</h3>
        <table id="orderDelivery_table_1">
            <tr class="orderDelivery_table_tr_1">
                <td>${orderDelivery.orderNumber}</td>
            </tr>
            <tr class="orderDelivery_table_tr_2">
                <td>
                    ${fn:substring(orderDelivery.createdDate, 0, 4)}년
                    ${fn:substring(orderDelivery.createdDate, 4, 6)}월
                    ${fn:substring(orderDelivery.createdDate, 6, 8)}일
                    ${fn:substring(orderDelivery.createdDate, 8, 10)}시
                    ${fn:substring(orderDelivery.createdDate, 10, 12)}분

                </td>
            </tr>
            <tr class="orderDelivery_table_tr_1">
                <td>배달 주소</td>
            </tr>
            <tr class="orderDelivery_table_tr_2">
                <td>${orderDelivery.orderAddress}</td>
            </tr>
            <tr class="orderDelivery_table_tr_1">
                <td>${orderDelivery.deliveryType}</td>
            </tr>
        </table>
        <hr>
        <table id="orderDelivery_table_2">
            <tr class="orderDelivery_table_tr_1">
                <td colspan="2">주문 내역</td>
            </tr>
            <c:forEach var="store" items="${orderDelivery.newOrderDetails}">
                <tr class="orderDelivery_table_tr_1">
                    <td colspan="2">${store.buStoreName}</td>
                </tr>
                <tr class="orderDelivery_table_tr_2">
                <tr>
                    <td>${store.itemName}&nbsp;&nbsp;&nbsp;
                        <fmt:formatNumber value="${store.itemPrice}" pattern="#,###"/>원
                        <small style="color: #818083;">&nbsp;&nbsp;&nbsp;x${store.itemCount}</small></td>
                </tr>
                </tr>
            </c:forEach>
            <tr>
                <td>배달비</td>
                <td><fmt:formatNumber value="${orderDelivery.orderDeliveryPrice}" pattern="#,###"/>원</td>
            </tr>
        </table>
        <hr>
        <table id="orderDelivery_table_3">
            <tr>
                <td class="orderDelivery_table3_td_1">요청사항</td>
                <td class="orderDelivery_table3_td_1">${orderDelivery.orderRequests}</td>
            <tr>
                <td class="orderDelivery_table3_td_1">배달 기사님께</td>
                <td class="orderDelivery_table3_td_1">${orderDelivery.forRider}</td>
            </tr>
            <tr>
                <td id="orderDelivery_table3_total_td_1">총 금액</td>
                <td id="orderDelivery_table3_total_td_2">
                    <fmt:formatNumber value="${orderDelivery.orderTotalPrice}" pattern="#,###"/>원
                </td>
            </tr>
        </table>

    </div>
</main>
</body>
</html>
