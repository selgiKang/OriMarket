<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Orimarket_ImportantNoticeDetail</title>
  <link rel="stylesheet" href="../../css/business/message_detail.css">
</head>
<body id="messageDetail_body">
  <form action="/message_edit/${getmessages.messageId}" method="post">
    <table id="messageEdit_table" style="border-collapse: collapse;">
      <tr class="messageEdit_tr">
        <td class="messageEdit_td1" style="height: 30px;">제목</td>
        <td class="messageEdit_td2">
          <input type="text" name="messageTitle" value="${getmessages.messageTitle}">
        </td>
      </tr>
      <tr class="messageEdit_tr">
        <td class="messageEdit_td1">공지 내용</td>
        <td class="messageEdit_td2">
          <textarea type="textarea" rows="10" maxlength="700" name="totalMessage">${getmessages.totalMessage}</textarea>
        </td>
      </tr>
      <tr class="messageIEdit_tr">
        <td colspan="2" class="messageEdit_td1">
          <input id="messageEdit_btn" type="submit" value="수정">
        </td>
      </tr>
    </table>
  </form>
</body>
</html>
