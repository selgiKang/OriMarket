<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Orimarket_관리자 로그인</title>
    <link rel="stylesheet" href="../../css/admin/login.css">
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
<div id="loginpage_wrap">
    <div class="loginpage_wrapbox">
        <div class="loginpage_title_wrap">
        <a href="/"><h1>오리시장</h1></a>
        </div>
        <div id="container">
            <h1 class="login_title">관리자 로그인</h1>
            <form action="/adminLogin" method="post" onsubmit="return validateLoginForm();">
                <div id="login_box">
                    <div class="login_box_wrap">
                        <p>아이디 &nbsp;&nbsp;<input type="text" size="20" placeholder=" 아이디를 입력해주세요.." name="adminId" id="adminId" required></p>
                        <p>패스워드 <input type="password" size="20" placeholder=" *********" name="adminPassword" id="adminPassword" required></p>
                    </div>
                    <p style="margin-bottom:10px;"><input type="checkbox" name="login" value=""> 로그인 상태 유지</p>
                    <p align="center"><input class="login_btn" type="submit" value="로그인"></p>
                </div>
            </form>
        </div>
    </div>
    <jsp:include page="../footer/footer.jsp" />
</div>
</body>
</html>