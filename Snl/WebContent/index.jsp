<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">		
		<link href="css/bootstrap.min.css" rel="stylesheet">
	    <link href="css/leftmenu.css" rel="stylesheet">
	    <link  href="css/font-awesome.min.css" rel="stylesheet" />
	    <link href="http://netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet">
		
		<script type='text/javascript' src='http://code.jquery.com/jquery-1.11.1.min.js'></script> 
		<script src="js/login.js"></script>
    	
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
				fncGetCont("./addPayment.jsp");	
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
	
    <style>
    
    body {
    	
    }
    
    *{
    		margin: 0;
            padding: 0;
            border: 0;
            vertical-align: baseline;
     }
		
        #headernav {   	
        	width:100%; 
			height:100px;
			margin:0 auto; color:#ffffff;
        }
        
		#home {
			float:left; font-size:2em;
			padding-left:60px;
			color:white;
			font-weight:bold;
		}
		
		#login {
			float:right; font-size:1.2em;
			padding-right:100px; 
			color:white;
		}
		
		#group {
			float:right; font-size:1.2em;
			padding-ringt:100px; 
			color:white;
			border: 1px solid #3C3B3D; 
			border-radius: 1px;
		}
		
		#header {
			width:100%;
        	background-color:#353535;
        	height:50px; 
		}

	
		
		
        #content {
            width:100%; 
            hight:100%;
            overflow:hidden; 
            background-image:url('images/main.jpg');
        	background-repeat:no-repeat;
            background-size: cover;
            background-position:center;
            background-origin:content-box;
			opacity: 0.9!important; filter:alpha(opacity=30);
        }
        
   		#leftmenu {
        	height:1100px;
        	float:left; 
            box-sizing:border-box; 
        } 
        
        #main {
        	width:1067px;
        	height:1100px;
        	float:left;
        	box-sizing:border-box;
        	padding:50px;
        	
			
        }
        
        #rightmenu {
        	width:300px;
        	height:1100px;
        	float:left; 
            box-sizing:border-box; 
        }

        #footer  {
            width:100%; height:50px; margin:0px auto 0; background-color:#242424; color:#ffffff;
            text-align:center; line-height:50px;
            clear:both; border:0;
        }


    </style>
	
</head>
<body >
	<div id="header">
    	<nav class="navbar navbar-inverse">
		    <div class="navbar-header">
		     	<a id="home" class="navbar-brand" href="/Snl/index.jsp">SNL</a> 
			</div>        
			
			<ul class="nav navbar-nav navbar-right navbar-user">		
				   <li class="active"><a href='addGroup.html' onclick='addGroup(this); return false;'>+ Add Group</a></li>
				   <li><a href="list.html"  onclick='list(this); return false;'>Group1</a></li>
				   <li><a href="#">Group2</a></li>
				   <li><a href="#">Group3</a></li>
				   

				   
				<li><a id="login" class="navbar-brand" href='login.jsp'  onclick='login(this); return false;'><i class="fa fa-globe"></i> Login</a></li>
            </ul>
		</nav>
    </div>          
    
    <div id="content">

   	<div id="leftmenu" >	
  	  <nav class="navbar navbar-inverse sidebar" role="navigation">
    <div class="container-fluid">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">		
		
			<a class="navbar-brand" href="#">Menu</a>
		</div>
		
		<div class="collapse navbar-collapse" id="bs-sidebar-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li ><a href='calendar.html' onclick='paymentlist(this); return false;'>지출현황<span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-home"></span></a></li>
				<li ><a href='addPayment.jsp' onclick='addPayment(this); return false;'>지출추가<span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-user"></span></a></li>
				<li ><a href='jqGridSimple.jsp' onclick='stat1(); return false;'>통    계<span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-envelope"></span></a></li>


				<li class="dropdown">
						
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">
							그룹관리<span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-home"></span>
							<b class="caret"></b>
						</a>
						
						<ul class="dropdown-menu">
							<li><a href='paymentManager.jsp' onclick='paymentManager(this); return false;'>회비관리
								</a>
							</li>
							<li><a href="list.html"  onclick='list(this); return false;'>회원리스트</a></li>
						</ul>
				</li>
				
				<li ><a href="#">설    정<span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-user"></span></a></li>
				<li ><a href="#">Etc<span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-envelope"></span></a></li>
			</ul>
		</div>
	</div>
</nav>
    
    </div>
    	
    	<div id="main">
    		main
    	</div>
    	
    	<div id="rightmenu">
    		rightmenu
    	</div>
    </div>
    
             
	    
    <div id="footer">
        <div>footer</div>
    </div>
    
    <script type="text/javascript">
  
</script>
</body>
</html>