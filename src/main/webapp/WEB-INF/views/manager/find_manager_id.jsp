<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link href="../code/loginpage.css" rel="stylesheet" media="all">
    <title>Orimarket_findId</title>
    <style>
        @font-face {
            font-family: 'omyu_pretty';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-01@1.0/omyu_pretty.woff2') format('woff2');
            font-weight: normal;
            font-style: normal;
        }

        *{margin: 0; padding: 0; box-sizing: border-box; font-family: 'omyu_pretty';}

        body{width: 375px; height: 812px; margin: 0 auto; }

        /* 230727 */
        #loginpage_wrap{background-color:#eee; width:375px; height:712px; margin:0 auto;}
        .loginpage_wrapbox{width:375px; height:612px;}
        .loginpage_wrapbox a{text-decoration: none; color:#333;}

        .loginpage_title_wrap{width:375px; height:160px; margin:auto; padding: 10% 20%; text-align: center;}
        .loginpage_title_wrap > a{text-decoration: none;}
        .loginpage_title_wrap > a >h1{font-size: 55px; color:#46A973; letter-spacing: 10px; text-align: center;}

        #container{width: 300px; height: 400px; padding:20px; text-align: center;
            background-color:#fff; border-radius: 10px; box-shadow: 0 3px 6px 0 rgba(0,0,0, 0.4); margin: 0 10%;}

        h1.login_title{color: #333; letter-spacing: 5px; margin: 20px 20px 30px 20px;}
        div#login_box{margin:20px 0}
        div.login_box_wrap{margin-bottom:25px;}
        div.login_box_wrap p {margin-bottom:10px;}

        input[type=text] {width: 65%; height: 30px; font-size: 15px; border: 0; border-radius: 15px; outline: none; padding-left: 10px; background-color: rgb(233, 233, 233);}
        input[type=tel] {width: 65%; height: 30px; font-size: 15px; border: 0; border-radius: 15px; outline: none; padding-left: 10px; background-color: rgb(233, 233, 233);}
        input.search_btn { width:82%; height:40px; background-color:#46A973; border:none; border-radius: 25px; color:#fff; font-weight: 700; font-size: 16px; font-family: 'omyu_pretty';}
        input.search_btn:hover{ background-color:#333; color:#ffbf41;}

        div.manager_join_btn_wrap{width:100%;}
        a.manager_join_btn{width:40%; height:40px; padding: 4% 32%; background-color:#ffbf41; border:none; border-radius: 25px; color:#333; font-weight: 700; font-size: 16px;}
        a.manager_join_btn:hover {background-color: #333; color:#fff;}
        a.findpw_btn{color:#333; font-weight: 600;}
        a.findpw_btn:hover{text-decoration: underline; color:#46A973;}
    </style>
    <script>
        <%-- 서버에서 에러 메시지를 전달할 경우 알림 팝업 띄우기 --%>
        <% if (request.getAttribute("managerloginError") != null) { %>
        window.onload = function() {
            var errorMessage = "<%= request.getAttribute("managerloginError") %>";
            if (errorMessage.trim() !== "") {
                alert(errorMessage);
            }
        };
        <% } %>
    </script>
</head>
<body>
<div id="loginpage_wrap">
    <div class="loginpage_wrapbox">
        <div class="loginpage_title_wrap">
            <a href="/managerLogin"><h1>오리시장</h1></a>
            <h2 style="margin:10px 0;letter-spacing: 5px;">매니저</h2>
        </div>
        <div id="container">
            <h1 class="login_title">아이디 찾기</h1>
            <c:if test="${empty managerUserResult}">
                <form action="/findManagerId" method="post" onsubmit="return validateLoginForm();">
                    <div id="login_box">
                        <div class="login_box_wrap">
                            <p>이름 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" size="20" placeholder="이름만 입력해주세요" name="managerName" id="managerName" required></p>
                            <p>휴대폰번호 <input type="tel" size="20" placeholder="'-' 없이 숫자만 입력해주세요" name="managerPhone" id="managerPhone" required></p>
                        </div>
                        <p align="center"><input class="search_btn" type="submit" value="찾기"></p>
                    </div>
                </form>
            </c:if>
            <c:if test="${!empty managerUserResult}">
                <div style="text-align: center;margin: 0 auto; width: 200px;height: 150px;background-color: #E4E0DB">
                    <div>
                        찾으시는 아이디는 <strong>${managerUserResult.managerId}</strong> 입니다.
                    </div>
                </div>
            </c:if>
            <div id="list" style="margin-top:15px;">
                <div style="margin-top: 25px;margin-bottom:25px;padding-bottom: 5px;">
                    <span><a href="#" class="findpw_btn">비밀번호 찾기</a></span>
                </div>
                <div class="manager_join_btn_wrap" style="margin-bottom:40px;"><a href="/managerJoin" class="manager_join_btn">회원가입</a></div>
            </div>
        </div>
</body>
</html>