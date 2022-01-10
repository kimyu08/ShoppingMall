<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<script src="../js/jquery-3.6.0.min.js"></script>
<script src="../js/jquery.cookie.js"></script>
<script src="js/myscript.js"></script>


<div class="card-header" style="text-align: center">아이디 찾기</div>
<div class="cotainer">	
	<form name="memfrm" id="memfrm" action="findID2.do" onsubmit="return checkidphone()" >
		<table class="table" style="text-align:center;">
			<tr>
				
				<td>
					이름&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="mname" id="mname" size="15" maxlength="20"  required>
				</td>
			</tr>
			<tr>
				
				<td >
					전화번호&nbsp;&nbsp;<input type="text" name="phone" id="phone" size="15" maxlength="20"  required>
				</td>
			</tr>
			
			<tr>
   			 <td>
        		<input type="submit" value="확인"  class="btn btn-primary" />
        		<input type="button"  value="취소"     class="btn btn-primary" onclick="location.href='/login.do' "/>
    		</td>
			</tr>
			<tr >
				<td><input type="button" value="비밀번호 찾기"  class="btn btn-primary" onclick="location.href='/findPW.do' "/></td>
			</tr>	
		</table>
	</form>
</div>



<%-- 본문종료 --%>
<%@ include file="../footer.jsp"%>