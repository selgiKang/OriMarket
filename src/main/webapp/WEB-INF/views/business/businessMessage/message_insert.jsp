<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <title>Orimarket_ImportantNotice</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link rel="stylesheet" href="../../css/business/message_insert.css">
</head>
<body id="messageInsert_body">
<header id="messageInsert_header">
    <h3>공지사항 등록</h3>
</header>
<form action="/messageInsert" method="post">
    <%
       // String buUserNumber = session.getAttribute("buUserNumber").toString();
        Date date = new Date();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String today = dateFormat.format(date);
    %>
    <%--<input type="hidden" name="buUserNumber" value="<%=buUserNumber%>">--%>
    <input type="hidden" name="messageInsertDate" value="<%=today%>">
    <table id="messageInsert_table" style="border-collapse: collapse;">
        <tr class="messageInsert_tr">
            <td class="messageInsert_td1" style="height: 30px;">제목</td>
            <td class="messageInsert_td2">
                <input type="text" name="messageTitle">
            </td>
        </tr>
        <tr class="messageInsert_tr">
            <td class="messageInsert_td1">공지 내용</td>
            <td class="messageInsert_td2">
                <textarea type="textarea" rows="10" maxlength="700" name="totalMessage"></textarea>
            </td>
        </tr>
        <tr class="messageInsert_tr">
            <td colspan="2" class="messageInsert_td1">
                <input id="messageInsert_btn" type="submit" value="등록">
            </td>
        </tr>
    </table>
</form>
</body>
</html>