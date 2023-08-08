<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>OriMarket</title>
    <link rel="stylesheet" href="../../css/main/main.css">
    <link rel="stylesheet" href="../../css/main/connexion_market.css">

</head>
<body>
<div id="main">
    <input type="hidden" id="address_kakao" value="${userAddress1}">
    <jsp:include page="../header/header_index.jsp"/>
    <div id="main_wrap_box">
        <div class="modal">
            <div class="modal_body">
                <div class="container">
                    <div class="form_field">
                        <h2 style="margin:30px 0;"><label for="address_kakao" style="font-size: 26px;">단골시장 추가하기</label>
                        </h2>
                        <a href="/connexion_market" class="current_location_btn"
                           style="text-decoration:none; color:#333; cursor: pointer;"><i
                                class="fa-solid fa-location-dot header_i" style="font-size: 16px;"></i>&nbsp;가까운 시장찾기 >
                        </a>
                        <p style="margin-top:30px; font-size: 16px;">현재 내가 설정한 주소: <span
                                style="color: red; font-size: 16px;">${userAddress1} ${userAddressDetail1} ...</span>
                        </p>
                        <hr style="margin-top:30px;">
                        <div class="input_container" style="margin-top:15px;">
                            <form id="userMarketSearchForm" action="/usermarketSearch" method="post">
                                <input type="text" id="address_kakao" name="userAddress" readonly
                                       style="width:215px; height:30px; border:1px solid #ffbf41; border-radius: 35px; float:left;"
                                       placeholder=" 주소를 검색해 주세요">
                                <div class="btn_container">
                                    <button type="button" class="btn_round" onclick="searchAddress()"
                                            style="border-radius: 20px; padding: 5px 10px; background-color: #ffbf41; color: white; border: none; font-size: 14px; cursor: pointer; float: right; font-family: 'omyu pretty', Arial, sans-serif;">
                                        주소검색
                                    </button>
                                </div>
                            </form>
                            <input type="hidden" id="address_detail" name="userAddressDetail1"
                                   placeholder="상세주소를 입력해주세요" required>
                        </div>
                    </div>
                </div>
                <p style="text-align: left; margin-top: 65px; font-size: 23px;">* 등록한 주소에서 가까운 시장목록 *</p>
                <ul id="marketList" style="text-align: left; margin-left: 0px;">
                </ul>
            </div>
        </div>
        <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
        <script type="text/javascript"
                src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b256385fdf81fd0ccd4bc7e1b22da770&libraries=services"></script>
        <div id="connextion_market" class="clear">
            <c:if test="${empty userId}">
                <span class="connextion_title clear"
                      style="font-weight:800;font-size: 18px;font-family: 'omyu pretty';/*border: 2px solid #999;*/width: 290px;border-radius: 5px;height: 25px; display: flex; justify-content: flex-start; align-items: center;">&nbsp;<img
                        class="connextion_title_img clear navicon"
                        src="../../img/main/navi.png">&nbsp;<p>&nbsp나의 단골시장</p></span>
            </c:if>
            <c:if test="${!empty userId}">
                <span class="connextion_title clear"
                      style="font-weight:800;font-size: 18px;font-family: 'omyu pretty';/*border: 2px solid #999;*/width: 290px;border-radius: 5px;height: 25px; display: flex; justify-content: flex-start; align-items: center;">&nbsp;<img
                        class="connextion_title_img clear navicon"
                        src="../../img/main/navi.png">&nbsp;<p>&nbsp;${userNickname}님의 단골시장</p></span>
            </c:if>
            <hr style="width:280px;margin-left: 8%;opacity: 0.4;">
            <span style="font-size:15px;margon-left: 0;/* text-align: left; */float: left;padding: 10px 30px 0;color: #46a973;"> # 주문할 시장을 단골등록해오리</span>
            <div class="connextion_marketbox clear">
                <div class="connexion_marketbox_wrap" style="padding:10px 20px;">
                    <c:if test="${!empty userMarket}">
                        <c:forEach var="i" items="${userMarket}" varStatus="status">
                            <c:if test="${status.index == 0}">
                                <c:if test="${!empty i.market.marketName}">
                                    <div class="connextion_mk2_wrap change_marketimg_wrap"
                                         style="margin-right:20px; background:none; position: relative">
                                        <div id="orderReceipt_btn_cancel0"
                                             style="position: absolute; right: -7px; top: 12px; z-index: 9999;">
                                            <a href="/deleteUserMarket?userMarketSeq=${i.userMarketSeq}"><i
                                                    class="fas fa-regular fa-xmark"></i></a>
                                        </div>
                                        <img class="connexion_market_img" src="../../img/main/market2.png">
                                        <a class="connextion_mk2 change_marketimg"
                                           onclick="checkAddressAndProceed('${i.market.marketName}','${i.market.marketHref}')">
                                            <p>${i.market.marketName}</p>
                                        </a>
                                    </div>
                                </c:if>
                            </c:if>
                        </c:forEach>
                    </c:if>
                    <c:if test="${empty userMarket}">
                        <div class="connextion_mk2_wrap btn-open-popup" onclick="modal"><a class="connextion_mk2"
                                                                                           href=""><p>단골시장등록</p></a>
                            <p style="font-size: 40px;">+</p>
                        </div>
                    </c:if>
                    <c:if test="${!empty userMarket}">
                        <c:forEach var="i" items="${userMarket}" varStatus="status">
                            <c:if test="${status.index == 1}">
                                <c:if test="${!empty i.market.marketName}">
                                    <div class="connextion_mk2_wrap change_marketimg_wrap"
                                         style="margin-right:20px; background:none; position: relative">
                                        <div id="orderReceipt_btn_cancel"
                                             style="position: absolute; right: -7px; top: 12px; z-index: 9999;"><a
                                                href="/deleteUserMarket?userMarketSeq=${i.userMarketSeq}"><i
                                                class="fas fa-regular fa-xmark"></i></a></div>
                                        <img class="connexion_market_img" src="../../img/main/market2.png">
                                        <a class="connextion_mk2 change_marketimg"
                                           onclick="checkAddressAndProceed('${i.market.marketName}','${i.market.marketHref}')">
                                            <p>${i.market.marketName}</p>
                                        </a>
                                    </div>
                                </c:if>
                            </c:if>
                        </c:forEach>
                    </c:if>
                    <c:if test="${empty userMarket}">
                        <div class="connextion_mk2_wrap btn-open-popup" onclick="modal"><a class="connextion_mk2"
                                                                                           href=""><p>단골시장등록</p></a>
                            <p style="font-size: 40px;">+</p></div>
                    </c:if>
                    <c:if test="${userMarket.size() eq 1}">
                        <div class="connextion_mk4_wrap btn-open-popup" onclick="modal"><a class="connextion_mk4"
                                                                                           href=""><p>단골시장등록</p></a>
                            <p style="font-size: 40px;">+</p>
                        </div>
                    </c:if>
                </div>
                <div class="connexion_marketbox_wrap" style="padding:0 20px 0 25px;">
                    <c:if test="${!empty userMarket}">
                        <c:forEach var="i" items="${userMarket}" varStatus="status">
                            <c:if test="${status.index == 2}">
                                <c:if test="${!empty i.market.marketName}">
                                    <div class="connextion_mk3_wrap change_marketimg_wrap"
                                         style="margin-right:20px; background:none; position: relative;">
                                        <div id="orderReceipt_btn_cancel1"
                                             style="position: absolute; right: -7px; top: 12px; z-index: 9999;"><a
                                                href="/deleteUserMarket?userMarketSeq=${i.userMarketSeq}"><i
                                                class="fas fa-regular fa-xmark"></i></a></div>
                                        <img class="connexion_market_img" src="../../img/main/market2.png">
                                        <a class="connextion_mk3 change_marketimg"
                                           onclick="checkAddressAndProceed('${i.market.marketName}','${i.market.marketHref}')">
                                            <p>${i.market.marketName}</p>
                                        </a>
                                    </div>
                                </c:if>
                            </c:if>
                        </c:forEach>
                    </c:if>
                    <c:if test="${empty userMarket}">
                        <div class="connextion_mk3_wrap btn-open-popup" onclick="modal"><a class="connextion_mk3"
                                                                                           href=""><p>단골시장등록</p></a>
                            <p style="font-size: 40px;">+</p></div>
                    </c:if>

                    <c:if test="${!empty userMarket}">
                        <c:forEach var="i" items="${userMarket}" varStatus="status">
                            <c:if test="${status.index == 3}">
                                <c:if test="${!empty i.market.marketName}">
                                    <div class="connextion_mk3_wrap change_marketimg_wrap"
                                         style="margin-right:20px; background:none; position: relative;">
                                        <div id="orderReceipt_btn_cancel2"
                                             style="position: absolute; right: -7px; top: 12px; z-index: 9999;"><a
                                                href="/deleteUserMarket?userMarketSeq=${i.userMarketSeq}"><i
                                                class="fas fa-regular fa-xmark"></i></a></div>
                                        <img class="connexion_market_img" src="../../img/main/market2.png">
                                        <a class="connextion_mk3 change_marketimg"
                                           onclick="checkAddressAndProceed('${i.market.marketName}','${i.market.marketHref}')">
                                            <p>${i.market.marketName}</p>
                                        </a>
                                    </div>
                                </c:if>
                            </c:if>
                        </c:forEach>
                    </c:if>
                    <c:if test="${userMarket.size() ne 4}">
                        <div class="connextion_mk4_wrap btn-open-popup" onclick="modal"><a class="connextion_mk4"
                                                                                           href=""><p>단골시장등록</p></a>
                            <p style="font-size: 40px;">+</p></div>
                    </c:if>
                </div>
            </div>
        </div>
        <div id="main_banner_wrap">
            <div class="main_slidebanner_box slideshow-container">
                <div class="mySlides fade"><img class="slideshow-image" src="../../img/main/exsliderbn.png" alt="메인배너1">
                </div>
                <div class="mySlides fade"><img class="slideshow-image" src="../../img/main/exsliderbn2.png"
                                                alt="메인배너2"></div>
                <div class="mySlides fade"><img class="slideshow-image" src="../../img/main/exsliderbn3.png"
                                                alt="메인배너3"></div>
                <div class="mySlides fade"><img class="slideshow-image" src="../../img/main/exsliderbn4.png"
                                                alt="메인배너4"></div>
            </div>
            <div class="list-button">
                <span class="list-button-item active"></span>
                <span class="list-button-item"></span>
                <span class="list-button-item"></span>
                <span class="list-button-item"></span>
            </div>
        </div>
    </div>
    <jsp:include page="../footer/footer.jsp"/>
