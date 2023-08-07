<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link href="../code/loginpage.css" rel="stylesheet" media="all">
    <link rel="stylesheet" type="text/css" href="../../css/user/findPassword.css">
    <title>Orimarket_비밀번호찾기</title>
</head>
<body>
<h1>오리시장</h1>
<div id="container">
    <c:if test="${empty userInfo}">
        <form action="/findUserId" method="post" onsubmit="return validateLoginForm();">
            <a href="/"><h1 style="position: fixed; left: 20px; top: 0; font-size: 30px; color: red">홈으로 바로가기</h1></a>
            <div id="login_box">
                <div class="form-group email-form">
                    <label for="userEmail1">이메일</label>
                    <div class="input-group">
                        <input type="text" class="form-control" name="userEmail" id="userEmail1" placeholder="이메일" >
                        <select class="form-control" name="userEmail2" >
                            <option>@naver.com</option>
                            <option>@daum.net</option>
                            <option>@gmail.com</option>
                            <option>@hanmail.com</option>
                            <option>@yahoo.co.kr</option>
                        </select>
                     </div>
                </div>
            </div>
            <div class="input-group-addon">
                <button type="button" class="btn btn-primary" id="mail-Check-Btn">본인인증</button>
            </div>
            <div class="mail-check-box">
                <input class="form-control mail-check-input" placeholder="인증번호 6자리를 입력해주세요!" disabled="disabled" maxlength="6">
            </div>
            <span id="mail-check-warn"></span>
        </form>
    </c:if>
    <c:if test="${!empty userInfo}">
        <div style="text-align: center;margin: 0 auto; width: 375px;height: 250px;background-color: #E4E0DB">
            <div>
                찾으시는 아이디는 <strong>${userInfo.userId}</strong> 입니다.
            </div>
        </div>
    </c:if>
    <div id="list">
        <div>
            <span><a href="#">비밀번호 찾기</a></span>
        </div>
        <div><a href="/join">회원가입</a></div>
    </div>
</div>
<div id="footer">푸터z</div>
</body>
</html>