<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Orimarket_ImportantNotice</title>
</head>
<style>
    @font-face {
        font-family: 'LINESeedKR-Bd';
        src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/LINESeedKR-Bd.woff2') format('woff2');
        font-weight: 700;
        font-style: normal;
    }
    #message_body{
        font-family: "LINESeedKR-Bd",sans-serif;
        font-size: 16px;
        margin: 0 auto;
        width: 375px;
    }
    #message_header{text-align: center;}
    #message_header>a{
        color: black;
        text-decoration: none;
        margin: 0 auto;
    }
    #message_header>a:hover {
        opacity: 0.7;
    }
    #message_header>h3{
        margin: 0 auto;
    }
    #message_table{
        width: 100%;
    }
    .message_td_1{
        padding: 10px;
        width: 50px;
        text-align: center;
    }
    .message_td_2{
        padding: 10px;
    }
    .message_td_2>a{
        color: black;
        text-decoration: none;
    }
    .message_td_2>a:hover {
        opacity: 0.7;
    }

    /*뒤로가기*/
    .line {
        border-top: 1px solid #c4c4c4;
        width: 330px;
        margin: 30px auto;
        position: relative;
        right: 8px;
        margin-top: 20px;
    }

    button.backbtn {
        display: flex;
        align-items: center;
        font-size: 20px;
        color: #999;

        margin: 10px 0 0 10px; width: 30px; height: 30px; background-color: #fff; border-radius: 50%; border: 1px solid #999; cursor: pointer; justify-content: center;}
    button.backbtn:hover {background-color:#333; color:#fff;}

</style>
<body id="message_body">
    <header id="message_header">
        <%--뒤로가기 디자인 바꿔도 됩니다--%>
        <button class="backbtn" onclick="window.location.replace('storenotice1')">&lt;</button>
        <div class="line"></div>
        <h3>공지사항</h3>
        <a href="businessInsertMessage">공지사항 작성하기</a>
    </header>
    <table id="message_table">
        <tr><th>순번</th><th>날짜</th><th>제목</th></tr>
        <c:forEach var="resultMessage" items="${resultMessage}" varStatus="status">
            <tr>
                <td class="message_td_1">${status.index + 1}</td>
                <td class="message_td_2"><a href="/message_detail/${resultMessage.messageId}">${resultMessage.messageInsertDate}</a></td>
                <td class="message_td_2">${resultMessage.messageTitle}</td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>