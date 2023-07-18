<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Orimarket_ImportantNotice</title>
</head>
<body>
    <header>
        <h3>공지사항</h3>
        <a href="businessInsertMessage">공지사항 작성하기</a>
    </header>
    <table>
        <tr><th>순번</th><th>날짜</th><th>제목</th></tr>
        <c:forEach var="resultMessage" items="${resultMessage}">
            <tr>
                <td>${status.index + 1}</td>
                <td><a>${resultMessage.messageInsertDate}</a></td>
                <td>${resultMessage.messageTitle}</td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>