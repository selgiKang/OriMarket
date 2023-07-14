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
<div class="main-container">
  <div class="user_total_review">
    <h4>이 가게를 추천하시겠어요?</h4>
    <div class="line"></div>
    <div class="stars">
      <input type="radio" id="star5" name="rating1" value="5" />
      <label for="star5"></label>
      <input type="radio" id="star4" name="rating1" value="4" />
      <label for="star4"></label>
      <input type="radio" id="star3" name="rating1" value="3" />
      <label for="star3"></label>
      <input type="radio" id="star2" name="rating1" value="2" />
      <label for="star2"></label>
      <input type="radio" id="star1" name="rating1" value="1" />
      <label for="star1"></label>
    </div>
    <br><br>
  </div>

  <div class="line"></div>

  <div class="store_review">

    <div class="taste_review">
      <h3>맛</h3>
    </div>

    <div class="stars">
      <input type="radio" id="star10" name="rating2" value="10" />
      <label for="star10"></label>
      <input type="radio" id="star9" name="rating2" value="9" />
      <label for="star9"></label>
      <input type="radio" id="star8" name="rating2" value="8" />
      <label for="star8"></label>
      <input type="radio" id="star7" name="rating2" value="7" />
      <label for="star7"></label>
      <input type="radio" id="star6" name="rating2" value="6" />
      <label for="star6"></label>
    </div>
  </div>

  <br>

  <div class="store_review">
    <div class="delivery_review">
      <h3>배달</h3>
    </div>

    <div class="stars">
      <input type="radio" id="star15" name="rating3" value="10" />
      <label for="star15"></label>
      <input type="radio" id="star14" name="rating3" value="9" />
      <label for="star14"></label>
      <input type="radio" id="star13" name="rating3" value="8" />
      <label for="star13"></label>
      <input type="radio" id="star12" name="rating3" value="7" />
      <label for="star12"></label>
      <input type="radio" id="star11" name="rating3" value="6" />
      <label for="star11"></label>
    </div>
  </div>
  <br><br>

  <textarea class="review_textbox" placeholder="리뷰를 작성해주세요."></textarea>

  <ul class="image-preview" id="imagePreview">
    <li class="box"><span class="plus-icon">+</span></li>
    <li class="box"><span class="plus-icon">+</span></li>
    <li class="box"><span class="plus-icon">+</span></li>
  </ul>
  <input type="file" class="real-upload" accept="image/*" required multiple>

  <button class="submit-button">리뷰 작성하기</button>
</div>

<script>
  let selectedBoxIndex; // 선택한 박스 인덱스 추적 변수

  function getImageFiles(e) {
    const uploadFiles = [];
    const files = e.currentTarget.files;
    const imagePreview = document.getElementById('imagePreview');
    const boxes = imagePreview.querySelectorAll('.box');

    if ([...files].length > 3) {
      alert('이미지는 최대 3장까지만 업로드 할 수 있습니다.');
      return;
    }

    // File type and count validation
    [...files].forEach((file, index) => {
      if (!file.type.match("image/.*")) {
        alert('이미지 파일만 업로드가 가능합니다.');
        return;
      }

      if (index < 3) {
        uploadFiles.push(file);
        const reader = new FileReader();
        reader.onload = (e) => {
          const preview = createElement(e, file);
          const selectedBox = boxes[selectedBoxIndex]; // 선택한 박스 가져오기
          if (selectedBox) {
            selectedBox.innerHTML = '';
            selectedBox.appendChild(preview);
            hidePlusIcon(selectedBox); // 선택한 박스의 플러스 아이콘 숨기기
            addDeleteIcon(selectedBox, file); // 선택한 박스에 삭제 아이콘 추가하기
          }
        };
        reader.readAsDataURL(file);
      }
    });
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
</script>
</body>

</html>
