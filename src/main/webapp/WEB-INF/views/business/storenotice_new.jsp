<%@ page import="java.util.Date" %>
<%@ page import="java.time.LocalDateTime" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Page Title</title>
    <link rel="stylesheet" href="../../css/business/storenotice_new.css">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <%
        Date date = new Date();
        long utc = date.getTime() + (date.getTimezoneOffset() * 60 * 100);
        //한국 kst 기준 시간
        long kstGap = 9 * 60 * 60 * 1000;
        //한국 시가능로 date 객체 (오늘)
        Date today = new Date(utc + kstGap);

        int currentYear = today.getYear() + 1900; // 전역 변수에 할당
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

<div class="main-container">
    <div class="header">
        <jsp:include page="../header/business_header_index.jsp"/>
    </div>

    <div class="store_time_container">
        <div class="store_time">
            <c:if test="${empty save}">
                <h3>가게를 등록해주세요!</h3>
            </c:if>
            <c:if test="${not empty save}">
                <c:if test="${empty save.status}">
                    <h3 id="switchStoreStatus">CLOSE</h3>
                </c:if>
                <c:if test="${!empty save.status}">
                    <h3 id="switchStoreStatus">${save.status}</h3>
                </c:if>
            </c:if>
            <h6 style="margin-top: 6px;">보유하신 가게에 적용됩니다.</h6>
            <div class="wrapper">
                <form id="statusForm" action="/storeStatus" method="post">
                    <input type="hidden" name="buStoreNumber" value="${save.buStoreNumber}">
                    <input type="checkbox" id="switch" name="status" value="">
                    <label for="switch" class="switch_label">
                        <span class="onf_btn"></span>
                    </label>
                </form>
            </div>
        </div>
    </div>
    <script>
        const switchInput = document.getElementById("switch");
        const switchStoreStatus = document.getElementById("switchStoreStatus");
        const saveStatus = "${save.status}"

        if (saveStatus === "OPEN") {
            switchInput.checked = true;
            switchInput.value = "open";
            switchStoreStatus.textContent = "OPEN";
        } else {
            switchInput.checked = false;
            switchInput.value = "close";
            switchStoreStatus.textContent = "CLOSE";
        }

        switchInput.addEventListener("change", function () {
            if (this.checked) {
                this.value = "OPEN";
                switchStoreStatus.textContent = "OPEN";
            } else {
                this.value = "CLOSE";
                switchStoreStatus.textContent = "CLOSE";
            }

            // AJAX 요청
            const xhr = new XMLHttpRequest();
            xhr.open("POST", "/storeStatus");
            xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
            xhr.onreadystatechange = function () {
                if (xhr.readyState === XMLHttpRequest.DONE) {
                    // 서버로부터 응답을 받았을 때 추가적인 처리가 필요하다면 이 부분에 작성
                }
            };
            const formData = new FormData(statusForm);
            xhr.send(new URLSearchParams(formData));
        });
    </script>
    <div class="total_menu_container">
        <div class="total_menu">
            <h3>전체 메뉴</h3>
            <div class="detail_total_menu">
                <div class="first_menu">
                    <a href="/business_manage">
                        <img src="../../img/store/가게관리.png" alt="가게 관리">
                        <h5>가게 관리</h5>
                    </a>
                </div>

                <a class="first_menu" href="/messageInsert">
                    <img src="../../img/store/게시판.png" alt="공지사항">
                    <h5>공지사항</h5>
                </a>

                <a class="first_menu" href="/businessReview">
                    <img src="../../img/store/리뷰.png" alt="리뷰 관리">
                    <h5>리뷰 관리</h5>
                </a>

                <div class="first_menu">
                    <img src="../../img/store/메뉴관리.png" alt="메뉴 관리">
                    <h5>메뉴 관리</h5>
                </div>

                <a class="first_menu"
                   href="/sellerList?calculate_date=<%=currentDate%>&calculate_date_last=<%=currentDateLast%>">
                    <img src="../../img/store/주문내역.png" alt="주문 내역">
                    <h5>주문 내역</h5>
                </a>

                <div class="first_menu">
                    <img src="../../img/store/쿠폰.png" alt="쿠폰 관리">
                    <h5>쿠폰 관리</h5>
                </div>

                <a class="first_menu"
                   href="/calculate?calculate_date=<%=currentDate%>&calculate_date_last=<%=currentDateLast%>"
                   style="color: #333333;text-decoration: none;">
                    <img src="../../img/store/정산내역.png" alt="정산 내역">
                    <h5>정산 내역</h5>
                </a>

                <div class="first_menu">
                    <img src="../../img/store/확성기.png" alt="오리시장 공지사항">
                    <a href="/business_manage1"><h5>고객센터</h5></a>
                </div>
            </div>
        </div>
    </div>


    <div class="storecare_container">

        <div class="tabs">
            <input class="input" name="tabs-1" type="radio" id="tab-1"/>
            <label class="label" for="tab-1">가게 관리</label>
            <div class="panel">
                <h6 style="color: #818083; margin-top: 7px;">※가게 정보수정은 전체메뉴 가게관리에서 해주세요.</h6>
                <div class="line"></div>
                <form action="/storenotice1" method="post" enctype="multipart/form-data">
                    <div class="storecare_logo">
                        <h3 style="font-size: small">내 가게 사진</h3>
                        <c:if test="${empty save.buStoreImageUrl}">
                            <input type="file" accept="image/*" name="pictureUrl" id="logo-upload"
                                   onchange="previewPicture(event)"/>
                        </c:if>
                        <div id="logo-preview">
                            <c:if test="${!empty save.buStoreImageUrl}">
                                <img src="../../img/store/${save.buStoreImageUrl}"
                                     style="max-width: 100%; height: auto;">
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

                        <%-- 입력된 가게 이름 --%>
                        <c:if test="${!empty save.buStoreName}">
                            <p style="margin-top: 10px; font-size: 23px; color: #2382f6">${save.buStoreName}</p>
                        </c:if>
                        <c:if test="${!empty otherList.buStoreName}">
                            <p style="margin-top: 10px; font-size: 23px; color: #2382f6">${otherList.buStoreName}</p>
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
                            <input type="hidden" id="store-number-input" name="buStorePhone"
                                   value="${save.buStorePhone}"/>
                        </c:if>

                        <%-- 입력된 가게 번호--%>
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

                        <%-- 입력된 가게 카테고리를 표시 --%>
                        <c:if test="${!empty save.buStoreCategory}">
                            <p style="margin-top: 10px; font-size: 23px; color: #2382f6">${save.buStoreCategory}</p>
                        </c:if>
                    </div>
                    <div class="line"></div>

                    <div class="storecare_location">
                        <h3 style="font-size: small">내 가게 주소</h3>
                        <c:if test="${empty save.buStoreAddress}">
                            <input type="text" id="store-location-input" name="buStoreAddress"
                                   placeholder="가게를 위치를 지정해주세요.">
                        </c:if>

                        <%--입력창--%>
                        <c:if test="${!empty save.buStoreAddress}">
                            <input type="hidden" id="store-location-input" name="buStoreAddress"
                                   value="${save.buStoreAddress}">
                        </c:if>


                        <c:if test="${empty save.buStoreAddressDetail}">
                            <input type="text" name="buStoreAddressDetail" id="buStoreAddressDetail"
                                   placeholder="상세위치를 적어주세요.">
                        </c:if>

                        <%--입력창--%>
                        <c:if test="${!empty save.buStoreAddressDetail}">
                            <input type="hidden" name="buStoreAddressDetail" id="buStoreAddressDetail"
                                   value="${save.buStoreAddressDetail}">
                        </c:if>

                        <c:if test="${empty save.buStoreAddress}">
                            <div class="btn_container">
                                <button type="button" class="btn_round" onclick="searchAddress()">주소검색</button>
                            </div>
                        </c:if>

                        <br>

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
                <h4>사장님 공지사항</h4>
                <div class="board">
                    <div class="content">
                        <input type="text" name="messageTitle" placeholder="공지 제목">
                        <textarea type="textarea" rows="10" maxlength="700" name="totalMessage"
                                  placeholder="공지 내용"></textarea>
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
                <c:if test="${empty re}"><h3>아직 등록된 리뷰가 없어요&#128546;</h3></c:if>
                <c:if test="${!empty re}">
                    <c:forEach var="r" items="${re}" varStatus="status">
                        <c:set var="reverseIndex" value="${re.size() - status.index - 1}"/>
                        <c:set var="currentItem" value="${re[reverseIndex]}"/>
                        <div class="my_review_list_store">
                            <h4>불닭발</h4>
                            <br>
                            <div class="rate_and_date">
                                <h4 class="rating" data-rating="${currentItem.rating}"></h4>&nbsp;<h6
                                    class="date">${currentItem.createdDate}</h6>
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
                <jsp:include page="../store/seller_manageMenu.jsp"/>
            </div>

            <br>

            <input class="input" name="tabs-5" type="radio" id="tab-5"/>
            <label class="label" for="tab-5">주문 내역</label>
            <div class="panel">
                아직 주문내역이 없어요&#128546;
            </div>

            <br>

            <input class="input" name="tabs-6" type="radio" id="tab-6"/>
            <label class="label" for="tab-6">쿠폰 관리</label>
            <div class="panel">
                준비 중입니다...⌛
            </div>

            <br>

            <input class="input" name="tabs-7" type="radio" id="tab-7"/>
            <label class="label" for="tab-7">정산 내역</label>

            <br>

            <input class="input" name="tabs-8" type="radio" id="tab-8"/>
            <label class="label" for="tab-8">고객센터</label>

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
        xhr.onload = function () {
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

