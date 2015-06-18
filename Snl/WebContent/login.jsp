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
		    width: 500px;
		    margin: 0px auto;
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
		<script src="js/login.js"></script>


	</head>
	
	<body>
	
	<div id="header">
   		<nav class="navbar navbar-inverse">
		    <div class="navbar-header">
		     	<a id="home" class="navbar-brand" href="/Snl/login.jsp">SNL</a> 
			</div>    
		</nav>
	</div>
    
  	<div id="content">
    
    	
    	<div id="main">
    	
<div class="login-container">   		
	<div class="row" >
		<form role="form" id="login-form" method="post" action="login.do?sgroupNo=<%=sgroupNo%>" accept-charset="UTF-8">
			<fieldset>
				<h2>Log In</h2>
				<hr class="colorgraph">
				<div class="form-group">
                    <input type="text" name="userId" id="userId" class="form-control input-lg" placeholder="ID">
				</div>
				<div class="form-group">
                    <input type="password" name="userPw" id="userPw" class="form-control input-lg" placeholder="Password">
				</div>
				<div id="logInChk" style="text-align: center;"></div>
				
				<hr class="colorgraph">
				<div class="row">
					<div class="col-xs-6 col-sm-6 col-md-6">
                        <input type="button" name="login-submit" id="login-submit" class="btn btn-lg btn-success btn-block" onclick="loginchk();" value="로그인">
					</div>
					<div class="col-xs-6 col-sm-6 col-md-6">
						<a href="addUserView.jsp" class="btn btn-lg btn-primary btn-block">회원가입</a>
					</div>
				</div>
				<a href="search.jsp" class="btn btn-link pull-right">ID/PW 찾기</a>
				
			</fieldset>
		</form>
	</div>
</div>
</div>
</div>
	
    
    
             
	    
	
	

	
	</body>

</html>
