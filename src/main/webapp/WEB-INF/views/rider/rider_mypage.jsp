<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Orimarket_riderMypage</title>
    <link rel="stylesheet" href="../../css/rider/rider_mypage.css">
</head>
<body>
<div class="main-container">

    <div class="mypage">
        <p>마이페이지</p>
    </div>

    <div class="line"></div>

    <div class="riderinfo">
        <p>김오리 라이더님</p>
        <button>배달 기록</button>
    </div>

    <div class="current">
        <button id="workButton" onclick="changeStatus()">업무 시작</button>
    </div>

    <div class="line"></div>

    <div class="myridelocation" id="myridelocation">
        <p>배달 희망 지역</p>
        <div class="buttons-container" id="buttons-container">
            <div class="button-item">
                <button class="selectable-button" onclick="toggleSelected(this)">서울특별시</button>
            </div>
            <div class="button-item">
                <button class="selectable-button" onclick="toggleSelected(this)">경기도</button>
            </div>
            <div class="button-item">
                <button class="selectable-button" onclick="toggleSelected(this)">인천광역시</button>
            </div>
            <div class="button-item">
                <button class="selectable-button" onclick="toggleSelected(this)">강원도</button>
            </div>
            <div class="button-item">
                <button class="selectable-button" onclick="toggleSelected(this)">충청북도</button>
            </div>
            <div class="button-item">
                <button class="selectable-button" onclick="toggleSelected(this)">세종특별자치시</button>
            </div>
            <div class="button-item">
                <button class="selectable-button" onclick="toggleSelected(this)">충청남도</button>
            </div>
            <div class="button-item">
                <button class="selectable-button" onclick="toggleSelected(this)">대전광역시</button>
            </div>
            <div class="button-item">
                <button class="selectable-button" onclick="toggleSelected(this)">전라북도</button>
            </div>
            <div class="button-item">
                <button class="selectable-button" onclick="toggleSelected(this)">전라남도</button>
            </div>
            <div class="button-item">
                <button class="selectable-button" onclick="toggleSelected(this)">광주광역시</button>
            </div>
            <div class="button-item">
                <button class="selectable-button" onclick="toggleSelected(this)">경상남도</button>
            </div>
            <div class="button-item">
                <button class="selectable-button" onclick="toggleSelected(this)">대구광역시</button>
            </div>
            <div class="button-item">
                <button class="selectable-button" onclick="toggleSelected(this)">경상북도</button>
            </div>
            <div class="button-item">
                <button class="selectable-button" onclick="toggleSelected(this)">울산광역시</button>
            </div>
            <div class="button-item">
                <button class="selectable-button" onclick="toggleSelected(this)">부산광역시</button>
            </div>
            <div class="button-item">
                <button class="selectable-button" onclick="toggleSelected(this)">제주특별자치도</button>
            </div>
        </div>
    </div>

    <div class="chooseride">
        <p>배달 수단 선택</p>
        <div class="chooseride-container" id="chooseride-container">
            <button class="selectable-button" onclick="toggleSelected(this)">도보</button>
            <button class="selectable-button" onclick="toggleSelected(this)">자전거</button>
            <button class="selectable-button" onclick="toggleSelected(this)">오토바이</button>
            <button class="selectable-button" onclick="toggleSelected(this)">자동차</button>
        </div>
    </div>

    <div class="line"></div>


</div>

<script>
    // 스크롤바 없이 buttons-container 안에 있는 버튼들만 스크롤 기능을 구현하는 JavaScript 코드입니다.

    const container = document.querySelector('.main-container');
    const buttonsContainer = document.getElementById('buttons-container');
    let isMouseDown = false;
    let startX;
    let scrollLeft;

    buttonsContainer.addEventListener('mousedown', (e) => {
        isMouseDown = true;
        startX = e.pageX - buttonsContainer.offsetLeft;
        scrollLeft = buttonsContainer.scrollLeft;
    });

    buttonsContainer.addEventListener('mouseup', () => {
        isMouseDown = false;
    });

    buttonsContainer.addEventListener('mousemove', (e) => {
        if (!isMouseDown) return;
        e.preventDefault();
        const x = e.pageX - buttonsContainer.offsetLeft;
        const walk = (x - startX) * 2; // 스크롤 속도 조절을 위해 * 2를 적용합니다.
        buttonsContainer.scrollLeft = scrollLeft - walk;
    });

    buttonsContainer.addEventListener('mouseleave', () => {
        isMouseDown = false;
    });

    //업무시작누르면 업무종료로 바뀌게
    function changeStatus() {
        var button = document.getElementById('workButton');
        if (button.innerText === '업무 시작') {
            button.innerText = '업무 종료';
            button.classList.add('completed');
        } else {
            button.innerText = '업무 시작';
            button.classList.remove('completed');
        }
    }

    //선택 버튼
    function toggleSelected(button) {
        const container = button.parentElement.parentElement;
        const buttons = container.getElementsByClassName("selectable-button");
        for (const btn of buttons) {
            btn.classList.remove("selected");
        }
        button.classList.add("selected");
    }

</script>
</body>
</html>