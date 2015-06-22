<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
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
	  <link href="jui/jui.min.css" rel="stylesheet">
	  <link href="css/user.css" rel="stylesheet">


		

		<!--  js -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<script src="js/login.js"></script>
		<script src="js/highchart/highstock.js"></script>
		<script src="js/highchart/highcharts-3d.js"></script>
		<script src="js/highchart/exporting.js"></script>
		<script src="js/highchart/no-data-to-display.js"></script>
		<script src="jui/jui.min.js"></script>
		<script src="js/highchart/sand-signika.js"></script>
		<!-- <script src="jquery.json-2.4.min.js"></script> -->
		
		<!-- <script>
		jui.ready([ "uix.table" ], function(table) {
		    table_1 = table("#table_1", {
		        data: [
		            { name: "기간내합계", amount: "275,000원"},
		            { name: "월간 평균", amount: "25,000원"}
		        ]
		    });
		});
		</script> -->
	</head>
	
	<body>
	

 		<jsp:include page="header.jsp"/>
    
  		<div id="content">

  	  	<jsp:include page="leftMenu.jsp"/>
    	
    	<div id="main">
    	<input type="hidden" id="groupNoHidden" name="groupNoHidden" value="${group.groupNo}"/>
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
	<span>
		<button type="button" id="duration" style="height:26px">조회</button>
		<button id="column" style="margin-left: 2em">Column</button>
		<button id="line">Line</button>
		<button id="area">Area</button>		
	</span>
	<div id="errMsg"></div>
	<!-- <div class="row">
			<div class="col-xs-1">
				<fieldset id="f_start" style="border:0; font-size:12px">시작일<br>
					<input type="text" id="start-date" style="width:72px">
				</fieldset>
			</div>
			<div class="col-xs-1">
				<fieldset>
					<br>~
				</fieldset>
			</div>
			<div class="col-xs-1">
				<fieldset id="f_end" style="border:0; font-size:12px">
					종료일<br>
					<input type="text" id="end-date" style="width:72px">
				</fieldset>
			</div>
			<div class="col-xs-1">
				<fieldset><br>
					<button type="submit" id="duration" style="height:26px">조회</button>
				</fieldset>
			</div>
	</div> -->

<div id="container"></div>
<div class="jui">
		<table id="table_1" class="table table-classic">
		    <thead>
		    <tr align=center>
		        <th></th>
		        <th>지출비용</th>
		    </tr>
		    </thead>
		    <tbody></tbody>
		</table>
<script data-jui="#table_1" data-tpl="row" type="text/template">
    <tr align=center>
        <td><!= name !></td>
        <td><!= amount !></td>
    </tr>
</script>
</div>




    	</div>
	
		<jsp:include page="rightMenu.jsp"></jsp:include>
    
    </div>
    
             
	    
	<jsp:include page="footer.jsp"/>
	<script src="js/graph.js"></script>
	</body>

</html>
