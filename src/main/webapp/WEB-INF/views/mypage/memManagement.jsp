<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<%-- 본문시작 template.jsp --%>
	 <div align="center">
    	<ul class="mainmenu" >
    	 <li><a href="/MasterProductList.do">상품등록</a></li>
          <li><a href="/payList.do">결제관리</a></li>
          <li><a href="/memManagement.do?nowPage=1">회원관리</a></li>
          <li><a href="/notice.do">공지사항</a></li>
 		 </ul>
    </div><!-- 메뉴 end --><br><br>
	<div class="memInfo" align="center">
	<h3>회원 정보</h3><br>
		<table width="600" style="text-align: center;">
			<tr style="border-top: 1px solid black;border-bottom:1px solid black; ">
				<th>이름</th>
				<th>아이디</th>
				<th>연락처</th>
				<th>상태</th>
				<th>삭제</th>
			</tr>
			<c:forEach var="dto" items="${dto}">
				<tr style="border-bottom:1px solid lightgray;">
					<td>${dto.mname}</td>
					<td>${dto.id}</td>
					<td>${dto.phone}</td>
					<c:choose>
						<c:when test="${dto.rights eq 1}">
							<td>일반회원</td>
							<td>
								<input type="button" value="회원삭제" onclick="deleteMem('${dto.id}')">
							</td>
						</c:when>
						<c:when test="${dto.rights eq 2}">
							<td>관리자</td>
						</c:when>
						<c:when test="${dto.rights eq 3}">
							<td>탈퇴회원</td>
							<td>
								<input type="button" value="회원삭제" onclick="deleteMem('${dto.id}')">
							</td>
						</c:when>
					</c:choose>	 
					
				</tr>
			</c:forEach>
		</table>
		<br><br><br>
		<c:forEach var="nowPage" begin="1" end="${endPage}">
			<input type="button" value="${nowPage}" onclick="location.href='memManagement.do?nowPage=${nowPage}'">
		</c:forEach>
	</div>
	<br><br><br>
	<script>
	function deleteMem(value){	
		if(!confirm(value+"회원을 삭제하시겠습니까?")){
			//취소(아니오)버튼 클릭시
		}else{
			//확인(예)버튼 클릭시
			location.href="MasterdeleteMem.do?id="+value;
		}
	}
	</script>
	
<%-- 본문종료 --%>
<%@ include file="../footer.jsp" %>