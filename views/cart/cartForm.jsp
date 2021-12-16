<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../header.jsp"%>
<%-- 본문시작 template.jsp --%>
<br>
<br>
<br>
<div class="cart" align="center">
	<h3>장바구니</h3>
	<br>

	<form name='frm' method="get" action="order.do">
		<table>
			<tr>
				<th>선택</th>
				<th>이미지</th>
				<th colspan="2">상품 이름</th>
				<th>색상,사이즈</th>
				<th>수량</th>
				<th>가격</th>
				<th>배송비</th>
				<th>합계</th>
				<th>선택</th>
			</tr>
			<c:set var="totalprice" value="0" />
			<c:forEach var="dto" items="${dto}">
				<c:set var="totalprice" value="${totalprice + dto.totalprice}"></c:set>
				<tr>
					<td><input type="checkbox" value="${dto.cartno}"></td>
					<td><img src="./storage/${dto.photo}" width="150"></td>
					<td colspan="2"><a href="read.do?pname=${dto.pname}">${dto.pname}</a></td>

					<td>${dto.color}<br> ${dto.size}<br></td>
					<td>${dto.quantity}</td>
					<td>${dto.price}원</td>
					<td>2,500원</td>
					<td>${dto.totalprice+2500}원</td>
					<td><input type="button" value="수정"
						onclick="location.href='update.do?"> <input type="button"
						value="결제 취소"
						onclick="location.href='delete.do?cartno=${dto.cartno}'">
					</td>
				</tr>
			</c:forEach>
		</table>
		<br>
		<br>
		<br>
		<table>
			<tr>
				<th>총상품 금액</th>
				<th>배송비</th>
				<th>결제 예정 금액</th>
			</tr>
			<tr>
				<td>${totalprice}원</td>
				<td>2,500원</td>
				<td>${totalprice+2500}원</td>
			</tr>
		</table>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<div class="orderbutton" align="center">
			<input type="button" value="선택 상품 주문"> 
			<input type="submit" value="전체 상품 주문">
		</div>

</form>
</div>
<br>
<br>
<br>
<br>
<br>
<br>
<%-- 본문종료 --%>
<%@ include file="../footer.jsp"%>