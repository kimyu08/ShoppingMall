<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<%-- 본문시작 template.jsp --%>

 <div align="center">
    	<ul class="mainmenu" >
    	 <li><a href="/MasterProductList.do">상품등록</a></li>
          <li><a href="/payList.do">결제관리</a></li>
          <li><a href="/memManagement.do?nowPage=1">회원관리</a></li>
          <li><a href="/notice.do">공지사항</a></li>
 		 </ul>
    </div>
<div class="plist" align="center"><br><br>
	<h3>상품 리스트</h3>
	<br>
		<button type="button" class="btn btn-success" onclick="location.href='/productAdd.do' "><i class="fa fa-save"></i> 상품 등록</button>
		<table  width=80%, style="text-align: center;">
	
			<tr style="border-top: 1px solid black;border-bottom:1px solid black; height: 50px;">
				<th>이름 </th>
				<th>제품 코드</th>
				<th>제품 그룹</th>
				<th>설명</th>
				<th>색상</th>
				<th>사이즈</th>
				<th>재고</th>
				<th>사진</th>
				<th>가격</th>
				<th>등록일<th>
			</tr>		
			<c:forEach var="dto" items="${dto}">
					
				
				<tr style="border-bottom:1px solid lightgray; height: 50px;">
					<td>${dto.pname}</td>
					<td>${dto.pcode}</td>
					<td>${dto.pgroup}</td>
					<td>${dto.content}</td>
					<td>${dto.color}</td>
					<td>${dto.size}</td>
					<td>${dto.stock}</td>
					<td>${dto.photo}</td>
					<td>${dto.price}</td>
					<td>${dto.date}</td>
					
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