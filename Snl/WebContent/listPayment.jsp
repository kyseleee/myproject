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
    	<h3 style="color: #8772bf; border-bottom: 1px solid #eee; padding-bottom: 10px; margin-top: 0px;"> 지출검색</h3><br/>
    		<!-- <div class="col-md-3"></div>
    		<div class="col-md-9" >
    		
		    	<div class="vgroup" style="background-color:blue; float:right;">
		          <div class="group">
			          <label class="label label-pur" style="width:160px"><i class="icon-calendar icon-large"></i>  시작일</label>
			          <label class="label label-pur" style="width:160px"><i class="icon-calendar icon-large"></i>  종료일</label>
			          <label class="label label-pur" style="width:175px"><i class="icon-calendar icon-large"></i>  제목검색</label>
		          </div>
		          <div class="group">
			          <input type="date" id="startDate" name="startDate" class="input " >
			          <input type="date" id="endDate" name="endDate" class="input " >
			          <input type="text" id="search" name="search" class="input " >
						    <a class="btn btn-purple-black" id="duration">
						    <i class="icon-search icon-large icon-bounce"></i>
						    검  색</a>
			        </div>
			     </div>
			 </div> -->
			 
		<div class="group">
			<label class="label label-pur" style="width:160px"><i class="icon-calendar icon-large"></i>  시작일</label>
			<label class="label label-pur" style="width:160px"><i class="icon-calendar icon-large"></i>  종료일</label>
			<label class="label label-pur" style="width:175px"><i class="icon-calendar icon-large"></i>  제목검색</label>
		</div>
		
		<div class="group">
			<input type="date" id="startDate" name="startDate" class="input " >
			<input type="date" id="endDate" name="endDate" class="input " >
			<input type="text" id="search" name="search" class="input " >
			<a class="btn btn-purple-black" id="duration">
			<i class="icon-search icon-large icon-bounce"></i>
			검  색</a>
		</div>
		
		
    <div id="errMsg" style="height:30px"></div>
  
  		<div style="height:30px"></div>
    	<table id="table_7" class="table table-classic table-stripe">
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

<div id="win_1" class="window">
    <div class="head">
        <div class="left">HOME</div>
        <div class="right">
            <a href="javascript:alert('plus');"><i class="icon-plus icon-white"></i></a>
            <a href="javascript:alert('search');"><i class="icon-search icon-white"></i></a>
            <a href="#" class="close"><i class="icon-exit icon-white"></i></a>
        </div>
    </div>
    <div class="body">
        Contents...<br/>
    </div>
</div>

<!-- <button class="btn btn-gray" onclick="win_1.show()">
    <i class="icon-play"></i> Run
</button> -->


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
