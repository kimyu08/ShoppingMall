<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<%@ include file="../header.jsp"%>
<%-- 본문시작 template.jsp --%>

		<c:forEach var="s_rights" items="${s_rights}">
			<c:if test="${s_rights eq 2 }">
				 <div align="center">
			    	<ul class="mainmenu" >
			    	 <li><a href="/MasterProductList.do">상품등록</a></li>
			          <li><a href="/payList.do">결제관리</a></li>
			          <li><a href="/memManagement.do?nowPage=1">회원관리</a></li>
			          <li><a href="/notice.do">공지사항</a></li>
			 		 </ul>
			    </div><!-- 메뉴 end -->
			</c:if>
		</c:forEach>
		<br><br>
<div class="boarder" align="center">
	<h3>공지사항</h3>
	<br>
		<table width=80%, style="text-align: center;">
			<tr style="border-top: 1px solid black;border-bottom:1px solid black; height: 50px;">
				<th>공지 번호</th>
				<th colspan="2">내용</th>
				<th>날짜</th>
			</tr>		
			<c:forEach var="dto" items="${dto}">			
				<tr style="border-bottom:1px solid lightgray; height: 50px;">
					<td>${dto.noticeno}</td>
					<td colspan="2"><a href="noticeRead.do?noticeno=${dto.noticeno}">${dto.subject}</a></td>
					<td>${dto.date}</td>
				</tr>
			</c:forEach>
		</table>
		<br>
		<br>
		<c:forEach var="s_rights" items="${s_rights}">
			<c:if test="${s_rights eq 2 }">
				<button type="button" class="btn btn-success" onclick="location.href='/noticeWrite.do' "><i class="fa fa-save"></i> 글쓰기</button>
			</c:if>
		</c:forEach>
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
<%@ include file="../footer.jsp"%>