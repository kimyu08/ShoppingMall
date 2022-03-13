# ShoppingMall

[http://kimyu08.cafe24.com](http://kimyu08.cafe24.com)

작업기간: 21.11.29~21.12.29(1개월)

작업인원: 2명

역할: 기술자문

IDE: STS4

작품소개: LOGO쇼핑몰

사용언어: JAVA, JSP, HTML, CSS, JAVASCRIPT

프레임워크: SpringBoot, Mybatis, Bootstrap

라이브러리: JSTL, Ajax, jQuery

DB: MariaDB

호스팅:cafe24. filezilla/putty사용

맡은 파트:메인, 템플릿페이지, 로그인/로그아웃, 상품리스트, 상품상세보기, 장바구니, 주문확인, 결제, 마이/관리자 페이지

기능 설명 (테스트 일반ID:aaa1/12345 관리자ID:master/1234)

1.로그인시 해당 자용자의 권한(일반:1,관리자:2)을 session에 저장하여 권한에 따른 메뉴구성

2.로그인시 아이디 저장 체크시 사용자 PC에 쿠키저장 가능/DB조회로 아이디/비밀번호 찾기

3.ModelAndView로 각페이지에 맞는 정보를 담아와 페이지 이동/mav에 담아온 데이터 JSTL활용하여 구성

4.제품 상세보기에서 Ajax를 활용하여 해당 제품의 색상선택시에 사이즈와 재고 불러오기/ 장바구니 등록/ 바로 결제 기능

5.장바구니에서 선택 상품 구매/ 전체 상품 구매

6.회원정보 수정/탈퇴,장바구니 ,결제 조회/취소, 결제된 상품 리뷰등록

7.관리자 페이지 물품등록,회원관리(limit를 활용한 페이징처리)


보완해야할 점: 결제 모듈, 에러페이지처리, CSS
