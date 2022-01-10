<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>01_ajaxTest.jsp</title>
	<script src="../js/jquery-3.6.0.min.js"></script>
	<script src="../js/jquery.cookie.js"></script>
</head>
<body>
	<h3>* 회원등록폼 *</h3>
	<form name="form1" method="post" action="insert.do" onsubmit="return send()">
	<table border="1" width="400px">
	<tr>
		<th>아이디</th>
		<td>
			<input type="text" name="userid" id="userid" oninput="checkId()">
			<input type="button" value="아이디중복확인" id="btn_userid">    
			<br>
			<span id="panel"></span><!-- 아이디 중복 관련 메세지 -->
					</td>
	</tr>
	<tr>
		<th>비밀번호</th>
		<td><input type="password" name="passwd"></td>
	</tr>
	<tr>
		<th>이름</th>
		<td><input type="text" name="name"></td>
	</tr>
	<tr>
		<th>이메일</th>
		<td><input type="text" name="email"></td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<input type="submit" value="확인">
		</td>
	</tr>	
	
	</table>
	<input type="text" id="myInput" oninput="myFunction()">

	<p id="demo1"></p>
	<p id="demo2"></p>	
	</form>	
	<script>
function myFunction() {
  var y="userid=" + $("#userid").val().trim();
  var x = document.getElementById("myInput").value;
  document.getElementById("demo1").innerHTML = "You wrote: " + y;
  document.getElementById("demo2").innerHTML = "You wrote: " + x;
}
</script>
	<script>
	
	
		//1)id=brn_user 아이디 중복 확인 버튼을 클릭했을때
		function checkId(){
			//2)입력한 아이디를 변수에 대입하기
			var userid="userid=" + $("#userid").val().trim();

			//3) post 방식으로 서버에 요청해서 응답받기
			//$.post("요청명령어", 전달값, 콜백함수, 응답받는형식(기본은"text"))
			
			//3-1)text응답
			//$.post("idCheckProc4.do", userid, checkID, "text");
			
			//3-2)JSON응답
			$.post("idCheckProc4.do", userid, checkID, "json");
		}//click() end
		
		//4) callback함수 작성하기
		function checkID(result){
			//5)서버에서 응답받은 메세지(result)를 본문의 id=panel에 출력하기
			
			//5-1)텍스트 응답
			//alert(result); //0또는 1
			
			//5-2)JSON응답
			//alert(result.count);  //{"count":1} 또는 [object Object]
			var count=eval(result.count); //형변환
			if(count==0){
				$("#panel").css("color","blue");
				$("#panel").text("사용 가능한 아이디 입니다.");
				//$.cookie("쿠키변수명",값)
				$.cookie("checkID","PASS");	//아이디 중복 확인을 했따는 증거.
			}else{
				$("#panel").css("color","red");
				$("#panel").text("중복된 아이디 입니다.");
				$("#userid").focus();  //커서를 아이디 칸으로.
			}
		}//checkID end
		
		//7)아이디중복확인을 해야만 회우너가입폼이 서버로 전송
		function send(){
			//쿠키변수 가져오기
			var checkID=$.cookie("checkID");
			if(checkID=="PASS"){
				return true; //서버로 전송
			}else{
				$("#panel").css("color","red");
				$("#panel").text("아이디 중복 확인 해주세요.");
				$("#userid").focus();
				return false;
			}//if end
			
		}//send() end
		
	</script>
	
</body>
</html>