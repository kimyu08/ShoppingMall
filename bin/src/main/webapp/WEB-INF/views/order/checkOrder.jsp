<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<%-- 본문시작 template.jsp --%>
	<br><br><br>
<div class="order" align="center">
<h3>주문조회</h3><br>
	<table>
		<c:set var="totalprice" value="0"/>
		<c:forEach var="dto" items="${dto}">
			<c:set var="totalprice" value="${totalprice + dto.totalprice}"></c:set>
			<tr>
				<td rowspan="4"><img src="./storage/${dto.photo}" width="150"></td>
				<td>${dto.ono}</td>
				<td>${dto.dates}</td>
				<c:choose>
					<c:when test="${dto.state eq 1}">
					<td rowspan="4">상품준비중</td>
					<td rowspan="4"><input type="button" value="결제취소"
					onclick="deleteorder(${dto.ono})"></td>
					</c:when>
					<c:when test="${dto.state eq 2}">
					<td rowspan="4">배송중</td>
					</c:when>
					<c:when test="${dto.state eq 3}">
					<td rowspan="4">배송완료</td>
					<td rowspan="4"><input type="button" value="리뷰쓰기"
					onclick="location.href='reviewWrite.do?'"></td>
					</c:when>
					<c:when test="${dto.state eq 4}">
					<td rowspan="4">결제취소</td>
					</c:when>
				</c:choose>	 
			</tr>
			<tr>
				<td><a href="read.do?pname=${dto.pname}">${dto.pname}</a></td>
				<td>${dto.totalprice+2500}원</td>
			</tr>
			<tr>				
				<td>${dto.color}<br> ${dto.size}<br></td>
				<td>${dto.quantity}개</td>
			</tr>
			<tr>								 
				<td colspan="2">${dto.zipcode} ${dto.address1} ${dto.address2}</td>
			</tr>
		</c:forEach>
	</table>
</div>
<script>
	function deleteorder(value){	
		if(!confirm("결제를 취소하시겠습니까?"+value)){
			//취소(아니오)버튼 클릭시
		}else{
			//확인(예)버튼 클릭시
			location.href="deleteOrder.do?ono="+value;
		}
	}
</script>
<br><br><br><br><br><br>
<%-- 본문종료 --%>
<%@ include file="../footer.jsp" %>