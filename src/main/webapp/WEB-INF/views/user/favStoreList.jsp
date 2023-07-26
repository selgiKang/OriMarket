<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Orimarket_단골가게</title>
<style>
    @font-face {
      font-family: 'LINESeedKR-Bd';
      src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/LINESeedKR-Bd.woff2') format('woff2');
      font-weight: 700;
      font-style: normal;
    }
    #favStoreList_table_body{
      font-family: "LINESeedKR-Bd",sans-serif;
      font-size: 16px;
      margin: 0 auto;
      width: 375px;
    }
    #favStoreList_table_body>h3{
      margin: 0 auto;
    }
    #favStoreList_table{
      border-collapse: collapse;
      text-align: center;
      width: 100%;
    }
</style>
</head>
<body id="favStoreList_table_body">
  <h3>단골 가게 목록</h3>
  <table border="1" id="favStoreList_table">
    <tr><th>순번</th><th>가게 이름</th></tr>
    <c:forEach var="favResult" items="${favResult}" varStatus="status">
      <tr>
        <td>${status.index+1}</td>
        <td><a href="/store?favStoreName=${favResult.favStoreName}">${favResult.favStoreName}</a></td>
      </tr>
    </c:forEach>
  </table>
</body>
</html>
