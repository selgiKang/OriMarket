<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>현 재고 리스트</title>
    <link rel="stylesheet" href="../../css/admin/manager.css">
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
            <div class="top_title_wrap">
                <!-- 뒤로가기 -->
                <a href="/adminMain">
                    <button class="backbtn">&lt;</button>
                </a>
            </div>
            <a><input type="button" class="delete_btn" value="선택회원 삭제" onclick="deleteSelectedManagerUsers()"></a>
            <a><input type="button" class="show_all_btn" value="전체회원 보기" onclick="showAllManagerUsers()"></a>
            <form id="searchForm">
                <select id="searchType" name="searchType">
                    <option value="managerId">아이디</option>
                    <option value="managerName">이름</option>
                    <option value="managerEmail">이메일</option>
                    <option value="managerPhone">휴대폰 번호</option>
                </select>
                <input type="text" id="searchValue" name="searchValue">
                <input type="button" value="검색" onclick="searchManagerUsers()">
            </form>
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
        xhr.onreadystatechange = function () {
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


    //매니저 회원검색 crud
    function searchManagerUsers() {
        // 선택한 검색 조건을 가져옴
        var searchType = document.getElementById('searchType').value;
        // 입력한 검색어를 가져와 소문자로 변환
        var searchText = document.getElementById('searchValue').value.toLowerCase();

        // 매니저 목록의 모든 행을 가져옴
        var managers = document.querySelectorAll('#goods_list table tr');

        var hasResults = false; // 검색 결과가 있는지 확인하기 위한 변수

        for (var i = 1; i < managers.length; i++) { // 1부터 시작하여 테이블 헤더 행을 건너뜀
            // 행에서 매니저 아이디, 이름, 이메일, 휴대폰번호를 가져옴
            var managerId = managers[i].querySelector('td:nth-child(3)').textContent.toLowerCase();
            var managerName = managers[i].querySelector('td:nth-child(5)').textContent.toLowerCase();
            var managerEmail = managers[i].querySelector('td:nth-child(7)').textContent.toLowerCase();
            var managerPhone = managers[i].querySelector('td:nth-child(6)').textContent.toLowerCase();

            // 검색어가 비어있으면 모든 행을 보여줌
            if (searchText === '') {
                managers[i].style.display = '';
                hasResults = true;
            } else {
                // 검색 조건과 검색어를 기준으로 행을 필터링하여 보여줄지 숨길지 결정
                if (
                    (searchType === 'managerId' && managerId.includes(searchText)) || // 검색 조건이 '아이디'이면 매니저 아이디로 필터링
                    (searchType === 'managerName' && managerName.includes(searchText)) || // 검색 조건이 '이름'이면 매니저 이름으로 필터링
                    (searchType === 'managerEmail' && managerEmail.includes(searchText)) || // 검색 조건이 '이메일'이면 매니저 이메일로 필터링
                    (searchType === 'managerPhone' && managerPhone.includes(searchText)) // 검색 조건이 '휴대폰'이면 매니저 휴대폰번호로 필터링
                ) {
                    managers[i].style.display = ''; // 일치하는 행은 보여줌
                    hasResults = true;
                } else {
                    managers[i].style.display = 'none'; // 일치하지 않는 행은 숨김
                }
            }
        }

        // 검색 결과가 없는 경우 알림창 띄우기
        if (!hasResults) {
            alert('잘못 입력하셨거나 해당 회원정보가 없습니다.');
        }
    }

    //엔터키로 검색되게
    var searchValue = document.getElementById('searchValue');
    searchValue.addEventListener('keyup', function (event) {
        if (event.keyCode === 13) { // Enter 키를 누른 경우
            searchManagerUsers(); // 검색 기능 함수를 호출
        }
    });

    // 전체회원 보기
    function showAllManagerUsers() {
        // 매니저 목록의 모든 행을 가져옴
        var managers = document.querySelectorAll('#goods_list table tr');

        // 모든 행을 보여줌
        for (var i = 1; i < managers.length; i++) { // 1부터 시작하여 테이블 헤더 행을 건너뜀
            managers[i].style.display = '';
        }
    }
</script>
</body>
</html>

