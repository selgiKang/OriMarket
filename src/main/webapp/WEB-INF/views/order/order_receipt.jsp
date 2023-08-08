<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ori_Receipt</title>
<script src="https://kit.fontawesome.com/59f45736e5.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="../../css/order/order_receipt.css">
</head>
<body>
	<main id="orderReceipt_main">
		<div id="orderReceipt_btn_cancel"><a href="#"><i class="fas fa-regular fa-xmark"></i></a></div>
		<div id="orderReceipt_title"><h3>영 수 증</h3></div>
		<table id="orderReceipt_table_1">
			<tr id="orderReceipt_table1_tr_1"><td>${marketName}</td></tr>
			<tr id="orderReceipt_table1_tr_2"><td>주문번호: 202307040001</td></tr>
			<tr id="orderReceipt_table1_tr_3"><td>2023-06-29 12:10</td></tr>
		</table>
		<table id="orderReceipt_table_2">
			<tr class="orderReceipt_table2_tr_1"><td colspan="3">생생 야채 가게</td></tr>
			<tr class="orderReceipt_table2_tr_2"><td class="orderReceipt_table2_td_1">대파</td><td class="orderReceipt_table2_td_2">1개</td><td class="orderReceipt_table2_td_3">3,000원</td></tr>
			<tr class="orderReceipt_table2_tr_2"><td class="orderReceipt_table2_td_1">양파</td><td class="orderReceipt_table2_td_2">1개</td><td class="orderReceipt_table2_td_3">1,500원</td></tr>
		</table>
		<hr>
		<table id="orderReceipt_table_3">
			<tr><td>주문 금액</td><td class="orderReceipt_table3_td_2">4,500원</td></tr>
			<tr><td>배달비</td><td class="orderReceipt_table3_td_2">2,000원</td></tr>
		</table>
		<hr>
		<table id="orderReceipt_table_4">
			<tr><td class="orderReceipt_table4_td_1">삼성카드 결제</td><td class="orderReceipt_table4_td_2">6,500원</td></tr>
		</table>
		<hr>
		<table id="orderReceipt_table_5">
			<tr id="orderReceipt_table5_tr_1"><td class="orderReceipt_table5_td_1">총 결제금액</td><td class="orderReceipt_table5_td_2">6,500원</td></tr>
			<tr id="orderReceipt_table5_tr_2"><td colspan="2">(배달주소) 서울 특별시</td></tr>
		</table>
	</main>
</body>
</html>