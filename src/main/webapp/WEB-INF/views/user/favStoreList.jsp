<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Orimarket_단골가게</title>
  <link rel="stylesheet" type="text/css" href="../../css/user/favStoreList.css">
</head>
<body>

<div class="main-container">

  <div class="header">
    <jsp:include page="../header/header_index.jsp" />
  </div>

  <div class="headermsg_wrap">
  <%--뒤로가기--%>
  <button class="backbtn" onclick="window.location.replace('/mypage')">&lt;</button>
    <h3 style="margin: 15px 5px 5px; font-size: 20px; text-align: center;">단골 가게 목록</h3>
  </div>

  <div class="sub-container">
    <div class="content">
      <table>
        <tr class="hoverable-row">
          <th>순번</th>
          <th>가게 이미지</th>
          <th>가게 이름</th>
        </tr>
        <c:forEach var="favResult" items="${favResult}" varStatus="status">
          <tr class="hoverable-row">
            <td>${status.index + 1}</td>
            <%--8.3 테스트--%>
            <td><img src="../../img/store/${favResult.favStoreImg}" alt="가게 이미지" style="width: 100px; height: 100px;"></td>
            <td><a href="/store?favStoreName=${favResult.favStoreName}">${favResult.favStoreName}</a></td>
          </tr>
        </c:forEach>
      </table>
    </div>
  </div>

  <div class="fav_footer">
    <jsp:include page="../footer/footer.jsp" />
  </div>

</div>

</body>
</html>
