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
    *{margin: 0; padding: 0; box-sizing: border-box;}

    body{
        width: 375px;
        height: 812px;
        display: flex;
        flex-direction: column;
        align-items: center;
        /* background: rgba(205, 133, 63, 0.4); */
        background-size: 50%;
        margin: 0 auto;
        border: 1px solid black;
        position: relative;

    }

    h1{
        margin-top: 50px;
        margin-bottom: 20px;
        font-style: italic;
        font-size: 50px;
    }
    h1>sub{
        font-size: 15px;
        opacity: 0.7;
        color: black;
        overflow: auto;
    }
    h1>span{
        color: green;
        overflow: auto;
    }
    #container{
        margin-top: 40px;
        border: 2px solid silver;
        padding: 20px 60px;
        background-color: rgba(144, 238, 144, 0.4);
        font-size: 25px;
        width: 350px;
        border-radius: 10px;
    }
    #login_box>div{
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
    #login_box>p:nth-of-type(2)>input[type="submit"]{
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
    #login_box>div>p:nth-of-type(1)>input[type="text"],input[type="password"]{
        margin-top: 5px;
        width: 90%;
        height: 40px;
        background-color: rgba(255, 255, 255, 0.5);
        border-radius: 5px;
        border: none;
    }
    #login_box>div>p:nth-of-type(2)>input[type="text"],input[type="password"]{
        margin-top: 5px;
        width: 90%;
        height: 40px;
        background-color: rgba(255, 255, 255, 0.5);
        border-radius: 5px;
        border: none;
    }
    #login_box>p:nth-of-type(1){
        font-size: small;
        position: relative;
        right: 37px;
    }
    #list{
        width: 310px;
        text-align: center;
        font-size: 0;
    }
    #list>div{
        display: inline-block;
        font-size: small;
        text-align: left;
        position: relative;
        right: 40px;
    }
    #list>div:nth-of-type(1){
        width: 60%;
    }
    #list>div:nth-of-type(2){
        width: 35%;
        text-align: right;
        padding-right: 5px;
    }

    #list a{
        text-decoration: none;
        color: black;
    }
    #list a:hover{
        text-decoration: underline;
        color: blue;
    }
    #footer{
        position: absolute;
        bottom: 0;
        height: 40px;
        width: 100%;
        background: #4caf50;
        text-align: center;
    }
</style>
<body>
<h1>오리시장</h1>
<div id="container">
    <form action="/login" method="post">
        <div id="login_box">
            <div>
                <p>id: <input  type="text"  size="20" placeholder=" 아이디를 입력해주세요.." name="userId" required></p>
                <p>pw: <input  type="password"  size="20" placeholder=" *********" name="userPassword" required></p>
            </div>
            <p><input type="checkbox" name="login" value=""> 로그인 상태 유지</p>
            <p align="center"><input type="submit" value="로그인"></p>
        </div>
    </form>
    <div id="list">
        <div>
            <a href="#">아이디 찾기</a> / <span><a href="#">비밀번호 찾기</a></span>
        </div>
        <div><a href="/join">회원가입</a></div>
    </div>
</div>
<div id="footer">푸터z</div>
</body>
</html>