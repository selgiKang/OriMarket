<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>User List</title>
</head>
<body>
<h2>User List</h2>
<table>
    <tr>
        <th>ID</th>
        <th>Password</th>
        <!-- 필요한 회원 정보에 따라 추가적인 컬럼을 작성합니다. -->
    </tr>
    <c:forEach items="${users}" var="user">
        <tr>
            <td>${user.userId}</td>
            <td>${user.userPassword}</td>
            <!-- 필요한 회원 정보에 따라 추가적인 컬럼 값을 출력합니다. -->
        </tr>
    </c:forEach>
</table>
</body>
</html>
