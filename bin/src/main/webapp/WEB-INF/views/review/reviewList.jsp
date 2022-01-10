<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<%@ include file="../header.jsp"%>
<%-- 본문시작 template.jsp --%>
<br>
<br>
<br>
<div class="cart" align="center">
	<h3>리뷰 목록</h3>
	<br>
	<br>
		<button type="button" class="btn btn-success" onclick="location.href='/reviewWrite.do' "><i class="fa fa-save"></i> 리뷰 작성</button>
		<table>
	
			<tr>
				<th>번호</th>
				<th>제품 코드</th>
				<th>ID</th>
				<th>내용</th>
				<th>등록일</th>
			</tr>		
			
			<c:forEach var="dto" items="${dto}">
					
				
				<tr>
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