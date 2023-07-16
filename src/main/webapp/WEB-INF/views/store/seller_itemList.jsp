<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>현 재고 리스트</title>
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

        /* ------------------------------------------ 공통적용css---------------------------------------------- */

        #goods_list{font-size: 14px;}

        #goods_title a{margin-right: 0;}


        #goods_listTitle{color: #46A973;}
    </style>
</head>
<body>
<div id="goods_container">
    <div id="goods_store">
        <div>푸른과일마트</div>
        <small>대표:손예솔</small>
    </div>
    <div id="goods_title">
        <h1>현 재고 목록</h1>
        <a href="#"><input type="button"  value="선택품목 삭제"></a>
        <a href="./GoodsManage_register.jsp"><input type="button"  value="신규품목 등록"></a>
    </div>
    <br>
    <div id="goods_list">
        <table>
            <tr id="goods_listTitle">
                <td></td>
                <td>상품번호</td>
                <td>상품명</td>
                <td>재고수량</td>
                <td>등록일</td>
            </tr>
            <tr>
                <!-- 반복문 사용해서 모든 제품리스트 출력 -->
                <td><input type="checkbox" value="Goods"></td>
                <td><a href="./GoodsManage_details.jsp">00001</a></td>
                <td>대추방울토마토 300g</td>
                <td>15</td>
                <td>2023.06.01</td>
            </tr>
            <tr>
                <td><input type="checkbox" value="Goods"></td>
                <td><a href="#">00002</a></td>
                <td>유명산지 고당도사과 1.5kg</td>
                <td>50</td>
                <td>2023.07.07</td>
            </tr>
            <tr>
                <td><input type="checkbox" value="Goods"></td>
                <td><a href="#">00003</a></td>
                <td>당도선별 수박 7kg이상</td>
                <td>27</td>
                <td>2023.07.01</td>
            </tr>
            <tr>
                <td><input type="checkbox" value="Goods"></td>
                <td><a href="#">00004</a></td>
                <td>제주 하우스 감귤 1kg</td>
                <td>0</td>
                <td>2023.05.21</td>
            </tr>
            <tr>
                <td><input type="checkbox" value="Goods"></td>
                <td><a href="#">00005</a></td>
                <td>성주 꼬마 참외 900g</td>
                <td>11</td>
                <td>2023.06.03</td>
            </tr>
        </table>
    </div>
</div>
</body>
</html>