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
		<link href="css/listPayment.css" rel="stylesheet">

		<!--  js -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<script src="js/login.js"></script>
			

		
	</head>
	
	<body>
		<input type="hidden" id="groupNoHidden" name="groupNoHidden" value="${group.groupNo}"/>

 		<jsp:include page="header.jsp"/>
    
  		<div id="content">

  	  	<jsp:include page="leftMenu.jsp"/>
    	
    	<div id="main">
    	
				<!-- <div class="container"> -->
				    <h3>The columns titles are merged with the filters inputs thanks to the placeholders attributes</h3>
				    <hr>
				    <div class="row">
				        <div class="panel panel-primary filterable">
				            <div class="panel-heading">
				                <h3 class="panel-title" align="center">지 출 내 역</h3>
				                <div class="pull-right">
				                    <button class="btn btn-default btn-xs btn-filter"><span class="glyphicon glyphicon-filter"></span> Filter</button>
				                </div>
				            </div>
				            <table class="table" style="text-align:center;">
				                <thead>
				                    <tr class="filters">
				                        <th><input type="text" style="text-align:center;" class="form-control" placeholder="#" disabled></th>
				                        <th><input type="text" style="text-align:center;" class="form-control" placeholder="결제수단" disabled></th>
				                        <th><input type="text" style="text-align:center;" class="form-control" placeholder="날    짜" disabled></th>
				                        <th><input type="text" style="text-align:center;" class="form-control" placeholder="상 호 명" disabled></th>
				                        <th><input type="text" style="text-align:center;" class="form-control" placeholder="금    액" disabled></th>				                    
				                        <th><input type="text" style="text-align:center;" class="form-control" placeholder="영 수 증" disabled></th>				                    </tr>
				                </thead>
				                <tbody>
				                    
				                </tbody>
				            </table>
				        </div>
				    </div>
				<!-- </div> -->


    	</div>
	
		<jsp:include page="rightMenu.jsp"></jsp:include>
    
    </div>
    
             
	    
	<jsp:include page="footer.jsp"/>
	<script src="js/listPayment.js"></script>
	</body>

</html>
