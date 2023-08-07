<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Kakao 지도 시작하기</title>
    <link rel="stylesheet" href="../../css/rider/rider_firstscreen.css">
</head>
<body>
<div class="main-container">
    <div id="map"></div>
    <div class="modal" id="modal">
        <div class="modal-content">
            <img src="../../img/store/rider.png">
            <p>배차를 받기 위해 업무 시작을 눌러주세요</p>
            <br>
            <button id="closeModalBtn">업무 시작</button>
        </div>
    </div>
</div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=259217c849691d825026ea7a9f71af88"></script>
<script>
    var container = document.getElementById('map');
    var options = {
        center: new kakao.maps.LatLng(33.450701, 126.570667),
        level: 3
    };
    var map = new kakao.maps.Map(container, options);

    // Function to display the marker and infowindow
    function displayMarker(locPosition, message) {
        map.removeOverlayMapTypeId(kakao.maps.MapTypeId.TRAFFIC);
        map.removeOverlayMapTypeId(kakao.maps.MapTypeId.ROADVIEW);
        map.removeOverlayMapTypeId(kakao.maps.MapTypeId.USE_DISTRICT);

        var marker = new kakao.maps.Marker({
            map: map,
            position: locPosition
        });
        var infowindow = new kakao.maps.InfoWindow({
            content: message,
            removable: true
        });
        infowindow.open(map, marker);
        map.setCenter(locPosition);
    }

    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(function(position) {
            var lat = position.coords.latitude,
                lon = position.coords.longitude;
            var locPosition = new kakao.maps.LatLng(lat, lon),
                message = '<div style="padding:5px;">현재위치</div>';
            displayMarker(locPosition, message);
        });
    } else {
        var locPosition = new kakao.maps.LatLng(33.450701, 126.570667),
            message = 'geolocation을 사용할수 없어요..';
        displayMarker(locPosition, message);
    }

    const modal = document.getElementById('modal');
    const closeModalBtn = document.getElementById('closeModalBtn');

    closeModalBtn.addEventListener('click', () => {
        modal.style.bottom = '-100%'; // 모달창이 아래로 내려가도록 설정
        setTimeout(() => {
            modal.style.display = 'none'; // 애니메이션 후에 모달창이 사라지도록 설정
        }, 300); // 0.3초 후에 사라지도록 설정 (변경 가능)
    });

    let isDragging = false;
    let startOffsetY = 0;
    let modalOffsetY = 0;

    modal.addEventListener('mousedown', (event) => {
        modal.style.bottom = '0';
        isDragging = true;
        startOffsetY = event.clientY - modal.getBoundingClientRect().top;
        modalOffsetY = modal.offsetTop;
        modal.classList.add('dragging');
    });

    window.addEventListener('mousemove', (event) => {
        if (isDragging) {
            const newY = event.clientY - startOffsetY;
            const maxY = window.innerHeight - modal.clientHeight;
            const minY = 50;
            const newTop = Math.max(minY, Math.min(newY, maxY));
            modal.style.top = `${newTop}px`;
        }
    });

    window.addEventListener('mouseup', () => {
        isDragging = false;
        modal.classList.remove('dragging');
    });

    document.addEventListener('DOMContentLoaded', showMapWithOrders);
</script>
</body>
</html>
