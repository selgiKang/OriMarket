<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>신규상품등록</title>
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
        #goods_container{width: 375px; height:812px; margin: 0 auto;}

        /* 가게상호명,업주 */ /* 230723 승원 */
        #goods_store{height:100px; background-color:#46A973; color:#fff; display: flex; justify-content: end; align-items: center;}
        .sn_wrap{margin-right:20px}

        /* 버튼 */ /* 230723 승원 */
        #goods_btn input{width:80px; background-color: #FFBF41; font-family:'LINESeedKR-Bd'; border-style: none; font-size: 16px; padding: 10px 8px 8px; border:none; border-radius:5px; cursor:pointer;}
        #goods_btn{vertical-align: center;}
        #goods_btn > input:hover {background-color:#333; color:#fff;}
        #goods_btn > a {width:80px; background-color: #46A973; color:#fff; font-family:'LINESeedKR-Bd'; border-style: none; font-size: 16px; padding: 12px 18px 11px; border:none; border-radius:5px; text-decoration: none; cursor:pointer;}
        #goods_btn > a:hover {background-color:#333; color:#fff;}

        /* 230723 승원 */
        .goods_store_wrap{background-color:#eee; height:712px; display: flex;}
        .goods_store_new_wrap{width: 90%; border-radius: 25px; border-radius: 25px; background-color:#fff; padding:20px 5px; margin:auto; box-shadow: 0px 2px 8px rgba(0, 0, 0, 0.2);}

        #goods_listTable{margin: 0 auto;}
        #goods_listTable tr{line-height: 30px;}
        #goods_listTable td{color: #46A973; text-align: center;}

        input[type=text] {
            width: 75%;
            height: 20px;
            font-size: 15px;
            border: 0;
            border-radius: 15px;
            outline: none;
            padding-left: 10px;
            background-color: rgb(233, 233, 233);
        }
    </style>
</head>
<body>
<div id="goods_container">
    <div id="goods_store">
        <div class="sn_wrap">
            <div>${buStore.buStoreName}</div>
            <small>대표:${buUser.buUserName}</small>
        </div>
    </div>
    <div class="goods_store_wrap">
        <div class="goods_store_new_wrap">
            <div>
              <h1>신규상품등록</h1>
            </div>
        <div>
            <form action="/s2" method="post">
                <table id="goods_listTable">
                    <tr>
                        <td>상품명</td>
                        <td><input type="text" name="itemName"></td>
                    </tr>
                    <tr>
                        <td>상품수량</td>
                        <td><input type="text" name="itemCnt" placeholder="판매단위로 입력해주세요."></td>
                    </tr>
                    <tr>
                        <td>원가</td>
                        <td><input type="text" name="itemCost"></td>
                    </tr>
                    <tr>
                        <td>판매가</td>
                        <td><input type="text" name="itemPrice"></td>
                    </tr>
                    <tr>
                        <td>무게</td>
                        <td><input type="text" name="itemG" placeholder="g(그램)단위로 작성해주세요."></td>
                    </tr>
                    <tr>
                        <td>원산지</td>
                        <td><input type="text" name="itemFrom"></td>
                    </tr>
                    <tr>
                        <td>입고일</td>
                        <td><input type="date" name="itemRegDate"></td>
                    </tr>
                    <tr>
                        <td>상세정보</td>
                        <td><textarea name="itemInfo"></textarea></td>
                    </tr>
                    <tr>
                        <td>상품 카테고리</td>
                        <td><select type="" name="itemCategory" id="lang">
                                <option value="한식">한식</option>
                                <option value="양식">양식</option>
                                <option value="일식">일식</option>
                                <option value="분식">분식</option>
                                <option value="카페">카페</option>
                                <option value="음료">음료</option>
                                <option value="채소">채소</option>
                                <option value="패스트푸드">패스트푸드</option>
                                <option value="과일">과일</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>상품사진</td>
                        <td><input type="file"></td>
                    </tr>
                </table>
                <br>
                <div id="goods_btn">
                    <!-- 등록버튼 클릭하면 모달창 띄워서 등록이 완료되었습니다. 표시하고 계속 상품등록할 수 있도록 같은 등록페이지로 리다이렉트 -->
                    <input type="submit" value="등록">
                    <input type="reset" onclick="window.history.go(-1)" value="취소">
                    <a href="/s1/${buUserId}">리스트</a>
                </div>
            </form>
            <div>
            </div>
        </div>
        <br>
        </div>
    </div>
</div>
</body>
</html>
