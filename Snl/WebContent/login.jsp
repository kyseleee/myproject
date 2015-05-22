<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<%
	String sgroupNo = request.getParameter("sgroupNo");
	if(sgroupNo==null){
		sgroupNo = "";
	}	

%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
	<script src="js/login.js"></script>
	
	<script type="text/javascript">
	
	
	$("#findPwBtnPre").click(function() {
    	
		$("#resultBodyPw").hide();    	
    	$("#inputBodyPw").show();
		
		$("#findPwBtnPreDiv").hide();    	
    	$("#findPwBtnDiv").show();
		document.getElementById("msgPw").innerHTML= "";


    });
	
	$("#IdINfindPwBtn").click(function() {
    	
		$("#findId").hide();    	
    	$("#findPw").show();

    });

	
	$("#findPwBtn").click(function() {
    	var id = $("input[id=inputUserId]").val();
    	var email = $("input[id=inputUserEmail]").val();

    	$.ajax({
	        type:"POST",
	        url:"./getUserByIdEmail.do",
	        data : {id : id, email : email},
	        success: function(data){
	        		document.getElementById("msgPw").innerHTML= data;
	        },
	        error: function(xhr, status, error) {
	            alert(error);
	        }  
	    });	
    	
    	$("#resultBodyPw").show();
		$("#findPwBtnPreDiv").show();

		$("#inputBodyPw").hide();    	
        $("#findPwBtnDiv").hide();
	});
	
	$("#getUserBtn").click(function() {
	    	var email = $("input[name=userEmail]").val();
	    	
	    	$.ajax({
		        type:"POST",
		        url:"./getUserByEmail.do",
		        data : {userEmail : email},
		        success: function(data){
		        		document.getElementById("msg").innerHTML= data;
		        },
		        error: function(xhr, status, error) {
		            alert(error);
		        }  
		    });	
	    	
	    	$("#resultBody").show();
			$("#resultBtn").show();

			$("#inputBody").hide();    	
	        $("#inputBtn").hide();
    });

	function loginChk(){
		var idLogInChk = document.getElementById("userId").value;
		var pwLogInChk = document.getElementById("userPw").value;
		var msg="1";
		
		$.ajax({
	        type:"POST",
	        url:"./loginchk.do",
	        data : {id : idLogInChk, pw : pwLogInChk},
	        async : false,
	        success: function(data){
	        	if(data == "no"){
	        		msg = "<font color='red'>등록되지 않은 아이디이거나,</br>아이디 또는 비밀번호를 잘못 입력하셨습니다.</font>";
	        		document.getElementById("logInChk").innerHTML= msg;
	        	}
	        	else{}
	        },

	        error: function(xhr, status, error) {
	            alert(error);
	        }  
	    });	
		
		  if (msg=="1") {
			  return true;
		  }
		  else {
			  return false;
		  }	
	}
	
	$("#findIdBtn").click(function() {
		
		$("#inputBtn").show();
		$("#inputBody").show();    
		
		$("#resultBody").hide();
		$("#resultBtn").hide();  
		
		document.getElementById("msg").innerHTML= "";

		
    });
	
	$("#findId").on('hidden.bs.modal', function (){
		
        $("#inputBtn").show();
		$("#inputBody").show();    
		
		$("#resultBody").hide();
		$("#resultBtn").hide();
		
        $("#userEmail").val("");
        $("#msg").val("");
		
	})
	
	$("#findPw").on('hidden.bs.modal', function (){
		
		$("#inputBodyPw").show();
		$("#findPwBtnDiv").show();    
		
		$("#resultBodyPw").hide();
		$("#findPwBtnPreDiv").hide();
		
        $("#inputUserId").val("");
        $("#inputUserPw").val("");
		
	})
	
   

	
	
	</script> 
	
	<style type="text/css">
		
		.panel-login {
			border-color: #ccc;
			-webkit-box-shadow: 0px 2px 3px 0px rgba(0,0,0,0.2);
			-moz-box-shadow: 0px 2px 3px 0px rgba(0,0,0,0.2);
			box-shadow: 0px 2px 3px 0px rgba(0,0,0,0.2);
		}
		.panel-login>.panel-heading {
			color: #00415d;
			background-color: #fff;
			border-color: #fff;
			text-align:center;
		}
		.panel-login>.panel-heading a{
			text-decoration: none;
			color: #666;
			font-weight: bold;
			font-size: 15px;
			-webkit-transition: all 0.1s linear;
			-moz-transition: all 0.1s linear;
			transition: all 0.1s linear;
		}
		.panel-login>.panel-heading a.active{
			color: #029f5b;
			font-size: 18px;
		}
		.panel-login>.panel-heading hr{
			margin-top: 10px;
			margin-bottom: 0px;
			clear: both;
			border: 0;
			height: 1px;
			background-image: -webkit-linear-gradient(left,rgba(0, 0, 0, 0),rgba(0, 0, 0, 0.15),rgba(0, 0, 0, 0));
			background-image: -moz-linear-gradient(left,rgba(0,0,0,0),rgba(0,0,0,0.15),rgba(0,0,0,0));
			background-image: -ms-linear-gradient(left,rgba(0,0,0,0),rgba(0,0,0,0.15),rgba(0,0,0,0));
			background-image: -o-linear-gradient(left,rgba(0,0,0,0),rgba(0,0,0,0.15),rgba(0,0,0,0));
		}
		.panel-login input[type="text"],.panel-login input[type="email"],.panel-login input[type="password"] {
			height: 45px;
			border: 1px solid #ddd;
			font-size: 16px;
			-webkit-transition: all 0.1s linear;
			-moz-transition: all 0.1s linear;
			transition: all 0.1s linear;
		}
		.panel-login input:hover,
		.panel-login input:focus {
			outline:none;
			-webkit-box-shadow: none;
			-moz-box-shadow: none;
			box-shadow: none;
			border-color: #ccc;
		}
		.btn-login {
			background-color: #59B2E0;
			outline: none;
			color: #fff;
			font-size: 14px;
			height: auto;
			font-weight: normal;
			padding: 14px 0;
			text-transform: uppercase;
			border-color: #59B2E6;
		}
		.btn-login:hover,
		.btn-login:focus {
			color: #fff;
			background-color: #53A3CD;
			border-color: #53A3CD;
		}
		.forgot-password {
			text-decoration: underline;
			color: #888;
		}
		.forgot-password:hover,
		.forgot-password:focus {
			text-decoration: underline;
			color: #666;
		}
		
		.btn-register {
			background-color: #1CB94E;
			outline: none;
			color: #fff;
			font-size: 14px;
			height: auto;
			font-weight: normal;
			padding: 14px 0;
			text-transform: uppercase;
			border-color: #1CB94A;
		}
		.btn-register:hover,
		.btn-register:focus {
			color: #fff;
			background-color: #1CA347;
			border-color: #1CA347;
		}
		

	</style>	

	</head>
	<body>
	
		
	
		<div class="row">
			<div class="col-md-6 col-sm-offset-3">
				<div class="panel panel-login">
					<div class="panel-heading">
						<div class="row">
							<div class="col-xs-6">
								<a href="#" class="active" id="login-form-link">로그인</a>
							</div>
							<div class="col-xs-6">
								<a href="#" id="register-form-link">회원가입</a>
							</div>
						</div>
						<hr>
					</div>
					<div class="panel-body">
						<div class="row">
							<div class="col-lg-12">
								<form id="login-form" action="login.do?sgroupNo=<%=sgroupNo%>" method="post" role="form" style="display: block;" onsubmit="return loginChk();">
									<div class="form-group">
										<input type="text" name="userId" id="userId" tabindex="1" class="form-control" placeholder="아이디" value="">
										
									</div>
									<div class="form-group">
										<input type="password" name="userPw" id="userPw" tabindex="2" class="form-control" placeholder="패스워드">
									</div>
									<div id="logInChk" style="text-align:center;">  </div>

									<div class="form-group">
										<div class="row">
											<div class="col-sm-6 col-sm-offset-3">
												<input type="submit"  name="login-submit" id="login-submit" tabindex="4" class="form-control btn btn-login" value="로그인">
											</div>
										</div>
									</div>
									<div class="form-group">
										<div class="row">
											<div class="col-lg-12">
												<div class="text-center">
													<a href="" tabindex="5" class="forgot-password" style=text-decoration:none data-toggle="modal" data-target="#findId">아이디 </a>&nbsp /
													<a href="" tabindex="5" class="forgot-password" style=text-decoration:none data-toggle="modal" data-target="#findPw">비밀번호 찾기</a>
												</div>
											</div>
										</div>
									</div>
								</form>
								<form id="register-form" action="/Snl/addUser.do?sgroupNo=<%=sgroupNo %>" method="post" style="display: none;">
									<div class="form-group" >
										<input type="text" name="id" id="id" tabindex="1" class="form-control" placeholder="아이디" value=""  required="">
										<div id="idInfo"></div>
									</div>
									<div class="form-group">
										<input type="password" name="pw" id="pw" tabindex="1" class="form-control" placeholder="패스워드">
									</div>
									<div class="form-group">
										<input type="password" name="confirm-password" id="confirm-password" tabindex="1" class="form-control" placeholder="비밀번호 확인">
										<div id="pwInfo"></div>
									</div>
							
							
									<div class="form-group">
										<input type="text" name="userName" id="userName" tabindex="1" class="form-control" placeholder="이름">
									</div>
									<div class="form-group">
										<input type="email" name="email" id="email" tabindex="1" class="form-control" placeholder="이메일 주소" value="">
									</div>
									<div class="form-group">
										<input type="text" name="tel" id="tel" tabindex="1" class="form-control" placeholder="전화번호" value="">
										<div id="telInfo"></div>
									
									</div>
									
									<div class="form-group">
										<div class="row">
											<div class="col-sm-6 col-sm-offset-3">
												<input type="submit" name="register-submit" id="register-submit" tabindex="4" class="form-control btn btn-register" value="등록">
											</div>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<!-- findId Modal -->
		<div id="findId" class="modal fade" role="dialog">
		  <div class="modal-dialog">
		
		    <!-- Modal content-->
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal">&times;</button>
		        <h4 class="modal-title">ID 찾기</h4>
		      </div>
		      <div class="modal-body" id="inputBody" style="height: 130px;">
	        	<p>회원가입 시 입력하였던 email을 입력해주시기 바랍니다.</p>
	        	<input type="email" style="margin-top: 30px;" class="form-control" name="userEmail" id="userEmail" placeholder="ex) abc@gmail.com "> 
		      </div>
		      <div class="modal-body" id="resultBody" style="display: none; height: 130px;">
			  	<div id="msg" style="text-align:center;margin-top: 40px;"> 
			  	<br>
		  		<br>
		  	  </div>
			  </div>
		      <div class="modal-footer" id="inputBtn">
		      	<button type="button" id="getUserBtn" class="btn btn-primary">확인</button>
		      </div>
		      <div class="modal-footer" id="resultBtn" style="display: none;">
		      	<button type="button" class="btn btn-default" id="findIdBtn" class="form-control btn btn-register">뒤로가기</button>
		      	<button type="button" class="btn btn-primary" id="IdINfindPwBtn" class="form-control btn btn-register"
		      			style=text-decoration:none data-toggle="modal" data-target="#findPw">비밀번호찾기</button>
			  </div>
		    
			</div>
		  </div>
		</div>
		<!-- findId Modal 끝 !!! -->
		
		<!-- findPw Modal -->
