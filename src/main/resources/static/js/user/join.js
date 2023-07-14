
//주소검색
function searchAddress() {
    new daum.Postcode({
        oncomplete: function (data) {
            document.getElementById("address_kakao").value = data.address;

            //주소 검색 후 선택하면 창이 닫히고 상세주소칸으로 포인트가 이동
            document.getElementById("address_detail").focus();
        }
    }).open();
}