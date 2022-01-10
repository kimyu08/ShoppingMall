<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>5조 쇼핑몰 입장하기</title>
</head>
<body>
	<div align="center">
		<h1>쇼핑몰 입장하기</h1>
		<img src="storage/clothes.png" width="15%"><br>
		<input type="button" value="입장하기" onclick="location.href='home.do'">
		<h1>상업적X</h1>
	</div>
	<p>작업기간: 21.11.29~21.12.29(1개월)</p>
		<p>작업인원: 2명</p>
		<p>IDE: STS4</p>
		<p>작품소개: LOGO쇼핑몰</p>
		<p>사용언어: JAVA, JSP, HTML, CSS, JAVASCRIPT</p>
		<p>프레임워크: SpringBoot, Mybatis, Bootstrap</p>
		<p>라이브러리: JSTL, Ajax, jQuery</p>
		<p>DB: MariaDB</p>
		<p>호스팅:cafe24. filezilla/putty사용</p>
		<p>맡은 파트(기술자문):메인, 템플릿페이지, 로그인/로그아웃, 상품리스트, 상품상세보기, 장바구니, 주문확인, 결제, 마이/관리자 페이지</p>
		<p>기능 설명 (테스트 일반ID:aaa1/12345 관리자ID:master/1234)</p>
		<p>1.로그인시 해당 자용자의 권한(일반:1,관리자:2)을 session에 저장하여 권한에 따른 메뉴구성</p>
		<p>2.로그인시 아이디 저장 체크시 사용자 PC에 쿠키저장 가능/DB조회로 아이디/비밀번호 찾기</p>
		<p>3.ModelAndView로 각페이지에 맞는 정보를 담아와 페이지 이동/mav에 담아온 데이터 JSTL활용하여 구성</p>
		<p>4.제품 상세보기에서 Ajax를 활용하여 해당 제품의 색상선택시에 사이즈와 재고 불러오기/ 장바구니 등록/ 바로 결제 기능</p>
		<p>5.장바구니에서 선택 상품 구매/ 전체 상품 구매</p>
		<p>6.회원정보 수정/탈퇴,장바구니 ,결제 조회/취소, 결제된 상품 리뷰등록</p>
		<p>7.관리자 페이지 물품등록,회원관리(limit를 활용한 페이징처리)</p>
</body>
</html>