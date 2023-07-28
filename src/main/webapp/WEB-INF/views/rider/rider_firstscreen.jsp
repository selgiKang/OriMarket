<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Kakao 지도 시작하기</title>
    <style>
        .main-container {
            position: relative;
            width: 375px;
            height: 812px;
            margin: 0 auto;
            display: flex;
            flex-direction: column;
            justify-content: flex-start;
            align-items: flex-start;
            background-color: #eee;
            overflow: auto;
            overflow-x: hidden;
            font-family: 'LINESeedKR-Bd', sans-serif;
        }

        .main-container::-webkit-scrollbar {
            display: none;
        }

        #map {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: 1; /* 지도를 모달창 아래로 배치 */
        }

        .modal {
            position: absolute;
            bottom: 0px;
            left: 50%;
            transform: translateX(-50%);
            background-color: #fefefe;
            width: 350px;
            max-height: 81vh;
            overflow-y: hidden;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.5);
            transition: bottom 0.3s ease-in-out;
            border-radius: 30px 30px 0 0;
            z-index: 2; /* 모달창을 지도 위로 배치 */
        }

        .modal-content {
            text-align: center; /* 가운데 정렬을 위해 추가 */
        }

        #closeModalBtn{
            width: 295px;
            height: 60px;
            background-color: #46A973;
            color: white;
            font-weight: bolder;
            border-radius: 16px;
            margin-top: -20px;
            border: none;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.5);
        }

        .modal-content img{
            width: 80px;

        }
    </style>
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

    //7.28 테스트중
    function initMap() {
        var container = document.getElementById('map');
        var options = {
            center: new kakao.maps.LatLng(33.450701, 126.570667),
            level: 8
        };
        map = new kakao.maps.Map(container, options);
        showMapWithOrders();
        showMyLocation();
    }

    // 클라이언트에서 서버로부터 주문 정보와 주소 데이터를 가져와서 지도에 마커를 표시하는 함수
    function showMapWithOrders() {
        fetch('/api/map/orders')
            .then(response => response.json())
            .then(orderMapInfoList => {
                // 주문 정보와 주소 데이터를 반복하며 마커를 지도에 표시합니다
                orderMapInfoList.forEach(orderMapInfo => {
                    var geocoder = new kakao.maps.services.Geocoder();
                    geocoder.addressSearch(orderMapInfo.orderAddressNumber, function (result, status) {
                        if (status === kakao.maps.services.Status.OK) {
                            var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
                            var marker = new kakao.maps.Marker({
                                position: coords,
                                map: map
                            });

                            // 마커에 주문 번호 정보를 표시할 수도 있습니다
                            var infowindow = new kakao.maps.InfoWindow({
                                content: '<div style="width:150px;text-align:center;padding:6px 0;">' + orderMapInfo.orderNumber + '</div>'
                            });
                            infowindow.open(map, marker);
                        }
                    });
                });
            })
            .catch(error => {
                console.error('Error fetching order data:', error);
            });
    }

    // 내 위치 마커 표시 함수
    function showMyLocation() {
        if (navigator.geolocation) {
            navigator.geolocation.getCurrentPosition(function(position) {
                var lat = position.coords.latitude;
                var lon = position.coords.longitude;
                var locPosition = new kakao.maps.LatLng(lat, lon);
                var marker = new kakao.maps.Marker({
                    map: map,
                    position: locPosition
                });
                var infowindow = new kakao.maps.InfoWindow({
                    content: '<div style="padding:5px;">현재위치</div>'
                });
                infowindow.open(map, marker);
                map.setCenter(locPosition);
            });
        } else {
            console.error('geolocation을 사용할 수 없어요...');
        }
    }




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
