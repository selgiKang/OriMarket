<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<style>

    *{
        margin: 0;
        padding: 0;
    }

    body {
        background-color: #666666;
    }

    /*핸드폰 화면, 스크롤 가능, 스크롤바 안보이게*/
    .main-container {
        position: relative;
        width: 375px;
        height: 812px;
        margin: 0 auto;
        display: flex;
        flex-direction: column;
        justify-content: flex-start;
        align-items: flex-start;
        background-color: white;
        overflow: auto;
        overflow-x: hidden;
        font-family: 'LINESeedKR-Bd', sans-serif;
    }

    .main-container::-webkit-scrollbar {
        display: none;
    }


    /*라인*/
    .line {
        border: 1px solid #c4c4c4;
        width: 500px;
        margin-top: 20px;
        position: relative;
    }

    /*마이페이지*/
    .mypage{
        color: black;
        font-family: "LINESeedKR-Bd", sans-serif;
        font-weight: bolder;
        text-align: center;
        margin: 0 auto;
        font-size: 20px;
    }

    .mypage p{
        margin-top: 10px;
    }

    /*마이페이지 누구누구 님*/
    .riderinfo {
        display: flex; /* Flex 컨테이너로 설정 */
        align-items: center; /* 수직 가운데 정렬 */
        justify-content: center; /* 수평 가운데 정렬 */
        margin-top: 25px;
    }

    /*배달 기록 버튼*/
    .riderinfo button{
        width: 90px;
        height: 40px;
        border-radius: 25px;
        border-style: solid;
        border-width: thin;
        background-color: white;
        font-size: 15px;
        font-weight: bolder;
    }

    .riderinfo p{
        font-size: 25px;
        margin-left: 20px;
        margin-right: 70px;
    }


    /*업무시작 버튼*/
    #workButton {
        background-color: black; /* 업무 시작 배경색 (검정색) */
        color: white;
        width: 325px;
        height: 80px;
        border-radius: 17px;
        font-size: 25px;
        margin-left: 25px;
        margin-top: 10px;
    }
    #workButton.completed {
        background-color: gray; /* 업무 종료 배경색 (회색) */
    }


    /*배달 희망 지역*/
    .myridelocation {
        margin-top: 30px;
        background-color: #E3F2FD;
        width: 345px;
        border-radius: 15px;
        height: 110px;
        margin-left: 15px;
    }

    /*배달 희망 지역 버튼*/
    .myridelocation button{
        border-radius: 50px;
        border-width: revert;
        padding: 6px;
        background-color: white;
        margin-left: 10px;
        margin-top: 7px;
    }

    /*배달 희망 지역 텍스트*/
    .myridelocation p{
        margin-top: 10px;
        margin-left: 10px;
    }

    /*배달 희망 지역 버튼 스크롤 가능하게 하기*/
    .buttons-container {
        white-space: nowrap;
        overflow-x: scroll;
        height: 50px;
        margin-top: 10px;
        margin-bottom: 10px;
        width: 345px; /*뒤에 짤림?...*/

    }

    /*배달희망지역 버튼 가로 정렬*/
    .button-item {
        display: inline-block;

    }

    /*배달희망지역 버튼 길이*/
    .selectable-button{
        width: 120px;
    }

    /*배달희망지역 버튼 스크롤바 없애기*/
    .buttons-container::-webkit-scrollbar {
        display: none; /* 스크롤바 감추기 */
    }

    /*클릭한 버튼 색상*/
    .selectable-button.selected {
        border-color: #4caf50; /* 선택된 버튼의 테두리 색상을 원하는 색상으로 변경해주세요 */
    }


    /*배달 수단 선택*/
    .chooseride{
        margin-top: 25px;
        background-color: #E3F2FD;
        width: 345px;
        border-radius: 15px;
        height: 110px;
        margin-left: 15px;

    }

    .chooseride p{
        margin-top: 10px;
        margin-left: 10px;
    }


    .chooseride-container {
        display: flex; /* 가로 정렬을 위해 display 속성을 flex로 설정합니다. */
        align-items: center; /* 버튼들을 수직 가운데로 정렬합니다. */
        margin-top: 10px;
    }

    .chooseride-container button{
        margin-left: 10px;
        width: 70px;
        justify-content: space-between;
    }



    /*배댈 선택 버튼*/
    .selectable-button {
        border-radius: 50px;
        border-width: revert;
        padding: 6px;
        background-color: white;
        margin-right: 4px; /* 버튼들 사이에 일정한 간격을 추가합니다. */
    }

    .selectable-button:last-child {
        margin-right: 0; /* 마지막 버튼의 오른쪽 간격을 없애서 불필요한 여백을 제거합니다. */
    }


</style>
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
            <div class="button-item"><button class="selectable-button" onclick="toggleSelected(this)">서울특별시</button></div>
            <div class="button-item"><button class="selectable-button" onclick="toggleSelected(this)">경기도</button></div>
            <div class="button-item"><button class="selectable-button" onclick="toggleSelected(this)">인천광역시</button></div>
            <div class="button-item"><button class="selectable-button" onclick="toggleSelected(this)">강원도</button></div>
            <div class="button-item"><button class="selectable-button" onclick="toggleSelected(this)">충청북도</button></div>
            <div class="button-item"><button class="selectable-button" onclick="toggleSelected(this)">세종특별자치시</button></div>
            <div class="button-item"><button class="selectable-button" onclick="toggleSelected(this)">충청남도</button></div>
            <div class="button-item"><button class="selectable-button" onclick="toggleSelected(this)">대전광역시</button></div>
            <div class="button-item"><button class="selectable-button" onclick="toggleSelected(this)">전라북도</button></div>
            <div class="button-item"><button class="selectable-button" onclick="toggleSelected(this)">전라남도</button></div>
            <div class="button-item"><button class="selectable-button" onclick="toggleSelected(this)">광주광역시</button></div>
            <div class="button-item"><button class="selectable-button" onclick="toggleSelected(this)">경상남도</button></div>
            <div class="button-item"><button class="selectable-button" onclick="toggleSelected(this)">대구광역시</button></div>
            <div class="button-item"><button class="selectable-button" onclick="toggleSelected(this)">경상북도</button></div>
            <div class="button-item"><button class="selectable-button" onclick="toggleSelected(this)">울산광역시</button></div>
            <div class="button-item"><button class="selectable-button" onclick="toggleSelected(this)">부산광역시</button></div>
            <div class="button-item"><button class="selectable-button" onclick="toggleSelected(this)">제주특별자치도</button></div>
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