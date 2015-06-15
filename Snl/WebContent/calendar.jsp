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
		<link rel='stylesheet' href='fullcalendar/lib/cupertino/jquery-ui.min.css' />
		<link href='fullcalendar/fullcalendar.css' rel='stylesheet' />
		<link href='fullcalendar/fullcalendar.print.css' rel='stylesheet' media='print' />
		<link href="css/user.css" rel="stylesheet">
		
		<!--  js -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<script src="js/login.js"></script>
		<script src='fullcalendar/lib/moment.min.js'></script>
		<script src='fullcalendar/fullcalendar.min.js'></script>
		<script src="js/addPayment.js"></script>
		<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
		
		
	</head>
	
	<body>
	
    <input type="hidden" id="groupNoHidden" name="groupNoHidden" value="${group.groupNo}"/>
    
 		<jsp:include page="header.jsp"/>
    
  		<div id="content">
  	  	<jsp:include page="leftMenu.jsp"/>
    
    	
    	<div id="main">
    	

    		<div class="panel-body" id='calendar'></div>
    	
    		<div id="event" title="dialog">
    				<div id="eventContent"></div>
    		</div>
    		
    		<div id="addPayment" title="지출추가">
    			<div id="addPaymentContent"></div>
	    		<%-- <form id="addPay-form" action="addPayment.do?groupNo=${groupNo}" method="POST" enctype="multipart/form-data"> 
			            	<div class="form-group">
		                        <label for="payMethod" class="col-sm-3 control-label">결제수단</label>
		                        <div class="col-sm-9" style="vertical-align:middle;">
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
	                  	</form> --%>
						
    		</div>
    		
    	</div>
	
		<jsp:include page="rightMenu.jsp"></jsp:include>>
    
    </div>
    
             
	    
	<jsp:include page="footer.jsp"/>
	<script src='fullcalendar/calendar.js'></script>
	
	</body>

</html>
