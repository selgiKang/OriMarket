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

    body {
      font-family: "LINESeedKR-Bd", sans-serif;
      font-size: 16px;
      margin: 0 auto;
      max-width: 375px;
      padding: 20px;
    }

    /*핸드폰화면 사이즈*/
    .main-container {
      width: 375px;
      /*        height: 812px;*/
      margin: 0 auto;
      display: flex;
      flex-direction: column;
      align-items: center;
      background-color: #eee;
      overflow: auto;
      overflow-x: hidden;
      position: relative;
    }

    h3 {
      /* 제목 텍스트 스타일 */
      /*margin: 15px 5px 5px;*/
      font-size: 20px;
      display: inline;
      white-space: nowrap; /* 한 줄로 표시 */
      margin-right: 100px;

    }

    .sub-container{
      border-radius: 5px;
      background-color: white;
      height: 100%;
      max-width: 365px;
      width: 90%;
      margin-top: 5px;
      margin-bottom:5px;
      border: 10px solid transparent;
      margin-bottom: 5px;

    }

    .content{
      margin: 10px;
    }

    table {
      border-collapse: collapse;
      width: 100%;
      background-color: white;
      overflow: hidden;
     /* border-radius: 3px;*/
      border: none;
    }



    th, td {
      /*border: 1px solid #ccc;*/
      border: none;
      padding: 8px;
      text-align: center;

    }

    th {
      background-color: white;
    }

    tr:nth-child(even) {
      background-color: white;
    }

    a {
      color: #007bff;
      text-decoration: none;
    }

    a:hover {
      text-decoration: underline;
    }

    .headermsg_wrap {
      width: 90%;
      display: flex;
      align-items: center;
      justify-content: flex-start;
      align-items: end;

    }


    button.backbtn{
      display: flex;
      align-items: center;
      font-size: 20px;
      color: #999;
      margin: 0 0 0 10px;
      width: 30px;
      height: 30px;
      background-color: #fff;
      border-radius: 50%;
      border: 1px solid #999;
      cursor: pointer;
      justify-content: center;
      margin-right:20%;}

    button.backbtn:hover {background-color:#333; color:#fff;}

    .header{
      font-family: 'omyu_pretty';
    }

    .fav_footer{
      font-family: 'omyu_pretty';
      width: 100%;
      margin-top: 20px;

    }

    .hoverable-row:hover td {
      background-color: rgb(70, 169, 115); /* 변경하고자 하는 배경색 지정 */
    }

    .hoverable-row:hover a {
      color: #f8f6f6; /* 변경하고자 하는 가게 이름 색상 지정 */
    }
  </style>
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
          <th>가게 이름</th>
        </tr>
        <c:forEach var="favResult" items="${favResult}" varStatus="status">
          <tr class="hoverable-row">
            <td>${status.index + 1}</td>
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
