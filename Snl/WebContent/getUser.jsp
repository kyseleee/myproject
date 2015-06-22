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
	    <link href="css/user.css" rel="stylesheet">


		<!--  js -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<script src="js/login.js"></script>

<style type="text/css">
		
		.colorgraph {
			height: 5px;
			border-top: 0;
			background: #c4e17f;
			border-radius: 5px;
			background-image: -webkit-linear-gradient(left, #c4e17f, #c4e17f 12.5%, #f7fdca 12.5%, #f7fdca 25%, #fecf71 25%, #fecf71 37.5%, #f0776c 37.5%, #f0776c 50%, #db9dbe 50%, #db9dbe 62.5%, #c49cde 62.5%, #c49cde 75%, #669ae1 75%, #669ae1 87.5%, #62c2e4 87.5%, #62c2e4);
			background-image: -moz-linear-gradient(left, #c4e17f, #c4e17f 12.5%, #f7fdca 12.5%, #f7fdca 25%, #fecf71 25%, #fecf71 37.5%, #f0776c 37.5%, #f0776c 50%, #db9dbe 50%, #db9dbe 62.5%, #c49cde 62.5%, #c49cde 75%, #669ae1 75%, #669ae1 87.5%, #62c2e4 87.5%, #62c2e4);
			background-image: -o-linear-gradient(left, #c4e17f, #c4e17f 12.5%, #f7fdca 12.5%, #f7fdca 25%, #fecf71 25%, #fecf71 37.5%, #f0776c 37.5%, #f0776c 50%, #db9dbe 50%, #db9dbe 62.5%, #c49cde 62.5%, #c49cde 75%, #669ae1 75%, #669ae1 87.5%, #62c2e4 87.5%, #62c2e4);
			background-image: linear-gradient(to right, #c4e17f, #c4e17f 12.5%, #f7fdca 12.5%, #f7fdca 25%, #fecf71 25%, #fecf71 37.5%, #f0776c 37.5%, #f0776c 50%, #db9dbe 50%, #db9dbe 62.5%, #c49cde 62.5%, #c49cde 75%, #669ae1 75%, #669ae1 87.5%, #62c2e4 87.5%, #62c2e4);
		}

		
		.login-container{
		    position: relative;
		    width: 700px;
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

		.addbtn{
		    	  background-color: #f6f1ff;
				  background-image: -moz-linear-gradient(top,#f6f1ff 0,#e3d5f7 50%,#d4bff1 50%,#f3ebff 100%);
				  background-image: linear-gradient(top,#f6f1ff 0,#e3d5f7 50%,#d4bff1 50%,#f3ebff 100%);
				  background-image: -webkit-linear-gradient(top,#f6f1ff 0,#e3d5f7 50%,#d4bff1 50%,#f3ebff 100%);
				  background-image: -o-linear-gradient(top,#f6f1ff 0,#e3d5f7 50%,#d4bff1 50%,#f3ebff 100%);
				  background-image: -ms-linear-gradient(top,#f6f1ff 0,#e3d5f7 50%,#d4bff1 50%,#f3ebff 100%);
				  border: 1px solid #b696ea;
				  color: #201834;
		    	}
		</style>

</head>
<body>

<jsp:include page="header.jsp"/>
    
  		<div id="content">
  	  	<jsp:include page="leftMenu.jsp"/>
    
    	
    	<div id="main">
    	
    	<div class="login-container" style="margin-top: 0px;">   		

		<div class="row" style="height:400px;">
		<form role="form" action="" method="post">
			<h2 style="text-align:left; font-size:20px;">회원정보</h2>
			
			<hr class="colorgraph">
		
		<div>
			<div class="col-xs-4 col-sm-4 col-md-4">
				<p style="font-size:17px; font-weight: bold; float:left; padding: 8px;">아이디</p>
			</div>
	
			<div class="col-xs-6 col-sm-6 col-md-6">
			<div class="form-group">
				<input type="text" name="id" id="id" tabindex="1" class="form-control input-lg" placeholder="아이디" value="${user.id}" required="" disabled="disabled">
				<div id="idInfo"  align="left"></div>
			</div>
			</div>
		</div>	
		
		<div>
			<div class="col-xs-4 col-sm-4  col-md-4">
				<p style="font-size:17px; font-weight: bold; float:left; padding:8px;">이름</p>
			</div>
	
			<div class="col-xs-6 col-sm-6 col-md-6">
			<div class="form-group">
				<input type="text" name="userName" id="userName" tabindex="1" class="form-control input-lg" value="${user.userName}"placeholder="이름" disabled="disabled">
				<div id="idInfo"  align="left"></div>
			</div>
			</div>
		</div>	
		
		<div>
			<div class="col-xs-4 col-sm-4  col-md-4">
				<p style="font-size:17px; font-weight: bold; float:left; padding:8px;">이메일 주소</p>
			</div>
	
			<div class="col-xs-7 col-sm-6 col-md-6">
			<div class="form-group">
				<input type="email" name="email" id="email" tabindex="1" class="form-control input-lg" value="${user.email}"placeholder="이메일 주소" disabled="disabled">
				<div id="idInfo"  align="left"></div>
			</div>
			</div>
		</div>	
		
		<div>
			<div class="col-xs-4 col-sm-4  col-md-4">
				<p style="font-size:17px; font-weight: bold; float:left; padding:8px;">전화번호</p>
			</div>	
		
			
			<div class="col-xs-7 col-sm-6 col-md-6">
			<div class="form-group">
				<input type="text" name="tel" id="tel" tabindex="1" class="form-control input-lg"  value="${user.tel}" placeholder="전화번호" disabled="disabled">
				<div id="idInfo"  align="left"></div>
			</div>
			</div>
		</div>
			<div>
				<a href="index.jsp" class="col-md-4"><input type="button" value="확인" class="btn addbtn btn-block " tabindex="7"></a>
								<a href="updateUserView.do?id=${user.id}" class="col-md-4"><input type="button" value="수정" class="btn addbtn btn-block " tabindex="7"></a>
								<a href="deleteUser.do?userNo=${user.userNo}&groupNo=${group.groupNo}" class="col-md-4"><input type="button" value="탈퇴" class="btn addbtn btn-block " tabindex="7"></a>
			</div>
		</form>
	</div>
</div>

      </div>
    </div>
</body>
</html>