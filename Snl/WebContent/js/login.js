function loginchk(){
		var idLogInChk=document.getElementById("userId").value;
		var pwLogInChk=document.getElementById("userPw").value;
		var msg="1" ;
		
		$.ajax({
			global : true,
			type : "POST",
			url : "./loginchk.do",
			async : false,
			data : { id : idLogInChk, pw : pwLogInChk },
			success : function(data) {
						if (data == "no") {
							msg="<font color='red'>등록되지 않은 아이디이거나,</br>아이디 또는 비밀번호를 잘못 입력하셨습니다.</br></font>";
							document.getElementById("logInChk").innerHTML=msg;
						} else {}
					  },
	
			error : function(xhr, status, error) {
						alert(error);
					}
		});
		
		if (msg == "1"){
			document.getElementById("login-form").submit();
		} else {
			
		}		
}





