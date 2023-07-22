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

        /* 가게상호명,업주 */
        #goods_store{text-align: right;}

        /* 버튼 */
        #goods_btn input{background-color: #FFBF41; font-family:'LINESeedKR-Bd'; border-style: none; font-size: 16px;}


        #goods_table{margin: 0 auto;}
        #goods_table tr{line-height: 30px;}
        #goods_table td{color: #46A973;}
    </style>
</head>
<body>
<div id="goods_container">
    <div id="goods_store">
        <div>${buStore.buStoreName}</div>
        <small>대표:${buUser.buUserName}</small>
    </div>
    <div>
        <h1>상품상세정보</h1>
    </div>
    <div>
        <form action="" enctype="">
            <table id="goods_table">
                <tr>
                    <td>상품명</td>
                    <td><input type="text" name="menu_name" value="${item.itemName}"></td>
                </tr>
                <tr>
                    <td>상품수량</td>
                    <td><input type="text" name="menu_cnt" value="${item.itemCnt}"></td>
                </tr>
                <tr>
                    <td>원가</td>
                    <td><input type="text" name="menu_priceOrigin" value="${item.itemCost}"></td>
                </tr>
                <tr>
                    <td>판매가</td>
                    <td><input type="text" name="menu_price" value="${item.itemPrice}"></td>
                </tr>
                <tr>
                    <td>무게</td>
                    <td><input type="text" name="menu_g" value="${item.itemG}"></td>
                </tr>
                <tr>
                    <td>원산지</td>
                    <td><input type="text" name="menu_from" value="${item.itemFrom}"></td>
                </tr>
                <tr>
                    <td>입고일</td>
                    <td><input type="text" name="menu_regDate" value="${item.itemRegDate}"></td>
                </tr>
                <tr>
                    <td>상세정보</td>
                    <td><textarea name="menu_info" rows="7">${item.itemInfo}</textarea></td>
                </tr>
                <tr>
                    <td>상품 카테고리</td>
                    <td><select type="" name="itemCategory" id="lang" >
                        <option value="${item.itemCategory}" selected>${item.itemCategory}</option>
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
                    <td><input type="image" value="제품사진" name=""></td>
                </tr>
            </table>
            <br>
            <div id="goods_btn">
                <input type="submit" value="수정">
                <a href="/s1/${buUserId}"><input type="button" value="리스트"></a>
            </div>
        </form>
    </div>
    <br>
</div>
</body>
</html>