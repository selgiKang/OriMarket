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
        body{margin: 0; padding: 0; font-family:'LINESeedKR-Bd'; font-size: 16px; text-align: center;}
        #goods_container{width: 375px; border: 1px solid black;}

        /* 가게상호명,업주 */
        #goods_store{text-align: right;}

        /* 버튼 */
        #goods_btn input{background-color: #FFBF41; font-family:'LINESeedKR-Bd'; border-style: none; font-size: 16px;}


        #goods_table{margin: 0 auto;}
        #goods_table td{color: #46A973;}


    </style>
</head>
<body>
<div id="goods_container">
    <div id="goods_store">
        <div>푸른과일마트</div>
        <small>대표:손예솔</small>
    </div>
    <div>
        <h1>상품상세정보</h1>
    </div>
    <div>
        <form action="" enctype="">
            <table id="goods_table">
                <tr>
                    <td>상품명</td>
                    <td><input type="text" name="menu_name"></td>
                </tr>
                <tr>
                    <td>상품수량</td>
                    <td><input type="text" name="menu_cnt"></td>
                </tr>
                <tr>
                    <td>원가</td>
                    <td><input type="text" name="menu_priceOrigin"></td>
                </tr>
                <tr>
                    <td>판매가</td>
                    <td><input type="text" name="menu_price"></td>
                </tr>
                <tr>
                    <td>무게</td>
                    <td><input type="text" name="menu_g"></td>
                </tr>
                <tr>
                    <td>원산지</td>
                    <td><input type="text" name="menu_from"></td>
                </tr>
                <tr>
                    <td>입고일</td>
                    <td><input type="text" name="menu_regDate"></td>
                </tr>
                <tr>
                    <td>상세정보</td>
                    <td><textarea name="menu_info" rows="7"></textarea></td>
                </tr>
                <tr>
                    <td>상품사진</td>
                    <td><input type="image" value="제품사진" name=""></td>
                </tr>
            </table>
            <br>
            <div id="goods_btn">
                <input type="submit" value="수정">
                <a href="./GoodsManage_list.jsp"><input type="button" value="리스트"></a>
            </div>
        </form>
    </div>
    <br>

</div>
</body>
</html>