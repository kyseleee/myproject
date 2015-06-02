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


$(function() {
	
    $('#login-form-link').click(function(e) {
		$("#login-form").delay(100).fadeIn(100);
 		$("#register-form").fadeOut(100);
		$('#register-form-link').removeClass('active');
		$(this).addClass('active');
		e.preventDefault();
	});
	$('#register-form-link').click(function(e) {
		$("#register-form").delay(100).fadeIn(100);
 		$("#login-form").fadeOut(100);
		$('#login-form-link').removeClass('active');
		$(this).addClass('active');
		e.preventDefault();
	});


});


$(document).ready(function(){
	
	
	 $("#id").blur(function(){
		
		var idv = $("input[name=id]").val();
		 
		if(idv == ""){
			var msg = "<font color='red'>필수입력입니다.</font>";
    		document.getElementById("idInfo").innerHTML= msg;
		}else{ 
		 
			$.ajax({
		        type:"POST",
		        url:"./getUserById.do",
		        data : {id : idv },
		        success: function(responseData){
		        	var data = JSON.parse(responseData);
		        	
		        	if(data.result == "true"){
		        		var msg = "<font color='blue'>사용 가능한 아이디 입니다.</font>";
		        	}
		        	else{
						var msg = "<font color='red'>이미 사용중인 아이디 입니다.</font>";
		        	}
	        		document.getElementById("idInfo").innerHTML= msg;

		        },

		        error: function(xhr, status, error) {
		            alert(error);
		        }  
		    });	 
		}
	  });
	 

	$("#confirm-password").keyup(function(){
		
		var pw = $("input[name=pw]").val();
		var cpw = $("input[name=confirm-password]").val();

			if(pw != cpw){
				var msg = "<font color='red'> 비밀번호가 일치하지 않습니다.</font>";
			}else{ 
				var msg = "<font color='blue'> 비밀번호가 일치합니다.</font>";						
			}
    		document.getElementById("pwInfo").innerHTML= msg;

	});
	
	
	$("#tel").focus(function(){
		document.getElementById("telInfo").innerHTML= "<font color='blue'> 숫자만 입력하세요. 예)01011111111</font>";
	});
	
	
	$("#tel").keyup(function(){
		
		var tel = $("input[name=tel]").val();
		
		if(tel.length == 3){
			tel = tel + "-";
    		document.getElementById("tel").value=tel; 
		}else if(tel.length == 8){
			tel = tel + "-";
    		document.getElementById("tel").value=tel; 
		}

	});
	
	 
});


