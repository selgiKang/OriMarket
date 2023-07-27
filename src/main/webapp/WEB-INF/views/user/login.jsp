<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link href="../code/loginpage.css" rel="stylesheet" media="all">
    <title>Insert title here</title>
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

    .loginpage_title_wrap{width:375px; height:140px; margin:auto; padding: 10% 20%; text-align: center;}
    .loginpage_title_wrap > a{text-decoration: none;}
    .loginpage_title_wrap > a >h1{font-size: 55px; color:#46A973; letter-spacing: 10px; text-align: center;}

    #container{width: 300px; height: 400px; padding:20px; text-align: center;
        background-color:#fff; border-radius: 10px; box-shadow: 0 3px 6px 0 rgba(0,0,0, 0.4); margin: 0 10%;}

    h1.login_title{color: #333; letter-spacing: 5px; margin: 20px 20px 30px 20px;}
    div#login_box{margin:20px 0}
    div.login_box_wrap{margin-bottom:25px;}
    div.login_box_wrap p {margin-bottom:10px;}

    input[type=text] {width: 65%; height: 30px; font-size: 15px; border: 0; border-radius: 15px; outline: none; padding-left: 10px; background-color: rgb(233, 233, 233);}
    input[type=password] {width: 65%; height: 30px; font-size: 15px; border: 0; border-radius: 15px; outline: none; padding-left: 10px; background-color: rgb(233, 233, 233);}
    input.login_btn { width:82%; height:40px; background-color:#46A973; border:none; border-radius: 25px; color:#fff; font-weight: 700; font-size: 16px; font-family: 'omyu_pretty';}
    input.login_btn:hover{ background-color:#333; color:#ffbf41;}

    div.join_btn_wrap{width:100%;}
    a.join_btn{width:70%; height:40px; padding: 4% 32%; background-color:#ffbf41; border:none; border-radius: 25px; color:#333; font-weight: 700; font-size: 16px;}
    a.join_btn:hover {background-color: #333; color:#fff;}
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