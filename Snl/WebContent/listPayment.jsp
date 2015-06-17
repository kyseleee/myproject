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

		<script>
$(document).ready(function(){
		$.ajax({
			url : './listPaymentByDayDuration.do',
			data : {startDate : "2015-01-01", endDate : "2015-06-01"},
			dataType : 'json',
			method : 'POST',
			success : function(data){
				alert(data);
				var receiptLink;
				for(var i=0;i<data.length;i++){
					data[i].method=decodeURIComponent(data[i].method);
					data[i].payName=decodeURIComponent(data[i].payName);
		
					
					if(data[i].receit=='-') {				
						receiptLink=data[i].receit;
					}
					else {
						receiptLink='<a href="http://192.168.200.122:8080/Snl/'+data[i].receit+'" onclick="popup(this.href); return false;">'+data[i].receit+'</a>';
					}
					
				}
				alert("before"+data[0].payName);
				
				var data1 = JSON.stringify(data);
				/* lll */
				jui.ready([ "uix.table" ], function(table) {
		    table_7 = table("#table_7", {
		        fields: [ "payDate", "payName", "amount", "method", "receipt" ],
		        data: data,
		        resize: true,
		        sort: [ 0, 1, 2 ],
		        scroll: true,
		        scrollHeight: 150,
		        event: {
		            sort: function(column, e) {
		                var className = {
		                    "desc": "icon-arrow1 icon-white",
		                    "asc": "icon-arrow3 icon-white"
		                }[column.order];

		                $(column.element).children("i").remove();
		                $(column.element).append("<i class='" + className + "'></i>");
		            }
		        }
		    });
		});
				
				/* 111 */
			},
			error:function() {
				alert("error");
			}
			
		});
		
		
		
		
		
		
});
		</script>
	</head>
	
	<body>
		<input type="hidden" id="groupNoHidden" name="groupNoHidden" value="${group.groupNo}"/>

 		<jsp:include page="header.jsp"/>
    
  		<div id="content">

  	  	<jsp:include page="leftMenu.jsp"/>
    	
    	<div id="main" class="jui">
    	<table id="table_7" class="table table-classic table-stripeless">
    <thead>
    <tr>
        <th>payDate</th>
        <th>payName</th>
        <th>amount</th>
        <th>method</th>
        <th>receipt</th>
    </tr>
    </thead>
    <tbody></tbody>
</table>

<script data-jui="#table_7" data-tpl="row" type="text/template">
    <tr>
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
