<%@ page import="com.choongang.OriMarket.user.User" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8">
  <title>리뷰쓰기</title>
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
      margin: 0px auto;
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

    .stars {
      display: flex;
      justify-content: center;
      flex-direction: row-reverse;
    }

    .stars input {
      display: none;
    }

    .stars label {
      float: right;
      cursor: pointer;
      color: #ccc;
      outline: none;
      width: 50px;
      height: 50px;
    }

    .stars label:before {
      content: '\2606';
      font-size: 50px;
      text-align: center;
      border: none;
      background-color: transparent;
    }

    .stars input:checked~label:before {
      content: '\2605';
      color: #ffcc00;
      border: none;
    }

    .user_total_review h4 {
      justify-content: center;
      text-align: center;
    }

    .store_review {
      display: flex;
      align-items: center;
    }

    .taste_review {
      top: 50%;
      transform: translate(0, 50%);
      margin-right: 30px;
      font-size: 20px;
    }

    .delivery_review {
      top: 50%;
      transform: translate(0, 50%);
      margin-right: 30px;
      font-size: 20px;
    }

    .taste_review,
    .delivery_review {
      display: block;
      clear: both;
    }

    .review_textbox {
      width: 300px;
      height: 100px;
      resize: none; /* 사이즈 조절 안되게 */
      padding: 10px;
      font-size: 16px;
      border: 1px solid #ccc;
    }

    li {
      list-style: none;
    }

    .box {
      width: 100px;
      height: 100px;
      border: 1px solid black;
      display: flex;
      justify-content: center;
      align-items: center;
      overflow: hidden;
      background-color: white;
      position: relative;
    }

    img {
      width: 100%;
      height: 100%;
      object-fit: cover;
    }

    .real-upload {
      display: none; /* 업로드 창 숨기기 */
    }

    .image-preview {
      width: 1300px;
      height: 200px;
      display: flex;
      justify-content: center;
      align-items: center;
      gap: 20px;
    }

    .plus-icon {
      font-size: 30px;
    }

    .delete-icon {
      position: absolute;
      top: 5px;
      right: 5px;
      width: 20px; /* 가로 크기 조정 */
      height: 20px; /* 세로 크기 조정 */
      font-size: 20px;
      color: black;
      cursor: pointer;
      z-index: 1;
      background-color: grey; /* 삭제 버튼 배경색 검정색으로 변경 */
      display: flex;
      justify-content: center;
      align-items: center;
    }

    .submit-button {
      width: 355px;
      height: 40px;
      background-color: green;
      color: white;
      font-size: 16px;
      border: none;
      margin-top: 20px;
      border-radius: 15px;
    }
  </style>
