<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String sgroupNo = request.getParameter("sgroupNo");
	if (sgroupNo == null) {
		sgroupNo = "";
	}
%>

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

		

		<!--  js -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<script src="js/login.js"></script>


	</head>
	
	<body>
	

 		<jsp:include page="header.jsp"/>
    
  		<div id="content">
  	  	<jsp:include page="leftMenu.jsp"/>
    
    	
    	<div id="main">
    	
    	
    			<div class="row">
		<div class="col-md-6 col-sm-offset-3">
			<div class="panel panel-login">
			
				<!-- 제목 -->
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
				
				<!-- body -->
				<div class="panel-body">
					<div class="row">
						<div class="col-lg-12">
							<!-- login 입력받아 넘길 값들  -->
							<form id="login-form" action="login.do?sgroupNo=<%=sgroupNo%>"
								method="post" role="form" style="display: block;">
								<div class="form-group">
									<input type="text" name="userId" id="userId" tabindex="1"
										class="form-control" placeholder="아이디" value="">
								</div>
								<div class="form-group">
									<input type="password" name="userPw" id="userPw" tabindex="2"
										class="form-control" placeholder="패스워드">
								</div>
								<div id="logInChk" style="text-align: center;"></div>

								<div class="form-group">
									<div class="row">
										<div class="col-sm-6 col-sm-offset-3">
											<input type="button" name="login-submit" id="login-submit"
												 class="form-control btn btn-login" onclick="loginchk();" value="로그인">
										</div>
									</div>
								</div>
								<div class="form-group">
									<div class="row">
										<div class="col-lg-12">
											<div class="text-center">
												<a href="" tabindex="5" class="forgot-password"
													style="text-decoration: none" data-toggle="modal"
													data-target="#findId">아이디 </a>&nbsp / <a href=""
													tabindex="5" class="forgot-password"
													style="text-decoration: none" data-toggle="modal"
													data-target="#findPw">비밀번호 찾기</a>
											</div>
										</div>
									</div>
								</div>
							</form>
							<form id="register-form"
								action="/Snl/addUser.do?sgroupNo=<%=sgroupNo%>" method="post"
								style="display: none;">
								<div class="form-group">
									<input type="text" name="id" id="id" tabindex="1"
										class="form-control" placeholder="아이디" value="" required="">
									<div id="idInfo"></div>
								</div>
								<div class="form-group">
									<input type="password" name="pw" id="pw" tabindex="1"
										class="form-control" placeholder="패스워드">
								</div>
								<div class="form-group">
									<input type="password" name="confirm-password"
										id="confirm-password" tabindex="1" class="form-control"
										placeholder="비밀번호 확인">
									<div id="pwInfo"></div>
								</div>


								<div class="form-group">
									<input type="text" name="userName" id="userName" tabindex="1"
										class="form-control" placeholder="이름">
								</div>
								<div class="form-group">
									<input type="email" name="email" id="email" tabindex="1"
										class="form-control" placeholder="이메일 주소" value="">
								</div>
								<div class="form-group">
									<input type="text" name="tel" id="tel" tabindex="1"
										class="form-control" placeholder="전화번호" value="">
									<div id="telInfo"></div>

								</div>

								<div class="form-group">
									<div class="row">
										<div class="col-sm-6 col-sm-offset-3">
											<input type="submit" name="register-submit"
												id="register-submit" tabindex="4"
												class="form-control btn btn-register" value="등록">
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
		
		
		
		</div>
				

			


	<!-- index 끝 -->






	

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
	
		<jsp:include page="rightMenu.jsp"></jsp:include>
    
    </div>
    
             
	    
	<jsp:include page="footer.jsp"/>
	
	
	
<script>

$("#findPwBtnPre").click(function() {

	$("#resultBodyPw").hide();
	$("#inputBodyPw").show();

	$("#findPwBtnPreDiv").hide();
	$("#findPwBtnDiv").show();
	document.getElementById("msgPw").innerHTML="";

});

$("#IdINfindPwBtn").click(function() {

	$("#findId").hide();
	$("#findPw").show();

});

$("#findPwBtn").click(function() {
	var id=$( "input[id=inputUserId] ").val();
	var email=$("input[id=inputUserEmail] ").val();

	$.ajax({
		type: "POST",
		url : "./getUserByIdEmail.do",
		data : {id :id, email : email},
		success : function(data) {
					document.getElementById("msgPw").innerHTML=data;
				  },
		error : function(xhr, status, error) {
					alert(error);
				}
	});

	$("#resultBodyPw").show();
	$("#findPwBtnPreDiv").show();

	$("#inputBodyPw").hide();
	$("#findPwBtnDiv").hide();
});

$("#getUserBtn").click(function() {

	$(document).ajaxStart(function() {

		$('#viewLoading').css('left', $('#modal-body').offset().left);
		$('#viewLoading').css('top', $('#modal-body').offset().top);
		$('#viewLoading').css('width', $('#modal-body').css('width'));
		$('#viewLoading').css('height', $('#modal-body').css('height'));

	});
	$(document).ajaxStop(function() {
		$("#viewLoading").hide();
	});

	var email=$( "input[name=userEmail]").val();

	$("#resultBody").show();
	$("#resultBtn").show();

	$("#inputBody").hide();
	$("#inputBtn").hide();

	$.ajax({
		type : "POST",
		url : "./getUserByEmail.do",
		data : { userEmail : email},
		success : function(data) {
					document.getElementById("msg").innerHTML=data;
				},
		error : function(xhr, status, error) {
					alert(error);
				}
	});
});

$("#findIdBtn").click(function() {

	$("#inputBtn").show();
	$("#inputBody").show();

	$("#resultBody").hide();
	$("#resultBtn").hide();
	document.getElementById("msg").innerHTML="";

});

$("#findId").on('hidden.bs.modal', function() {

	$("#inputBtn").show();
	$("#inputBody").show();

	$("#resultBody").hide();
	$("#resultBtn").hide();

	$("#userEmail").val("");
	$("#msg").val("");

});

$("#findPw").on('hidden.bs.modal', function() {

	$("#inputBodyPw").show();
	$("#findPwBtnDiv").show();

	$("#resultBodyPw").hide();
	$("#findPwBtnPreDiv").hide();

	$("#inputUserId").val("");
	$("#inputUserPw").val("");

});



</script>	
	
	</body>

</html>
