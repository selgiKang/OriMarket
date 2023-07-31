<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Orimarket_findId</title>
    <link href="../code/loginpage.css" rel="stylesheet" media="all">
    <link href="../../css/user/findId.css" rel="stylesheet" media="all">
    <script>
        <%-- 서버에서 에러 메시지를 전달할 경우 알림 팝업 띄우기 --%>
        <% if (request.getAttribute("loginError") != null) { %>
        window.onload = function() {
            alert("<%= request.getAttribute("loginError") %>");
        };
        <% } %>
    </script>
</head>
<body>
<h1>오리시장</h1>
<div id="container">
    <c:if test="${empty userInfo}">
        <form action="/findUserId" method="post" onsubmit="return validateLoginForm();">
            <div id="login_box">
                <div>
                    <p>이름: <input type="text" size="20" placeholder="이름만 입력해주세요" name="userId" id="userId" required></p>
                    <p>핸드폰 번호: <input type="tel" size="20" placeholder="핸드폰 번호를 숫자만 입력해주세요" name="userPhone" id="userPhone" required></p>
                </div>
                <p align="center"><input type="submit" value="찾기"></p>
            </div>
        </form>
    </c:if>
    <c:if test="${!empty userInfo}">
        <div style="text-align: center;margin: 0 auto; width: 200px;height: 150px;background-color: #E4E0DB">
            <div>
                찾으시는 아이디는 <strong>${userInfo.userId}</strong> 입니다.
            </div>
        </div>
    </c:if>
    <div id="list">
        <div>
            <span><a href="#">비밀번호 찾기</a></span>
        </div>
        <div><a href="/mypage">로그인 하러가기</a></div>
    </div>
</div>
</body>
</html>