<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<html>
<head>
  <meta charset="UTF-8">
  <title>Orimarket_ManagerLogin</title>
  <style>
    @font-face {
      font-family: 'LINESeedKR-Bd';
      src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/LINESeedKR-Bd.woff2') format('woff2');
      font-weight: 700;
      font-style: normal;
    }
    #managerLogin_body{
      font-family: "LINESeedKR-Bd",sans-serif;
      margin: 0 auto;
      width: 375px;
      font-size: 16px;
    }
    #managerLogin_body>h2{
      margin: 0 auto;
      text-align: center;
      margin-top: 30%;
    }
    .managerLogin_table{
      width: 100%;
      border-collapse: collapse;
      height: 150px;
    }
    .managerLogin_table_border{
      border: #46A973 1px solid;
      border-radius: 10px;
      width: 100%;
    }
    .managerLogin_td_1{
      padding-left: 10px;
    }
    .managerLogin_td_2>input{
      height: 10px;
      width: 70%;
    }
    .managerLogin_td_3>input{
      font-family: "LINESeedKR-Bd",sans-serif;
      outline: none;
      border: none;
      background: #46A973;
      color: white;
      font-weight: bolder;
      padding: 5px;
      font-size: 16px;
    }
    .managerLogin_td_3>input:focus {
      outline-color: #46A973;
    }
    .managerLogin_td_3>a{
      outline: none;
      border: none;
      background: #46A973;
      color: white;
      padding: 5px;
      height: 17px;
      font-size: 16px;
    }
    .managerLogin_tr{
      text-align: center;
    }
    .managerLogin_tr a{
      text-decoration: none;
    }
    .managerLogin_tr a:hover{
      opacity: 0.7;
    }
  </style>
</head>
<body id="managerLogin_body">
<h2> 로 그 인</h2>
<form action="/managerLogin" method="post">
  <div class="managerLogin_table_border">
    <table class="managerLogin_table">
      <tr>
        <td class="managerLogin_td_1">아 이 디</td>
        <td class="managerLogin_td_2"><input style="height: 15px;" type="text" placeholder="아이디" name="managerId"></td>
      </tr>
      <tr>
        <td class="managerLogin_td_1">비밀번호</td>
        <td class="managerLogin_td_2"><input style="height: 15px;" type="password" placeholder="비밀번호" name="managerPassword"></td>
      </tr>
    </table>
    <table style="width: 100%;text-align: center;">
      <tr class="managerLogin_tr">
        <td class="managerLogin_td_3"><input type="submit" value="로 그 인"></td>
        <td class="managerLogin_td_3" ><a style="padding: 5px;height: 15px;" href="/managerJoin">회원가입</a></td>
      </tr>
    </table>
  </div>
</form>
</body>
</html>