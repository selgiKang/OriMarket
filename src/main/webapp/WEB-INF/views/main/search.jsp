<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="../../css/user/join.css">

    <script src="../../js/user/join.js"></script>
</head>
<style>
    hr {
        width: 350px; /* 원하는 길이로 조정합니다. */
        margin: 0 auto;
        margin-top: 15px;
        position: absolute;
        top: 60px;
        left: 12px;
    }
</style>

<body>
<div class="container" style="position: relative">
    <form action="" method="post">
        <div class="form_field">
            <h2 style="position: absolute; top: 10px; left: 40px;"><label for="address_kakao">배달받을 주소 설정하기</label></h2>
            <hr>
            <div class="input_container">
                <input type="text" id="address_kakao" name="userAddress" readonly style="position: absolute; top: 100px; right: 110px;" placeholder="주소검색버튼을눌러주세요..">
                <div class="btn_container" style="position: absolute; top: 100px; right: 40px">
                    <button type="button" class="btn_round" onclick="searchAddress()"
                            style="border-radius: 20px; padding: 5px 10px; background-color: #ffbf41; color: white; border: none; font-size: 14px; cursor: pointer; font-family: 'omyu pretty', Arial, sans-serif;">주소검색
                    </button>
                </div>
            </div>
        </div>

        <div class="form_field" style="position: absolute; top: 150px; right: 110px">
            <label for="address_detail"></label>
            <input type="text" id="address_detail" name="userAddressDetail" placeholder="상세주소를 입력해주세요" required>
        </div>

        <input type="submit" value="등록하기" class="submit_btn" style="position: absolute; top: 190px; left: 40px;">
    </form>

</div>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</body>


</html>
