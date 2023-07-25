<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>결제 결과</title>
</head>
<body>
<h1>결제 결과</h1>
<%-- 여기에 결제 성공/실패 여부를 표시하는 로직 추가 --%>
<script>
    // 결제 성공/실패 여부 확인 로직
    var paymentSuccess = true; // true 또는 false로 결제 성공/실패 여부를 설정

    if (paymentSuccess) {
        alert("결제가 성공적으로 완료되었습니다.");
        // 결제 성공 시, 원하는 페이지로 이동 (예: 주문 완료 페이지)
        window.location.href = "/orderComplete";
    } else {
        alert("결제가 실패하였습니다. 다시 시도해주세요.");
        // 결제 실패 시, 원하는 페이지로 이동 (예: 장바구니 페이지)
        window.location.href = "/myCartPage";
    }
</script>
</body>
</html>
