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
	<h3>주문/결제</h3>
	<br>
	<table>
		<tr>
			<th>이미지</th>
			<th colspan="2">상품 이름</th>
			<th>색상,사이즈</th>
			<th>수량</th>
			<th>가격</th>
			<th>배송비</th>
			<th>합계</th>
		</tr>
		<c:set var="totalprice" value="0" />
		<c:set var="opcode" value="" />
		<c:forEach var="cartdto" items="${cartdto}">
			<c:set var="totalprice" value="${totalprice + cartdto.totalprice}"></c:set>
			<tr>
				<td><img src="./storage/${cartdto.photo}" width="150"></td>
				<td colspan="2"><a href="read.do?pname=${cartdto.pname}">${cartdto.pname}</a></td>

				<td>${cartdto.color}<br> ${cartdto.size}<br></td>
				<td>${cartdto.quantity}</td>
				<td>${cartdto.price}원</td>
				<td>2,500원</td>
				<td>${cartdto.totalprice+2500}원</td>
			</tr>
		</c:forEach>
	</table>
	<form name='orderForm' method="post" action="order.do">
		<c:forEach var="cartdto" items="${cartdto}">
			<input type="text" name="opcode" value="${cartdto.opcode}">
			<input type="text" name="quantity" value="${cartdto.quantity}">
			<input type="text" name="totalprice" value="${cartdto.totalprice}">
		</c:forEach>
		<h3>배송지 정보</h3>
		배송지 선택 <input type="radio" name="chk_info" value="nor" checked
			onclick="setForm(this.value);">기본배송지 <input type="radio"
			name="chk_info" value="new" onclick="setForm(this.value);">신규배송지
		<div id="divNor">
			<table class="table">
				<tr>
					<th>주문자</th>
					<td style="text-align: left"><input type="text" name="mname"
						id="mname" size="15" value="${memdto.mname}" readonly></td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td style="text-align: left"><input type="text" name="phone"
						id="phone" size="15" value="${memdto.phone}" readonly>
					</td>
				</tr>
				<tr>
					<th>우편번호</th>
					<td style="text-align: left"><input type="text" name="zipcode"
						id="zipcode" size="7" value="${memdto.zipcode}" readonly>
					</td>
				</tr>
				<tr>
					<th>주소</th>
					<td style="text-align: left"><input type="text"
						name="address1" id="address1" size="45" value="${memdto.address1}"
						readonly>
					</td>
				</tr>
				<tr>
					<th>상세주소</th>
					<td style="text-align: left"><input type="text"
						name="address2" id="address2" size="45" value="${memdto.address2}"
						readonly>
					</td>
				</tr>

			</table>
		</div>
		<div id="divNew" style="display: none">
			<table class="table">
				<tr>
					<th>주문자</th>
					<td style="text-align: left"><input type="text" name="mname"
						id="mname" size="15">
					</td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td style="text-align: left"><input type="text" name="phone"
						id="phone" size="15" >
					</td>
				</tr>
				<tr>
					<th>우편번호</th>
					<td style="text-align: left"><input type="text" name="zipcode"
						id="zipcode" size="7" readonly>
						<input type="button" value="주소찾기" onclick="DaumPostcode()">
					</td>
				</tr>
				<tr>
					<th>주소</th>
					<td style="text-align: left"><input type="text"
						name="address1" id="address1" size="45" readonly>
					</td>
				</tr>
				<tr>
					<th>상세주소</th>
					<td style="text-align: left"><input type="text"
						name="address2" id="address2" size="45">
					</td>
				</tr>

			</table>
		</div>

	
	<br> <br> <br>
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
	<br> <br> <br> <br> <br> <br>
	<div class="orderbutton" align="center">
		<input type="submit" value="결제하기">
	</div>
	</form>
</div>
<script>
	function setForm(value) {
		if (value == "nor") {
			document.getElementById("divNor").style.display = "";
			document.getElementById("divNew").style.display = "none";
		} else {
			document.getElementById("divNor").style.display = "none";
			document.getElementById("divNew").style.display = "";
		}

	}
</script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    // 우편번호 찾기 화면을 넣을 element
    var element_wrap = document.getElementById('wrap');

    function foldDaumPostcode() {
        // iframe을 넣은 element를 안보이게 한다.
        element_wrap.style.display = 'none';
    }

    function DaumPostcode() {
        // 현재 scroll 위치를 저장해놓는다.
        var currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
        new daum.Postcode({
            oncomplete: function(data) {
                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = data.address; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 기본 주소가 도로명 타입일때 조합한다.
                if(data.addressType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('zipcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('address1').value = fullAddr;

                // iframe을 넣은 element를 안보이게 한다.
                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                element_wrap.style.display = 'none';

                // 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
                document.body.scrollTop = currentScroll;
                
                $('#address2').focus();
            },
            // 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
            onresize : function(size) {
                element_wrap.style.height = size.height+'px';
            },
            width : '100%',
            height : '100%'
        }).embed(element_wrap);

        // iframe을 넣은 element를 보이게 한다.
        element_wrap.style.display = 'block';
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