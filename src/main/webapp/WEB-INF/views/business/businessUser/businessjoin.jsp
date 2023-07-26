<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" type="text/css" href="../../../../css/user/join.css">

  <script src="../../../../js/user/join.js"></script>
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
<body>
<a href="/"><h1 style="position: fixed; left: 20px; top: 0; font-size: 30px; color: red">홈으로 바로가기</h1></a>
<div class="container">
  <div class="logo_container">
    <img src="../../../../img/user/ori.png" alt="logo">
    <img src="../../../../img/user/smoke.png" alt="smoke">

    <span class="logo-text">Ori Market</span>
  </div>
  <h3 style="text-align: center;">사업자 회원가입</h3>


  <form action="/join1" method="post" onsubmit="return validateForm()">

    <div class="form_field">
      <label for="name">시장 선택</label>
      <select name="market.marketName" id="market_select">
        <option value="신원시장">신원시장</option>
        <option value="경동시장">경동시장</option>
        <option value="동대문시장">동대문시장</option>
        <option value="남대문시장">남대문시장</option>
        <option value="통인시장">통인시장</option>
      </select>
    </div>
    <div class="form_field">
      <label for="name">사업자번호</label>
      <input type="text" id="nickname" name="buUserNumber" required>
    </div>
    <div class="form_field">
      <label for="id">아이디</label>
      <div class="input_container">
        <input type="text" id="id" name="buUserId" required>
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
      <input type="password" id="password" name="buUserPassWord" required>
      <div id="passwordError" class="error_message" style="display: none; color: red;"></div>
    </div>
    <div class="form_field">
      <label for="password">비밀번호 확인</label>
      <input type="password" id="passwordConfirm" required>
      <div id="passwordMatchError" class="error_message" style="display: none; color: red;"></div>
    </div>
    <div class="form_field">
      <label for="name">이름</label>
      <input type="text" id="name" name="buUserName" required>

    </div>
    <div class="form_field">
      <label for="phone">휴대폰</label>
      <input type="tel" id="phone" name="buUserPhone" required>
      <div id="phoneError" class="error_message" style="display: none; color: red;"></div>
    </div>
    <div class="form_field">
      <label for="address_kakao">주소</label>
      <div class="input_container">
        <input type="text" id="address_kakao" name="buUserAddress" readonly>
        <div class="btn_container">
          <button type="button" class="btn_round" onclick="searchAddress()"
                  style="border-radius: 20px; padding: 5px 10px; background-color: #ffbf41; color: white; border: none; font-size: 14px; cursor: pointer; font-family: 'omyu pretty', Arial, sans-serif;">주소검색
          </button>

        </div>
      </div>
    </div>
    <div class="form_field">
      <label for="address_detail"></label>
      <input type="text" id="address_detail" name="buUserAddressDetail" placeholder="상세주소를 입력해주세요" required>
    </div>
    <input type="submit" value="SIGN UP" class="submit_btn">
  </form>

</div>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script>
  function validateForm() {
    var password = document.getElementById("password").value;
    var passwordConfirm = document.getElementById("passwordConfirm").value;
    var nickname = document.getElementById("nickname").value;


    if (password !== passwordConfirm) {
      alert("비밀번호가 일치하지 않습니다.");
      return false;
    }

    if (!/^(?=.*[a-zA-Z])(?=.*\d)(?=.*[@$!%*#?&])[a-zA-Z\d@$!%*#?&]{3,}$/.test(password)){
      alert("비밀번호 형식이 올바르지 않습니다.")
      return false;
    }

    // 추가적인 유효성 검사 조건을 여기에 추가할 수 있습니다.

    return true;
  }
</script>

<script>
  function checkDuplicate() {
    var buUserId = document.getElementById("id").value;
    var url = "/buUserId/" + buUserId + "/exists"; // API 엔드포인트 URL
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
          } else {
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
  }
</script>
<script>
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
</script>
<script>
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
</script>

<script>
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
</body>


</html>

