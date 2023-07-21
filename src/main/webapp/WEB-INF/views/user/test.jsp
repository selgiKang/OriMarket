<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>

<html>
<head>
    <meta charset="UTF-8">
    <title>title</title>
</head>
<body>

    <c:if test="${!empty it1}">
    <h2>이거는 아이템입니다.</h2>
    <c:forEach var="a" items="${it1}">
        <p>아이템 이름: ${a.itemName}</p>
        <p>아이템 가격: ${a.itemPrice}</p>
    </c:forEach>
    </c:if>

    <c:if test="${!empty st123}">
    <h2>이거는 가게입니다.</h2>
    <c:forEach var="b" items="${st123}">
        <p>${b.buStoreName}</p>
    </c:forEach>
    </c:if>

</body>
</html>


