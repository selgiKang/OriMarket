<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Orimarket_상세매출내역</title>
   <link rel="stylesheet" href="../../css/calculate/detail_calculate.css">
</head>
<body id="detailsCalculate_body">
<c:set var="orderDateStr" value="${detailsDataList.createdDate}"/>
<c:set var="formattedDate"
       value="${fn:substring(orderDateStr, 0, 4)}년 ${fn:substring(orderDateStr, 4, 6)}월 ${fn:substring(orderDateStr, 6, 8)}일"/>

<h3>${formattedDate} 수입</h3>
<tr>
    <th>주문번호:</th>
    <th>${detailsDataList.orderNumber}</th>
</tr>
<table border="1" id="detailsCalculate_table">
    <c:forEach items="${detailsDataList.newOrderDetails}" var="newList">
        <tr>
            <th>판매 목록</th>
            <td>${newList.itemName}</td>
            <td>${newList.itemPrice}원</td>
        </tr>
        <tr>
            <th>판매 개수</th>
            <td colspan="2">${newList.itemCount}개</td>
        </tr>
    </c:forEach>
    <tr>
        <th colspan="1">총 가격</th>
        <td colspan="2">${detailsDataList.orderGoodsTotalPrice}원</td>
    </tr>
</table>
</body>
</html>