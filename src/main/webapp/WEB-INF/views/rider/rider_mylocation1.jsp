<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>주소로 장소 표시하기</title>
    <style>
        button.backbtn { display: flex; align-items: center; font-size: 26px; color: #fff; margin: 0 0 0 10px; width: 40px; height: 40px; background-color: #46A973; border-radius: 50%; border: 1px solid #eee; cursor: pointer; justify-content: center;}
        button.backbtn:hover {background-color:#333; color:#ffbf41;}
    </style>
</head>
<body>
<div id="map" style="width:375px; height:812px; margin: 0 auto;">
    <!-- 뒤로가기 -->
    <button class="backbtn" onclick="window.history.go(-1)" style="position:absolute; top:3%; left:3%; z-index:999;">&lt;</button>
</div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=259217c849691d825026ea7a9f71af88&libraries=services"></script>
<script>
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new kakao.maps.LatLng(${formattedLatitude}, ${formattedLongitude}), // 지도의 중심좌표
            level: 5 // 지도의 확대 레벨
        };

    // 지도를 생성합니다
    var map = new kakao.maps.Map(mapContainer, mapOption);

    // 마커가 표시될 위치입니다
    var markerPosition  = new kakao.maps.LatLng(${formattedLatitude}, ${formattedLongitude});

    var marker = new kakao.maps.Marker({
        position: markerPosition
    });
    // 인포윈도우로 장소에 대한 설명을 표시합니다
    var infowindow = new kakao.maps.InfoWindow({
        content: '<div style="width:150px;text-align:center;padding:6px 0; border-radius: 10px">${marketName}</div>'
    });
    infowindow.open(map, marker);
    // 마커가 지도 위에 표시되도록 설정합니다
    marker.setMap(map);


    // HTML5의 geolocation으로 사용할 수 있는지 확인합니다
    if (navigator.geolocation) {

        // GeoLocation을 이용해서 접속 위치를 얻어옵니다
        navigator.geolocation.getCurrentPosition(function(position) {

            var lat = position.coords.latitude, // 위도
                lon = position.coords.longitude; // 경도

            var locPosition = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
                message = '<div style="padding:5px;">현재위치</div>'; // 인포윈도우에 표시될 내용입니다

            // 마커와 인포윈도우를 표시합니다
            displayMarker(locPosition, message);

        });

    } else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다

        var locPosition = new kakao.maps.LatLng(33.450701, 126.570667),
            message = 'geolocation을 사용할수 없어요..'

        displayMarker(locPosition, message);
    }

    // 지도에 마커와 인포윈도우를 표시하는 함수입니다
    function displayMarker(locPosition, message) {

        // 마커를 생성합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: locPosition
        });

        var iwContent = message, // 인포윈도우에 표시할 내용
            iwRemoveable = true;

        // 인포윈도우를 생성합니다
        var infowindow = new kakao.maps.InfoWindow({
            content : iwContent,
            removable : iwRemoveable
        });

        // 인포윈도우를 마커위에 표시합니다
        infowindow.open(map, marker);
        // 지도 중심좌표를 접속위치로 변경합니다
        map.setCenter(locPosition);
    }
</script>
</body>
</html>