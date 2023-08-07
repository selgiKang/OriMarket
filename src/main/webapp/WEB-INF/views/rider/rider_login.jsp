<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>

<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link href="../code/loginpage.css" rel="stylesheet" media="all">
    <link rel="stylesheet" href="../../css/rider_login.css">
</head>
<body>
<div id="businesslogin_wrap">
    <div class="businesslogin_wrapbox">
        <div class="businesslogin_title_wrap">
            <h1>오리시장</h1>
        </div>
        <div id="container">
            <h1 class="login_title">라이더 로그인</h1>
            <form action="/rider_login" method="post">
                <div id="login_box">
                    <div class="login_box_wrap">
                        <p>아이디 &nbsp;&nbsp;<input type="text" size="20" placeholder=" 아이디를 입력해주세요.." name="riderId"
                                                  required></p>
                        <p>패스워드 <input type="password" size="20" placeholder=" *********" name="riderPassword" required>
                        </p>
                    </div>
                    <p style="margin-bottom:10px;"><input type="checkbox" name="" value=""> 로그인 상태 유지</p>
                    <p align="center"><input class="login_btn" type="submit" value="로그인"></p>
                </div>
            </form>
            <div id="list" style="margin-top:15px;">
                <div style="margin-top: 20px;margin-bottom:20px;padding-bottom: 5px;">
                    <a href="#">아이디 찾기</a> / <span><a href="#">비밀번호 찾기</a></span>
                </div>
                <div class="join_btn_wrap" style="margin-bottom:40px;"><a href="/rider_join" class="join_btn">회원가입</a>
                </div>
            </div>
        </div>
    </div>
</div>
<%--<div id="footer">푸터z</div>--%>
</body>
<script>
    <%-- 서버에서 에러 메시지를 전달할 경우 알림 팝업 띄우기 --%>
    <% if (request.getAttribute("loginError") != null) { %>
    window.onload = function () {
        var errorMessage = "<%= request.getAttribute("loginError") %>";
        if (errorMessage.trim() !== "") {
            alert(errorMessage);
        }
    };
    <% } %>
    <% if (request.getAttribute("deleteError") != null) { %>
    window.onload = function () {
        var errorMessage = "<%= request.getAttribute("deleteError") %>";
        if (errorMessage.trim() !== "") {
            alert(errorMessage);
        }
    };
    <% } %>
</script>
</html>