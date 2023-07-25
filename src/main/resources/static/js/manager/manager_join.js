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