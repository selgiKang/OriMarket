<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="for" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>title</title>
    <style>
        #b_table{border: 1px solid black;}

    </style>
</head>
<body>
    <form action="" method="">
        <h1>사업자등록현황</h1>
        <table id="b_table">
            <tr>
                <th>시장</th>
                <th>사업자번호</th>
                <th>가게상호명</th>
                <th>대표</th>
                <th>주소</th>
                <th>아이디</th>
                <th>연락처</th>
                <th>이메일</th>
            </tr>
            <%--반복문시작--%>
            <c:forEach var="buser" items="${busers}">
            <tr>
                <td>${buser.market.marketName}</td>
                <td>${buser.buUserNumber}</td>
                <td>${buser.businessStores.get(0).buStoreName}</td>
                <td>${buser.buUserName}</td>
                <td>${buser.buUserAddress}</td>
                <td>${buser.buUserId}</td>
                <td>${buser.buUserPhone}</td>
                <td>${buser.buUserEmail}</td>
            </tr>
            </c:forEach>
        </table>
    </form>
</body>
</html>

