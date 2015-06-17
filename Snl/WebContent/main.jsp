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
<link href="css/grayscale.css" rel="stylesheet">
<link href="css/mainActivity.css" rel="stylesheet">
<style type="text/css">
#login-dp{
    min-width: 250px;
    padding: 14px 14px 0;
    overflow:hidden;
    background-color:rgba(255,255,255,.8);
}
#login-dp .help-block{
    font-size:12px;
   	font-color:blue;    
}
#login-dp .bottom{
    background-color:rgba(255,255,255,.8);
    border-top:1px solid #ddd;
    clear:both;
    padding:14px;
}
#login-dp .social-buttons{
    margin:12px 0    
}
#login-dp .social-buttons a{
    width: 49%;
}
#login-dp .form-group {
    margin-bottom: 10px;
}
.btn-fb{
    color: #fff;
    background-color:#3b5998;
}
.btn-fb:hover{
    color: #fff;
    background-color:#496ebc 
}
.btn-tw{
    color: #fff;
    background-color:#55acee;
}
.btn-tw:hover{
    color: #fff;
    background-color:#59b5fa;
}
@media(max-width:768px){
    #login-dp{
        background-color: inherit;
        color: #fff;
    }
    #login-dp .bottom{
        background-color: inherit;
        border-top:0 none;
    }
}
</style>
<!--  js -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/login.js"></script>


