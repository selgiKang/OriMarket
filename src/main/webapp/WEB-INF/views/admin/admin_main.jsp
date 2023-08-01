<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="for" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Orimarket_관리자 메인</title>
</head>
<body style="margin: 0 auto;">
    <div>
        <div><h3>관리 페이지</h3></div>
        <div>
            <table>
                <tr><th><a href="">일반 회원 페이지</a></th></tr>
                <tr><th><a href="/a_buser">사업자 페이지</a></th></tr>
                <tr><th><a href="/managercrud">매니저 페이지</a></th></tr>
                <tr><th><a href="/rider_list">라이더 페이지</a></th></tr>
                <tr><th><a href="/admin_order">주문 페이지</a></th></tr>
            </table>
        </div>
    </div>
</body>
</html>