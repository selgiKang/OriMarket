<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>지도 생성하기</title>
    <style>
        .currentlocationmap_wrap{width:375px; height:812px; background-color:#46A973;}
        .currentlocationmap_box{width:330px; heigth:600px; padding: 10px 20px 20px 20px; margin:0 auto; background-color:#fff; border-radius: 10px; box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.2); box-sizing: border-box;}
        .currentlocationmap_title{font-size: 20px; letter-spacing:-2px; text-align: center; margin-bottom:10px;}
        #map{margin:auto; width:280px;height:400px;}
        #map_btns{width:240px; padding:10px; margin:auto;}
        button.nowmap_btn{margin-top:10px; padding:8px 10px; background-color:#ffbf41; border-radius: 5px; border:none; cursor: pointer;}
        button.mkmap_btn{margin-top:10px; padding:8px 10px; background-color:#ffbf41; border-radius: 5px; border:none; cursor: pointer;}
        button.cnmkmap_btn{ width:240px; margin-top:10px; padding:8px 10px; background-color:#ffbf41; border-radius: 5px; border:none; cursor: pointer;}
    </style>
</head>
<body>
<!-- 지도를 표시할 div 입니다 -->
<div class="currentlocationmap_wrap">
    <div class="currentlocationmap_box">
        <h2 class="currentlocationmap_title">현재 위치 가까운 시장 보기</h2>
        <div id="map"></div>
        <div id="map_btns">
            <button class="nowmap_btn" onclick="showCurrentLocationMap()">현재 위치 보기</button>
            <button class="mkmap_btn" onclick="showClosestMarketMap()">가까운 시장 보기</button>
            <button class="cnmkmap_btn" onclick="">단골시장으로 등록하기</button>
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

    // 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
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
        var currentPosition = new kakao.maps.LatLng(latitude, longitude);
        currentPositionMarker = new kakao.maps.Marker({
            map: map,
            position: currentPosition,
            title: "내 현재 위치"
        });

        // 마커에 커스텀 오버레이를 추가하여 텍스트 표시
        var content = '<div style="padding:7px; background-color:#fff; font-size:14px; color:#333; border:2px solid #ffbf41; border-radius: 5px; letter-spacing:-2px;">현재 위치</div>';
        var customOverlay = new kakao.maps.CustomOverlay({
            content: content,
            position: currentPosition,
            xAnchor: 0.5,
            yAnchor: 2
        });
        customOverlay.setMap(map);

        // 지도 중심을 현재 위치로 이동시킵니다
        map.setCenter(currentPosition);

        // 가장 가까운 전통시장 찾기
        var closestMarket = findClosestMarket(latitude, longitude);
        var marketPosition = new kakao.maps.LatLng(closestMarket.latitude, closestMarket.longitude);

        // 가까운 전통시장을 지도에 표시하는 마커 생성
        var marketMarker = new kakao.maps.Marker({
            map: map,
            position: marketPosition,
            title: closestMarket.name
        });

        // 마커 클릭 이벤트 등록하여 해당 전통시장의 지도 보기
        kakao.maps.event.addListener(marketMarker, 'click', function() {
            // 전통시장의 지도를 보여주기 위해 해당 시장의 위도, 경도를 중심으로 하는 지도 생성
            var marketMap = new kakao.maps.Map(mapContainer, {
                center: marketPosition,
                level: 3
            });

            // 전통시장의 지도에 마커 표시
            var marketMarker = new kakao.maps.Marker({
                map: marketMap,
                position: marketPosition,
                title: closestMarket.name
            });

            // 지도 중심을 해당 전통시장으로 이동
            marketMap.setCenter(marketPosition);
        });
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

        // 전통시장의 지도를 보여주기 위해 해당 시장의 위도, 경도를 중심으로 하는 지도 생성
        var marketMap = new kakao.maps.Map(mapContainer, {
            center: marketPosition,
            level: 3
        });

        // 가까운 전통시장을 지도에 표시하는 마커 생성
        var marketMarker = new kakao.maps.Marker({
            map: marketMap,
            position: marketPosition,
            title: closestMarket.name
        });

        // 지도 중심을 해당 전통시장으로 이동
        marketMap.setCenter(marketPosition);
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
        { name: "신원시장", latitude: 37.4815335827273, longitude: 126.92842341587128 }
        // 추가 전통시장 데이터
        // ...
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
</script>
</body>
</html>
