<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%--, 가게물품등록하기, 공지사항 하기, --%>
<html>
<head>
    <meta charset="UTF-8">
    <title>title</title>
</head>
<body>

#초기 개발 환결설정 (db연결, 컨트롤러, 서비스, jpa레파지스토리, 필요 라이브러리, 깃 등)
#사용자, 사업자, 라이더 로그인 회원가입(유효성검사), 회원정보수정 등
#사업자 가게등록, 상품등록, 리뷰, 가게 on/off(ex.off하면 사용자가 시장들어갔을때 해당 가게 불이꺼짐) 서비스 구현
#사용자 배달지 등록, 단골시장검색, 거리계산, 위치보기, 리뷰, 주문, 시장or가게or상품검색 서비스 구현
#라이더 배달 서비스(배달요청검색, 배달요청수락, 배달완료 등) 구현
#공통관련 페이징 처리, 이미지정보 db저장, 배달지와 시장 거리계산(너무 멀면 주문이안되게) and 주소검색후 db속 시장중 가까운 시장만 나오게 거리게산, 현재위치 and 가게위치 등 위치정보 확인
 원하는 형식으로 출력되게 구현(cart,리뷰,주문내역,스토어 등)

</body>
</html>


<%--
String itemName = "${it.itemName}"; // 변수 itemName에 "${it.itemName}" 값 할당
int price = 3000; // 가격 변수에 3000 할당

String message = String.format("%,d원", price); // 숫자를 3자리마다 쉼표를 넣어서 변환하여 문자열에 포맷팅

System.out.println(message); --%>
