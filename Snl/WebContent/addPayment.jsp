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
		<script src="js/addPayment.js"></script>
		

		
	</head>
	
	<body>
	

 		<jsp:include page="header.jsp"/>
    
  		<div id="content">
    
    	<input type="hidden" id="groupNoHidden" name="groupNoHidden" value="${group.groupNo}"/>
    	<div id="main">
    	
    	<div class="row">
    	    <jsp:include page="leftMenu.jsp"/>
    	
            <legend><b>지출 추가</b></legend>
  
            <div class="panel-default">
                <div class="panel-body form-horizontal payment-form">
                	<form id="addPay-form" action="addPayment.do" method="POST" enctype="multipart/form-data"> 
		            	
		            	<div class="form-group">
	                        <label for="payMethod" class="col-sm-3 control-label">결제수단</label>
	                        <div class="col-sm-9">
	                            <select class="form-control" id="method" name="method">
	                                <option>신용카드</option>
	                                <option>현    금</option>
	                            </select>
	                        </div>
	                    </div> 
	                  
	                    <div class="form-group">
	                        <label for="date" class="col-sm-3 control-label">날     짜</label>
	                        <div class="col-sm-9">
	                            <input type="date" class="form-control" id="payDate" name="payDate">
	                            <div id="dateErr"></div>
	                        </div>
	                    </div>   
	                    
	                    <div class="form-group">
	                        <label for="amount" class="col-sm-3 control-label">상  호  명</label>
	                        <div class="col-sm-9">
	                            <input type="text" class="form-control" id="payName" name="payName">
	                            <div id="payNameErr"></div>
	                        </div>
	                    </div>
	                    
		                <div class="form-group">
	                        <label for="description" class="col-sm-3 control-label">금      액</label>
	                        <div class="col-sm-9">
	                            <input type="text" class="form-control" id="amount" name="amount">
	                            <div id="amountErr"></div>
	                            <!-- <input type="hidden" value="" id="receit" name="receit"/> -->
	                        </div>
		                </div>
		                
						<div class="form-group">
	                        <label for="concept" class="col-sm-3 control-label">영  수  증</label>
	                        <div class="col-sm-9">
	                        		<input type="file" id="file" name="file"/>
	                        </div>
	                    </div>
	                    
							<div class="form-group">
											<div class="form-group text-center">
													<label for="txtMsg"> 지출내역 문자발송</label>
	                     		<input type="checkbox" tabindex="3" class="" name="txtMsg" id="txtMsg" value="y">
	                     </div>
							</div>
                  	</form>
                  
            <!-- 
            	<form id="uploadFile" action="fileUpload.do" method="POST" enctype="multipart/form-data">  
                    <div class="form-group">
                        <label for="concept" class="col-sm-3 control-label">영  수  증</label>
                        
                        <div class="col-sm-9">
                        		
                        		<input type="file" id="file" name="file"/>
                        		
                            <input type="submit" class="btn btn-default preview-add-button" value="영수증 찾기">
                        </div>
                    </div>
				</form>
			 -->
								
                    <div class="form-group">
                        <div class="col-sm-12 text-right">
                            <input type="button" onclick="getFile()" class="btn btn-default preview-add-button" value="입력완료">
                                
                        </div>
                    </div>
                
                </div>
            </div>            
        </div>
        
			
			
			</div>
    	
    	</div>
	
    
    
	    
	<jsp:include page="footer.jsp"/>
	
	</body>

</html>
