<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %> 
<%-- 본문시작 template.jsp --%>
<!------ Include the above in your HEAD tag ---------->

<!doctype html>
<html lang="en">
<head>
<script>
<!-- 아이디 중복 체크-->
	function checkId() {
		//$.post("요청명령어", 전달값, callback함수);
		$.post("idCheck.do", "id=" + $("#id").val(), responseProc);
	});//click end

	function responseProc(result) {
		//result 서버가 응답해준 메세지를 받는 변수
		$("#panel").empty();
		$("#panel").html(result);
		$("#panel").show();
	}//responseProc() end
</script>

    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Fonts -->
    <link rel="dns-prefetch" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css?family=Raleway:300,400,600" rel="stylesheet" type="text/css">



    <link rel="icon" href="Favicon.png">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">


<main class="my-form">
    <div class="cotainer">
        <div class="row justify-content-center">
            <div class="col-md-8">
                    <div class="card">
                        <div class="card-header">LOGO 회원가입</div>
                        <div class="card-body">
                            <form name="my-form" onsubmit="return validform()" action="success.php" method="">
                            
                            	<div class="form-group row">
                                    <label for="user_name" class="col-md-4 col-form-label text-md-right">아이디</label>
                                    <div class="col-md-6">
                                        <input type="text" id="id" class="form-control" name="id" oninput="checkId()">
                                        <p id="panel" style="display:none"></p>
                                    </div>
                                </div>
                                
                                
                                
                                <div class="form-group row">
                                    <label for="user_name" class="col-md-4 col-form-label text-md-right">비밀번호</label>
                                    <div class="col-md-6">
                                        <input type="password" id="pw" class="form-control" name="pw">
                                        <div id="panel" style="display:none"></div>
                                    </div>
                                </div>
                                
                                <div class="form-group row">
                                    <label for="user_name" class="col-md-4 col-form-label text-md-right">비밀번호 확인</label>
                                    <div class="col-md-6">
                                        <input type="password" id="pwcheck" class="form-control" name="pwcheck">
                                    </div>
                                </div>
                            
                                <div class="form-group row">
                                    <label for="full_name" class="col-md-4 col-form-label text-md-right">이름</label>
                                    <div class="col-md-6">
                                        <input type="text" id="full_name" class="form-control" name="mname">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="email_address" class="col-md-4 col-form-label text-md-right">E-Mail</label>
                                    <div class="col-md-6">
                                        <input type="text" id="email_address" class="form-control" name="email" size="7">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="phone_number" class="col-md-4 col-form-label text-md-right">Phone Number</label>
                                    <div class="col-md-6">
                                        <input type="text" id="phone_number" class="form-control" name="phone">
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="present_address" class="col-md-4 col-form-label text-md-right">우편번호</label>
                                    <div class="col-md-6">
                                        <input type="text" id="zipcode" size="7" readonly>
                                        <input type="button" value="주소찾기" onclick="DaumPostcode()" >
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="permanent_address" class="col-md-4 col-form-label text-md-right">주소</label>
                                    <div class="col-md-6">
                                        <input type="text" id="address1" class="form-control" name="address1" readonly>
                                    </div>
                                </div>

                               <div class="form-group row">
                                    <label for="permanent_address" class="col-md-4 col-form-label text-md-right">상세 주소</label>
                                    <div class="col-md-6">
                                        <input type="text" id="address2" class="form-control" name="address2">
                                    </div>
                                </div>

                                    <div class="col-md-6 offset-md-4">
                                        <button type="submit" class="btn btn-primary">
                                        Register
                                        </button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
            </div>
        </div>
    </div>

</main>



<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<!-- ----- DAUM 우편번호 API 시작 ----- -->
<!-- http://postcode.map.daum.net/guide -->
<div id="wrap" style="display:none;border:1px solid;width:500px;height:300px;margin:5px 110px;position:relative">
  <img src="//i1.daumcdn.net/localimg/localimages/07/postcode/320/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">
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
<%@ include file="../footer.jsp" %>