</head>
<body id="page-top" data-spy="scroll" data-target=".navbar-fixed-top">

	<nav class="navbar navbar-custom navbar-fixed-top" role="navigation">
	<div class="container">
		<div class="navbar-header">
			<a class="navbar-brand page-scroll" href="#page-top"
				style="font-size: 25px;">S N L</a>
		</div>

		<div
			class="collapse navbar-collapse navbar-right navbar-main-collapse">
			<ul class="nav navbar-nav">
				<li><a class="page-scroll" href="#main1">introduction</a></li>
				<li><a class="page-scroll" href="#main2">contact</a></li>
				<li><a class="page-scroll" href="login.jsp">LogIn</a></li>
       				
        
				
			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container --> </nav>


	<div id="content">

		<!-- 첫번째 Main 화면 -->
		<div id="main">

			<div class="main_wrap">

				<div class="main_title">
					<h1>SNL</h1>
					<h1>(Social Network Ledger)</h1>
					<p class="intro-text">
						어디에서도 경험 할 수 없었던 <br /> 소셜 네트워크 가계부 <br /> 경험해보세요. <br />
					</p>
					<a href="#main1" class="btn btn-circle page-scroll"> <i
						class="animated glyphicon glyphicon-arrow-down"
						style="top: 7px; right: 4px"></i></a>


				</div>



				<div class="loginForm">
					<div class="form-title">
						<div class="col-xs-6">
							<a href="#" class="active" id="login-form-link">로그인</a>
						</div>
						<div class="col-xs-6">
							<a href="#" id="register-form-link">회원가입</a>
						</div>
						<hr>
					</div>

					<!-- login 입력받아 넘길 값들  -->
					<form class="login" id="login-form"
						action="login.do?sgroupNo=<%=sgroupNo%>" method="post" role="form"
						style="display: block;">

						<input type="text" name="userId" id="userId" class=""
							placeholder="Username" value=""> <input type="password"
							name="userPw" id="userPw" class="" placeholder="Password">

						<div id="logInChk" style="text-align: center;"></div>
						<input type="submit" name="login-submit" id="login-submit"
							class="btn btn-success btn-sm" onclick="loginchk();"
							style="border-radius: 15px" value="Sign In">

						<div class="text-center" style="margin-top: 5%;">
							<a href="" tabindex="5" class="forgot-password"
								style="text-decoration: none" data-toggle="modal"
								data-target="#findId">아이디 </a> &nbsp / <a href="" tabindex="5"
								class="forgot-password" style="text-decoration: none"
								data-toggle="modal" data-target="#findPw">비밀번호 찾기</a>
						</div>
					</form>

					<form id="register-form" class="login"
						action="/Snl/addUser.do?sgroupNo=<%=sgroupNo%>" method="post"
						style="display: none;">
						<input type="text" name="id" id="id" placeholder="아이디" value=""
							required="">
						<div id="idInfo"></div>

						<input type="password" name="pw" id="pw" placeholder="패스워드">

						<input type="password" name="confirm-password"
							id="confirm-password" placeholder="비밀번호 확인">
						<div id="pwInfo"></div>

						<input type="text" name="userName" id="userName" placeholder="이름">

						<input type="email" name="email" id="email" placeholder="이메일 주소"
							value=""> <input type="text" name="tel" id="tel"
							placeholder="전화번호" value="">
						<div id="telInfo"></div>

						<div class="form-group">
							<div class="row">
								<div class="col-sm-6 col-sm-offset-3">
									<input type="submit" name="register-submit"
										id="register-submit" class="btn btn-success btn-sm" value="등록"
										style="border-radius: 15px">
								</div>
							</div>
						</div>
					</form>
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
						<h5 class="modal-title">ID 찾기</h5>
					</div>
					<div class="modal-body" id="inputBody" style="height: 130px;">
						<h6>회원가입 시 입력하였던 email을 입력해주시기 바랍니다.</h6>
						<input type="email" style="margin-top: 30px;" class="form-control"
							name="userEmail" id="userEmail" placeholder="ex) abc@gmail.com ">
					</div>
					<div class="modal-body" id="resultBody"
						style="display: none; height: 130px; text-align: center;">
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
						<h5 class="modal-title">PW 찾기</h5>
					</div>

					<div class="modal-body" id="inputBodyPw">
						<h6>ID와 회원가입시 사용하였던 email을 입력해주시기 바랍니다.</h6>
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


		<!-- 두번째 Main1 화면 -->
		<div id="main1">
			<div class="main1_wrap">
				<div class="main1_title">
					<div class="main1_title">
						<h2 style="font-weight: bold;">Social Network Leager</h2>
						<a href="http://startbootstrap.com/template-overviews/grayscale/">소셜
							네트워크 가계부</a>
					</div>
				</div>
			</div>
		</div>


		<!-- 세번째 Main2 화면 -->
		<div id="main2">
			<div class="main2_wrap">
				<div class="main2_title">
					
				<h2><a href="http://startbootstrap.com/template-overviews/grayscale/">★</a>
				홈페이지 주요 기능 <a href="http://startbootstrap.com/template-overviews/grayscale/">★</a></h2>
					
				</div>

				<div class="main2_section">
					<div class="boxs" style="float: left; margin: 20px;">
						<div class="box-icon">
							<span style="font-size: 50px; left: 2px;"
								class="glyphicon glyphicon-calendar"></span>
						</div>
						<div>
							<h4>현황리스트</h4>
							<img style="width: 300px; height: 200px" class="img-responsive"
								src="./images/a.jpg" />
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
						</div>
					</div>

					<div class="boxs" style="float: left; margin: 20px;">
						<div class="box-icon">
							<span style="font-size: 50px;" class="glyphicon glyphicon-usd"></span>
						</div>
						<div>
							<h4>지출추가</h4>
							<img style="width: 300px; height: 200px" class="img-responsive"
								src="./images/a.jpg" />
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
						</div>
					</div>

					<div class="boxs" style="float: left; margin: 20px;">
						<div class="box-icon">
							<span style="font-size: 50px;" class="glyphicon glyphicon-stats"></span>
						</div>
						<div>
							<h4>통계</h4>
							<img style="width: 300px; height: 200px" class="img-responsive"
								src="./images/a.jpg" />
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
						</div>
					</div>



					<div class="boxs" style="float: left; margin: 20px;">
						<div class="box-icon">
							<span style="font-size: 50px;"
								class="glyphicon glyphicon-list-alt"></span>
						</div>
						<div>
							<h4>회비관리</h4>
							<img style="width: 300px; height: 200px" class="img-responsive"
								src="./images/a.jpg" />
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
						</div>
					</div>

				</div>
			</div>
		</div>
		<!-- Main2 End -->

	</div>

	<div id="footer">
		<p>footer</p>
	</div>


<script src="js/jquery.easing.min.js"></script>
<script src="js/grayscale.js"></script>
<script type="text/javascript">

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
	alert("dadaad");
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