</head>
<body>
<form action="/user_review" method="post" enctype="multipart/form-data">
  <div class="main-container">
    <div class="user_total_review">
        <c:forEach var="abcd" items="${abcde}" varStatus="status" >
          <c:if test="${status.index == 0}">
          <input type="hidden" name="orderNumber" value="${abcd.orderNumber}">
          <input type="hidden" name="newOrder.newOrderSeq" value="${abcd.newOrder.newOrderSeq}">
          <h3 style="text-align: center; margin-top: 5px;"><input type="hidden" name="buStoreName" value="${abcd.buStoreName}">
            ${abcd.buStoreName}
          </h3>
            <div class="line" style="margin-top: 10px;"></div>
            <p style="text-align: center; font-size: small; padding-top: 10px;">
            <c:forEach var="abcd1" items="${abcde}">
              <input type="hidden" name="itemName" value="${abcd1.itemName}">
              ${abcd1.itemName}
            </c:forEach>
            </p>
          </c:if>
        </c:forEach>
      <div class="line" style="margin-top: 10px; margin-bottom: 30px;"></div>
      <h4 style="text-align: center;">이 가게를 추천하시겠어요?</h4>
      <div class="stars">
        <input type="radio" id="star5" name="rating" value="5" />
        <label for="star5"></label>
        <input type="radio" id="star4" name="rating" value="4" />
        <label for="star4"></label>
        <input type="radio" id="star3" name="rating" value="3" />
        <label for="star3"></label>
        <input type="radio" id="star2" name="rating" value="2" />
        <label for="star2"></label>
        <input type="radio" id="star1" name="rating" value="1" />
        <label for="star1"></label>
      </div>
      <br><br>
    </div>
    <div class="line" style="margin-top: 30px; margin-bottom: 30px;"></div>
      <h5 style="text-align: center; color: #999999;">이 가게에 대한 상세한 평가를 해주세요</h5>
    <div class="store_review">
      <div class="taste_review">
        <h3>맛</h3>
      </div>

      <div class="stars">
        <input type="radio" id="star10" name="taste" value="5" />
        <label for="star10"></label>
        <input type="radio" id="star9" name="taste" value="4" />
        <label for="star9"></label>
        <input type="radio" id="star8" name="taste" value="3" />
        <label for="star8"></label>
        <input type="radio" id="star7" name="taste" value="2" />
        <label for="star7"></label>
        <input type="radio" id="star6" name="taste" value="1" />
        <label for="star6"></label>
      </div>
    </div>

    <br>

    <div class="store_review">
      <div class="delivery_review">
        <h3>양</h3>
      </div>

      <div class="stars">
        <input type="radio" id="star15" name="amount" value="5" />
        <label for="star15"></label>
        <input type="radio" id="star14" name="amount" value="4" />
        <label for="star14"></label>
        <input type="radio" id="star13" name="amount" value="3" />
        <label for="star13"></label>
        <input type="radio" id="star12" name="amount" value="2" />
        <label for="star12"></label>
        <input type="radio" id="star11" name="amount" value="1" />
        <label for="star11"></label>
      </div>
    </div>
    <br><br><br>
    <h5 style="text-align: center;">포토리뷰 작성시 <span style="color: #cc4444">100포인트</span> 지급!</h5>
    <textarea class="review_textbox" placeholder="사진과 함께 리뷰를 작성하시면 100포인트가 적립됩니다." name="content"
              oninput="checkMaxLength(this, 300); updateCharacterCount(this, 'charCount')"></textarea>
    <div id="charCount">0 / 300</div>

    <script>
      function checkMaxLength(textarea, maxLength) {
        if (textarea.value.length > maxLength) {
          textarea.value = textarea.value.slice(0, maxLength); // 글자 수를 제한
        }
      }

      function updateCharacterCount(textarea, countElementId) {
        const charCountElement = document.getElementById(countElementId);
        charCountElement.textContent = textarea.value.length + ' / 300';
      }
    </script>

    <ul class="image-preview" id="imagePreview">
      <li class="box"><span class="plus-icon">+</span></li>
      <li class="box"><span class="plus-icon">+</span></li>
      <li class="box"><span class="plus-icon">+</span></li>
    </ul>
    <input type="file" accept="image/*" name="pictureUrls" id="logo-upload" onchange="previewPicture(event)" class="real-upload" required multiple>
    <%--<button class="submit-button" type="submit">리뷰 작성하기</button>--%>
    <button class="submit-button" type="button" onclick="uploadImagesAndSubmit()">리뷰 작성하기</button>
</div>
  </form>


