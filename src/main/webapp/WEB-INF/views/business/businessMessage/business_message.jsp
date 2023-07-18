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

</style>
<body id="message_body">
    <header id="message_header">
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