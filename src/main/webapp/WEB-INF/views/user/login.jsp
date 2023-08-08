<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link href="../code/loginpage.css" rel="stylesheet" media="all">
    <link rel="stylesheet" type="text/css" href="../../css/user/login.css">
    <title>로그인</title>
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
            <h1 class="login_title">로그인</h1>
            <form action="/login" method="post" onsubmit="return validateLoginForm();">
                <div id="login_box">
                    <div class="login_box_wrap">
                        <p>아이디 &nbsp;&nbsp;<input type="text" size="20" placeholder=" 아이디를 입력해주세요.." name="userId" id="userId" required></p>
                        <p>패스워드 <input type="password" size="20" placeholder=" *********" name="userPassword" id="userPassword" required></p>
                    </div>
                    <p style="margin-bottom:10px;"><input type="checkbox" name="login" value=""> 로그인 상태 유지</p>
                    <p align="center"><input class="login_btn" type="submit" value="로그인"></p>
                </div>
            </form>
            <div id="list" style="margin-top:15px;">
                <div style="margin-top: 20px;margin-bottom:20px;padding-bottom: 5px;">
                    <a href="/findUserId">아이디 찾기</a> / <span><a href="#">비밀번호 찾기</a></span>
                </div>
                <div class="join_btn_wrap" style="margin-bottom:40px;"><a href="/join" class="join_btn">회원가입</a></div>
            </div>
        </div>
    </div>
    <jsp:include page="../footer/footer.jsp" />
</div>
</body>
</html>