<div id="findPw" class="modal fade" role="dialog">
  <div class="modal-dialog">
    <!-- Modal content-->
	<div class="modal-content">
		
		<div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	        <h4 class="modal-title">PW 찾기</h4>
   		</div>
    
		<div class="modal-body" id="inputBodyPw" >
	    	<p>ID와 회원가입시 사용하였던 email을 입력해주시기 바랍니다.</p>
	          <div class="form-group">
	            <label for="userId" class="control-label">ID </label>
	            <input type="text" class="form-control" id="inputUserId">
	          </div>
	          <div class="form-group">
	            <label for="userEmail" class="control-label">Email</label>
	            <input type="text" class="form-control" id="inputUserEmail">
	          </div>
	    </div>
    
	    <div class="modal-body" id="resultBodyPw" style="display: none; height: 130px;">
			<div id="msgPw" style="text-align:center;margin-top: 40px;"> 
			  	<br>
			 	<br>
			</div>
		</div>
   
		<div class="modal-footer" id="findPwBtnDiv">
			<button type="button" class="btn btn-primary" id="findPwBtn" class="form-control btn btn-register">찾기</button>
		</div>
		<div class="modal-footer" id="findPwBtnPreDiv" style="display: none;">
	      	<button type="button" class="btn btn-default" id="findPwBtnPre" class="form-control btn btn-register">뒤로가기</button>
		</div>
  	</div>		
  </div>
</div>


		

</body>
</html>



