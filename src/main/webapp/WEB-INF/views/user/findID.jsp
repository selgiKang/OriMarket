<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link href="../code/loginpage.css" rel="stylesheet" media="all">
    <title>Orimarket_findId</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }

        body {
            width: 375px;
            height: 812px;
            display: flex;
            flex-direction: column;
            align-items: center;
            background-size: 50%;
            margin: 0 auto;
            border: 1px solid black;
            position: relative;
        }

        h1 {
            margin-top: 50px;
            margin-bottom: 20px;
            font-style: italic;
            font-size: 50px;
        }

        #container {
            margin-top: 40px;
            border: 2px solid silver;
            padding: 20px 60px;
            background-color: rgba(144, 238, 144, 0.4);
            font-size: 25px;
            width: 350px;
            border-radius: 10px;
        }

        #login_box > div {
            margin-bottom: 10px;
            border: 1px solid silver;
            padding: 10px;
            font-size: 15px;
            border-radius: 10px;
            text-align: center;
            position: relative;
            right: 40px;
            width: 310px;
        }

        #login_box > p:nth-of-type(2) > input[type="submit"] {
            background-color: #8BC34A;
            width: 310px;
            margin: 0 auto;
            border-radius: 10px;
            height: 50px;
            margin-bottom: 7px;
            margin-top: 10px;
            font-size: large;
            font-weight: bolder;
            border-right: 1px solid silver;
            border-bottom: 1px solid silver;
            position: relative;
            right: 40px;
        }

        #login_box > div > p:nth-of-type(1) > input[type="text"],
        input[type="password"] {
            margin-top: 5px;
            width: 90%;
            height: 40px;
            background-color: rgba(255, 255, 255, 0.5);
            border-radius: 5px;
            border: none;
        }

        #login_box > div > p:nth-of-type(2) > input[type="text"],
        input[type="password"] {
            margin-top: 5px;
            width: 90%;
            height: 40px;
            background-color: rgba(255, 255, 255, 0.5);
            border-radius: 5px;
            border: none;
        }

        #login_box > p:nth-of-type(1) {
            font-size: small;
            position: relative;
            right: 37px;
        }

        #list {
            width: 310px;
            text-align: center;
            font-size: 0;
        }

        #list > div {
            display: inline-block;
            font-size: small;
            text-align: left;
            position: relative;
            right: 40px;
        }

        #list > div:nth-of-type(1) {
            width: 60%;
        }

        #list > div:nth-of-type(2) {
            width: 35%;
            text-align: right;
            padding-right: 5px;
        }

        #list a {
            text-decoration: none;
            color: black;
        }

        #list a:hover {
            text-decoration: underline;
            color: blue;
        }

        #footer {
            position: absolute;
            bottom: 0;
            height: 40px;
            width: 100%;
            background: #4caf50;
            text-align: center;
        }
    </style>
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