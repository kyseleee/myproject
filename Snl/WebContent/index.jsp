<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link href="css/bootstrap.min.css" rel="stylesheet">
	
		<script type='text/javascript' src='http://code.jquery.com/jquery-1.8.0.min.js'></script> 
		<script src="js/login.js"></script>
		<link rel="stylesheet" href="css/style.css" />
	
		<script type='text/javascript'> 
		
			
			function fncGetCont(url) 
			{ 
			     $.ajax({ 
			            type        : 'POST' 
			            ,url        : url 
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
			

			function login()
			{
				fncGetCont("./login.jsp");	
			}

			
			function paymentManager()
			{
				fncGetCont("./paymentManager.jsp");
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
			
		
		
			
		</style>
		
	

	</head>
	
	<body>
	
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
			      <a class="navbar-brand" href="/Snl/index.jsp"><font color="#5FB0E4">SNL</font></a>
			    </div>
			
			    <!-- Collect the nav links, forms, and other content for toggling -->
			    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			     
			      <ul class="nav navbar-nav navbar-right" style="margin-right: 150px;">
			      	<li class="active">
			            	<a href='calendar.html' onclick='paymentlist(this); return false;'>������Ȳ</a> 
					</li>
					<li>
			            	<a href='addPayment.html' onclick='addPayment(this); return false;'>�����߰�</a> 
					</li>
			        <li>
			            	<a href='jqGridSimple.jsp' onclick='stat1(); return false;'>���</a> 
			        </li>
			       								        
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">
						�׷����
						<b class="caret"></b>
						</a>
						<ul class="dropdown-menu">
							<li><a href='paymentManager.jsp' onclick='paymentManager(this); return false;'>ȸ�����</a></li>
							<li><a href="list.html"  onclick='list(this); return false;'>ȸ������Ʈ</a></li>
						</ul>
					</li>
			        <li>
			        	<a href="#">����</a>
			        </li>
			        <li>
			        	<a href='login.jsp'  onclick='login(this); return false;'>�α���</a>
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
			<div id="leftmenu">
			

				<ul class="nav nav-pills nav-stacked">
				   <li class="active"><a href="list.html"  onclick='list(this); return false;'>Group1</a></li>
				   <li><a href="#">Group2</a></li>
				   <li><a href="#">Group3</a></li>
				   <li><a href='addGroup.html' onclick='addGroup(this); return false;'>+ Add Group</a></li>

				   
				</ul>
			
			</div>
			
			<div>

				
				<div id="main">
				</div>
				
			</div>
			

		</div>
		<div id="footer">footer</div>
	</body>

</html>
