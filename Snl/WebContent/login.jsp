<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    


<%
   String fail="";
   fail=(String)request.getParameter("fail");
   System.out.println(fail);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="utf-8">
    <!-- This file has been downloaded from Bootsnipp.com. Enjoy! -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<script type='text/javascript' src='http://code.jquery.com/jquery-1.8.0.min.js'></script> 
	<link rel="stylesheet" href="css/style.css" />
	<script src="js/login.js"></script>
	<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>

	<script type='text/javascript'> 
		
		$(document).ready(function(){
			 
			 $("#id").blur(function(){
				
				var idv = $("input[name=id]").val();
				 
				if(idv == ""){
					var msg = "<font color='red'>필수입력입니다.</font>";
	        		document.getElementById("idInfo").innerHTML= msg;
				}else{ 
				 
					$.ajax({
				        type:"POST",
				        url:"./getUser.do",
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
		});


			function fncGetCont(url) 
			{ 
			     $.ajax({ 
			            type        : 'POST' 
			            ,url        : url 
			            ,dataType   : 'html' 
			            ,success    : function(data, textStatus, jqXHR){$('#main').html(data);} 
			     }); 
			} 
		 
			
			function addPayment()
			{
				fncGetCont("./addPayment.html");	
			}
			
			function paymentlist()
			{
				fncGetCont("./calendar.html");	
			}
			
		
			
			function list()
			{
				fncGetCont("./list.html");	
			}
			

			function addGroup()
			{
				fncGetCont("./addGroup.html");	
			}
			
			
		</script> 
	
	
	
	
		<style type="text/css">
			
			
			
			* {
				padding: 0;
				margin: 0;
			}
			
			#headernav {
			
				
				position: fixed;
				width: 100%;
				height: 50px;
				left : 0;
				top : 0;

				border-radius: 0;
				margin-bottom: 0;
				z-index: 100;
				
				
				
				
			}
			
			#header {
			
				margin-top: 10px;
				background-color: #5fb0e4;
				background-image: url(header-bg.jpg?ver=2.0.0);
				background-position: center center;
				background-repeat: no-repeat;
				background-size: cover;
				color: #FFF;
				font-size: 16px;
				text-align: center;
				text-shadow: 0 1px 0 rgba(0,0,0,.15);
				font-family: Roboto,sans-serif;
				width: 100%;
				height: 170px;
			}
			
			#article {
				width: 100%;
				height: 1000px;
				background-color: #F5F5F5
			}
			

			
			#main {
				margin-left: 18%;
				padding-top: 50px;
				width: 65%;
				height: 100%;
			}
			
				
			#donutchart {
				margin-left: 18%;
				width: 100%;
				height: 100%;
			}
			#curve_chart{
				margin-left: 18%;
				width: 100%;
				height: 100%;
			}
			
			
			
			#footer {
				clear: both;
				width: 100%;
				height: 50px;
				margin-top: 10px;
				margin-bottom: 10px;
			}
			
			#leftmenu {
				margin-top : 60px;
				margin-left : 5%;
				text-align : right;
				float : left;
				top: 250px;
				width: 150px;
				height: 300px;
			}
			
			
			#aside {
				position: fixed;
				right: 30px;
				top: 170px;
				width: 150px;
				height: 300px;
			}
			
			
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
	
		<div id="headernav">
		
			<nav class="navbar navbar-default">
			  <div class="container-fluid">
			    <div class="navbar-header" style="margin-left: 150px;">
			      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
			        <span class="sr-only">Toggle navigation</span>
			        <span class="icon-bar"></span>
			        <span class="icon-bar"></span>
			        <span class="icon-bar"></span>
			      </button>
			      <a class="navbar-brand" href="http://localhost:8080/Snl/index.html"><font color="#5FB0E4">SNL</font></a>
			    </div>
			
			    <!-- Collect the nav links, forms, and other content for toggling -->
			    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			     
			      <ul class="nav navbar-nav navbar-right" style="margin-right: 150px;">
			      	<li class="active">
			            	<a href='calendar.html' onclick='paymentlist(this);'>지출현황</a> 
					</li>
					<li>
			            	<a href='addPayment.html' onclick='addPayment(this);'>지출추가</a> 
					</li>
			        <li>
			            	<a href='jqGridSimple.jsp' onclick='stat1();'>통계</a> 
			        </li>
			       								        
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">
						그룹관리
						<b class="caret"></b>
						</a>
						<ul class="dropdown-menu">
							<li><a href="#">회비관리</a></li>
							<li><a href="list.html"  onclick='list(this);'>회원리스트</a></li>
						</ul>
					</li>
					
			        <li><a href="#">설정</a></li>
			        <li>
			        		<a href='login.html'>로그인</a>
			        </li>
			        
			        
			        
			      </ul>
			    </div><!-- /.navbar-collapse -->
			  </div><!-- /.container-fluid -->
			</nav>
		</div>
		
		<div id="header" align="center">
			<br/><br/>
				<font size="9" face ="sans-serif"><b>SNL</b></font><br/>
				<font size="5">Social Network Ledger</font>
		</div>
	
		<div id="article">			
			<div id="main">
			
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
													<div> <%= fail %> </div>
													<div class="form-group text-center">
														<input type="checkbox" tabindex="3" class="" name="remember" id="remember">
														<label for="remember"> 아이디 저장</label>
													</div>
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
																	<a href="" tabindex="5" class="forgot-password">패스워드 잊었니?</a>
																</div>
															</div>
														</div>
													</div>
												</form>
												<form id="register-form" action="/Snl/addUser.do" method="post" style="display: none;">
													<div class="form-group" >
														<input type="text" name="id" id="id" tabindex="1" class="form-control" placeholder="아이디" value=""  required="">
														<div id="idInfo"></div>
													</div>
													<div class="form-group">
														<input type="password" name="pw" id="pw" tabindex="2" class="form-control" placeholder="패스워드">
													</div>
													<div class="form-group">
														<input type="password" name="confirm-password" id="confirm-password" tabindex="2" class="form-control" placeholder="비밀번호 확인">
														<div id="pwInfo"></div>
													</div>
													
													
													<div class="form-group">
														<input type="text" name="userName" id="userName" tabindex="2" class="form-control" placeholder="이름">
													</div>
													<div class="form-group">
														<input type="email" name="email" id="email" tabindex="1" class="form-control" placeholder="이메일 주소" value="">
													</div>
													<div class="form-group">
														<input type="text" name="tel" id="tel" tabindex="1" class="form-control" placeholder="전화번호" value="">
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
				<script type="text/javascript">
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
					$('#register-submit').click(function(e) {
						alert('회원가입 완료되었습니다.');
					});
						
				
				});
				
				</script>
			
			
			
			</div>

		</div>
		<div id="footer">footer</div>
	
	
	
	
	
	

</body>
</html>



