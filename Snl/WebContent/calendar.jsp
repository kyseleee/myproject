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
    <input type="hidden" id="leaderNo" value="${group.user.userNo}"/>
    <input type="hidden" id="userNo" value="${user.userNo}"/>
    
 		<jsp:include page="header.jsp"/>
  		<div id="content">
  	  	<jsp:include page="leftMenu.jsp"/>
    
    	
    	<div id="main">
    	<h3 style="color: #8772bf; border-bottom: 1px solid #eee; padding-bottom: 10px; margin-top: 0px; font-weight:bold"> 지출현황  </h3><br/>

    		<div class="panel-body" id='calendar'></div>
    	
    		<div id="event" title="dialog">
    				<div id="eventContent"></div>
    		</div>
    		
    		<div id="addPayment" title="지출추가">
    			<div id="addPaymentContent"></div>
	    		
						
    		</div>
    		
    	</div>
	
		<jsp:include page="rightMenu.jsp"></jsp:include>>
    
    </div>
    
             
	    
	<jsp:include page="footer.jsp"/>
	
	<script src='fullcalendar/calendar.js'></script>
	
	</body>

</html>
