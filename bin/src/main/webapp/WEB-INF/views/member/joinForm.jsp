<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<script src="../js/jquery-3.6.0.min.js"></script>
<script src="../js/jquery.cookie.js"></script>
<script src="js/myscript.js"></script>


<div class="card-header" style="text-align: center">LOGO 회원가입</div>
<div class="cotainer" style="text-align: center" >	
	<form name="memfrm" id="memfrm" method="post" action="joinForm.do" onsubmit="return memberCheck()">
		<table class="table">
			<tr>
				<th >아이디</th>
				<td style="text-align: left">
					<input type="text" name="id" id="id" size="15" oninput="checkId()"> 
					<span id="panel"></span><!-- 아이디 중복 관련 메세지 -->
				</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td style="text-align: left">
					<input type="password" name="pw" id="pw" size="15" required>
				</td>
			</tr>
			<tr>
				<th>비밀번호 확인</th>
				<td style="text-align: left">
					<input type="password" name="repw" id="repw" size="15" required>
				</td>
			</tr>
			<tr>
				<th>이름</th>
				<td style="text-align: left">
					<input type="text" name="mname" id="mname" size="15" maxlength="20" required>
				</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td style="text-align: left">
					<input type="email" name="email" id="email" size="30"> 
				</td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td style="text-align: left">
					<input type="text" name="phone" id="phone" size="15">
				</td>
			</tr>
			<tr>
				<th>우편번호</th>
				<td style="text-align: left"><input type="text" name="zipcode" id="zipcode" size="7" readonly> 
					<input type="button" value="주소찾기" onclick="DaumPostcode()">
				</td>
			</tr>
			<tr>
				<th>주소</th>
				<td style="text-align: left">
					<input type="text" name="address1" id="address1" size="45" readonly>
				</td>
			</tr>
			<tr>
				<th>상세주소</th>
					<td style="text-align: left">
					<input type="text" name="address2" id="address2" size="45">
				</td>
			</tr>
			
			<tr>
   			 <td colspan="2">
        		<input type="submit" value="회원가입"  class="btn btn-primary"/>
        		<input type="reset"  value="취소"     class="btn btn-primary"/>
    		</td>
			</tr>
		</table>
<script>
	
	
		//1)id=brn_user 아이디 중복 확인 버튼을 클릭했을때
		function checkId(){
			//2)입력한 아이디를 변수에 대입하기
			var id="id=" + $("#id").val().trim();

			//3) post 방식으로 서버에 요청해서 응답받기
			//$.post("요청명령어", 전달값, 콜백함수, 응답받는형식(기본은"text"))
			
			//3-1)text응답
			//$.post("idCheckProc4.do", userid, checkID, "text");
			
			//3-2)JSON응답
			$.post("idCheckProc.do", id, checkID, "json");
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
		</script>
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
</body>
</html>
<%-- 본문종료 --%>
<%@ include file="../footer.jsp"%>