<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>OriMarket</title>
    <link rel= "stylesheet" href= "../../css/main/main.css">
    <link rel= "stylesheet" href= "../../css/main/connexion_market.css">
    <style>
        div.connextion_mk1_wrap{position:relative;}
        .connexion_marketbox_wrap{display: flex; justify-items: center; align-items: center;}
        img.connexion_market_img{
            width: 120px;
            height: 65px;
            position: absolute;
            top: 42%;
            left: 6%;}
        a.connextion_mk1{width:120px; height:120px; position:absolute; top:0%; left:8%;}
        .connextion_mk1 > p {
            position: absolute;
            width: 125px;
            padding: 3px 0;
            top: -10px;
            left: -3%;
            font-size: 20px;
            background-color: #ffbf41;
            border-radius: 10px;}

        /**/
        div.change_marketimg_wrap{position:relative;}
        .connexion_marketbox_wrap{display: flex; justify-items: center; align-items: center;}
        img.connexion_market_img{
            width: 120px;
            height: 65px;
            position: absolute;
            top: 42%;
            left: 6%;}
        a.change_marketimg{position:absolute; width:120px; height:120px; top:-7%; left:7%;}
        .change_marketimg > p {
            position: absolute;
            width: 125px;
            padding: 3px 0;
            top: -2%;
            left: -4%;
            font-size: 20px;
            background-color: #ffbf41;
            border-radius: 10px;}

        .navicon{
            font-size: 5em;
            animation: motion 0.6s
            linear 0s
            infinite alternate;
        }
        @keyframes motion {
            0% {margin-top: 0px;}
            100% {margin-top: 8px;}
        }

        #orderReceipt_btn_cancel{
            width:100%;
            text-align: right;
        }
        #orderReceipt_btn_cancel>a:hover {
            text-decoration: none;
            cursor: pointer;
            opacity: 0.7;
        }

        #orderReceipt_btn_cancel1{
            width:100%;
            text-align: right;
        }
        #orderReceipt_btn_cancel1>a:hover {
            text-decoration: none;
            cursor: pointer;
            opacity: 0.7;
        }
    </style>
