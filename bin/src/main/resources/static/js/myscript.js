function memberCheck(){ //회원가입 유효성 검사
  //1)아이디 5~10글자 인지?
	var id=document.getElementById("id").value;//내용 가져오기
	id=id.trim(); //좌우 공백 제거

	if(!(id.length>=5 && id.length<=10)){
		alert("아이디를 5~10자리 입력해주세요");
		document.getElementById("id").focus();//내용 칸에 커서
		return false;//전송하지 않음
	}//if end
  //2)비밀번호 5~10글자 인지?
  var pw=document.getElementById("pw").value;//내용 가져오기
	pw=pw.trim(); //좌우 공백 제거
	if(!(pw.length>=5 && pw.length<=10)){
		alert("비밀번호를 5~10자리 입력해주세요");
		document.getElementById("pw").focus();//내용 칸에 커서
		return false;//전송하지 않음
	}//if end
  //3)비밀번호와 비밀번호확인이 서로 일치하는지?
	var repw=document.getElementById("repw").value;//내용 가져오기
	repw=repw.trim(); //좌우 공백 제거
	if(pw!=repw){
		alert("비밀번호 2개를 똑같이 입력해 주세요.");
		document.getElementById("pw").focus();//내용 칸에 커서
		return false;//전송하지 않음
	}//if end

  //4)이름 두글자 이상 인지?
  var mname=document.getElementById("mname").value;//작성자 가져오기
	mname=mname.trim(); //좌우 공백 제거
	if(mname.length<2){
		alert("이름을 2글자 이상 입력해주세요");
		document.getElementById("mname").focus();//작성자 칸에 커서
		return false;//전송하지 않음
	}//if end
	
  //5)이메일 5글자 인지?
	var email=document.getElementById("email").value;//내용 가져오기
	email=email.trim(); //좌우 공백 제거
	if(email.length<5){
		alert("email을 5글자 이상 입력해주세요");
		document.getElementById("email").focus();//내용 칸에 커서
		return false;//전송하지 않음
	}//if end
	
	//6)전화번호 적었는지?
	var phone=document.getElementById("phone").value;//내용 가져오기
	phone=phone.trim(); //좌우 공백 제거
	if(phone.length<2){
		alert("전화번호를 입력해주세요");
		document.getElementById("phone").focus();//내용 칸에 커서
		return false;//전송하지 않음
	}//if end
	
	//7)우편번호 적었는지?
	var zipcode=document.getElementById("zipcode").value;//내용 가져오기
	zipcode=zipcode.trim(); //좌우 공백 제거
	if(zipcode.length<2){
		alert("우편번호를 입력해주세요");
		document.getElementById("zipcode").focus();//내용 칸에 커서
		return false;//전송하지 않음
	}//if end
	
	//8)상세주소 적었는지?
	var address2=document.getElementById("address2").value;//내용 가져오기
	address2=address2.trim(); //좌우 공백 제거
	if(address2.length<2){
		alert("상세주소를 입력해주세요");
		document.getElementById("address2").focus();//내용 칸에 커서
		return false;//전송하지 않음
	}//if end
	
	return true;//서버로 전송
}//memberCheck end


function updatememCheck(){
 //이름 두글자 이상 인지?
  var mname=document.getElementById("mname").value;//작성자 가져오기
	mname=mname.trim(); //좌우 공백 제거
	if(mname.length<2){
		alert("이름을 2글자 이상 입력해주세요");
		document.getElementById("mname").focus();//작성자 칸에 커서
		return 2;//전송하지 않음
	}//if end
	
  //이메일 5글자 인지?
	var email=document.getElementById("email").value;//내용 가져오기
	email=email.trim(); //좌우 공백 제거
	if(email.length<5){
		alert("email을 5글자 이상 입력해주세요");
		document.getElementById("email").focus();//내용 칸에 커서
		return 2;//전송하지 않음
	}//if end
	
	//전화번호 적었는지?
	var phone=document.getElementById("phone").value;//내용 가져오기
	phone=phone.trim(); //좌우 공백 제거
	if(phone.length<2){
		alert("전화번호를 입력해주세요");
		document.getElementById("phone").focus();//내용 칸에 커서
		return 2;//전송하지 않음
	}//if end
}//updatememCheck end


function locationCheck(){
	//우편번호 적었는지?
	var zipcode=document.getElementById("zipcode").value;//내용 가져오기
	zipcode=zipcode.trim(); //좌우 공백 제거
	if(zipcode.length<2){
		alert("우편번호를 입력해주세요");
		document.getElementById("zipcode").focus();//내용 칸에 커서
		return false;//전송하지 않음
	}//if end
	
	//상세주소 적었는지?
	var address2=document.getElementById("address2").value;//내용 가져오기
	address2=address2.trim(); //좌우 공백 제거
	if(address2.length<2){
		alert("상세주소를 입력해주세요");
		document.getElementById("address2").focus();//내용 칸에 커서
		return false;//전송하지 않음
	}//if end
	
	return true;
}//locationCheck() end




function checkidphone(){	
	var mname=document.getElementById("mname").value;//작성자 가져오기
	mname=mname.trim(); //좌우 공백 제거
	if(mname.length<2){
		alert("이름을 2글자 이상 입력해주세요");
		document.getElementById("mname").focus();//작성자 칸에 커서
		return false;//전송하지 않음
	}//if end

	var phone=document.getElementById("phone").value;//내용 가져오기
	phone=phone.trim(); //좌우 공백 제거
	if(phone.length<2){
		alert("전화번호를 입력해주세요");
		document.getElementById("phone").focus();//내용 칸에 커서
		return false;//전송하지 않음
	}//if end
}

function checkPW(){	
	var mname=document.getElementById("mname").value;//작성자 가져오기
	mname=mname.trim(); //좌우 공백 제거
	if(mname.length<2){
		alert("이름을 2글자 이상 입력해주세요");
		document.getElementById("mname").focus();//작성자 칸에 커서
		return false;//전송하지 않음
	}//if end

	var phone=document.getElementById("phone").value;//내용 가져오기
	phone=phone.trim(); //좌우 공백 제거
	if(phone.length<2){
		alert("전화번호를 입력해주세요");
		document.getElementById("phone").focus();//내용 칸에 커서
		return false;//전송하지 않음
	}//if end
	
	var id=document.getElementById("id").value;//내용 가져오기
	id=id.trim(); //좌우 공백 제거
	if(!(id.length>=4 && id.length<=10)){
		alert("아이디를 4~10자리 입력해주세요");
		document.getElementById("id").focus();//내용 칸에 커서
		return false;//전송하지 않음
	}//if end
}