</div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    <% if (request.getAttribute("deleteError") != null) { %>
    window.onload = function () {
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
                // 주소 정보를 서버로 전송 (Ajax 요청)
                var userAddress = data.address;
                var geocoder = new kakao.maps.services.Geocoder();
                geocoder.addressSearch(userAddress, function (result, status) {
                    if (status === kakao.maps.services.Status.OK) {
                        var latitude = result[0].y; // 위도
                        var longitude = result[0].x; // 경도
                        console.log("주소: " + userAddress);
                        console.log("위도: " + latitude);
                        console.log("경도: " + longitude);
                        // 위도와 경도를 서버로 전송 (Ajax 요청)
                        $.ajax({
                            type: "POST",
                            url: "/usermarketSearch",
                            data: {
                                latitude: latitude,
                                longitude: longitude
                            },
                            success: function (response) {
                                console.log("서버 응답:", response);
                                updateTable(response);
                            },
                            error: function (error) {
                                console.error("Ajax 요청 실패:", error);
                            },
                        });
                    } else {
                        console.log("주소 검색 실패: " + status);
                    }
                });
            },
        }).open();

        function updateTable(response) {
            var ul = $("ul#marketList"); // 시장 목록을 보여줄 <ul> 태그 선택
            ul.empty(); // 기존 목록 초기화
            console.log(1);

            // 만약 response 배열에 데이터가 없으면, "근처에 저희 오라마켓에 등록된 시장이 없습니다." 메시지를 직접 <li> 태그로 생성하여 추가합니다.
            if (response.length === 0) {
                var li = $("<li>").text("근처에 저희 오라마켓에 등록된 시장이 없습니다.");
                li.addClass("empty-market");
                ul.append(li);
                return; // 메시지를 추가한 후 함수를 종료합니다.
            }

            // 받은 response 배열을 순회하면서 <li> 태그로 만들어 목록에 추가
            for (var i = 0; i < response.length; i++) {
                console.log(2);
                var market = response[i];
                var li = $("<li>").text(market.marketName);
                // 거리 정보가 있을 경우, 해당 정보를 <li> 태그에 추가
                if (market.hasOwnProperty("distance")) {
                    var distanceInfo = $("<span>").text(" (" + market.distance + ")");
                    distanceInfo.css({
                        "font-size": "small"
                    });
                    li.append(distanceInfo);
                }
                var link = $("<a>")
                    .attr("href", "/market_search?marketName=" + encodeURIComponent(market.marketName))
                    .text("선택")
                    .attr("data-marketname", market.marketName)
                    .on("click", function () {
                        var selectedMarketName = $(this).data("marketname");
                        // 선택한 시장 이름을 사용하여 필요한 작업 수행
                        // 예: 선택한 시장으로 이동하거나 추가적인 Ajax 요청 등
                    });
                li.append(link);

                console.log(3);
                ul.append(li);
            }
        }
    }
