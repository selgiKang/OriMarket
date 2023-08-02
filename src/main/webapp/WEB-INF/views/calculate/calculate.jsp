<%@ page import="java.time.LocalDateTime" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--특정 위치마다 , 넣도록--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Ori_매출내역</title>
    <script src="../../js/common/jquery-3.6.4.js"></script>
    <script src="../../js/calculate/calculate.js"></script>
    <script src="https://kit.fontawesome.com/59f45736e5.js" crossorigin="anonymous" ></script>
    <link rel="stylesheet" href="../../css/calculate/calculate.css">
</head>
<body id="calculate_body">
<%
    // 현재 시간을 LocalDateTime 형식으로 가져옴
    LocalDateTime now = LocalDateTime.now();

    // 원하는 형식으로 DateTimeFormatter를 생성 (예: "yyyy-MM-dd HH:mm:ss")
    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");

    // LocalDateTime 객체를 문자열로 변환
    String currentDate = now.format(formatter);

    // 한 달 후의 LocalDateTime을 계산
    LocalDateTime oneMonthLater = now.plusMonths(1);
    String currentDateLast = oneMonthLater.format(formatter);
%>
    <header id="calculate_header">
        <div id="calculate_title">
            <%--왼쪽 화살표--%>
            <a href="/backbuUser" onclick="location.href='/backbuUser'"><i class="fas fa-solid fa-arrow-left" style="color: #fafafa;"></i></a>
            내 수입
        </div>
        <%--정산 날짜 출력--%>
        <table id="calculate_date">
            <%--왼쪽 화살표--%>
            <tr>
                <td>
                    <a class="go-prev"><i class="fas fa-regular fa-angle-left" style="color: #f5f5f5;"></i></a>
                </td>
                <td>
                    <input type="hidden" name="calculate_date" id="calculate_date">
                    <%--해당 달 1달 후--%>
                    <input type="hidden" name="calculate_date_last" id="calculate_date_last">
                    <div id="calculate_search_date" style="color:#f5f5f5;"></div>
                </td>
            <%--오른쪽 화살표--%>
                <td>
                    <a class="go-next"><i id="calculate_search_rightArrow" class="fas fa-solid fa-angle-right" style="color: #f5f5f5;"></i></a>
                </td>
            </tr>
        </table>
    </header>
    <main>
        <div id="calculate_main_totalIncome">
            <p id="calculate_main_totalIncome_title">총 수입</p>

            <h3><fmt:formatNumber value="${allTotalPrice}" pattern="#,###"/>원</h3>
            <div>주문 횟수 ${orderCount}회</div>
            <small style="color: #818083">* 자세한 내역은 날짜를 클릭해주세요. *</small>
        </div>
        <table id="calculate_main_table">
            <tr id="calculate_main_table_tr_1">
                <td>날짜</td><td>수입</td>
            </tr>
            <tbody id="tableBody">
            <c:forEach items="${tableData}" var="datas">
                <tr>
                    <td class="calculate_main_table_td_1" style="text-align: center;">
                        <a class="dateTag" href="/details?orderNumber=${datas.orderNumber}">
                           <script>
                               var date = "${datas.date}";
                               var year = date.substr(0, 4);
                               var month = date.substr(4, 2);
                               var day = date.substr(6, 2);
                               var formatDate  = year+"년 "+month+"월 "+day+"일";
                               document.write(formatDate);
                           </script>
                        </a>
                    </td>
                    <td class="calculate_main_table_td_2" style="text-align:center;">
                        <h3><fmt:formatNumber value="${datas.totalPrice}" pattern="#,###"/>원</h3>
                    </td>
                    </tr>
            </c:forEach>
            </tbody>
        </table>
    </main>
</body>
</html>