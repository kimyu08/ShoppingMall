<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<%-- 본문시작 template.jsp --%>
 <div align="center">
    	<ul class="mainmenu" >
    	 <li><a href="/MasterProductList.do">상품등록</a></li>
          <li><a href="/payList.do">결제관리</a></li>
          <li><a href="/memManagement.do">회원관리</a></li>
          <li><a href="/notice.do">공지사항</a></li>
 		 </ul>
    </div><!-- 메뉴 end -->
	<br><br><br>
<div class="cart" align="center">
	<h3>결제 관리</h3>
	<br>
		<table>
	
			<tr>
				<th>주문번호</th>
				<th>사용자</th>
				<th>제품이름</th>
				<th>옵션코드</th>
				<th>수량</th>
				<th>가격</th>
				<th>날짜</th>
				<th>상태</th>
				<th>버튼</th>
				
			</tr>		
			<c:forEach var="dto" items="${dto}">								
				<tr>
					<td>${dto.ono}</td>
					<td>${dto.mname}</td>
					<td>${dto.pname}</td>
					<td>${dto.opcode}</td>
					<td>${dto.quantity}</td>
					<td>${dto.totalprice}</td>
					<td>${dto.dates}</td>

						<c:choose>
							<c:when test="${dto.state eq 1}">
								<td>상품준비중</td>
								<td>
									<input type="button" value="취소" onclick="deleteorder(${dto.ono})">
									<input type="button" value="배송처리" onclick="updateorder2(${dto.ono})">
								</td>
							</c:when>
							<c:when test="${dto.state eq 2}">
								<td>배송중</td>
								<td><input type="button" value="완료처리" onclick="updateorder3(${dto.ono})"></td>
							</c:when>
							<c:when test="${dto.state eq 3}">
								<td>배송완료</td>
							</c:when>
							<c:when test="${dto.state eq 4}">
								<td>결제취소</td>
							</c:when>
						</c:choose>	 

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
<script>
	function deleteorder(value){	
		if(!confirm("주문번호:"+value+" 취소하시겠습니까?")){
			//취소(아니오)버튼 클릭시
		}else{
			//확인(예)버튼 클릭시
			location.href="MasterdeleteOrder.do?ono="+value;
		}
	}
	function updateorder2(value){	
		if(!confirm("주문번호:"+value+"을 배송처리 하시겠습니까?")){
			//취소(아니오)버튼 클릭시
		}else{
			//확인(예)버튼 클릭시
			location.href="updateOrder.do?ono="+value+"&state=2";
		}
	}
	function updateorder3(value){	
		if(!confirm("주문번호:"+value+"을 배송 완료 처리 하시겠습니까?")){
			//취소(아니오)버튼 클릭시
		}else{
			//확인(예)버튼 클릭시
			location.href="updateOrder.do?ono="+value+"&state=3";
		}
	}
</script>	
	
	
<%-- 본문종료 --%>
<%@ include file="../footer.jsp" %>