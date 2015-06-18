<%@ page contentType="text/html; charset=euc-kr" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">	

<link rel="stylesheet" href="/css/admin.css" type="text/css">
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


		</style>
		
<script type="text/javascript">
		

		$(document).ready(function(){
			
			
			 $("#id").blur(function(){
				var idv = $("input[name=id]").val();
				 
				if(idv == ""){
					var msg = "<font color='red'>�ʼ��Է��Դϴ�.</font>";
		    		document.getElementById("idInfo").innerHTML= msg;
				}else{ 
				 
					$.ajax({
				        type:"POST",
				        url:"./getUserById.do",
				        data : {id : idv },
				        success: function(responseData){
				        	var data = JSON.parse(responseData);
				        	
				        	if(data.result == "true"){
				        		var msg = "<font color='blue'>��� ������ ���̵� �Դϴ�.</font>";
				        	}
				        	else{
								var msg = "<font color='red'>�̹� ������� ���̵� �Դϴ�.</font>";
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
						var msg = "<font color='red'>�ʼ��Է��Դϴ�.</font>";
			    		document.getElementById("emailInfo").innerHTML= msg;
					}else{ 
					 
						$.ajax({
					        type:"POST",
					        url:"./getUserByEmail.do",
					        data : {email : iemail},
					        success: function(responseData){
					        	var data = JSON.parse(responseData);
					        	
					        	if(data.result == "false"){
									var msg = "<font color='red'>�̹� ���Ե� �̸��� �Դϴ�.</font>";
					        	}
					        	else{
									var msg = "<font color='blue'>��밡���� �̸��� �Դϴ�.</font>";
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
						var msg = "<font color='red'> ��й�ȣ�� ��ġ���� �ʽ��ϴ�.</font>";
					}else{ 
						var msg = "<font color='blue'> ��й�ȣ�� ��ġ�մϴ�.</font>";						
					}
		    		document.getElementById("pwInfo").innerHTML= msg;

			});
			
			
			$("#tel").focus(function(){
				document.getElementById("telInfo").innerHTML= "<font color='blue'> ���ڸ� �Է��ϼ���. ��)01011111111</font>";
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


<jsp:include page="header.jsp"/>
    
  		<div id="content">
  	  	<jsp:include page="leftMenu.jsp"/>
    
    	
    	<div id="main">

<div class="login-container" style="margin-top: 0px;">   		

		<div class="row">
<form role="form" action="updateUser.do" method="post">

 <input type="hidden" name="id" value="${user.id}"> 
<input type="hidden" name="email" value="${user.email}"> 
			<h2>�������� ����</h2>
			<hr class="colorgraph">
			
			<div class="row">
			<div class="col-xs-4 col-sm-4 col-md-4">
				<p style="font-size:20px; font-weight: bold; float:left; padding: 8px; padding-left:20px;">�н�����</p>
			</div>
  				<div class="col-xs-6 col-sm-6 col-md-6">
	  				<div class="form-group">
						<input type="password" name="pw" id="pw" tabindex="1" class="form-control input-lg" value="${user.pw}" placeholder="�н�����">
					</div>
  				</div>
  				
  			</div>


			<div class="row">
			<div class="col-xs-4 col-sm-4 col-md-4">
				<p style="font-size:20px; font-weight: bold; float:left; padding: 8px; padding-left:20px;">�н����� Ȯ��</p>
			</div>
			<div class="col-xs-6 col-sm-6 col-md-6">
  					<div class="form-group">
						<input type="password" name="confirm-password" id="confirm-password" tabindex="1" class="form-control input-lg"
						value="${user.pw}" placeholder="�н����� Ȯ��">
						<div id="pwInfo" align="left"></div>
					</div>
  				</div>
			</div>
			
			
			<div class="row">
			<div class="col-xs-4 col-sm-4 col-md-4">
				<p style="font-size:20px; font-weight: bold; float:left; padding: 8px; padding-left:20px;">�̸�</p>
			</div>
			<div class="col-xs-6 col-sm-6 col-md-6">
  					<div class="form-group">
				<input type="text" name="userName" id="userName" tabindex="1" class="form-control input-lg" value="${user.userName}" placeholder="�̸�">
						<div id="pwInfo" align="left"></div>
					</div>
  				</div>
			</div>
			
			<div class="row">
			<div class="col-xs-4 col-sm-4 col-md-4">
				<p style="font-size:20px; font-weight: bold; float:left; padding: 8px; padding-left:20px;">�̸��� �ּ�</p>
			</div>
			<div class="col-xs-6 col-sm-6 col-md-6">
  					<div class="form-group">
				<input type="email" name="email" id="email" tabindex="1" class="form-control input-lg" value="${user.email}" placeholder="�̸��� �ּ�" disabled="disabled">
						<div id="pwInfo" align="left"></div>
					</div>
  				</div>
			</div>
			
			<div class="row">
			<div class="col-xs-4 col-sm-4 col-md-4">
				<p style="font-size:20px; font-weight: bold; float:left; padding: 8px; padding-left:20px;">��ȭ��ȣ</p>
			</div>
			<div class="col-xs-6 col-sm-6 col-md-6">
  					<div class="form-group">
				<input type="text" name="tel" id="tel" tabindex="1" class="form-control input-lg" value="${user.tel}" placeholder="��ȭ��ȣ" value="">
						<div id="pwInfo" align="left"></div>
					</div>
  				</div>
			</div>
			<hr class="colorgraph">
			<div class="row">
				<div class="col-md-6"><input type="submit" value="Ȯ��" class="btn btn-primary btn-block btn-lg" tabindex="7"></div>
				<div class="col-md-6"><a href="index.jsp"><input type="submit" value="���" class="btn btn-primary btn-block btn-lg" tabindex="7"></a></div>
			</div>
		</form>
	</div>
	</div>

</div>
</div>

</body>
</html>