<script>
  let selectedBoxIndex; // 선택한 박스 인덱스 추적 변수

  function getImageFiles(e) {
    const files = e.currentTarget.files;
    const imagePreview = document.getElementById('imagePreview');
    const boxes = imagePreview.querySelectorAll('.box');

    // 파일 선택 수와 최대 허용 개수 비교
    const maxFiles = 3; // 최대 허용 이미지 개수
    const numFiles = Math.min(files.length, maxFiles);

    // 박스 개수에 맞게 이미지를 미리보기로 채웁니다.
    for (let i = 0; i < maxFiles; i++) {
      const previewBox = boxes[i];
      const plusIcon = previewBox.querySelector('.plus-icon');

      if (i < numFiles) {
        // 파일 선택한 경우
        const file = files[i];
        const reader = new FileReader();
        reader.onload = (e) => {
          const imgElement = createElement(e, file);
          previewBox.innerHTML = '';
          previewBox.appendChild(imgElement);
          addDeleteIcon(previewBox, file); // 삭제 아이콘 추가
        };
        reader.readAsDataURL(file);
      } else {
        // 파일 선택하지 않은 경우
        previewBox.innerHTML = '<span class="plus-icon">+</span>';
        hidePlusIcon(previewBox);
      }
    }

    // 선택한 박스 인덱스 재설정
    selectedBoxIndex = numFiles - 1;
  }

  function createElement(e, file) {
    const img = document.createElement('img');
    img.setAttribute('src', e.target.result);
    img.setAttribute('data-file', file.name);
    return img;
  }

  function hidePlusIcon(box) {
    const plusIcon = box.querySelector('.plus-icon');
    if (plusIcon) {
      plusIcon.style.display = 'none';
    }
  }

  function addDeleteIcon(box, file) {
    const deleteIcon = document.createElement('span');
    deleteIcon.classList.add('delete-icon');
    deleteIcon.innerHTML = '&times;';
    deleteIcon.addEventListener('click', (e) => {
      e.stopPropagation(); // 이벤트 전파 방지
      const imagePreview = document.getElementById('imagePreview');
      const previewBox = deleteIcon.parentNode;
      const previewIndex = Array.from(previewBox.parentNode.children).indexOf(previewBox);

      // 삭제한 이미지 박스의 내용만 초기화
      previewBox.innerHTML = '<span class="plus-icon">+</span>';
      showPlusIcon(previewBox); // 삭제한 박스의 플러스 아이콘 표시

      // 이후 동작 처리
    });
    box.appendChild(deleteIcon);
  }

  function showPlusIcon(box) {
    const plusIcon = box.querySelector('.plus-icon');
    if (plusIcon) {
      plusIcon.style.display = 'block';
    }
  }

  const realUpload = document.querySelector('.real-upload');
  const boxes = document.querySelectorAll('.box');

  boxes.forEach((box, index) => {
    box.addEventListener('click', () => {
      selectedBoxIndex = index;
      realUpload.click();
    });
  });

  realUpload.addEventListener('change', getImageFiles);


  /*사진 첨부 없이 업로드하기*/
  const submitButton = document.querySelector('.submit-button');

  submitButton.addEventListener('click', (e) => {
    e.preventDefault(); // 기본 폼 제출 동작 막기
    // 리뷰 작성 처리 로직 추가
    // 예를 들어, 필수 입력 항목이 있는지 확인하고 서버로 데이터 전송 등을 수행할 수 있습니다.
    console.log('리뷰 작성하기 버튼이 클릭되었습니다.');
    document.querySelector('form').submit(); // 필요에 따라 폼 제출을 직접 호출할 수도 있습니다.
  });

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
  function uploadImagesAndSubmit() {
    const realUpload = document.querySelector('.real-upload');
    const formData = new FormData();

    // 선택된 파일들을 FormData에 추가
    if (realUpload.files && realUpload.files.length > 0) {
      for (const file of realUpload.files) {
        formData.append('pictureUrls', file);
      }
    }

    // 기존 폼 데이터도 추가 (평가, 리뷰 등 다른 필드들)
    const formElement = document.querySelector('form');
    const formDataFromForm = new FormData(formElement);
    for (const [key, value] of formDataFromForm.entries()) {
      formData.append(key, value);
    }

    // AJAX를 사용하여 FormData 전송
    fetch('/user_review', {
      method: 'POST',
      body: formData
    })
            .then(response => response.json())
            .then(data => {
              // 서버로부터 온 응답에 따른 처리 (필요한 경우)
            })
            .catch(error => {
              // 에러 처리 (필요한 경우)
            });
  }
</script>
</body>

</html>
