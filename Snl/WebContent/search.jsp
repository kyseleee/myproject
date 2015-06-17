<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">	
		
		<!--  css -->

		<link href="css/bootstrap.min.css" rel="stylesheet">
 		<link href="css/index.css" rel="stylesheet">
	    <link href="css/leftmenu.css" rel="stylesheet">
		<link href="css/login.css" rel="stylesheet">
		<style type="text/css">
		
		.login-container{
		    position: relative;
		    width: 500px;
		    margin: 80px auto;
		    padding: 20px 40px 40px;
		    text-align: center;
		    background: #fff;
		    border: 1px solid #ccc;
		}
		
		.login-container::before,.login-container::after{
		    content: "";
		    position: absolute;
		    width: 100%;height: 100%;
		    top: 3.5px;left: 0;
		    background: #fff;
		    z-index: -1;
		    -webkit-transform: rotateZ(4deg);
		    -moz-transform: rotateZ(4deg);
		    -ms-transform: rotateZ(4deg);
		    border: 1px solid #ccc;
		
		}

		.login-container::after{
		    top: 5px;
		    z-index: -2;
		    -webkit-transform: rotateZ(-2deg);
		    -moz-transform: rotateZ(-2deg);
		    -ms-transform: rotateZ(-2deg);
		
		}


		</style>
		

		<!--  js -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<script type="text/javascript">
		
		$(function() {
			
		    $('#id-form-link,#id-form-btn').click(function(e) {
				$("#userEmail").val("");
				$("#msg").val("");
				$("#id-form").delay(100).fadeIn(100);
		 		$("#pw-form").fadeOut(100);
		 		$("#resultBody").fadeOut(100);
				$('#pw-form-link').removeClass('active');
				$(this).addClass('active');
				e.preventDefault();
				

			});
		    
			$('#pw-form-link,#pw-form-btn').click(function(e) {
				$("#inputUserId").val("");
				$("#inputUserEmail").val("");
				$("#msgPw").val("");
				$("#pw-form").delay(100).fadeIn(100);
		 		$("#id-form").fadeOut(100);
		 		$("#resultBodyPw").fadeOut(100);
		 		$('#id-form-link').removeClass('active');
				$(this).addClass('active');
				e.preventDefault();
			});

			
			$("#getUserBtn").click(function() {
					
				$(document).ajaxStart(function() {
					document.getElementById("msg").innerHTML="";
					$("#viewLoading").show();
				});
				
				$(document).ajaxStop(function() {
					$("#viewLoading").hide();
				});
	
				var email=$("input[name=userEmail]").val();
	
				$("#resultBody").show();
				$("#id-form").hide();
	
				$.ajax({
					type : "POST",
					url : "./searchId.do",
					data : {email : email},
					success : function(msg) {
			        	
						document.getElementById("msg").innerHTML=msg;
					
					},
					error : function(xhr, status, error) {
								alert(error);
					}
				});
			});
			
			$("#findPwBtn").click(function() {
				
				$(document).ajaxStart(function() {
					document.getElementById("msgPw").innerHTML="";
					$("#viewLoadingPw").show();
				});
				
				$(document).ajaxStop(function() {
					$("#viewLoadingPw").hide();
				});
	
	
				$("#resultBodyPw").show();
				$("#pw-form").hide();
				
				var id=$( "input[id=inputUserId] ").val();
				var email=$("input[id=inputUserEmail] ").val();

				$.ajax({
					type: "POST",
					url : "./searchPw.do",
					data : {id :id, email : email},
					success : function(msg) {
								document.getElementById("msgPw").innerHTML=msg;
							  },
					error : function(xhr, status, error) {
								alert(error);
							}
				});
			});


			
			
			
		});
		
		</script>


	</head>
	
	<body>
	
 		<jsp:include page="header.jsp"/>
    
  		<div id="content">
        	
    	<div id="main">
    	<div class="login-container">
    	<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-login" style="margin-bottom: 0px;">
					
				<!-- 제목 -->
				<div class="panel-heading">
					<div class="row">
						<div class="col-xs-6">
							<a href="#" class="active" id="id-form-link">ID찾기</a>
						</div>
						<div class="col-xs-6">
							<a href="#" id="pw-form-link">PW찾기</a>
						</div>
					</div>
					<hr>
				</div>	
				<!-- body -->
				<div class="panel-body">
					<div class="row">
						<div class="col-lg-12">
							<!-- ID 찾기 -->
							<form id="id-form" style="display: block;">
							<p>회원가입 시 입력하였던 email을 입력해주시기 바랍니다.</p>
							<input type="email" style="margin-bottom: 10px;" class="form-control" name="userEmail" id="userEmail" placeholder="ex) abc@gmail.com ">
							<div class="pull-right">
								<button type="button" id="getUserBtn" class="btn btn-primary">확인</button>
							</div>
							</form>
							
							<div id="resultBody" style="display: none;">
								<br><br>
								<div id="viewLoading" align="center">
									<img src="images/viewLoading.gif" align="middle" />
								</div>
								<div id="msg"></div>
								<br><br>
								<div class="pull-right">
								<button type="button" id="id-form-btn" class="btn btn-primary">뒤로가기</button>
								</div>	
							</div>
							
							<!-- PW 찾기 -->
							<form id="pw-form" style="display: none;">
							<p>ID와 회원가입시 사용하였던 email을 입력해주시기 바랍니다.</p>
							<div class="form-group">
								<input type="text" class="form-control" id="inputUserId" placeholder="ID">
							</div>
							<div class="form-group">
								<input type="text" class="form-control" id="inputUserEmail" placeholder="EMAIL">
							</div>
							<div class="pull-right">
								<button type="button" id="findPwBtn" class="btn btn-primary">확인</button>
							</div>
							</form>
							
							<div id="resultBodyPw" style="display: none;">
								<br><br>
								<div id="viewLoadingPw" align="center">
									<img src="images/viewLoading.gif" align="middle" />
								</div>
								<div id="msgPw"></div>
								<br><br>
								<div class="pull-right">
								<button type="button" id="pw-form-btn" class="btn btn-primary">뒤로가기</button>
								</div>	
							</div>
							
							
						</div>	
					</div>
				</div>	
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
					<input type="email" style="margin-top: 30px;" class="form-control"
						name="userEmail" id="userEmail" placeholder="ex) abc@gmail.com ">
				</div>
				<div class="modal-body" id="resultBody"
					style="display: none; height: 130px; text-align: center;">
					<div id="viewLoading" align="center">
						<img src="images/viewLoading.gif" align="middle" />
					</div>
					<div id="msg" style="text-align: center; margin-top: 40px;">
						<br> <br>
					</div>
				</div>
				<div class="modal-footer" id="inputBtn">
					<button type="button" id="getUserBtn" class="btn btn-primary">확인</button>
				</div>
				<div class="modal-footer" id="resultBtn" style="display: none;">
					<button type="button" class="btn btn-default" id="findIdBtn"
						class="form-control btn btn-register">뒤로가기</button>
					<button type="button" class="btn btn-primary" id="IdINfindPwBtn"
						class="form-control btn btn-register"
						style="text-decoration: none" data-toggle="modal"
						data-target="#findPw">비밀번호찾기</button>
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

				<div class="modal-body" id="inputBodyPw">
					<p>ID와 회원가입시 사용하였던 email을 입력해주시기 바랍니다.</p>
					<div class="form-group">
						<label for="userId" class="control-label">ID </label> <input
							type="text" class="form-control" id="inputUserId">
					</div>
					<div class="form-group">
						<label for="userEmail" class="control-label">Email</label> <input
							type="text" class="form-control" id="inputUserEmail">
					</div>
				</div>

				<div class="modal-body" id="resultBodyPw"
					style="display: none; height: 130px;">
					<div id="msgPw" style="text-align: center; margin-top: 40px;">
						<br> <br>
					</div>
				</div>

				<div class="modal-footer" id="findPwBtnDiv">
					<button type="button" class="btn btn-primary" id="findPwBtn"
						class="form-control btn btn-register">찾기</button>
				</div>
				<div class="modal-footer" id="findPwBtnPreDiv"
					style="display: none;">
					<button type="button" class="btn btn-default" id="findPwBtnPre"
						class="form-control btn btn-register">뒤로가기</button>
				</div>
			</div>
		</div>

    	
    	
    	
    	
    	
    	</div>
	
</div>    
    </div>

             
	    
	
	</body>

</html>
