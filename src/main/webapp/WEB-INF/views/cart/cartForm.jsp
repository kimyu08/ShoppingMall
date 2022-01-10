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
	<h3>장바구니</h3>
	<br>

	<form name='frm' method="get" action="order.do">
		<table>
			<tr>
				<th><input type="checkbox" class="cart" name="checkAll" id="checkAll" >전체선택</th>
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
					<td><input type="checkbox" class="cart" name="cartno" id="cartno" value="${dto.cartno}"></td>
					<td><img src="./storage/${dto.photo}" width="150"></td>
					<td colspan="2"><a href="read.do?pname=${dto.pname}">${dto.pname}</a></td>

					<td>${dto.color}<br> ${dto.size}<br></td>
					<td>${dto.quantity}</td>
					<td>${dto.price}원</td>
					<td>2,500원</td>
					<td>${dto.totalprice+2500}원</td>
					<td> <button type="button" id="btn_${dto.cartno}" value="${dto.cartno}" onclick="checkdelete(this.value)"><img src="./storage/delete.png" width="20" ></button>
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
			<input type="submit" value="선택 상품 주문"> 
			<input type="submit" value="전체 상품 주문" onclick="selectOrder()">
		</div>

</form>
</div>

<script>
	function selectOrder(){
		 $(".cart").prop("checked", true);
	}
</script>
 <script>
        $(document).ready(function(){
            //전체 체크박스 클릭
            $("#checkAll").click(function() {
                if ($("#checkAll").prop("checked")) {
                    $(".cart").prop("checked", true);
                } else {
                    $(".cart").prop("checked", false);
                }
            });
            //전체 체크박스 선택중 체크박스 하나를 풀었을때 "전체" 체크해제
            $(".cart").click(function() {
                if ($("input[name='cartno']:checked").length == $("input[name='cartno']").length) {
                    $("#checkAll").prop("checked", true);
                } else {
                    $("#checkAll").prop("checked", false);
                }
            });
        });    
    </script>
<script>
	function checkdelete(value){	
		if(!confirm("해당 목록을 삭제하시겠습니까?"+value)){
			//취소(아니오)버튼 클릭시
		}else{
			//확인(예)버튼 클릭시
			location.href="deleteCart.do?cartno="+value;
		}
	}
</script>
<br>
<br>
<br>
<br>
<br>
<br>
<%-- 본문종료 --%>
<%@ include file="../footer.jsp"%>