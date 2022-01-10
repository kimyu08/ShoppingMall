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
    <div class="card-header" style="text-align: center">회원 탈퇴</div>
<div class="cotainer" style="text-align: center" >	
	<form name="memfrm" id="memfrm" method="post" action="deleteInfo.do" onsubmit="return updateCheck()">
		<table class="table">
			<tr>
				<th>비밀번호</th>
				<td style="text-align: left">
					<input type="password" name="pw" id="pw" placeholder="비밀번호" maxlength="10" required>
				</td>
			</tr>
			<tr>
   			 <td colspan="2">
        		<input type="submit" value="회원탈퇴"  class="btn btn-primary"/>
        		<input type="reset"  value="취소"     class="btn btn-primary"/>
    		</td>
			</tr>
		</table>
	</form>
</div>
<script>
	function updateCheck(){
		if(!confirm("정말 탈퇴하시겠습니까?")){
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