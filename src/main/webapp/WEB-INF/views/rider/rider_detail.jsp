<%--
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>라이더 정보수정</title>
    <style type="text/css">
        /* 전체적용 */
        @font-face {
            font-family: 'omyu_pretty';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-01@1.0/omyu_pretty.woff2') format('woff2');
            font-weight: normal;
            font-style: normal;
        }
        @font-face {
            font-family: 'LINESeedKR-Bd';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/LINESeedKR-Bd.woff2') format('woff2');
            font-weight: 700;
            font-style: normal;
        }

        /* 전체 크기 */
        body{margin: 0; padding: 0; font-family:'LINESeedKR-Bd'; font-size: 16px; text-align: center; width: 100%; height: 100%}
        #rider_container{width: 375px; height:812px; margin: 0 auto;}

        /* 가게상호명,업주 */ /* 230723 승원 */
        #rider_store{height:100px; background-color:#46A973; color:#fff; display: flex; justify-content: end; align-items: center;}
        .sn_wrap{margin-right:20px}

        /* 버튼 */
        #rider_btn{vertical-align: center;}
        #rider_btn input{width:80px; background-color: #FFBF41; font-family:'LINESeedKR-Bd'; border-style: none; font-size: 16px; padding: 10px 8px 8px; border:none; border-radius:5px; cursor:pointer;}
        #rider_btn > input:hover {background-color:#333; color:#fff;}
        #rider_btn > a > input:hover {background-color:#46A973; color:#fff;}

        /* 230723 승원 */
        .rider_store_wrap{background-color:#eee; height:712px; display: flex;}
        .rider_store_list_wrap{width: 90%; height: 612px; overflow-y: scroll; border-radius: 25px; border-radius: 25px; background-color:#fff; padding:20px 5px; margin:auto; box-shadow: 0px 2px 8px rgba(0, 0, 0, 0.2);}
        .top_title_wrap{ display: flex; align-items: center;}
        button.backbtn { display: flex; align-items: center; font-size: 20px; color: #999; margin: 0 0 0 10px; width: 30px; height: 30px; background-color: #fff; border-radius: 50%; border: 1px solid #999; cursor: pointer; justify-content: center;}
        button.backbtn:hover {background-color:#333; color:#fff;}
        .top_title_wrap h2{text-align:center; margin:18px 17%;}

        #rider_table{margin: 0 auto;}
        #rider_table tr{line-height: 30px;}
        #rider_table td{color: #46A973;}

        input[type=text] {width: 80%; height: 30px; font-size: 15px; border: 0; border-radius: 15px; outline: none; padding-left: 10px; background-color: rgb(233, 233, 233);}
        textarea { width: 80%;height: 50px; padding: 10px; box-sizing: border-box; border: solid 2px #e6e6e6; border-radius: 5px;font-size: 16px; resize: both;}
        .select {width:80%; height:30px; border-radius:5px; border:2px solid #e9e9e9;}
        td.input_wrap{width:70%;}

        /* 스크롤바 숨기기 (Hide Scrollbar) */
        .rider_store_list_wrap {
            -ms-overflow-style: none; /* IE 및 Edge */
            scrollbar-width: none; /* Firefox */
        }
        .rider_store_list_wrap::-webkit-scrollbar {
            display: none; /* Chrome, Safari, Opera*/
        }

    </style>

</head>
<body>
<div id="rider_container">
    <div id="rider_store">
        <div class="sn_wrap">
            &lt;%&ndash;<div>${buStore.buStoreName}</div>
            <small>관리자:${buUser.buUserName}</small>&ndash;%&gt;
        </div>
    </div>
    <div class="rider_store_wrap">
        <div class="rider_store_list_wrap">
            <div id="rider_title">
                <div class="top_title_wrap">
                    <!-- 뒤로가기 -->
                    <button class="backbtn" onclick="window.history.go(-1)">&lt;</button>
                    <h2>라이더 정보수정</h2>
                </div>
            </div>
            <form action="/update_riderDetail" method="post" enctype="multipart/form-data">
                <table id="rider_table">
                    <td><input type="hidden" name="itemId" value="${riders.riderId}"></td>
                    <tr>
                        <td>라이더 이름</td>
                        <td class="input_wrap"><input type="text" name="itemName" value="${rider.riderName}"></td>
                    </tr>
                    <tr>
                        <td>라이더 아이디</td>
                        <td><input type="text" name="itemCnt" value="${rider.riderId}"></td>
                    </tr>

                    <tr>
                        <td>라이더번호</td>
                        <td><input type="text" name="itemPrice" value="${rider.riderPhone}"></td>
                    </tr>
                    <tr>
                        <td>라이더 주소</td>
                        <td><input type="text" name="itemG" value="${rider.riderAddress}"></td>
                    </tr>
                    <tr>
                        <td>운전면허</td>
                        <td><input type="text" name="itemFrom" value="${rider.driverLicense}"></td>
                    </tr>

                </table>
                <br>
                <div id="rider_btn">
                    <input type="submit" value="수정">
                    <a href="/s1/${buUserId}"><input type="button" value="리스트"></a>
                </div>
            </form>
        </div>
        <br>
    </div>
</div>
</div>
</body>
<script>
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
</script>
</html>
--%>
