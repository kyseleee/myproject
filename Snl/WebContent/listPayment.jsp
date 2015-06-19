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
		<link href="jui/jui.min.css" rel="stylesheet">	

		<!--  js -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<script src="js/login.js"></script>
		<script src="jui/jui.min.js"></script>
    <script src="js/listPayment.js"></script>
    
		
	</head>
	
	<body>
		<input type="hidden" id="groupNoHidden" name="groupNoHidden" value="${group.groupNo}"/>

 		<jsp:include page="header.jsp"/>
    
  		<div id="content">

  	  	<jsp:include page="leftMenu.jsp"/>
    	
    	<div id="main" class="jui">
    	<span>
		시작일&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp; 종료일<br>
		<input type="text" id="startDate" name="startDate" style="width:72px">
	</span>
	<span>
					~
	</span>
	<span>
		<input type="text" id="endDate" name="endDate" style="width:72px">
	</span>
    <div id="errMsg"></div>
    제목검색<br>
    <span>
		    <input type="text" id="startDate" name="startDate" style="width:165px">
		    <button type="button" id="duration" style="height:26px">조회</button>
    </span>
    
    	<table id="table_7" class="table table-classic table-stripeless">
    <thead>
    <tr align=center>
        <th>지출날짜</th>
        <th>지출내용</th>
        <th>금    액</th>
        <th>결제수단</th>
        <th>영 수 증</th>
    </tr>
    </thead>
    <tbody></tbody>
</table>

<script data-jui="#table_7" data-tpl="row" type="text/template">
    <tr align=center>
        <td><!= payDate !></td>
        <td><!= payName !></td>
        <td><!= amount !></td>
        <td><!= method !></td>
        <td><!= receipt !></td>
    </tr>
</script>
				<!-- <div class="container"> -->
				    
				<!-- </div> -->

    	</div>
	
		<jsp:include page="rightMenu.jsp"></jsp:include>
    
    </div>
    
             
	    
	<jsp:include page="footer.jsp"/>
	</body>

</html>
