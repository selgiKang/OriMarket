<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="for" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>관리자_주문관리</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin/common.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin/order.css">
</head>
<body>
<div id="goods_container">
    <div id="goods_store">
        <div class="snun_wrap">
            <h1>주문접수현황</h1>
        </div>
    </div>
    <div class="goods_store_wrap">
        <div id="goods_title">
            <div class="top_title_wrap">
                <!-- 뒤로가기 -->
                <a href="/adminMain">
                    <button class="backbtn">&lt;</button>
                </a>
            </div>
            <form action="/searchOrder" method="get" id="searchForm">
                <select name="selectType" id="searchType">
                    <option value="marketName">시장</option>
                    <option value="userId">일반회원</option>
                    <option value="orderNum">주문번호</option>
                </select>
                <input type="text" name="keyword" id="searchValue">
                <input type="submit" value="검색">
            </form>
        </div>
        <br>
        <div id="goods_list">
            <form action="" method="">
                <table id="b_table">
                    <tr class="goods_listTitle">
                        <td>주문번호</td>
                        <td>주문자</td>
                        <td>시장명</td>
                        <td>주문상품</td>
                        <td>물건금액</td>
                        <td>수량</td>
                        <td>배달/포장</td>
                        <td>배달비</td>
                        <td>총결제금액</td>
                        <td>결제수단</td>
                        <td>상태</td>
                        <td>매니저배정</td>
                        <td>라이더배정</td>
                    </tr>
                    <%--반복문시작--%>
                    <c:forEach var="order" items="${orders}">
                        <tr>
                            <td>${order.orderNumber}</td>
                            <td>${order.user.userId}</td>
                            <td>${order.orderMarketName}</td>
                            <td>${order.itemId1}</td>
                            <td>${order.orderGoodsTotalPrice}</td>
                            <td>${order.orderGoodsNum}</td>
                            <td>${order.deliveryType}</td>
                            <td>${order.orderDeliveryPrice}</td>
                            <td>${order.orderTotalPrice}</td>
                            <td>${order.orderType}</td>
                            <td>${order.orderStatus}</td>
                            <td>${order.managerUser.managerId}</td>
                            <td>${order.rider.riderId}</td>
                        </tr>
                    </c:forEach>
                </table>
            </form>
        </div>
    </div>
</div>

</body>
</html>

