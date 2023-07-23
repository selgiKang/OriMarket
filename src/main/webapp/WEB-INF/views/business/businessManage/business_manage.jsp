<%@ page import="java.util.Date" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Page Title</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <style>
        @font-face {
            font-family: 'LINESeedKR-Bd', sans-serif;
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/LINESeedKR-Bd.woff2') format('woff2');
            font-weight: 700;
            font-style: normal;
        }

        * {
            margin: 0;
            padding: 0;
        }

        body {
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            font-family: 'LINESeedKR-Bd', sans-serif;
        }

        .line {
            border-top: 1px solid #c4c4c4;
            width: 330px;
            margin: 30px auto;
            position: relative;
            right: 8px;
        }

        /* 메인 컨테이너 스타일 */
        .main-container {
            width: 375px;
            height: 812px;
            display: flex;
            flex-direction: column;
            justify-content: center; /* 세로 방향으로 중앙 정렬 */
            align-items: center;
            background-color: #eee;
            overflow: auto;
            overflow-x: hidden;
        }


        .storecare_logo h3,
        .storecare_name h3,
        .storecare_storenumber h3,
        .storecare_category h3,
        .storecare_location h3,
        .label {
            text-align: center;
        }

        .storecare_name,
        .storecare_storenumber,
        .storecare_category,
        .storecare_location {
            text-align: center;
        }

        .storecare_name input,
        .storecare_storenumber input,
        .storecare_location input,
        .storecare_category select,
        .board .buttons {
            display: block;
            margin: 0 auto;
            text-align: center; /* Added to center-align the text */
        }

        .board .buttons button,
        .storecare_logo{
            margin-top: 10px;
        }

        /*파일 업로드 관련 부분*/

        input[type="file"] {
            display: none;
        }
        .custom-file-upload {
            display: inline-block;
            padding: 8px 15px; /* 파일 선택 버튼의 크기 조정 */
            background-color: #a8a7a7;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .file-container {
            margin-top: 10px;
            text-align: center;
        }

        /*선택한 이미지가 중앙배치 되게*/
        #logo-preview {
            display: flex;
            justify-content: center;
        }


        /*입력버튼 가운데 배치*/
        .text_input{
            text-align: center;
            margin-top: 10px;
        }

        .file-container {
            display: flex;
            flex-direction: column;
            /*align-items: center;*/
        }

        .text_file {
            text-align: center;
            margin-right: 10px;
        }

        .no-file-text {
            color: gray;
            font-size: 12px;
            text-align: center;
        }



        .main-container::-webkit-scrollbar {
            display: none;
        }



        .store_time_container {
            background-color: white;
            border-radius: 25px;
            margin: 10px;
            width: 355px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.5);
        }

        .store_time {
            margin: 20px;
        }

        .store_time h6 {
            margin-top: -5px;
            color: gray;
        }

        /*버튼*/
        .wrapper {
            width: 50px;
            height: 50px;
            text-align: center;
            position: relative;
            bottom: 45px;
            left: 265px;
        }

        #switch {
            position: absolute;
            /* hidden */
            appearance: none;
            -webkit-appearance: none;
            -moz-appearance: none;
        }

        .switch_label {
            position: relative;
            cursor: pointer;
            display: inline-block;
            width: 48px;
            height: 18px;
            background: #fff;
            border: 2px solid #daa;
            border-radius: 20px;
            transition: 0.2s;
        }

        .switch_label:hover {
            background: #efefef;
        }

        .onf_btn {
            position: absolute;
            top: 4px;
            left: 3px;
            display: inline-block;
            width: 10px;
            height: 10px;
            border-radius: 20px;
            background: #daa;
            transition: 0.2s;
        }

        /* checking style */
        #switch:checked + .switch_label {
            background: #c44;
            border: 2px solid #c44;
        }

        #switch:checked + .switch_label:hover {
            background: #e55;
        }

        /* move */
        #switch:checked + .switch_label .onf_btn {
            left: 34px;
            background: #fff;
            box-shadow: 1px 2px 3px #00000020;
        }

        .total_menu_container {
            background-color: white;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.5);
            border-radius: 25px;
            margin: 10px;
            width: 355px;
        }

        .total_menu {
            margin: 20px;
        }

        .first_menu {
            margin-left: 10px;
            flex: 1;
            display: block;
            clear: both;
            flex-basis: calc(25% - 10px);
        }

        .first_menu img {
            width: 50px;
        }

        .first_menu h5 {
            margin-top: -2px;
        }

        .detail_total_menu {
            display: flex;
            flex-wrap: wrap;
            margin-left: 5px;
        }

        .storecare_container {
            background:transparent;
            border-radius: 25px;
            margin: 10px;
            width: 355px;
            position: relative; /* main-container 내에 위치하도록 설정 */
        }

        .storecare {
            margin: 20px;
        }

        .board {
            width: 270px;
            background-color: #f0f8ff;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            margin-top: 5px;
        }

        .board .content {
            margin-top: 20px;
            background-color: #fff;
            padding: 10px;
        }

        .board .content img {
            max-width: 100%;
            height: auto;
            margin-bottom: 10px;
        }

        .board .content textarea {
            width: 100%;
            height: 100px;
            margin-bottom: 10px;
            resize: vertical;
        }

        .board .buttons {
            display: flex;
            justify-content: space-between;
        }

        .board .buttons button {
            padding: 10px 20px;
            background-color: #333;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .storecare_logo img{
            width: 80px;
        }

        /*탭메뉴관련*/

        .tabs {
            display: flex;
            flex-direction: column;
        }
        /*
                .manager_main_tabs {
                    display: flex;
                    flex-wrap: wrap;
                    max-width: 700px;
                    !* box-shadow: 0 48px 80px -32px rgba(0,0,0,0.3);*!
                }*/

        .input {
            display: none;
            position: absolute;
            opacity: 0;
            border-radius: 25px;
            margin-bottom: 50px;
        }

        .label {
            border-radius: 25px;
            width: 295px;
            padding: 20px 30px;
            background: white;
            cursor: pointer;
            font-weight: bold;
            font-size: 18px;
            color: #000000;
            transition: background 0.1s, color 0.1s;
            margin-bottom: 1px;

        }

        .label:active {

            box-shadow: inset -.3rem -.1rem 1.4rem  #FBFBFB, inset .3rem .4rem .8rem #BEC5D0;
            cursor: pointer;

        }


        .input:focus + .label {
            z-index: 1;
        }


        /*탭안에 내용들*/
        .panel {
            border-radius: 0 0 15px 15px;
            display: none;
            padding: 20px 30px 30px;
            background: #fff;
            width: 295px;
            margin-top: -22px;
        }


        .input:checked + .label + .panel {
            display: block;
        }

        .first_menu:hover {opacity: 0.7;}


    </style>

