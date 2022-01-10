<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<%@ include file="../header.jsp"%>
<%-- 본문시작 template.jsp --%>
 <div align="center">
    	<ul class="mainmenu" >
          <li><a href="/mypage.do">정보수정</a></li>
          <li><a href="/location.do">배송지설정</a></li>
          <li><a href="/checkorder.do">결제목록</a></li>
          <li><a href="/cart.do">장바구니</a></li>
          <li><a href="/review.do">리뷰</a></li>
          <li><a href="/deleteInfo.do">회원탈퇴</a></li>
 		 </ul>
    </div><!-- 메뉴 end -->
<br><br>
<div class="review" align="center">
	<h3>리뷰 목록</h3>
	<br>
	<br>
		<button type="button" class="btn btn-success" onclick="location.href='/reviewWrite.do' "><i class="fa fa-save"></i> 리뷰 작성</button><br><br>
		<table width=80%, style="text-align: center;">
	
			<tr style="border-bottom:1px solid lightgray; height: 50px;">
				<th>번호</th>
				<th>제품 코드</th>
				<th>ID</th>
				<th>내용</th>
				<th>등록일</th>
			</tr>		
			
			<c:forEach var="dto" items="${dto}">
					
				
				<tr style="border-bottom:1px solid lightgray; height: 50px;">
					<td>${dto.reno}</td>
					<td>${dto.pcode}</td>
					<td>${dto.id}</td>
					<td>${dto.content}</td>
					<td>${dto.dates}</td>
					
				</tr>

			</c:forEach>
		</table>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
</div>




<%-- 본문종료 --%>
<%@ include file="../footer.jsp" %>