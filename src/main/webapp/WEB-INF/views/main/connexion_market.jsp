<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <link rel="stylesheet" href="../../css/main/connexion_market.css">

    <title>가까운 시장 단골등록</title>

</head>
<body>
<div class="currentlocationmap_wrap">
    <div class="currentlocationmap_box">
        <div class="top_content">
            <button class="backbtn" onclick="window.history.go(-1)">&lt;</button>
            <h2 class="currentlocationmap_title">가까운시장 단골등록</h2>
        </div>
        <div id="map"></div>
        <div id="map_btns">
            <button class="nowmap_btn" onclick="showCurrentLocationMap()">현재 위치 보기</button>
            <button class="mkmap_btn" onclick="showClosestMarketMap()">가까운 시장 보기</button>
            <!-- 아래 버튼의 클릭 이벤트를 추가하고, 사용자 닉네임이 비어있으면 알림을 표시합니다. -->
            <button class="cnmkmap_btn" type="button" onclick="checkUserNickname()">
                <input type="hidden" id="closestMarketInfo" name="marketName">
                단골시장으로 등록하기
            </button>
        </div>
    </div>
</div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a2de38dfc66e99ae9e3a132ffb7b217c"></script>
<script>
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
            level: 3 // 지도의 확대 레벨
        };

    // 지도를 표시할 div와 지도 옵션으로 지도를 생성
    var map = new kakao.maps.Map(mapContainer, mapOption);
    var currentPositionMarker;

    // 현재 위치 가져오기
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(showPosition);
    } else {
        alert("Geolocation is not supported by this browser.");
    }

    function showPosition(position) {
        var latitude = position.coords.latitude;
        var longitude = position.coords.longitude;

        // 현재 위치를 지도에 표시하는 마커 생성
        currentPositionMarker = new kakao.maps.Marker({
            map: map,
            position: new kakao.maps.LatLng(latitude, longitude),
            title: "내 현재 위치"
        });

        // 마커에 커스텀 오버레이를 추가하여 텍스트 표시
        var content = '<div style="padding:7px; background-color:#fff; font-size:14px; color:#333; border:2px solid #ffbf41; border-radius: 5px; letter-spacing:-2px;">현재 위치</div>';
        var customOverlay = new kakao.maps.CustomOverlay({
            content: content,
            position: currentPositionMarker.getPosition(),
            xAnchor: 0.5,
            yAnchor: 2
        });
        customOverlay.setMap(map);

        // 지도 중심을 현재 위치로 이동
        map.setCenter(currentPositionMarker.getPosition());
    }

    function showCurrentLocationMap() {
        if (!currentPositionMarker) {
            alert('현재 위치를 먼저 가져와주세요.');
            return;
        }

        // 현재 위치 지도로 이동
        map.setCenter(currentPositionMarker.getPosition());
    }

    function showClosestMarketMap() {
        if (!currentPositionMarker) {
            alert('현재 위치를 먼저 가져와주세요.');
            return;
        }

        // 현재 위치에서 가장 가까운 전통시장 찾기
        var closestMarket = findClosestMarket(currentPositionMarker.getPosition().getLat(), currentPositionMarker.getPosition().getLng());
        var marketPosition = new kakao.maps.LatLng(closestMarket.latitude, closestMarket.longitude);

        // 가까운 전통시장을 지도에 표시하는 마커 생성
        var marketMarker = new kakao.maps.Marker({
            map: map,
            position: marketPosition,
            title: closestMarket.name
        });

        // 마커에 커스텀 오버레이를 추가하여 텍스트 표시
        var marketContent = '<div style="padding:7px; background-color:#fff; font-size:14px; color:#333; border:2px solid #ffbf41; border-radius: 5px; letter-spacing:-2px;">' + closestMarket.name + '</div>';
        var marketCustomOverlay = new kakao.maps.CustomOverlay({
            content: marketContent,
            position: marketPosition,
            xAnchor: 0.5,
            yAnchor: 2
        });
        marketCustomOverlay.setMap(map);

        // 지도 중심을 해당 전통시장으로 이동
        map.setCenter(marketPosition);
    }

    var markets = [
        { name: "경동시장", latitude: 37.567123, longitude: 126.978456 },
        { name: "남대문시장", latitude: 37.559836, longitude: 126.977634 },
        { name: "동대문시장", latitude: 37.570457, longitude: 127.009982 },
        { name: "방산시장", latitude: 37.488471, longitude: 127.012539 },
        { name: "약수터시장", latitude: 37.554012, longitude: 127.017427 },
        { name: "이태원로데오거리", latitude: 37.535729, longitude: 126.992394 },
        { name: "통인시장", latitude: 37.565809, longitude: 126.966071 },
        { name: "평화시장", latitude: 37.570025, longitude: 126.985573 },
        { name: "신원시장", latitude: 37.4815335827273, longitude: 126.92842341587128 },
        { name: "장위전통시장", latitude: 37.61002647830202, longitude: 127.05155130278266 }
    ];

    function findClosestMarket(latitude, longitude) {
        var closestMarket = null;
        var closestDistance = Number.MAX_VALUE;

        for (var i = 0; i < markets.length; i++) {
            var market = markets[i];
            var distance = calculateDistance(latitude, longitude, market.latitude, market.longitude);

            if (distance < closestDistance) {
                closestDistance = distance;
                closestMarket = market;
            }
        }
        var closestMarketSpan = document.getElementById('closestMarketInfo');
        closestMarketSpan.value = closestMarket.name;

        return closestMarket;
    }

    function calculateDistance(lat1, lon1, lat2, lon2) {
        var R = 6371; // 지구의 반지름 (단위: km)
        var dLat = (lat2 - lat1) * (Math.PI / 180);
        var dLon = (lon2 - lon1) * (Math.PI / 180);
        var a =
            Math.sin(dLat / 2) * Math.sin(dLat / 2) +
            Math.cos(lat1 * (Math.PI / 180)) * Math.cos(lat2 * (Math.PI / 180)) *
            Math.sin(dLon / 2) * Math.sin(dLon / 2);
        var c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
        var distance = R * c;

        return distance;
    }

    //비회원 가까운시장 시도할때 그리고 가까운 시장 안누르고 바로 등록시도시 알림창

    var isClosestMarketViewed = false;

    function checkUserNickname() {
        var userNickname = "${userNickname}"; // 여기서 사용자의 닉네임을 가져와서 확인합니다.

        if (userNickname === '') {
            alert("로그인을 먼저 해주세요."); // 사용자 닉네임이 비어있을 경우 알림을 표시합니다.
        } else {
            if (isClosestMarketViewed) {
                // '가까운 시장 보기' 버튼을 먼저 클릭한 경우, 정상적으로 실행됩니다.
                var closestMarketForm = document.createElement('form');
                closestMarketForm.method = 'post';
                closestMarketForm.action = '/market_search';

                var hiddenInput = document.createElement('input');
                hiddenInput.type = 'hidden';
                hiddenInput.name = 'marketName';
                hiddenInput.value = document.getElementById('closestMarketInfo').value;

                closestMarketForm.appendChild(hiddenInput);
                document.body.appendChild(closestMarketForm);

                closestMarketForm.submit();
            } else {
                // '가까운 시장 보기' 버튼을 먼저 클릭하라는 알림을 표시합니다.
                alert("'가까운 시장 보기'를 먼저 클릭해주세요.");
            }
        }
    }

    function showClosestMarketMap() {
        if (!currentPositionMarker) {
            alert('현재 위치를 먼저 가져와주세요.');
            return;
        }

        // 현재 위치에서 가장 가까운 전통시장 찾기
        var closestMarket = findClosestMarket(currentPositionMarker.getPosition().getLat(), currentPositionMarker.getPosition().getLng());
        var marketPosition = new kakao.maps.LatLng(closestMarket.latitude, closestMarket.longitude);

        // 가까운 전통시장을 지도에 표시하는 마커 생성
        var marketMarker = new kakao.maps.Marker({
            map: map,
            position: marketPosition,
            title: closestMarket.name
        });

        // 마커에 커스텀 오버레이를 추가하여 텍스트 표시
        var marketContent = '<div style="padding:7px; background-color:#fff; font-size:14px; color:#333; border:2px solid #ffbf41; border-radius: 5px; letter-spacing:-2px;">' + closestMarket.name + '</div>';
        var marketCustomOverlay = new kakao.maps.CustomOverlay({
            content: marketContent,
            position: marketPosition,
            xAnchor: 0.5,
            yAnchor: 2
        });
        marketCustomOverlay.setMap(map);

        // 지도 중심을 해당 전통시장으로 이동
        map.setCenter(marketPosition);

        // '가까운 시장 보기' 버튼을 클릭한 플래그를 true로 설정합니다.
        isClosestMarketViewed = true;
    }
</script>
</body>
</html>