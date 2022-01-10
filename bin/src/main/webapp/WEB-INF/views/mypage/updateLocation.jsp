<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<script src="../js/jquery-3.6.0.min.js"></script>
<script src="../js/jquery.cookie.js"></script>
<script src="js/myscript.js"></script>
<%-- 본문시작 template.jsp --%>
	<!-- 메인 메뉴 시작 -->
    <div align="center">
    	<ul class="mainmenu" >
          <li><a href="/mypage.do">정보수정</a></li>
          <li><a href="/location.do">배송지설정</a></li>
          <li><a href="/checkorder.do">결제목록</a></li>
          <li><a href="/cart.do">장바구니</a></li>
          <li><a href="deleteInfo.do">회원탈퇴</a></li>
 		 </ul>
    </div><!-- 메뉴 end -->
    <div class="card-header" style="text-align: center">배송지 설정</div>
<div class="cotainer" style="text-align: center" >	
	<form name="memfrm" id="memfrm" method="post" action="updateLoc.do" onsubmit="return updateCheck()">
		<table class="table">
			<tr>
				<th>우편번호</th>
				<td style="text-align: left"><input type="text" name="zipcode" id="zipcode" size="7" readonly value="${dto.zipcode}"> 
					<input type="button" value="주소찾기" onclick="DaumPostcode()">
				</td>
			</tr>
			<tr>
				<th>주소</th>
				<td style="text-align: left">
					<input type="text" name="address1" id="address1" size="45" readonly value="${dto.address1}">
				</td>
			</tr>
			<tr>
				<th>상세주소</th>
					<td style="text-align: left">
					<input type="text" name="address2" id="address2" size="45" value="${dto.address2}">
				</td>
			</tr>
			<tr>
   			 <td colspan="2">
        		<input type="submit" value="배송지수정"  class="btn btn-primary"/>
        		<input type="reset"  value="취소"     class="btn btn-primary"/>
    		</td>
			</tr>
		</table>
	</form>
</div>
<!-- ----- DAUM 우편번호 API 시작 ----- -->
<!-- http://postcode.map.daum.net/guide -->
<div id="wrap"
	style="display: none; border: 1px solid; width: 500px; height: 300px; margin: 5px 110px; position: relative">
	<img
		src="//i1.daumcdn.net/localimg/localimages/07/postcode/320/close.png"
		id="btnFoldWrap"
		style="cursor: pointer; position: absolute; right: 0px; top: -1px; z-index: 1"
		onclick="foldDaumPostcode()" alt="접기 버튼">
</div>
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
<!-- ----- DAUM 우편번호 API 종료----- -->
<script>
	function updateCheck(){
		if(!confirm("배송지를 수정하시겠습니까?")){
			return false;
		}else{
			locationCheck();
		}
	}
</script>

<%-- 본문종료 --%>
<%@ include file="../footer.jsp" %>