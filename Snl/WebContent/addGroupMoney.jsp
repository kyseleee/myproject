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
			<div class="col-sm-12">
				<h2 align="center">${groupNo}회비 추가 </h2>
				<div>
				<form id="register-form" action="/Snl/addGroupMoney.do?groupNo=10040" method="post">
					<div class="panel-body form-horizontal payment-form">
						<div class="form-group" style="margin-bottom: 40px">
							<label for="concept" class="col-sm-3 control-label">회비명</label>
							<div class="col-sm-6">
								<input type="text" class="form-control" id="gmName" name="gmName" placeholder="이름을 입력하세요" style="width: 40%">
							</div>
						</div>

						<div class="form-group" style="margin-bottom: 40px">
							<label for="date" class="col-sm-3 control-label">날짜</label>
							<div class="col-sm-8">
								<input type="date" class="form-control" id="gmDate" name="gmDate" style="width: 40%">
							</div>
						</div>

						<div class="form-group" style="margin-bottom: 40px">

							<div class="col-sm-4">
								<label for="text" class="col-sm-3 control-label">개인회비</label> 
								<p>
								<input type="text" onchange="getNumber(this);" onkeyup="getNumber(this);" class="form-control" id="gmPrice" name="gmPrice" placeholder="숫자만 입력가능" style="width: 150px">
								원</p>
							</div>
						</div>
						
					</div>
					
			

			<div class="row">
				<div align="center" style="padding-bottom: 15px;">
					<button type="submit" class="btn btn-default preview-add-button" id="register-submit" name="register-submit">저장</button>
					<button class="btn btn-info btn-pressure btn-sensitive">취소</button>
				</div>
			</div>
			</form>
				</div>
			</div>
		</div>

	
    	
    	</div>
	
		<jsp:include page="rightMenu.jsp"></jsp:include>>
    
    </div>
    
             
	    
	<jsp:include page="footer.jsp"/>
	
	</body>

</html>
