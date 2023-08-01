<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        body{margin: 0; padding: 0; font-family:'LINESeedKR-Bd'; font-size: 16px; text-align: center; width: 100%; height: 100%}
        #goods_container{width: 375px; height:812px; margin: 0 auto;}

        /* 가게상호명,업주 */ /* 230723 승원 */
        #goods_store{height:100px; background-color:#46A973; color:#fff; text-align: right; display: flex; justify-content: end; align-items: center;}
        .snun_wrap{margin-right:80px}

        /* 230723 승원 */
        .goods_store_wrap{background-color:#eee; height:712px;}
        .top_title_wrap h1{text-align:center; margin:15px 18%;}

        #goods_title{padding:20px 0 0;}
        #goods_title a{color:#333; margin:10px 5px; margin-right: 0;}
        .top_title_wrap{ display: flex; align-items: center;}
        button.backbtn { display: flex; align-items: center; font-size: 20px; color: #999; margin: 0 0 0 10px; width: 30px; height: 30px; background-color: #fff; border-radius: 50%; border: 1px solid #999; cursor: pointer; justify-content: center;}
        button.backbtn:hover {background-color:#333; color:#fff;}

        /* ------------------------------------------ 공통적용css---------------------------------------------- */

        #goods_list{font-size: 10px; margin: 1px;}

        /* 230723 승원 */
        #goods_list table{ border-radius: 5px; background-color:#fff; margin:auto; }

        .goods_listTitle td{
            padding: 12px;
        }

        /* 230723 승원 */
        #goods_title > a > input{ background-color: #ffbf41; color: #333; font-weight:600; padding: 8px 8px; border:none; border-radius:5px; cursor:pointer;}
        #goods_title > a > input:hover {background-color:#333; color:#fff;}

        .goods_listTitle{color: #46A973; margin-bottom:15px;}
    </style>
</head>
<body>
<div id="goods_container">
    <div id="goods_store">
        <div class="snun_wrap">
            <h1>매니저 회원관리</h1>
        </div>
    </div>
    <div class="goods_store_wrap">
        <div id="goods_title">
            <a><input type="button" class="delete_btn" value="선택회원 삭제" onclick="deleteSelectedManagerUsers()"></a>
        </div>
        <br>
        <div id="goods_list">
            <table>
                <tr class="goods_listTitle">
                    <td></td>
                    <td>소속시장</td>
                    <td>아이디</td>
                    <td>비밀번호</td>
                    <td>이름</td>
                    <td>휴대폰</td>
                    <td>이메일</td>
                </tr>
                <c:forEach var="manageruser" items="${managerUsers}">
                <tr>
                    <td><input type="checkbox" value="${manageruser.managerSeq}"></td>
                    <td>${manageruser.market.marketName}</td>
                    <td>${manageruser.managerId}</td>
                    <td>${manageruser.managerPassword}</td>
                    <td>${manageruser.managerName}</td>
                    <td>${manageruser.managerPhone}</td>
                    <td>${manageruser.managerEmail}</td>
                </tr>
                </c:forEach>
            </table>
        </div>
    </div>
</div>
<script>
    function deleteSelectedManagerUsers() {
        // 선택된 회원들의 managerSeq 값을 배열로 저장
        var selectedManagerSeqs = [];
        var checkboxes = document.querySelectorAll('input[type="checkbox"]:checked');
        for (var i = 0; i < checkboxes.length; i++) {
            selectedManagerSeqs.push(checkboxes[i].value);
        }

        // 선택된 회원이 없는 경우 알림창 띄우기
        if (selectedManagerSeqs.length === 0) {
            alert('회원을 선택해 주세요.');
            return;
        }

        // 선택된 회원들의 managerSeq 값을 서버로 전송하여 삭제 요청
        var xhr = new XMLHttpRequest();
        xhr.open('POST', '/deleteManagerUsers', true);
        xhr.setRequestHeader('Content-Type', 'application/json');
        xhr.onreadystatechange = function() {
            if (xhr.readyState === XMLHttpRequest.DONE) {
                if (xhr.status === 200) {
                    // 삭제 요청이 성공적으로 처리되었을 경우, 선택된 회원들을 테이블에서 삭제
                    for (var i = 0; i < selectedManagerSeqs.length; i++) {
                        var row = document.querySelector('input[value="' + selectedManagerSeqs[i] + '"]').parentNode.parentNode;
                        row.parentNode.removeChild(row);
                    }
                    alert('회원 삭제가 완료되었습니다.');
                } else {
                    // 삭제 요청이 실패한 경우
                    alert('회원 삭제에 실패했습니다. 다시 시도해주세요.');
                }
            }
        };
        xhr.send(JSON.stringify(selectedManagerSeqs));
    }
</script>
</body>
</html>