</script>
<%--배달지의 위도경도값얻기--%>
<script>
    function sendLatLngToServer(marketName, marketHref) {
        const address = document.getElementById('address_kakao').value;
        const geocoder = new kakao.maps.services.Geocoder();
        geocoder.addressSearch(address, function (result, status) {
            if (status === kakao.maps.services.Status.OK) {
                const latitude = result[0].y; // 위도
                const longitude = result[0].x; // 경도

                // 폼을 생성하고 데이터를 입력
                const form = document.createElement('form');
                form.method = 'GET';
                form.action = marketHref;

                // hidden input을 추가하여 데이터 전송
                const inputMarketName = document.createElement('input');
                inputMarketName.type = 'hidden';
                inputMarketName.name = 'marketName';
                inputMarketName.value = marketName;
                form.appendChild(inputMarketName);

                const inputLatitude = document.createElement('input');
                inputLatitude.type = 'hidden';
                inputLatitude.name = 'latitude';
                inputLatitude.value = latitude;
                form.appendChild(inputLatitude);

                const inputLongitude = document.createElement('input');
                inputLongitude.type = 'hidden';
                inputLongitude.name = 'longitude';
                inputLongitude.value = longitude;
                form.appendChild(inputLongitude);

                // 폼을 body에 추가하고 전송
                document.body.appendChild(form);
                form.submit();
            } else {
                console.log("주소 검색 실패: " + status);
            }
        });
    }

    function checkAddressAndProceed(marketName, marketHref) {
        const userAddress = document.getElementById('address_kakao').value;
        if (!userAddress || userAddress.trim() === "") {
            alert("주소를 먼저 설정해 주세요.");
        } else {
            // 주소가 존재하는 경우에만 다음 동작 수행
            sendLatLngToServer(marketName, marketHref);
        }
    }

</script>
<script type="text/javascript" src="../../js/main/main_slidebanner.js"></script>
<script type="text/javascript" src="../../js/main/connexion_market.js"></script>
</body>
</html>