</head>
<body>

<div class="main-container">
    <input class="input" name="tabs-1" type="radio" id="tab-1" />
    <label class="label" for="tab-1">가게 관리</label>
    <div class="panel">
        <div class="line"></div>
        <form action="/storenotice1" method="post">
            <div class="storecare_logo">
                <h3>로고</h3>
                <div class="file-container">
                    <label for="logo-upload" class="custom-file-upload">파일 선택</label>
                    <input type="file" accept="image/*" name="pictureUrl" id="logo-upload" onchange="previewPicture(event)" />
                </div>
                <div class="no-file-text" id="no-file-text">선택된 파일없음</div>
                <div id="logo-preview"></div>
            </div>
            <div class="line"></div>
            <div class="storecare_name">
                <h3>가게 이름</h3>
                <input type="hidden" name="buStoreNumber" value="${save.buStoreNumber}">
                <c:if test="${empty save.buStoreName}">
                    <input type="text" id="store-name-input" name="buStoreName" placeholder="가게 이름">
                </c:if>
                <c:if test="${!empty save.buStoreName}">
                    <input type="text" id="store-name-input" name="buStoreName" value="${save.buStoreName}">
                </c:if>

                <h6>※변경이 필요한 경우 고객센터로 문의해주세요.</h6>
            </div>

            <div class="line"></div>

            <div class="storecare_storenumber">
                <h3>가게 번호</h3>
                <c:if test="${empty save.buStorePhone}">
                    <input type="text" id="store-number-input" name="buStorePhone" placeholder="가게 번호"/>
                </c:if>
                <c:if test="${!empty save.buStorePhone}">
                    <input type="text" id="store-number-input" name="buStorePhone" value="${save.buStorePhone}"/>
                </c:if>
            </div>

            <div class="line"></div>

            <div class="storecare_category">
                <h3>가게 카테고리</h3>
                <c:if test="${empty save.buStoreCategory}">
                    <select name="buStoreCategory">
                        <option value="채소">채소</option>
                        <option value="과일,견과,쌀">과일,견과,쌀</option>
                        <option value="수산,해산물,건어물">수산,해산물,건어물</option>
                        <option value="정육,계란">정육,계란</option>
                        <option value="국,반찬">국,반찬</option>
                        <option value="베이커리">베이커리</option>
                        <option value="양념,오일">양념,오일</option>
                        <option value="음료,커피">음료,커피</option>
                        <option value="간식">간식</option>
                        <option value="생활용품">생활용품</option>
                    </select>
                </c:if>
                <c:if test="${!empty save.buStoreCategory}">
                    <select name="buStoreCategory">
                        <c:forEach var="category" items="${['채소', '과일,견과,쌀', '수산,해산물,건어물', '정육,계란', '국,반찬', '베이커리', '양념,오일', '음료,커피', '간식', '생활용품']}">
                            <c:choose>
                                <c:when test="${save.buStoreCategory eq category}">
                                    <option value="${category}" selected>${category}</option>
                                </c:when>
                                <c:otherwise>
                                    <option value="${category}">${category}</option>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                    </select>
                </c:if>
            </div>
            <div class="line"></div>

            <div class="storecare_location">
                <h3>가게 위치 등록</h3>
                <c:if test="${empty save.buStoreAddress}">
                    <input type="text" id="store-location-input" name="buStoreAddress" placeholder="가게를 위치를 지정해주세요.">
                </c:if>
                <c:if test="${!empty save.buStoreAddress}">
                    <input type="text" id="store-location-input" name="buStoreAddress" value="${save.buStoreAddress}">
                </c:if>
                <c:if test="${empty save.buStoreAddressDetail}">
                    <input type="text" name="buStoreAddressDetail" placeholder="상세위치를 적어주세요.">
                </c:if>
                <c:if test="${!empty save.buStoreAddressDetail}">
                    <input type="text" name="buStoreAddressDetail" value="${save.buStoreAddressDetail}">
                </c:if>
            </div>
            <!-- 수정 버튼으로 변경 -->
            <div class="line"></div>
            <div class="text_input">
                <button type="submit">입력</button>
            </div>
        </form>
    </div>
