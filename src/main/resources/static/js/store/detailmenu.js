function plusBtn() {
    var countInput = document.getElementById('countInput');
    var count = parseInt(countInput.value);
    count = isNaN(count) ? 1 : count; // 만약 값이 NaN이면 기본값 1로 설정
    countInput.value = count + 1;
}

function minusBtn() {
    var countInput = document.getElementById('countInput');
    var count = parseInt(countInput.value);
    count = isNaN(count) ? 1 : count; // 만약 값이 NaN이면 기본값 1로 설정
    if (count > 1) {
        countInput.value = count - 1;
    }
}
function submitForm() {
    document.getElementById('cartForm').submit();
}