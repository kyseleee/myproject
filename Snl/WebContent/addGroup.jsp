<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
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
		<script src="js/addGroup.js"></script>
		<script src="js/login.js"></script>
		

		
	</head>
  

<body>

	<!-- head -->
	<jsp:include page="header.jsp"/>
	 <div id="content">
	 	<!-- leftMenu -->
  	  	<jsp:include page="leftMenu.jsp"/>
    
    	
    	<div id="main">
    	
    		<div class="col-sm-12">
	   <legend><strong>그룹추가</strong></legend>
	</div>
	   <!-- panel preview -->
	     
	<div class="col-sm-1"></div>
	<div class="col-sm-9">
		<div class="panel-default">
			<form id="register-form" action="/Snl/addGroup.do" method="post">
		     <div class="panel-body form-horizontal payment-form">
		         <div class="form-group">
		             <label for="concept" class="col-sm-2 control-label">그룹명</label>
		             <div class="col-sm-6">
		                 <input type="text" name="groupName" id="groupName" class="form-control">
		             </div>
		         </div>
		      </div>   
		  
			  <h4>초대 리스트</h4>
			  <hr style="border:1px dashed #dddddd;">
		      <br>
		      <div class="form-group payment-form2">
			  	<label for="description" class="col-sm-2 control-label">Email 주소</label>
			    	<div class="col-sm-6">
			        	<input type="text" class="form-control" id="description" name="description">
		            </div>
		            <div class="col-sm-3 text-right">
	        	        <button type="button" class="btn btn-default preview-add-button">
		                    <span class="glyphicon glyphicon-plus"></span> 초대리스트 추가
		                </button>
		            </div>
	          	</div> 
		        <h3></h3>
		        <div class="row">
		            <div class="col-xs-12" >
		                <div class="table-responsive">
		                    <table class="table preview-table" id=preview>
		                        <thead>
	                            <tr></tr>
		                        </thead>
		                        <input type="hidden" id="sendMsg" name="sendMsg">
		                        <tbody></tbody> <!-- preview content goes here-->
				            </table>
				        </div>                            
				    </div>
				</div>
				<div class="row text-right">
			    	<div class="col-xs-12">
			   			<h4>총: <strong><span class="preview-total"></span></strong>명</h4>
			  		</div>
				</div>
	
				<div class="row">
					<hr style="border:1px dashed #dddddd;">
					<div class="col-xs-4"></div>
	 				<div class="col-xs-4">		            	    
	                    <input type="submit"  onclick="fnc(); retrun false;" 
	                    		class="btn addbtn btn-block" name="register-submit" id="register-submit" tabindex="4" value="초대장발송">
	    			</div>
	        		<div class="col-xs-4"></div>                
    			</div>
    			</form>
    	 	</div>     
		</div> <!-- / panel preview -->
 
		<div class="col-sm-2"></div>
    		
    		
    		
    	</div>
    	    		
    </div>
    <jsp:include page="footer.jsp"/>
	
	
	

</body>
</html>