<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<html>
<head>
  <title>Orimarket_ManagerJoin</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" type="text/css" href="../../../../css/user/join.css">
  <link rel="stylesheet" href="../../css/manager/manager_join.css">
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <script src="../../js/common/jquery-3.6.4.js"></script>
  <script src="../../../../js/user/join.js"></script>
  <script src="../../js/manager/manager_join.js"></script>
</head>
<body style="margin:0;">
<div class="container">
  <div class="logo_container">
    <a href="/managerLogin"><img src="../../../../img/user/ori.png" alt="logo"></a>
    <img src="../../../../img/user/smoke.png" alt="smoke">

    <span class="logo-text">Ori Market</span>
  </div>
  <h3 style="text-align: center;">매니저 회원가입</h3>


  <form action="/managerJoin" method="post" onsubmit="return validateForm()">

    <div class="form_field">
      <label for="name">시장 선택</label>
      <select name="market.marketName" id="market_select">
        <option value="신원시장">신원시장</option>
        <option value="경동시장">경동시장</option>
        <option value="동대문시장">동대문시장</option>
        <option value="남대문시장">남대문시장</option>
      </select>
    </div>
    <div class="form_field">
      <label for="id">아이디</label>
      <div class="input_container">
        <input type="text" id="id" name="managerId" required>
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
      <input type="password" id="password" name="managerPassword" required>
      <div id="passwordError" class="error_message" style="display: none; color: red;"></div>
    </div>
    <div class="form_field">
      <label for="password">비밀번호 확인</label>
      <input type="password" id="passwordConfirm" required>
      <div id="passwordMatchError" class="error_message" style="display: none; color: red;"></div>
    </div>
    <div class="form_field">
      <label for="name">이름</label>
      <input type="text" id="name" name="managerName" required>
    </div>
    <div class="form_field">
      <label for="phone">휴대폰</label>
      <input type="tel" id="phone" name="managerPhone" required>
      <div id="phoneError" class="error_message" style="display: none; color: red;"></div>
    </div>
    <div class="form_field">
      <label for="managerEmail">이메일</label>
      <input type="email" id="managerEmail" name="managerEmail" required>
    </div>
    <input type="submit" value="SIGN UP" class="submit_btn">
  </form>

</div>
</body>
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

  function checkDuplicate() {
    var managerId = document.getElementById("id").value;
    var url = "/managerId/" + managerId + "/exists"; // API 엔드포인트 URL
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

  var phoneInput = document.getElementById("phone");
  var phoneError = document.getElementById("phoneError");

  phoneInput.addEventListener("input", function() {
    var phoneNumber = phoneInput.value;
    var numericPhoneNumber = phoneNumber.replace(/[^0-9]/g, "");

    // Limit the numericPhoneNumber to 11 digits
    numericPhoneNumber = numericPhoneNumber.slice(0, 11);

    // Format the phone number with hyphens
    if (numericPhoneNumber.length >= 3 && numericPhoneNumber.length <= 7) {
      numericPhoneNumber = numericPhoneNumber.slice(0, 3) + "-" + numericPhoneNumber.slice(3);
    } else if (numericPhoneNumber.length > 7) {
      numericPhoneNumber =
              numericPhoneNumber.slice(0, 3) + "-" +
              numericPhoneNumber.slice(3, 7) + "-" +
              numericPhoneNumber.slice(7);
    }
    phoneInput.value = numericPhoneNumber;

    // Check if the input value matches the numericPhoneNumber
    if (phoneNumber !== numericPhoneNumber) {
      phoneError.textContent = "휴대폰 번호는 숫자 11자리만 입력 가능합니다.";
      phoneError.style.color = "red";
      phoneError.style.display = "block";
      phoneError.style.marginTop = "2px";
      phoneError.style.marginLeft = "3px";
    } else {
      phoneError.style.display = "none";
    }
  });

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

