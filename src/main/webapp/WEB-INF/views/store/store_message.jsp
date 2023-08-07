<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Orimarket_ImportantNotice</title>
    <link rel="stylesheet" type="text/css" href="../../css/store/store_message.css">
</head>
<body id="message_body">
<header id="message_header">
    <h3>공지사항</h3>
</header>
<table id="message_table">
    <tr><th>순번</th><th>날짜</th><th>제목</th></tr>
    <c:forEach var="resultMessage" items="${resultMessage}" varStatus="status">
        <tr>
            <td class="message_td_1">${status.index + 1}</td>
            <c:if test="${empty sessionScope.userId}">
                <td class="message_td_2"><a href="/message_detail/${resultMessage.messageId}">${resultMessage.messageInsertDate}</a></td>
            </c:if>
            <c:if test="${!empty sessionScope.userId}">
                <td class="message_td_2">${resultMessage.messageInsertDate}</td>
            </c:if>
            <td class="message_td_2">${resultMessage.totalMessage}</td>
        </tr>
    </c:forEach>
</table>
</body>
</html>