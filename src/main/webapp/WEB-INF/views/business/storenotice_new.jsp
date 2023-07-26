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

        *{
            margin: 0;
            padding: 0;
        }

        body {
            margin: 0 auto;
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
            margin: 0 auto;
            display: flex;
            flex-direction: column;
            justify-content: flex-start;
            align-items: flex-start;
            background-color: #eee;
            overflow: auto; /* 스크롤 가능하도록 수정 */
            overflow-x: hidden; /* 가로 스크롤 금지 */
            font-family: 'LINESeedKR-Bd', sans-serif; /* 따옴표 추가 */
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


/*        .my_review_list{
            margin-top: 10px;
            margin: 20px;
        }*/

        .my_review_list_store{
            background-color: white;
            margin: 15px;
            padding: 15px;

        }

        .rating, .date {
            display: inline-block;
        }

        .rate_and_date{
            margin-top: -20px;
        }

        .my_review_photo {
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .my_review_photo img {
            width: 300px;
        }
        .rating {
            font-size: 24px;
        }

        .rating::before {
            content: "☆☆☆☆☆";
            color: lightgray;
        }

        .rating[data-rating="1"]::before {
            content: "★☆☆☆☆";
            color: gold;
        }

        .rating[data-rating="2"]::before {
            content: "★★☆☆☆";
            color: gold;
        }

        .rating[data-rating="3"]::before {
            content: "★★★☆☆";
            color: gold;
        }

        .rating[data-rating="4"]::before {
            content: "★★★★☆";
            color: gold;
        }

        .rating[data-rating="5"]::before {
            content: "★★★★★";
            color: gold;
        }


        /* 주소검색 css */
        .btn_container {
            display: flex;
            justify-content: center;
            margin-top: 10px;
        }

        .btn_round {
            border-radius: 20px;
            padding: 5px 10px;
            background-color: #ffbf41;
            color: white;
            border: none;
            font-size: 14px;
            cursor: pointer;
            font-family: 'omyu pretty', Arial, sans-serif;



    </style>
    <%
        Date date = new Date();
        long utc = date.getTime() + (date.getTimezoneOffset() * 60 * 100);
        //한국 kst 기준 시간
        long kstGap = 9 * 60 * 60 * 1000;
        //한국 시가능로 date 객체 (오늘)
        Date today = new Date(utc + kstGap);

        int currentYear = today.getYear()+1900; // 전역 변수에 할당
        int currentMonth = today.getMonth();

        String currentMonthStr = String.valueOf(currentMonth + 1);
        String currentMonthStr2 = String.valueOf(currentMonth + 2);

        //현재 월 표시
        if (currentMonthStr.length() == 1) {
            currentMonthStr = '0' + currentMonthStr;
        }
        if (currentMonthStr2.length() == 1) {
            currentMonthStr2 = '0' + currentMonthStr2;
        }

        String currentDate = String.valueOf(currentYear) + currentMonthStr;
        String currentDateLast = String.valueOf(currentYear) + currentMonthStr2;

    %>
</head>
<body>

<div>
<jsp:include page="../header/business_header_index.jsp" />
</div>

<div class="main-container">

    <div class="store_time_container">
        <div class="store_time">
            <h3>영업 임시중지</h3>
            <h6>보유하신 가게에 적용됩니다.</h6>
            <div class="wrapper">
                <input type="checkbox" id="switch">
                <label for="switch" class="switch_label">
                    <span class="onf_btn"></span>
                </label>
            </div>
        </div>
    </div>

    <div class="total_menu_container">
        <div class="total_menu">
            <h3>전체 메뉴</h3>
            <div class="detail_total_menu">
                <div class="first_menu">
                    <a href="/business_manage">
                    <img src="../../img/store/가게관리.png" alt="가게 관리"> <!-- alt 속성 추가 -->
                    <h5>가게 관리</h5>
                    </a>
                </div>

                <a class="first_menu" href="/messageInsert">
                    <img src="../../img/store/게시판.png" alt="공지사항"> <!-- alt 속성 추가 -->
                    <h5>공지사항</h5>
                </a>

                <a class="first_menu" href="/businessReview">
                    <img src="../../img/store/리뷰.png" alt="리뷰 관리"> <!-- alt 속성 추가 -->
                    <h5>리뷰 관리</h5>
                </a>

                <div class="first_menu">
                    <img src="../../img/store/메뉴관리.png" alt="메뉴 관리"> <!-- alt 속성 추가 -->
                    <h5>메뉴 관리</h5>
                </div>

                <a class="first_menu" href="/sellerList?calculate_date=<%=currentDate%>&calculate_date_last=<%=currentDateLast%>">
                    <img src="../../img/store/주문내역.png" alt="주문 내역"> <!-- alt 속성 추가 -->
                    <h5>주문 내역</h5>
                </a>

                <div class="first_menu">
                    <img src="../../img/store/쿠폰.png" alt="쿠폰 관리"> <!-- alt 속성 추가 -->
                    <h5>쿠폰 관리</h5>
                </div>

                <a class="first_menu" href="/calculate?calculate_date=<%=currentDate%>&calculate_date_last=<%=currentDateLast%>" style="color: #333333;text-decoration: none;">
                    <img src="../../img/store/정산내역.png" alt="정산 내역"> <!-- alt 속성 추가 -->
                    <h5>정산 내역</h5>
                </a>

                <div class="first_menu">
                    <img src="../../img/store/확성기.png" alt="오리시장 공지사항"> <!-- alt 속성 추가 -->
                    <a href="/business_manage1"><h5>고객센터</h5></a>
                </div>
            </div>
        </div>
    </div>



    <div class="storecare_container">

        <div class="tabs">
            <input class="input" name="tabs-1" type="radio" id="tab-1" />
            <label class="label" for="tab-1">가게 관리</label>
            <div class="panel">
                <h6 style="color: #818083; margin-top: 7px;">※가게 정보수정은 전체메뉴 가게관리에서 해주세요.</h6>
                <div class="line"></div>
                <form action="/storenotice1" method="post" enctype="multipart/form-data">
                <div class="storecare_logo">
                    <h3 style="font-size: small">내 가게 사진</h3>
                    <c:if test="${empty save.buStoreImageUrl}">
                    <input type="file" accept="image/*" name="pictureUrl" id="logo-upload" onchange="previewPicture(event)"/>
                    </c:if>
                    <div id="logo-preview">
                        <c:if test="${!empty save.buStoreImageUrl}">
                            <img src="../../img/store/${save.buStoreImageUrl}" style="max-width: 100%; height: auto;">
                        </c:if>
                    </div>
                </div>
                <div class="line"></div>
                    <div class="storecare_name">
                        <h3 style="font-size: small">내 가게 이름</h3>
                        <input type="hidden" name="buStoreNumber" value="${save.buStoreNumber}">
                        <c:if test="${empty save.buStoreName}">
                            <input type="text" id="store-name-input" name="buStoreName" placeholder="가게 이름">
                        </c:if>

                        <%--입력창--%>
                        <c:if test="${!empty save.buStoreName}">
                            <input type="hidden" id="store-name-input" name="buStoreName" value="${save.buStoreName}">
                        </c:if>

                       <%-- 7.24 테스트 승엽--%>
                        <%-- 입력된 가게 이름 --%>
                        <c:if test="${!empty save.buStoreName}">
                            <p style="margin-top: 10px; font-size: 23px; color: #2382f6">${save.buStoreName}</p>
                        </c:if>
                        <h6 style="color: #818083; margin-top: 7px;">※변경이 필요한 경우 고객센터로 문의해주세요.</h6>
                    </div>

                    <div class="line"></div>

                    <div class="storecare_storenumber">
                        <h3 style="font-size: small">내 가게 전화번호</h3>
                        <c:if test="${empty save.buStorePhone}">
                        <input type="text" id="store-number-input" name="buStorePhone" placeholder="가게 번호"/>
                        </c:if>

                        <%--입력창--%>
                            <c:if test="${!empty save.buStorePhone}">
                            <input type="hidden" id="store-number-input" name="buStorePhone" value="${save.buStorePhone}"/>
                        </c:if>

                        <%--//7.24 테스트 승엽--%>
                        <%-- 입력된 가게 번호를 표시합니다. --%>
                       <c:if test="${!empty save.buStorePhone}">
                            <p style="margin-top: 10px; font-size: 23px; color: #2382f6">${save.buStorePhone}</p>
                        </c:if>
                    </div>

                    <div class="line"></div>

                    <div class="storecare_category">
                        <h3 style="font-size: small">내 가게 카테고리</h3>
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

                        <%--입력창--%>
                        <c:if test="${!empty save.buStoreCategory}">
                            <%--<input type="text" id="store-category-input" name="buStoreCategory" value="${save.buStoreCategory}"/>--%>
                        </c:if>

                       <%-- <c:if test="${!empty save.buStoreCategory}">
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
                        </c:if>--%>

                        <%--//7.24 테스트 승엽--%>
                        <%-- 입력된 가게 카테고리를 표시합니다. --%>
                        <c:if test="${!empty save.buStoreCategory}">
                            <p style="margin-top: 10px; font-size: 23px; color: #2382f6">${save.buStoreCategory}</p>
                        </c:if>
                    </div>
                    <div class="line"></div>

                    <div class="storecare_location">
                        <h3 style="font-size: small" >내 가게 주소</h3>
                        <c:if test="${empty save.buStoreAddress}">
                        <input type="text" id="store-location-input" name="buStoreAddress" placeholder="가게를 위치를 지정해주세요.">
                        </c:if>

                     <%--입력창--%>
                            <c:if test="${!empty save.buStoreAddress}">
                            <input type="hidden" id="store-location-input" name="buStoreAddress" value="${save.buStoreAddress}">
                        </c:if>


                        <c:if test="${empty save.buStoreAddressDetail}">
                        <input type="text" name="buStoreAddressDetail" id="buStoreAddressDetail" placeholder="상세위치를 적어주세요.">
                        </c:if>

                        <%--입력창--%>
                            <c:if test="${!empty save.buStoreAddressDetail}">
                            <input type="hidden" name="buStoreAddressDetail" id="buStoreAddressDetail" value="${save.buStoreAddressDetail}">
                        </c:if>

                        <c:if test="${empty save.buStoreAddress}">
                        <div class="btn_container">
                            <button type="button" class="btn_round" onclick="searchAddress()">주소검색</button>
                        </div>
                        </c:if>

                        <br>
                      <%--  //7.24 테스트 승엽--%>
                        <%-- 입력된 가게 위치를 표시합니다. --%>
                        <c:if test="${!empty save.buStoreAddress}">
                            <p style="font-size: 23px; color: #2382f6">${save.buStoreAddress}</p>
                        </c:if>
                        <c:if test="${!empty save.buStoreAddressDetail}">
                            <p style="margin-top: 2px; font-size: 23px; color: #2382f6">${save.buStoreAddressDetail}</p>
                        </c:if>
                    </div>
                    <!-- 수정 버튼으로 변경 -->
                    <div class="line"></div>
                    <button type="submit">입력</button>
                </form>
            </div>



            <br>

            <input class="input" name="tabs-2" type="radio" id="tab-2"/>
            <label class="label" for="tab-2">공지사항</label>
            <div class="panel">
                <div class="line"></div>
                <h4>사장님 공지사항</h4>
                <div class="board">
                    <div class="content">
                        <input type="text" name="messageTitle" placeholder="공지 제목">
<%--                        <div id="image-preview"></div>--%>
                        <textarea type="textarea" rows="10" maxlength="700" name="totalMessage" placeholder="공지 내용"></textarea>
                    </div>
                    <div class="buttons">
                        <button onclick="uploadPost()">업로드</button>
                    </div>
                </div>
            </div>

            <br>


            <input class="input" name="tabs-3" type="radio" id="tab-3"/>
            <label class="label" for="tab-3">리뷰 관리</label>
            <div class="panel">
                <c:if test="${empty re}"><h3>현재 등록된 리뷰가 없습니다.!</h3></c:if>
                <c:if test="${!empty re}">
                    <c:forEach var="r" items="${re}" varStatus="status">
                        <c:set var="reverseIndex" value="${re.size() - status.index - 1}" />
                        <c:set var="currentItem" value="${re[reverseIndex]}" />
                        <div class="my_review_list_store">
                            <h4>불닭발</h4>
                            <br>
                            <div class="rate_and_date">
                                <h4 class="rating" data-rating="${currentItem.rating}"></h4>&nbsp;<h6 class="date">${currentItem.created_date}</h6>
                            </div>
                            <div class="line"></div>
                            <div class="my_review_photo">
                                <img src="../../../../resources/static/img/store/kal.jpg">
                                <div class="line"></div>
                                <p>${currentItem.content}</p>
                            </div>
                        </div>
                    </c:forEach>
                </c:if>
            </div>

            <br>


            <input class="input" name="tabs-4" type="radio" id="tab-4"/>
            <label class="label" for="tab-4">메뉴 관리</label>
            <div class="panel">
                <jsp:include page="../store/seller_manageMenu.jsp" />
            </div>

            <br>


            <input class="input" name="tabs-5" type="radio" id="tab-5"/>
            <label class="label" for="tab-5">주문 내역</label>
            <div class="panel">
                ㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎㅎ
            </div>

            <br>

            <input class="input" name="tabs-6" type="radio" id="tab-6"/>
            <label class="label" for="tab-6">쿠폰 관리</label>
            <div class="panel">
                ㄹㄹㅀㅀㅀㄹ
            </div>

            <br>

            <input class="input" name="tabs-7" type="radio" id="tab-7"/>
            <label class="label" for="tab-7">정산 내역</label>
            <div class="panel">
               <%-- <jsp:include page="../calculate">
                    <jsp:param name="calculate_date" value="<%=currentDate%>" />
                    <jsp:param name="calculate_date_last" value="<%=currentDateLast%>" />
                </jsp:include>--%>
            </div>

            <br>

            <input class="input" name="tabs-8" type="radio" id="tab-8"/>
            <label class="label" for="tab-8">고객센터</label>
            <div class="panel">


            </div>
        </div>



    </div>
</div>


<script>

    //주소API
    function searchAddress() {
        new daum.Postcode({
            oncomplete: function (data) {
                document.getElementById("store-location-input").value = data.address;

                //주소 검색 후 선택하면 창이 닫히고 상세주소칸으로 포인트가 이동
                document.getElementById("buStoreAddressDetail").focus();
            }
        }).open();
    }
  /*  var posts = []; // 게시글 정보를 저장할 배열

    function previewImage(event) {
        var imageUpload = event.target;
        var imageFile = imageUpload.files[0];
        var imagePreview = document.getElementById("image-preview");

        var reader = new FileReader();
        reader.onload = function (e) {
            var img = document.createElement("img");
            img.src = e.target.result;
            img.style.maxWidth = "100%";
            img.style.height = "auto";
            imagePreview.innerHTML = "";
            imagePreview.appendChild(img);
        };

        reader.readAsDataURL(imageFile);
    }*/

    function previewPicture(event) {
        const pictureInput = event.target;
        const picturePreview = document.getElementById('logo-preview');

        if (pictureInput.files && pictureInput.files[0]) {
            const reader = new FileReader();

            reader.onload = function (e) {
                const imgElement = document.createElement('img');
                imgElement.src = e.target.result;
                imgElement.style.maxWidth = '100%'; // 이미지 크기 조절 (선택사항)
                imgElement.style.height = "auto";
                picturePreview.innerHTML = ''; // 이미지 미리보기 업데이트
                picturePreview.appendChild(imgElement);
            };

            reader.readAsDataURL(pictureInput.files[0]);
        }
    }

    // function uploadPost() {
    //     var imageUpload = document.getElementById("image-upload");
    //     var imageFile = imageUpload.files[0];
    //     var postContent = document.querySelector(".board .content textarea").value;
    //
    //     var post = {
    //         content: postContent,
    //         image: imageFile,
    //         date: new Date(),
    //         isNotice: true, // 최신 게시글은 공지로 표시
    //     };
    //
    //     posts.unshift(post); // 배열의 맨 앞에 게시글 정보 추가
    //
    //     // 게시글을 생성하여 화면에 표시
    //     var boardDiv = document.querySelector(".storecare .board");
    //     var newPostDiv = document.createElement("div");
    //     newPostDiv.className = "post";
    //
    //     var titleDiv = document.createElement("div");
    //     titleDiv.className = "title";
    //
    //     if (post.isNotice) {
    //         var noticeDiv = document.createElement("div");
    //         noticeDiv.className = "notice";
    //         noticeDiv.innerText = "공지";
    //         titleDiv.appendChild(noticeDiv);
    //     }
    //
    //     var dateDiv = document.createElement("div");
    //     dateDiv.className = "date";
    //     dateDiv.style.float = "right";
    //     dateDiv.innerText = post.date.toLocaleString();
    //     titleDiv.appendChild(dateDiv);
    //
    //     newPostDiv.appendChild(titleDiv);
    //
    //     var contentDiv = document.createElement("div");
    //     contentDiv.className = "content";
    //
    //     if (imageFile) {
    //         var img = document.createElement("img");
    //         img.src = URL.createObjectURL(imageFile);
    //         img.style.maxWidth = "100%";
    //         img.style.height = "auto";
    //         contentDiv.appendChild(img);
    //     }
    //
    //
    //     contentDiv.innerHTML += postContent;
    //     newPostDiv.appendChild(contentDiv);
    //     boardDiv.prepend(newPostDiv);
    //
    //     // 게시글 업로드 후 입력 내용 초기화
    //     imageUpload.value = "";
    //     document.querySelector(".board .content textarea").value = "";
    //     document.getElementById("image-preview").innerHTML = "";
    //
    //     // 이전 게시글에서 공지 표시 제거
    //     for (var i = 1; i < posts.length; i++) {
    //         var otherPostElement = document.querySelectorAll(".storecare .board .post")[i];
    //         var otherNoticeDiv = otherPostElement.querySelector(".notice");
    //         if (otherNoticeDiv) {
    //             otherNoticeDiv.remove();
    //         }
    //     }
    // }


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
        label.addEventListener('click', () => {
            const panel = label.nextElementSibling;
            const isOpen = panel.style.display === 'block';

            if (isOpen) {
                panel.style.display = 'none';
            } else {
                panel.style.display = 'block';
            }
        });
    });



</script>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</body>

</html>

