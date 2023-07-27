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
    <div class="logo"><a href="/storenotice1" style="font-size:32px;">오리 사장님</a></div>

    <div class="nav">

        <c:if test="${not empty buUserId}">
            <span class="addpic">${buUserId} 님, 어서오리</h2></span>
        </c:if>

        <a href=""><i class="fa-solid fa-house" style="color: #ffbf41;"></i></a>

        <a href="/buUserLogout?buUserId=${buUserId}"><i class="fa-solid fa-right-from-bracket" style="color: #ffbf41;"></i></a>


    </div>


</div>

</body>
</html>