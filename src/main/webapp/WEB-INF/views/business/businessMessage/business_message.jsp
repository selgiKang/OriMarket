<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Orimarket_ImportantNotice</title>
    <link rel="stylesheet" href="../../css/business/business_message.css">
</head>

<body id="message_body">
    <header id="message_header">
        <button class="backbtn" onclick="window.location.replace('storenotice1')" style="float: left;">&lt;</button>
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