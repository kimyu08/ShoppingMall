<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<%
	Cookie[] cookies=request.getCookies();
	String c_id="";
	if(cookies!=null){//쿠키가 존재하는지?
		for(int i=0;i<cookies.length;i++){
			Cookie cookie=cookies[i];	//쿠키하나씩 가져오기
			if(cookie.getName().equals("c_id")==true){
				c_id=cookie.getValue();	
		}
	}	
}//if end
%>
<%-- 본문시작 template.jsp --%>
<br><br><br>
	<form name="memfrm" id="memfrm" method="post" action="loginProc.do" onsubmit="return loginCheck()">
	<table class="table" style="text-align:center;">											<!-- myscript.js 함수 코딩 -->
	<tr>
	    <td>
	    <h1>aaa1/12345</h1>
			<input type="text" name="id" id="id" placeholder="아이디" value="<%=c_id%>" maxlength="10" value="${c_id}"required>
	    </td>
	</tr>
	<tr>
	   <td>
	      <input type="password" name="pw" id="pw" placeholder="비밀번호" maxlength="10" required>
	   </td>
	</tr>
	<tr>
		<td>
			<input type="submit" value="로그인"  class="w-btn-outline w-btn-skin-outline"/>
	    </td>
	</tr>
	<tr>
	   <td>
		  <label><input type="checkbox" name="c_id" value="SAVE" <%if(!c_id.isEmpty()){out.print("checked");} %> >아이디 저장</label>
		  &nbsp;&nbsp;&nbsp;
		  <a href="/join.do">회원가입</a>
		  &nbsp;&nbsp;&nbsp;
		  <a href="findID.do">아이디/비번찾기</a>
	   </td>
	</tr>		  
	</table>
</form>
<br><br><br><br><br><br><br><br><br>
<%-- 본문종료 --%>
<%@ include file="../footer.jsp" %>