</div>
<script>


    function previewPicture(event) {
        const pictureInput = event.target;
        const picturePreview = document.getElementById('logo-preview');
        const noFileText = document.getElementById('no-file-text');

        if (pictureInput.files && pictureInput.files[0]) {

            const fileName = pictureInput.files[0].name;
            noFileText.style.display = 'none';
            const imgElement = document.createElement('img');
            imgElement.src = URL.createObjectURL(pictureInput.files[0]);
            imgElement.style.maxWidth = '100%';
            imgElement.style.height = "auto";
            picturePreview.innerHTML = '';
            picturePreview.appendChild(imgElement);
        } else {

            noFileText.style.display = 'block';
            picturePreview.innerHTML = '';
        }
    }






    // 컨트롤러로 요청을 보내고 처리하는 함수
    function uploadPost() {
        // 입력된 데이터 가져오기
        var messageTitle = document.querySelector('input[name="messageTitle"]').value;
        var totalMessage = document.querySelector('textarea[name="totalMessage"]').value;

        // 요청 데이터 생성
        var requestData = {
            messageTitle: messageTitle,
            totalMessage: totalMessage
        };

        // AJAX 요청 생성
        var xhr = new XMLHttpRequest();
        xhr.open("POST", "/messageInsertMain", true);
        xhr.setRequestHeader("Content-Type", "application/json");

        // 요청 완료 처리
        xhr.onload = function() {
            if (xhr.status === 200) {

                console.log("요청이 성공적으로 처리되었습니다.");
                // 돌아온 응답을 처리하는 코드를 작성하세요.

            } else {
                // 요청이 실패했을 때의 동작을 여기에 작성하세요.
                console.error("요청 처리 중 오류가 발생했습니다.");
            }
        };
        // 요청 전송

        xhr.send(JSON.stringify(requestData));
        document.querySelector(".board .content textarea").value = "";
        document.querySelector(".board .content input").value = "";
    }


    /*탭*/
    const labels = document.querySelectorAll('.label');
    labels.forEach((label) => {

        const panel = label.nextElementSibling;
        panel.style.display = 'block';


    });
</script>
</body>
</html>
