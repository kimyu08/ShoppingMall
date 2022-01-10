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
          <li><a href="/checkOrder.do">결제목록</a></li>
          <li><a href="/cart.do">장바구니</a></li>
          <li><a href="/review.do">리뷰</a></li>
          <li><a href="/deleteInfo.do">회원탈퇴</a></li>
 		 </ul>
    </div><!-- 메뉴 end -->
    <div class="card-header" style="text-align: center">내 정보 수정</div>
<div class="cotainer" style="text-align: center" >	
	<form name="memfrm" id="memfrm" method="post" action="changeInfo.do" onsubmit="return updateCheck()">
		<table class="table">
			<tr>
				<th>이름</th>
				<td style="text-align: left">
					<input type="text" name="mname" id="mname" size="15" maxlength="20" required value="${dto.mname}">
				</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td style="text-align: left">
					<input type="email" name="email" id="email" size="30" value="${dto.email}"> 
				</td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td style="text-align: left">
					<input type="text" name="phone" id="phone" size="15" value="${dto.phone}">
				</td>			
			<tr>
   			 <td colspan="2">
        		<input type="submit" value="정보수정"  class="btn btn-primary"/>
        		<input type="reset"  value="취소"     class="btn btn-primary"/>
    		</td>
			</tr>
		</table>
	</form>
</div>
<script>
	function updateCheck(){
		if(!confirm("정보를 수정하시겠습니까?")){
			return false;
		}else{
			if(updatememCheck()==2){
				return false;
			}
		}
	}
</script>

<%-- 본문종료 --%>
<%@ include file="../footer.jsp" %>