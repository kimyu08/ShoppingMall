<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<script src="../js/jquery-3.6.0.min.js"></script>
<script src="../js/jquery.cookie.js"></script>
<script src="js/myscript.js"></script>


<div class="card-header" style="text-align: center">비밀번호 찾기</div>
<div class="cotainer" >	
	<form name="memfrm" id="memfrm" method="post" action="findPW2.do" onsubmit="return checkPW()">
		<table class="table" style="text-align:center;">
			<tr>
			
				<td>
					아이디&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="id" id="id" size="15" maxlength="20">
				</td>
			</tr>
			<tr>
				
				<td>
					이름&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="mname" id="mname" size="15" maxlength="10" required>
				</td>
			</tr>
			<tr>
				
				<td >
					전화번호&nbsp;<input type="text" name="phone" id="phone" size="15">
				</td>
			</tr>	
			<tr>
   				<td colspan="2">
        			<input type="button"  value="아이디 찾기"     class="btn btn-primary" onclick="location.href='findID.do'"/>
        			<input type="submit"  value="확인"     class="btn btn-primary" />
        			<input type="button"  value="취소"     class="btn btn-primary" onclick="location.href='login.do'"/>
    			</td>
			</tr>
		</table>

	</form>
</div>