</head>
<body>${aabb}
<div id="main">
    <jsp:include page="../header/header_index.jsp" />
    <div id="main_wrap_box">
        <div class="modal">
            <div class="modal_body">
                <div class="container">
                    <div class="form_field">
                        <h2 style="margin:30px 0;"><label for="address_kakao" style="font-size: 26px;">단골시장 추가하기</label></h2>
                        <a href="/connexion_market" class="current_location_btn" style="text-decoration:none; color:#333; cursor: pointer;"><i class="fa-solid fa-location-dot header_i" style="font-size: 16px;"></i>&nbsp;가까운 시장찾기 > </a>
                        <p style="margin-top:30px; font-size: 16px;">현재 내가 설정한 주소: <span style="color: red; font-size: 16px;">${userAddress1} ${userAddressDetail1} ...</span></p>
                        <hr style="margin-top:30px;">
                        <div class="input_container" style="margin-top:15px;">
                            <form id="userMarketSearchForm" action="/usermarketSearch" method="post">
                                <input type="text" id="address_kakao" name="userAddress" readonly style="width:215px; height:30px; border:1px solid #ffbf41; border-radius: 35px; float:left;"  placeholder=" 주소를 검색해 주세요">
                                <div class="btn_container" >
                                    <button type="button" class="btn_round" onclick="searchAddress()"
                                            style="border-radius: 20px; padding: 5px 10px; background-color: #ffbf41; color: white; border: none; font-size: 14px; cursor: pointer; float: right; font-family: 'omyu pretty', Arial, sans-serif;">주소검색
                                    </button>
                                </div>
                            </form>
                            <input type="hidden" id="address_detail" name="userAddressDetail1" placeholder="상세주소를 입력해주세요" required>
                        </div>
                    </div>
                </div>
                <p style="text-align: left; margin-top: 65px; font-size: 23px;">* 등록한 주소에서 가까운 시장목록 *</p>
                <ul id="marketList" style="text-align: left; margin-left: 20px;">

                </ul>
            </div>
        </div>
        <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
        <div id="connextion_market" class="clear">
            <c:if test="${empty userId}">
                <span class="connextion_title clear" style="font-weight:800;font-size: 18px;font-family: 'omyu pretty';/*border: 2px solid #999;*/width: 290px;border-radius: 5px;height: 25px; display: flex; justify-content: flex-start; align-items: center;">&nbsp;<img class="connextion_title_img clear navicon" src="../../img/main/navi.png">&nbsp;<p>&nbsp나의 단골시장</p></span>
            </c:if>
            <c:if test="${!empty userId}">
                <span class="connextion_title clear" style="font-weight:800;font-size: 18px;font-family: 'omyu pretty';/*border: 2px solid #999;*/width: 290px;border-radius: 5px;height: 25px; display: flex; justify-content: flex-start; align-items: center;">&nbsp;<img class="connextion_title_img clear navicon" src="../../img/main/navi.png">&nbsp;<p>&nbsp;${userNickname}님의 단골시장</p></span>
            </c:if>
            <hr style="width:280px;margin-left: 8%;opacity: 0.4;">
            <span style="font-size:15px;margon-left: 0;/* text-align: left; */float: left;padding: 10px 30px 0;color: #46a973;"> # 주문할 시장을 단골등록해오리</span>
            <div class="connextion_marketbox clear">
                <div class="connexion_marketbox_wrap" style="padding:10px 20px;">
                    <div class="connextion_mk1_wrap" style="margin-right:20px;">
                        <img class="connexion_market_img" src="../../img/main/market2.png">
                        <a class="connextion_mk1" href="/shinwon_marketmap?marketName=신원시장">
                            <p style="font-weight: 800;">내가 등록한시장</p>
                        </a>
                    </div>
                    <c:if test="${!empty userMarket}">
                        <c:forEach var="i" items="${userMarket}" varStatus="status">
                            <c:if test="${status.index == 0}">
                                <c:if test="${!empty i.market.marketName}">
                                    <div class="connextion_mk2_wrap change_marketimg_wrap" style="margin-right:20px; background:none; position: relative">
                                        <div id="orderReceipt_btn_cancel" style="position: absolute; right: -7px; top: 12px; z-index: 9999;"><a href="/deleteUserMarket?userMarketSeq=${i.userMarketSeq}"><i class="fas fa-regular fa-xmark"></i></a></div>
                                        <img class="connexion_market_img" src="../../img/main/market2.png">
                                        <a class="connextion_mk2 change_marketimg" href="/shinwon_marketmap?marketName=${i.market.marketName}">
                                            <p>${i.market.marketName}</p>
                                        </a>
                                    </div>
                                </c:if>
                            </c:if>
                        </c:forEach>
                    </c:if>
                    <c:if test="${empty userMarket}">
                        <div class="connextion_mk2_wrap btn-open-popup" onclick="modal"><a class="connextion_mk2" href=""><p>단골시장등록</p></a><p style="font-size: 40px;">+</p></div>
                    </c:if>

                </div>

                <div class="connexion_marketbox_wrap" style="padding:0 20px 0 25px;">
                    <c:if test="${!empty userMarket}">
                        <c:forEach var="i" items="${userMarket}" varStatus="status">
                            <c:if test="${status.index == 1}">
                                <c:if test="${!empty i.market.marketName}">
                                    <div class="connextion_mk3_wrap change_marketimg_wrap" style="margin-right:20px; background:none; position: relative;" >
                                        <div id="orderReceipt_btn_cancel1" style="position: absolute; right: -7px; top: 12px; z-index: 9999;"><a href="/deleteUserMarket?userMarketSeq=${i.userMarketSeq}"><i class="fas fa-regular fa-xmark"></i></a></div>
                                        <img class="connexion_market_img" src="../../img/main/market2.png">
                                        <a class="connextion_mk3 change_marketimg" href="${i.market.marketHref}?marketName=${market.marketName}">
                                            <p>${i.market.marketName}</p>
                                        </a>
                                    </div>
                                </c:if>
                            </c:if>
                        </c:forEach>
                    </c:if>
                    <c:if test="${empty userMarket}">
                        <div class="connextion_mk3_wrap btn-open-popup" onclick="modal"><a class="connextion_mk3" href=""><p>단골시장등록</p></a><p style="font-size: 40px;">+</p></div>
                    </c:if>
                    <div class="connextion_mk4_wrap btn-open-popup" onclick="modal"><a class="connextion_mk4" href=""><p>단골시장등록</p></a><p style="font-size: 40px;">+</p></div>
                </div>
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
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    <% if (request.getAttribute("deleteError") != null) { %>
    window.onload = function() {
        var errorMessage = "<%= request.getAttribute("deleteError") %>";
        if (errorMessage.trim() !== "") {
            alert(errorMessage);
        }
    };
    <% } %>

    function searchAddress() {
        new daum.Postcode({
            oncomplete: function (data) {
                document.getElementById("address_kakao").value = data.address;
                // 주소 검색 후 선택하면 창이 닫히고 상세주소칸으로 포커스 이동
                document.getElementById("address_detail").focus();
                // 주소 검색이 완료되면 폼 자동 제출
                // 주소 정보를 서버로 전송 (Ajax 요청)
                var userAddress = data.address;
                $.ajax({
                    type: "POST",
                    url: "/usermarketSearch",
                    data: {
                        userAddress: userAddress,
                    },
                    success: function(response) {

                        console.log(response);
                    },
                    error: function (error) {
                        // Ajax 요청이 실패한 경우 처리할 로직 작성
                        console.error("Ajax 요청 실패:", xhr, status, error);
                    }
                });
            }
        }).open();

    }
</script>
<script type="text/javascript" src="../../js/main/main_slidebanner.js"></script>
<script type="text/javascript" src="../../js/main/connexion_market.js"></script>
</body>
</html>