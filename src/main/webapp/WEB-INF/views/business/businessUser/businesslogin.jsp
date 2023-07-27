<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
    <meta charset="UTF-8">
    <link href="../code/loginpage.css" rel="stylesheet" media="all">
    <title>Insert title here</title>
    <style>
    </style>

</head>
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
    #businesslogin_wrap{background-color:#46A973; width:375px; height:812px; margin:auto;}
    .businesslogin_wrapbox{width:375px; height:812px;}
    .businesslogin_wrapbox a{text-decoration: none; color:#333;}

    .businesslogin_title_wrap{width:375px; height:200px; margin:auto; padding: 20%; text-align: center;}
    .businesslogin_title_wrap>h1{font-size: 55px; color:#ffbf41; letter-spacing: 10px; text-align: center;}
    .businesslogin_title_wrap>h3{color:#fff}

    #container{width: 300px; height: 400px; padding:20px; text-align: center;
        background-color:#fff; border-radius: 10px; box-shadow: 0 3px 6px 0 rgba(0,0,0, 0.4); margin: 0 10%;}

    h1.login_title{color: #333; letter-spacing: 5px; margin: 20px 20px 30px 20px;}
    div#login_box{margin:20px 0}
    div.login_box_wrap{margin-bottom:25px;}
    div.login_box_wrap p {margin-bottom:10px;}

    input[type=text] {width: 65%; height: 30px; font-size: 15px; border: 0; border-radius: 15px; outline: none; padding-left: 10px; background-color: rgb(233, 233, 233);}
    input[type=password] {width: 65%; height: 30px; font-size: 15px; border: 0; border-radius: 15px; outline: none; padding-left: 10px; background-color: rgb(233, 233, 233);}

    input.login_btn { width:80%; height:40px; background-color:#46A973; border:none; border-radius: 25px; color:#fff; font-weight: 700; font-size: 16px; font-family: 'omyu_pretty';}
    input.login_btn:hover{ background-color:#333; color:#ffbf41;}

    div.join_btn_wrap{width:100%;}
    a.join_btn{width:70%; height:40px; padding: 4% 32%; background-color:#ffbf41; border:none; border-radius: 25px; color:#333; font-weight: 700; font-size: 16px;}
    a.join_btn:hover {background-color: #333; color:#fff;}
</style>
<body>
<div id="businesslogin_wrap">
    <div class="businesslogin_wrapbox">
        <div class="businesslogin_title_wrap">
            <h1>오리시장</h1>
        </div>
        <div id="container">
            <h1 class="login_title">사업자 로그인</h1>
            <form action="/login1" method="post">
                <div id="login_box">
                    <div class="login_box_wrap">
                        <p>아이디 &nbsp;&nbsp;<input  type="text"  size="20" placeholder=" 아이디를 입력해주세요.." name="buUserId" required></p>
                        <p>패스워드 <input  type="password"  size="20" placeholder=" *********" name="buUserPassWord" required></p>
                    </div>
                    <p style="margin-bottom:10px;"><input type="checkbox" name="login" value=""> 로그인 상태 유지</p>
                    <p align="center"><input class="login_btn" type="submit" value="로그인"></p>
                </div>
            </form>
            <div id="list" style="margin-top:15px;">
                <div style="margin-top: 20px;margin-bottom:20px;padding-bottom: 5px;">
                    <a href="#">아이디 찾기</a> / <span><a href="#">비밀번호 찾기</a></span>
                </div>
                <div class="join_btn_wrap" style="margin-bottom:40px;"><a href="/join1" class="join_btn">회원가입</a></div>
            </div>
        </div>
    </div>
</div>
<%--<div id="footer">푸터z</div>--%>
</body>
<script>
    <%-- 서버에서 에러 메시지를 전달할 경우 알림 팝업 띄우기 --%>
    <% if (request.getAttribute("loginError") != null) { %>
    window.onload = function() {
        var errorMessage = "<%= request.getAttribute("loginError") %>";
        if (errorMessage.trim() !== "") {
            alert(errorMessage);
        }
    };
    <% } %>
    <% if (request.getAttribute("deleteError") != null) { %>
    window.onload = function() {
        var errorMessage = "<%= request.getAttribute("deleteError") %>";
        if (errorMessage.trim() !== "") {
            alert(errorMessage);
        }
    };
    <% } %>
</script>
</html>