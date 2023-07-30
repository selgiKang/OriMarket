<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <meta charset="UTF-8">
  <title>Orimarket_ManagerLogin</title>
  <link rel="stylesheet" href="../../css/manager/manager_login.css">
</head>
<body id="managerLogin_body">
  <% if (request.getAttribute("pleaseLogin") != null) { %>
  window.onload = function() {
  alert("<%= request.getAttribute("pleaseLogin") %>");
  };
  <% } %>
  <h2> 매니저 로그인</h2>
  <form action="/managerLogin" method="post">
    <div class="managerLogin_table_border">
      <table class="managerLogin_table">
        <tr>
          <td class="managerLogin_td_1">아 이 디</td>
          <td class="managerLogin_td_2"><input id="managerId" style="height: 20px;" type="text" placeholder="아이디" name="managerId"></td>
        </tr>
        <tr>
          <td class="managerLogin_td_1">비밀번호</td>
          <td class="managerLogin_td_2"><input id="managerPassword" style="height: 20px;" type="password" placeholder="비밀번호" name="managerPassword"></td>
        </tr>
        <c:if test="${!empty fail}">
          <tr>
            <td style="color: red" colspan="2"><small>아이디와 비밀번호가 틀렸습니다.</small></td>
          </tr>
        </c:if>
        <%-- 서버에서 에러 메시지를 전달할 경우 알림 팝업 띄우기 --%>
      </table>
      <table style="width: 100%;text-align: center;">
        <tr class="managerLogin_tr">
          <td class="managerLogin_td_3"><input type="submit" value="로 그 인"></td>
          <td class="managerLogin_td_3" ><a style="padding: 5px;height: 15px;" href="/managerJoin">회원가입</a></td>
        </tr>
        <tr>
          <td colspan="2"><a href="/findManagerId">아이디 찾기</a>&nbsp;|&nbsp;<a>비밀번호 찾기</a></td>
        </tr>
      </table>
    </div>
  </form>
</body>
</html>