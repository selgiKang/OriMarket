<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<link rel="stylesheet" type="text/css" href="../../css/store/store.css">
<style>
    @font-face {
        font-family: 'LINESeedKR-Bd', sans-serif;
        src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/LINESeedKR-Bd.woff2') format('woff2');
        font-weight: 700;
        font-style: normal;
    }

    .line {
        border-top: 1px solid #c4c4c4;
        width: 330px;
        margin: 30px auto;
        position: relative;
        right: 8px;
    }

    * {
        margin: 0;
        padding: 0;
    }

    body {
        margin: 0 auto;
    }

    .main-container {
        width: 375px;
        height: 812px;
        margin: 0 auto;
        display: flex;
        flex-direction: column;
        align-items: center;
        background-color: #eee;
        overflow: auto;
        overflow-x: hidden;
        font-family: 'LINESeedKR-Bd', sans-serif;
    }

    .main-container::-webkit-scrollbar {
        display: none;
    }

    * {
        margin: 0;
        padding: 0;
        font-size: 15px;
        line-height: 1.3;
    }

    ul {
        list-style: none;
    }

    .tabmenu {
        width: 350px;
        margin: 0 auto;
        position: relative;
    }

    .tabmenu ul {
        display: flex;
        justify-content: flex-start;
        padding: 0;
        overflow-x: auto;
        white-space: nowrap;
    }

    .tabmenu ul::-webkit-scrollbar {
        display: none;
    }

    .tabmenu ul li {
        display: inline-block;
        text-align: center;
        background: transparent;
        line-height: 40px;
        flex-shrink: 0;
        margin-right: 10px;
        width: calc((100% - 50px) / 5); /* 5개의 라벨이므로 5로 나눈 값으로 너비 설정 */
    }

    .tabmenu label {
        display: block;
        width: 100%;
        height: 40px;
        line-height: 40px;
    }

    .tabmenu input {
        display: none;
    }

    .tabCon {
        display: none;
        width: 100%;
        text-align: left;
        padding: 20px;
        position: absolute;
        left: 0;
        top: 40px;
        box-sizing: border-box;
        border: 3px solid #f9f9f9;
    }

    .tabmenu input:checked ~ label {
        position: relative;
    }

    .tabmenu input:checked ~ label::after {
        content: "";
        position: absolute;
        bottom: 0;
        left: 0;
        width: 100%;
        height: 2px;
        background: #ee9820;
    }

    .tabmenu input:checked ~ .tabCon {
        display: block;
    }

    /* 추가된 스타일 */
    .menu-description {
        white-space: pre-wrap;
        overflow-wrap: break-word;
        word-wrap: break-word;
        word-break: break-all;
        display: -webkit-box;
        -webkit-line-clamp: 4;
        -webkit-box-orient: vertical;
        overflow: hidden;
        font-size: 12px;
        margin: 5px 0;
        line-height: 1.4;
    }

    .menu-description.multiline {
        display: -webkit-box;
        -webkit-line-clamp: 4;
        -webkit-box-orient: vertical;
        overflow: hidden;
    }

    .menu-content h5 {
        margin-top: 30px;
        font-size: 17px;
    }

    .menu-image img {
        width: 100px;
        height: 100px;
        object-fit: cover;
        border-radius: 4px;
    }
</style>
<body>
<div class="main-container">
    <div class="tabmenu out-tabmenu">

        <ul>
            <%--대표메뉴 버튼--%>
            <li id="tab1" class="btnCon">
                <input type="radio" checked name="tabmenu" id="tabmenu1">
                <label for="tabmenu1">대표 메뉴</label>
                <div class="tabCon">
                    <%--메뉴1--%>
                    <div class="menu">
                        <div class="menu-content">
                            <h2>칼국수</h2>
                            <h6 class="menu-description">인공 조미료를 쓰지 않고 순수 천연재료로 만들어 시원한 바다맛을 느낄 수 있는 착한 생 칼국수 대표 메뉴</h6>
                            <h5>3,800원</h5>
                        </div>
                        <div class="menu-image">
                            <img src="../../img/store/kal.jpg" alt="메뉴이미지">
                        </div>
                    </div>
                    <%--메뉴2--%>
                        <div class="menu">
                            <div class="menu-content">
                                <h2>칼국수</h2>
                                <h6 class="menu-description">인공 조미료를 쓰지 않고 순수 천연재료로 만들어 시원한 바다맛을 느낄 수 있는 착한 생 칼국수 대표 메뉴</h6>
                                <h5>3,800원</h5>
                            </div>
                            <div class="menu-image">
                                <img src="../../img/store/kal.jpg" alt="메뉴이미지">
                            </div>
                        </div>
                </div>
            </li>

            <%--여름메뉴 버튼--%>
            <li id="tab2" class="btnCon">
                <input type="radio" name="tabmenu" id="tabmenu2">
                <label for="tabmenu2">여름 메뉴</label>
                <div class="tabCon">
                    <%--메뉴1--%>
                    <div class="menu">
                        <div class="menu-content">
                            <h2>${ menu.menu_name }</h2>
                            <h6 class="menu-description">${ menu.menu_info }</h6>
                            <h5>${ menu.menu_price }</h5>
                        </div>
                        <div class="menu-image">
                            <img src="../../img/store/cold.jpg" alt="메뉴이미지">
                        </div>
                    </div>
                </div>
            </li>
            <li id="tab3" class="btnCon">
                <input type="radio" name="tabmenu" id="tabmenu3">
                <label for="tabmenu3">식사용</label>
                <div class="tabCon">
                    내용 적기
                </div>
            </li>
            <li id="tab4" class="btnCon">
                <input type="radio" name="tabmenu" id="tabmenu4">
                <label for="tabmenu4">사이드</label>
                <div class="tabCon"></div>
            </li>
            <li id="tab5" class="btnCon">
                <input type="radio" name="tabmenu" id="tabmenu5">
                <label for="tabmenu5">음료</label>
                <div class="tabCon"></div>
            </li>
        </ul>
    </div>
</div>
</body>
<script>
    const menuDescription = document.querySelector('.menu-description');
    const textLength = menuDescription.innerText.length;
    if (textLength > 22) {
        menuDescription.classList.add('multiline');
    }

    if (window.location.hash === '#seller_itemRegist') {
        alert('[[${message}]]'); // message 변수는 컨트롤러에서 전달한 Flash Attribute
    }
</script>
</html>
