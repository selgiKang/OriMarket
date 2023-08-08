<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>오리마켓 매니저 로그인</title>
    <link rel="stylesheet" href="../../css/manager/manager_login.css">

</head>


<body <%--id="managerLogin_body"--%>>
<% if (request.getAttribute("pleaseLogin") != null) { %>
window.onload = function() {
alert("<%= request.getAttribute("pleaseLogin") %>");
};
<% } %>
<div id="businesslogin_wrap">
    <div class="businesslogin_wrapbox">
        <div class="businesslogin_title_wrap">
            <h1>오리시장</h1>
        </div>
        <div id="container">
            <h1 class="login_title">매니저 로그인</h1>
            <form action="/managerLogin" method="post">
                <div id="login_box">
                    <div class="login_box_wrap">
                        <p>아이디 &nbsp;&nbsp;<input id="managerId" type="text" size="20" placeholder=" 아이디를 입력해주세요.."
                                                  name="managerId" required></p>
                        <p>패스워드 <input id="managerPassword" type="password" size="20" placeholder=" *********"
                                       name="managerPassword" required></p>
                    </div>
                    <p style="margin-bottom:10px;"><input type="checkbox" name="login" value=""> 로그인 상태 유지</p>
                    <p align="center"><input class="login_btn" type="submit" value="로그인"></p>
                </div>
            </form>
            <c:if test="${!empty fail}">
                <tr>
                    <td colspan="2"><small style="color:red;">아이디와 비밀번호가 틀렸습니다.</small></td>
                </tr>
            </c:if>
            <%-- 서버에서 에러 메시지를 전달할 경우 알림 팝업 띄우기 --%>
            <div id="list" style="margin-top:15px;">
                <div style="margin-top: 20px;margin-bottom:20px;padding-bottom: 5px;">
                    <a href="/findManagerId">아이디 찾기</a>&nbsp;/ <span><a href="#">비밀번호 찾기</a></span>
                </div>
                <div class="join_btn_wrap" style="margin-bottom:40px;"><a class="join_btn" href="/managerJoin">회원가입</a>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>