<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    


<%
  String fail="";
  String groupChk;
  fail=(String)request.getParameter("fail");
  if (fail==null) {
	  fail="";
  }
  groupChk=(String)request.getParameter("groupChk"); 
  if (groupChk==null){
	  groupChk="temp";
  }
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<script type='text/javascript' src='http://code.jquery.com/jquery-1.8.0.min.js'></script> 
	<link rel="stylesheet" href="css/style.css" />
	<script src="js/login.js"></script>
	<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
	
	<script type="text/javascript">
		function loginChk(){
			
		}
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
		<script src="https://code.jquery.com/jquery.js"></script>
      	<script src="js/bootstrap.min.js"></script>
	

		
		
	
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
								<form id="login-form" action="login.do" method="post" role="form" style="display: block;">
									<div class="form-group">
										<input type="text" name="userId" id="userId" tabindex="1" class="form-control" placeholder="아이디" value="">
									</div>
									<div class="form-group">
										<input type="password" name="userPw" id="userPw" tabindex="2" class="form-control" placeholder="패스워드">
									</div>
									<div style="text-align:center;"> <%= fail %> </div>
									<div class="form-group text-center">
										<input type="checkbox" tabindex="3" class="" name="remember" id="remember">
										<label for="remember"> <br>아이디 저장</label>
									</div>
									<div class="form-group">
										<div class="row">
											<div class="col-sm-6 col-sm-offset-3">
												<input type="button"  name="login-submit" id="login-submit" tabindex="4" class="form-control btn btn-login" value="로그인" onclick="">
											</div>
										</div>
									</div>
									<div class="form-group">
										<div class="row">
											<div class="col-lg-12">
												<div class="text-center">
													<a href="" tabindex="5" class="forgot-password">패스워드 잊었니?</a>
												</div>
											</div>
										</div>
									</div>
								</form>
								<form id="register-form" action="/Snl/addUser.do?groupChk=<%=groupChk%>" method="post" style="display: none;">
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
												<input type="submit" name="register-submit" id="register-submit" tabindex="4" class="form-control btn btn-register" value="등록" onclick="groupChk()">
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
		
		



</body>
</html>



