<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Orimarket_ImportantNoticeDetail</title>
  <link rel="stylesheet" href="../../css/business/message_detail.css">
</head>
<body id="messageDetail_body">
  <table id="messageDetail_table" style="border-collapse: collapse;">
    <tr class="messageDetail_tr">
      <td class="messageDetail_td1" style="height: 30px;">제목</td>
      <td class="messageDetail_td2">
        ${getmessages.messageTitle}
      </td>
    </tr>
    <tr class="messageDetail_tr">
      <td class="messageDetail_td1" style="height: 30px;">작성일</td>
      <td class="messageDetail_td2">
        ${getmessages.messageInsertDate}
      </td>
    </tr>
    <tr class="messageDetail_tr">
      <td class="messageDetail_td1">공지 내용</td>
      <td class="messageDetail_td2">
        <div>${getmessages.totalMessage}</div>
      </td>
    </tr>
    <tr class="messageDetail_tr">
      <td colspan="2" class="messageDetail_td1">
        <a class="messageDetail_btn" type="submit" href="/message_edit/${getmessages.messageId}">수정</a>
        <a class="messageDetail_btn" type="submit" href="/message_delete/${getmessages.messageId}">삭제</a>
      </td>
    </tr>
  </table>
</body>
</html>
