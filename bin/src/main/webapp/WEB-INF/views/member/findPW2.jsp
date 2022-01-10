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
<div class="cart" align="center" >
	<h3>비밀번호 찾기</h3>
	<br>
		<button type="button" class="btn btn-success" onclick="location.href='/login.do' "><i class="fa fa-save"></i> 로그인 </button>
			<br>
			<br>
		<table>
	
			<tr>
				<th>비밀번호</th>
				
			</tr>	
			<tr>	
				<c:forEach var="pw" items="${pw}">	
				<c:choose>								
					<c:when test="${not empty pw}">
						<td>${pw}</td>
					</c:when>
				</c:choose>
					
				</c:forEach>
			</tr>
			
			
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