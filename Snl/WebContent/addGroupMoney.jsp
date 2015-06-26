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
	    <style type="text/css">
	    
			.jumbotron-flat {
			  background-color: solid #4DB8FFF;
			  height: 100%;
			  border: 1px solid #4DB8FF;
			  background: white;
			  width: 100%;
			  text-align: center;
			  overflow: auto;
			}
			
			.paymentAmt {
			    font-size: 80px; 
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
    	
    	
    	
       	<h3 style="color: #8772bf; border-bottom: 1px solid #eee; padding-bottom: 10px; margin-top: 0px;"> 회비추가  </h3>
		<br/>
		<br/>
		<br/>
    	
 		<form action="/Snl/addGroupMoney.do" id="payment-form" method="post">
 			 
		<div class='form-row'>
			<div class='col-xs-3'></div>
			<div class='col-xs-6 form-group required'>
                <label class='control-label'>회비명</label>
                <input class='form-control' size='4' type='text' name='gmName'>
            </div>
      <div class='col-xs-3'></div>
        </div>
        <div class='form-row'>
              <div class='col-xs-12 form-group card required'>
                  <label class='control-label'>1인 회비금액</label>
                <input autocomplete='off' class='form-control card-number' size='20' type='text' name='gmPrice'>
              </div>
        </div>
           
        <div class='form-row'>
              <div class='col-xs-12 form-group card required'>
                <label class='control-label'>날짜</label>
                <input autocomplete='off' class='form-control' size='20' type='date' name='gmDate'>
              </div>
        </div>
        <div class='form-row'>
              <div class='col-xs-12 form-group card required' style="margin-top: 30px;">
              	<button class='form-control addbtn submit-button' type='submit' > 추가</button>        
              </div>
        </div>

        </form>
        </div>   
        </div>

</div>
    	
    	
    	
    	
    	
    	
    	</div>
	
    
    </div>
    
             
	    
	<jsp:include page="footer.jsp"/>
	
	</body>

</html>
