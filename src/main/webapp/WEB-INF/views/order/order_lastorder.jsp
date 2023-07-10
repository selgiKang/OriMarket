<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <style type="text/css">

        *{
            margin: 0;
            padding: 0;
        }
        #order {
            width: 315px;
            height: 812px;
            background-color: rgb(245, 245, 245);
            text-align: center;
            position: relative;
            overflow-y: scroll; /* Enable vertical scrollbar */
        }

        #order::-webkit-scrollbar {
            /* Hide the scrollbar */
            display: none;
        }

        #h3 {
            padding-top: 10px;
        }
        hr{
            margin-top: 10px;
        }

        #search_area > form > input {
            border: none;
            width: 75%;
            height: 40px;
            background: rgba(211, 211, 211, 0.5);
            border-radius: 20px;
            color: black;
            padding-left: 10px;
            margin-top: 15px;
        }
        #search_area > form > span {
            color: black;
            font-weight: bold;
            cursor: pointer;
            padding-left: 8px;
            width: 25%;

        }
        #mypage1_h2{
            margin-bottom: -4px;
            margin-left: 10px;
            text-align: left;
        }
        #img1{
            position: absolute;
            right: 10px;
            top: 10px;
            width: 50px;
            height: 50px;

        }
        #div1{
            border: none;
            width: 75%;
            height: 40px;
            background: rgba(211, 211, 211, 0.5);
            border-radius: 20px;
            color: black;
            padding-left: 10px;
            margin-top: 15px;
        }
        #div2{
            width: 315px;
            background-color: gray;
            position: absolute;
            bottom: 0;
            text-align: center;
            height: 30px;
        }

        #order_1{
            background-color: rgba(0, 128, 0, 0.3);
            height: 250px;
            padding-top: 5px;
            margin-top: 10px;
            position: relative;

        }
        footer{
            width: 315px;
            background-color: red;
            position: fixed;
            bottom: 0;
            left: 0;
            text-align: center;
            height: 40px;
            width: 315px;

        }
        small{
            color: red;
            margin-left:-140px;
            text-align: left;
        }
    </style>
</head>
<body>
<div id="order">
    <h3 id="h3">과거 주문 내역</h3>
    <hr>
    <div id="search_area">
        <form>
            <input type="search" placeholder="주문했던 메뉴와 시장을 검색해보세요.">
            <span>검색</span>
        </form>
    </div>

    <div id="order_1">
        <h2 id="mypage1_h2">오리시장 ??점</h2><img id="img1" src="" width="30px" height="30px">
        <small id="mypage1_small" style="text-align: left;">2023-07-05 오후 12:21</small>
        <h3 style="text-align: left;">배달완료</h3>
        <ul style="text-align: left;">
            <li>1.어쩌구 저쩌구</li>
            <li>2.어쩌구 저쩌구</li>
            <li>3.어쩌구 저쩌구</li>
        </ul>
        <h3 style="text-align: left;">합계: 1000만원</h3>
        <div id="div1">재주문하기...</div>
        <div id="div2">영수증 보기</div>
    </div>
    <footer>&lt; 푸터 &gt;</footer>

    <div id="order_1">
        <h2 id="mypage1_h2">오리시장 ??점</h2><img id="img1" src="" width="30px" height="30px">
        <small id="mypage1_small" style="text-align: left;">2023-07-05 오후 12:21</small>
        <h3 style="text-align: left;">배달완료</h3>
        <ul style="text-align: left;">
            <li>1.어쩌구 저쩌구</li>
            <li>2.어쩌구 저쩌구</li>
            <li>3.어쩌구 저쩌구</li>
        </ul>
        <h3 style="text-align: left;">합계: 1000만원</h3>
        <div id="div1">재주문하기...</div>
        <div id="div2">영수증 보기</div>
    </div>

    <div id="order_1">
        <h2 id="mypage1_h2">오리시장 ??점</h2><img id="img1" src="" width="30px" height="30px">
        <small id="mypage1_small" style="text-align: left;">2023-07-05 오후 12:21</small>
        <h3 style="text-align: left;">배달완료</h3>
        <ul style="text-align: left;">
            <li>1.어쩌구 저쩌구</li>
            <li>2.어쩌구 저쩌구</li>
            <li>3.어쩌구 저쩌구</li>
        </ul>
        <h3 style="text-align: left;">합계: 1000만원</h3>
        <div id="div1">재주문하기...</div>
        <div id="div2">영수증 보기</div>

    </div>

</div>
<footer>&lt; 푸터 &gt;</footer>
</body>
</html>
