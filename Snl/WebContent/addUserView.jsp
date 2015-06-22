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

		body{
		  background-color: rgba(219, 225, 239, 0.66);
		}

		</style>

		

		<!--  js -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<script type="text/javascript">
		

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
			 
			 $("#email").blur(function(){
					var iemail = $("input[name=email]").val();
					 
					if(iemail == ""){
						var msg = "<font color='red'>필수입력입니다.</font>";
			    		document.getElementById("emailInfo").innerHTML= msg;
					}else{ 
					 
						$.ajax({
					        type:"POST",
					        url:"./getUserByEmail.do",
					        data : {email : iemail},
					        success: function(responseData){
					        	var data = JSON.parse(responseData);
					        	
					        	if(data.result == "false"){
									var msg = "<font color='red'>이미 가입된 이메일 입니다.</font>";
					        	}
					        	else{
									var msg = "<font color='blue'>사용가능한 이메일 입니다.</font>";
					        	}
				        		document.getElementById("emailInfo").innerHTML= msg;

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

		
		</script>


	</head>
	
	<body>
	
	<div id="header">
    <nav class="navbar navbar-inverse"  style="background-color: #2b3340 !important; min-height: 50px; ">
   	<div class="center">
		    <div class="navbar-header">
		    	<c:if test="${! empty user}">
		     	<a id="home" class="navbar-brand" href="/Snl/calendar.jsp">SNL</a> 
		     	</c:if>
		     	<c:if test="${empty user}">
		     	<a id="home" class="navbar-brand" href="/Snl/calendar.jsp">SNL</a> 
		     	</c:if>
			</div>        

				
			
			<ul class="nav navbar-nav navbar-right navbar-user">
				
				<c:if test="${! empty group}">		
							
				<li class="dropdown">
						<a class="dropdown-toggle" data-toggle="dropdown">내 그룹
						<b class="caret"></b></a>
						<ul class="dropdown-menu">
						
							<c:forEach var="groupArr" items="${groupArrListByUser}">
								<li>
									<a id="name" href="setGroupNo.do?groupNo=${groupArr.group.groupNo}&currentPage=${pageContext.request.servletPath}">
									${groupArr.group.groupName}</a>
								</li>
							
							</c:forEach>
							
						</ul>
						
						
						
					</li>
				</c:if>		
				
				
				  
				<c:if test="${! empty user}">		
					<li ><a href='addGroup.jsp'>Add Group</a></li>
				</c:if>
				  
			  <%if (session.getAttribute("user") != null) {%>
					<li class="dropdown">						
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">
							<span style="font-size:20px;" class="glyphicon glyphicon-user"></span><b class="caret"></b></a>
							
						
						
			<ul id="user" class="dropdown-menu" style="background-color:#2b3340;">
				<li>
					<div class="profile-userpic" align="center">
						<img src="http://www.localcrimenews.com/wp-content/uploads/2013/07/default-user-icon-profile.png" 
						style="width:120px;height:90px;" class="img-circle img-responsive" alt="">
					</div>
					
					<div class="profile-usertitle" style="text-align:center;">
						<div class="profile-usertitle-id">
							${user.id}
						</div>
						<div class="profile-usertitle-name">
							${user.userName}
						</div>
					</div>
	
					<div class="profile-userbuttons">
						<a href="getUser.do?userNo=${user.userNo}"><button type="button" class="btn btn-success btn-sm" style="width:82px;">Edit</button></a>
					<a href="logout.do">	<button type="button" class="btn btn-danger btn-sm">Logout</button></a>
					</div>
					
					<div class="profile-usermenu">
						<%-- <ul class="nav">
							<li>
								<a href="getUser.do?userNo=${user.userNo}"><i class="glyphicon glyphicon-user "></i>나의정보보기 </a>
							</li>
						</ul> --%>
					</div>
				</li>
			</ul>
				</li>
					<%}else{%>	
					
					<li><p class="navbar-text">Already have an account?</p></li>
					
					<li>
			          <a id="login" class="nabar-brand" href='login.jsp' onclick='login(this); return false;'>
			          <b>Login</b></a>
			        </li>
					<%}%>
            </ul>
            </div>
	</nav>
	
	</div>    
  		<div id="content">
		<div id="main" style="
    margin-left: 0px;
    padding-top: 150px;
    padding-bottom: 0px;
">
		<div class="login-container" style="margin-top: 0px;">   		

		<div class="row">
		<form role="form" action="/Snl/addUser.do?sgroupNo=<%=sgroupNo%>" method="post">
			<h2>회원가입</h2>
			<hr class="colorgraph">
			<div class="form-group">
				<input type="text" name="id" id="id" tabindex="1" class="form-control input-lg" placeholder="아이디" value="" required="">
				<div id="idInfo"  align="left"></div>
			</div>
			
			<div class="row">
  				<div class="col-xs-6 col-sm-6 col-md-6">
	  				<div class="form-group">
						<input type="password" name="pw" id="pw" tabindex="1" class="form-control input-lg" placeholder="패스워드">
					</div>
  				</div>
  				<div class="col-xs-6 col-sm-6 col-md-6">
  					<div class="form-group">
						<input type="password" name="confirm-password" id="confirm-password" tabindex="1" class="form-control input-lg"
						placeholder="패스워드 확인">
						<div id="pwInfo" align="left"></div>
					</div>
  				</div>
  			</div>

			<div class="form-group">
				<input type="text" name="userName" id="userName" tabindex="1" class="form-control input-lg" placeholder="이름">
			</div>
			<div class="form-group">
				<input type="email" name="email" id="email" tabindex="1" class="form-control input-lg" placeholder="이메일 주소">
				<div id="emailInfo"  align="left"></div>
			</div>
			<div class="form-group">
				<input type="text" name="tel" id="tel" tabindex="1" class="form-control input-lg" placeholder="전화번호" value="">
				<div id="telInfo"  align="left"></div>
			</div>	
			<hr class="colorgraph">
			<div class="row">
				<div class="col-md-12"><input type="submit" value="등록" class="btn btn-primary btn-block btn-lg" tabindex="7"></div>
			</div>
		</form>
	</div>
</div>

</div>
			</div>
	
	
	</body>

</html>
