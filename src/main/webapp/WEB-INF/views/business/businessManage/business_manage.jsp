<%@ page import="java.util.Date" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Page Title</title>
    <link rel="stylesheet" href="../../css/business/manage.css">
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>

<div class="main-container">
    <div class="storecare_container">
        <div class="tabs">
            <input class="input" name="tabs-1" type="radio" id="tab-1"checked="checked" />
            <label class="label" for="tab-1">가게 관리</label>
            <div class="panel" >
                <div class="line"></div>
                <form action="/storenotice1" method="post" enctype="multipart/form-data">
                    <button class="backbtn" onclick="window.location.replace('storenotice1')">&lt;</button>
                    <div class="line"></div>
                    <div class="storecare_logo">
                        <h3>로고</h3>
                        <input type="file" accept="image/*" name="pictureUrl" id="logo-upload" onchange="previewPicture(event)"/>
                        <div id="logo-preview">
                            <c:if test="${!empty save.buStoreImageUrl}">
                                <img src="../../img/store/${save.buStoreImageUrl}" style="max-width: 100%; height: auto;">
                            </c:if>
                        </div>
                    </div>
                    <div class="line"></div>
                    <div class="storecare_name">
                        <h3>가게 이름</h3>
                        <input type="hidden" name="buStoreNumber" value="${save.buStoreNumber}">
                        <c:if test="${empty save.buStoreName}">
                          <input type="text" id="store-name-input" name="buStoreName" placeholder="  이름">
                        </c:if>
                       <%-- 입력창
                        <input type="text" id="store-name-input" name="buStoreName" value="${save.buStoreName}">--%>
                        <%-- 7.24 테스트 승엽--%>
                        <%-- 입력된 가게 이름 --%>
                        <c:if test="${!empty save.buStoreName}">
                            <p><input type="text" name="buStoreName" value="${save.buStoreName}" readonly style="outline: none;border: none;"></p>
                        </c:if>
                        <h6>※변경이 필요한 경우 고객센터로 문의해주세요.</h6>
                    </div>

                    <div class="line"></div>

                    <div class="storecare_storenumber">
                        <h3>가게 번호</h3>
                        <c:if test="${empty save.buStorePhone}">
                            <input type="text" id="store-number-input" name="buStorePhone" placeholder="가게 번호"/>
                        </c:if>

                        <%--입력창--%>
                        <c:if test="${!empty save.buStorePhone}">
                            <input type="text" id="store-number-input" name="buStorePhone" value="${save.buStorePhone}"/>
                        </c:if>

                        <%--//7.24 테스트 승엽--%>
                        <%-- 입력된 가게 번호를 표시합니다. --%>
                        <c:if test="${!empty save.buStorePhone}">
                            <p>${save.buStorePhone}</p>
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

                        <%--입력창--%>
                        <c:if test="${!empty save.buStoreCategory}">
                            <%--<input type="text" id="store-category-input" name="buStoreCategory" value="${save.buStoreCategory}"/>--%>
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

                        <%--//7.24 테스트 승엽--%>
                        <%-- 입력된 가게 카테고리를 표시합니다. --%>
                        <c:if test="${!empty save.buStoreCategory}">
                            <p>${save.buStoreCategory}</p>
                        </c:if>
                    </div>
                    <div class="line"></div>

                    <div class="storecare_location">
                        <h3>가게 위치 등록</h3>
                        <c:if test="${empty save.buStoreAddress}">
                            <input type="text" id="store-location-input" name="buStoreAddress" placeholder="가게를 위치를 지정해주세요.">
                        </c:if>

                        <%--입력창--%>
                        <c:if test="${!empty save.buStoreAddress}">
                            <input type="text" id="store-location-input" name="buStoreAddress" value="${save.buStoreAddress}">
                        </c:if>


                        <c:if test="${empty save.buStoreAddressDetail}">
                            <input type="text" name="buStoreAddressDetail" id="buStoreAddressDetail" placeholder="상세위치를 적어주세요.">
                        </c:if>

                        <%--입력창--%>
                        <c:if test="${!empty save.buStoreAddressDetail}">
                            <input type="text" name="buStoreAddressDetail" id="buStoreAddressDetail" value="${save.buStoreAddressDetail}">
                        </c:if>

                        <div class="btn_container">
                            <button type="button" class="btn_round" onclick="searchAddress()">주소검색</button>
                        </div>

                        <br>
                        <%--  //7.24 테스트 승엽--%>
                        <%-- 입력된 가게 위치를 표시합니다. --%>
                        <c:if test="${!empty save.buStoreAddress}">
                            <p>${save.buStoreAddress}</p>
                        </c:if>
                        <c:if test="${!empty save.buStoreAddressDetail}">
                            <p>${save.buStoreAddressDetail}</p>
                        </c:if>
                    </div>
                    <!-- 수정 버튼으로 변경 -->
                    <div class="line"></div>
                    <button type="submit">입력</button>
                </form>
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



</script>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</body>

</html>

