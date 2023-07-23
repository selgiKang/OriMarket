<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>title</title>
</head>
<body>
<form action="/upload" method="post" enctype="multipart/form-data">
    <input type="file" name="files" multiple>
    <input type="submit" value="업로드">


    <!-- 업로드된 이미지를 표시하는 예시 -->
    <c:if test="${!empty reviews}">
    <c:forEach var="review" items="${reviews}">
        <div>
            <p>${review.content}</p>
            <img src="${review.imageUrl}" width="200">
        </div>
    </c:forEach>
    </c:if>
</form>
</body>
</html>

