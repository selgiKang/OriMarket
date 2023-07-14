<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <script src="https://kit.fontawesome.com/1cfe6d92db.js" crossorigin="anonymous"></script>
    <link rel= "stylesheet" href= "../../css/header/header_index.css">
</head>
<body>

<div class="header_wrap">
    <div class="logo"><a href="/">Ori Market</a></div>

    <div class="nav">
        <c:if test="${empty userAddress1}">
        <span><a href="/search">주소검색</a></span>
        </c:if>
        <c:if test="${!empty userAddress1}">
            <span><a href="/search">${userAddress1} ...</a></span>
        </c:if>
        <a href="${sessionScope.userId}/cart"><i class="fa-solid fa-cart-shopping"></i></a>
        <a href="#"><i class="fa-solid fa-bell"></i></a>
        <a href="/mypage"><i class="fa-solid fa-circle-user"></i></a>
    </div>
</div>

</body>
</html>