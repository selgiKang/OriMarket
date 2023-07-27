<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <%-- join css 스타일 적용 --%>
  <link rel="stylesheet" type="text/css" href="../../css/user/join.css">
  <%-- join js 적용 --%>
  <script src="../../js/user/join.js"></script>
</head>
<style>
  /* 추가된 CSS 스타일 */
  .container {
    max-height: 100vh; /* 컨테이너의 최대 높이를 화면의 높이로 설정 */
    overflow-y: auto;
    box-sizing: border-box;
  }
  .container::-webkit-scrollbar {
    display: none;
  }
</style>
<body style="margin:0;">
  <div class="container">
      <div class="logo_container">
          <a href="/"><img src="../../img/user/ori.png" alt="logo"></a>
          <img src="../../img/user/smoke.png" alt="smoke">
          <span class="logo-text">Ori Market</span>
      </div>

      <form action="/join" method="post" onsubmit="return validateForm()">
          <div class="form_field">
              <label for="id">아이디</label>
                <div class="input_container">
                  <input type="text" id="id" name="userId" required>
                  <div class="btn_container">
                    <button type="button" class="btn_round" onclick="checkDuplicate()"
                            style="border-radius: 20px; padding: 5px 10px; background-color: #ffbf41; color: white; border: none; font-size: 14px; cursor: pointer; font-family: 'omyu pretty', Arial, sans-serif;">중복확인
                    </button>
                  </div>
                </div>
              <div id="idError" class="error_message" style="display: none; color: red;"></div>
          </div>

          <div class="form_field">
              <label for="password">비밀번호</label>
              <input type="password" id="password" name="userPassword" required>
              <div id="passwordError" class="error_message" style="display: none; color: red;"></div>
          </div>

          <div class="form_field">
              <label for="password">비밀번호 확인</label>
              <input type="password" id="passwordConfirm" required>
              <div id="passwordMatchError" class="error_message" style="display: none; color: red;"></div>
          </div>

          <div class="form_field">
              <label for="name">이름</label>
              <input type="text" id="name" name="userName" required>
          </div>

          <div class="form_field">
              <label for="name">닉네임</label>
              <input type="text" id="nickname" name="userNickname" required>
              <div id="nicknameError" class="error_message" style="display: none; color: red;"></div>
          </div>

          <div class="form_field">
              <label for="phone">휴대폰</label>
              <input type="tel" id="phone" name="userPhone" required>
              <div id="phoneError" class="error_message" style="display: none; color: red;"></div>
          </div>

          <div class="form_field">
              <label for="email">이메일</label>
              <input type="email" id="email" name="userEmail" required>
          </div>


          <div class="form_field">
              <label for="address_kakao">주소</label>
              <div class="input_container">
              <input type="text" id="address_kakao" name="userAddress" readonly>
              <div class="btn_container">
                <button type="button" class="btn_round" onclick="searchAddress()"
                        style="border-radius: 20px; padding: 5px 10px; background-color: #ffbf41; color: white; border: none; font-size: 14px; cursor: pointer; font-family: 'omyu pretty', Arial, sans-serif;">주소검색
                </button>
              </div>
              </div>
          </div>

          <div class="form_field">
              <label for="address_detail"></label>
              <input type="text" id="address_detail" name="userAddressDetail" placeholder="상세주소를 입력해주세요" required>
          </div>

          <input type="submit" value="SIGN UP" class="submit_btn">
      </form>
  </div>
  <%-- 주소검색 apir --%>
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</body>
<script>
  // 잘못된 값을 제출했을 때 다시 값을 넘겨주지 않고 해당하는 오류 알림창을 띄어준다.
  function validateForm() {
    var password = document.getElementById("password").value;
    var passwordConfirm = document.getElementById("passwordConfirm").value;
    var nickname = document.getElementById("nickname").value;

    // 비밀번호와, 비빌번호 확인이 일치하지 않으면 false
    if (password !== passwordConfirm) {
      alert("비밀번호가 일치하지 않습니다.");
      return false;
    }

    // 비밀번호 형식이 숫자,특수문자,영어 가 포함되지 않으면 false
    if (!/^(?=.*[a-zA-Z])(?=.*\d)(?=.*[@$!%*#?&])[a-zA-Z\d@$!%*#?&]{3,}$/.test(password)){
      alert("비밀번호 형식이 올바르지 않습니다.")
      return false;
    }

    // 닉네임이 2자이상 8자 이하로 작성되지 않으면 false
    if (nickname.length < 2 || nickname.length > 8) {
      alert("닉네임은 2자 이상 8자 이하로 작성해야 합니다.");
      return false;
    }

    // 추가적인 유효성 검사 조건을 여기에 추가할 수 있습니다.
    return true;
  };


  // 아이디 중복 체크 유효성 검사
  function checkDuplicate() {
    // 아이디의 값을 받아온다.
    var userId = document.getElementById("id").value;
    // 아이디 받은 값을 userId에 값을 넣어가지고 userId/{userId}/exists 컨트롤러로 이동
    var url = "/userId/" + userId + "/exists";
    var xhr = new XMLHttpRequest();
    var idError = document.getElementById("idError");

    xhr.onreadystatechange = function() {
      if (xhr.readyState === XMLHttpRequest.DONE) {
        if (xhr.status === 200) {
          var response = JSON.parse(xhr.responseText);
          if (response) {
            // 중복된 아이디 처리 로직
            idError.textContent = "아이디가 중복되어 사용할 수 없습니다.";
            idError.style.display = "block";
            idError.style.color = "red";
            idError.style.marginTop = "2px";
            idError.style.marginLeft = "3px";
          }else {
            // 중복되지 않은 아이디 처리 로직
            idError.textContent = "사용 가능한 아이디입니다.";
            idError.style.display = "block";
            idError.style.color = "yellow";
            idError.style.marginTop = "2px";
            idError.style.marginLeft = "3px";
          }
        } else {
          // 에러 처리
          alert("오류가 발생했습니다.");
        }
      }
    };

    xhr.open("GET", url);
    xhr.send();
  };


  // input 이벤트가 발생했을때 실행 비밀번호 일치 유효성 검사
  var passwordInput = document.getElementById("password");
  var passwordConfirmInput = document.getElementById("passwordConfirm");
  var passwordMatchError = document.getElementById("passwordMatchError");

  passwordConfirmInput.addEventListener("input", function() {
    var password = passwordInput.value;
    var passwordConfirm = passwordConfirmInput.value;

    if (password !== passwordConfirm) {
      passwordMatchError.textContent = "비밀번호가 일치하지 않습니다.";
      passwordMatchError.style.color= "red";
      passwordMatchError.style.display = "block";
      passwordMatchError.style.marginTop = "2px";
      passwordMatchError.style.marginLeft = "3px";
    } else {
      passwordMatchError.textContent = "비밀번호가 일치합니다.";
      passwordMatchError.style.color= "yellow";
      passwordMatchError.style.display = "block";
      passwordMatchError.style.marginTop = "2px";
      passwordMatchError.style.marginLeft = "3px";
    }
  });


  // input 이벤트가 발생했을때 닉네임 유효성 검사
  var nicknameInput = document.getElementById("nickname");
  var nicknameError = document.getElementById("nicknameError");

  nicknameInput.addEventListener("input", function() {
    var nickname = nicknameInput.value;

    if (nickname.length < 2 || nickname.length > 8) {
      nicknameError.textContent = "닉네임은 2자 이상 8자 이하로 작성해야 합니다.";
      nicknameError.style.color = "red";
      nicknameError.style.display = "block";
      nicknameError.style.marginTop = "2px";
      nicknameError.style.marginLeft = "3px";
    } else {
      nicknameError.textContent = "사용 가능한 닉네임입니다.";
      nicknameError.style.color = "yellow";
      nicknameError.style.display = "block";
      nicknameError.style.marginTop = "2px";
      nicknameError.style.marginLeft = "3px";
    }
  });

  // input 이벤트 발생했을때 휴대폰 번호 형식 유효성 검사
  var phoneInput = document.getElementById("phone");
  var phoneError = document.getElementById("phoneError");

  phoneInput.addEventListener("input", function() {
    var phoneNumber = phoneInput.value;
    var numericPhoneNumber = phoneNumber.replace(/[^0-9]/g, "");

    phoneInput.value = numericPhoneNumber;

    if (phoneNumber !== numericPhoneNumber) {
      phoneError.textContent = "휴대폰 번호는 숫자만 입력 가능합니다.";
      phoneError.style.color = "red";
      phoneError.style.display = "block";
      phoneError.style.marginTop = "2px";
      phoneError.style.marginLeft = "3px";
    } else {
      phoneError.style.display = "none";
    }
  });


  // input 이벤트 발생했을때 비밀번호 형식 유효성 검사
  var passwordInput = document.getElementById("password");
  var passwordError = document.getElementById("passwordError");

  passwordInput.addEventListener("input", function() {
    var password = passwordInput.value;

    // 비밀번호 형식을 정의하는 정규식
    var passwordPattern = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[@$!%*#?&])[a-zA-Z\d@$!%*#?&]{3,}$/;

    if (!passwordPattern.test(password)) {
      passwordError.textContent = "영문, 숫자, 특수문자를 포함하여 주세요";
      passwordError.style.color = "red";
      passwordError.style.display = "block";
      passwordError.style.marginTop = "2px";
      passwordError.style.marginLeft = "3px";
    } else {
      passwordError.textContent = "사용 가능한 비밀번호 입니다.";
      passwordError.style.color = "yellow";
      passwordError.style.display = "block";
      passwordError.style.marginTop = "2px";
      passwordError.style.marginLeft = "3px";
    }
  });
</script>
</html>

