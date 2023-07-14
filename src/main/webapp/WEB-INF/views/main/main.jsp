<%@ page language="java" contentType="text/html; charset=UTF-8"
          pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>OriMarket</title>
    <link rel= "stylesheet" href= "../../css/main/main.css">
</head>
<body>

    <div id="main">
        <jsp:include page="../header/header_index.jsp" />
        <div id="main_wrap_box">
            <c:if test="${empty userId}">
            <span class="connextion_title clear" style="font-weight:800; font-size: 18px;">&nbsp;<img class="connextion_title_img clear" src="../../img/main/singsing.png">&nbsp;&nbsp; 나의 단골시장</span>
            </c:if>
            <c:if test="${!empty userId}">
                <span class="connextion_title clear" style="font-weight:800; font-size: 18px;">&nbsp;<img class="connextion_title_img clear" src="../../img/main/singsing.png">&nbsp;&nbsp;${userNickname}님의 단골시장</span>
            </c:if>
            <div id="connextion_market" class="clear">
                <div class="connextion_marketbox clear">
                    <div class="connextion_mk1_wrap"><a class="connextion_mk1" href="/shinwon_marketmap"><p style="font-weight: 800;">신림<br>신원시장</p></a><p style="font-size: 10px;">　</p></div>
                    <div class="connextion_mk2_wrap"><a class="connextion_mk2" href=""><p>단골시장등록</p></a><p style="font-size: 40px;">+</p></div>
                    <div class="connextion_mk3_wrap"><a class="connextion_mk3" href=""><p>단골시장등록</p></a><p style="font-size: 40px;">+</p></div>
                    <div class="connextion_mk4_wrap"><a class="connextion_mk4" href=""><p>단골시장등록</p></a><p style="font-size: 40px;">+</p></div>
                </div>
            </div>
            <div id="main_banner_wrap">
                <div class="main_slidebanner_box slideshow-container">
                    <div class="mySlides fade"><img class="slideshow-image" src="../../img/main/exsliderbn.png" alt="메인배너1"></div>
                    <div class="mySlides fade"><img class="slideshow-image" src="../../img/main/exsliderbn2.png" alt="메인배너2"></div>
                    <div class="mySlides fade"><img class="slideshow-image" src="../../img/main/exsliderbn3.png" alt="메인배너3"></div>
                    <div class="mySlides fade"><img class="slideshow-image" src="../../img/main/exsliderbn4.png" alt="메인배너4"></div>
                </div>
                <div class="list-button">
                    <span class="list-button-item active"></span>
                    <span class="list-button-item"></span>
                    <span class="list-button-item"></span>
                    <span class="list-button-item"></span>
                </div>
            </div>
        </div>
        <jsp:include page="../footer/footer.jsp" />
    </div>
    <script type="text/javascript" src="../../js/main/main_slidebanner.js"></script>
</body>
</html>