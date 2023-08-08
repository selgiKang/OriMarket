<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link href="../code/loginpage.css" rel="stylesheet" media="all">
    <link href="../../user/css/user_find_id.css" rel="stylesheet">
    <title>Orimarket 아이디찾기</title>
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
            <h1 class="login_title">아이디 찾기</h1>
            <c:if test="${empty userInfo}">
            <form action="/findUserId" method="post" onsubmit="return validateLoginForm();">
                <div id="login_box">
                    <div class="login_box_wrap">
                        <p>이름 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" size="20" placeholder="이름만 입력해주세요" name="userId" id="userId" required></p>
                        <p>휴대폰번호 <input type="tel" size="20" placeholder="'-' 없이 숫자만 입력해주세요" name="userPhone" id="userPassword" required></p>
                    </div>
                    <p align="center"><input class="search_btn" type="submit" value="찾기"></p>
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
            <div id="list" style="margin-top:15px;">
                <div style="margin-top: 25px;margin-bottom:25px;padding-bottom: 5px;">
                    <span><a href="#" class="findpw_btn">비밀번호 찾기 ></a></span>
                </div>
                <div class="dologin_btn_wrap" style="margin-bottom:40px;"><a href="/mypage" class="dologin_btn">로그인 하러가기</a></div>
            </div>
        </div>
    </div>
    <jsp:include page="../footer/footer.jsp" />
</div>
</body>
</html>