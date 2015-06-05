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
	    <link href="css/groupMoney.css" rel="stylesheet">
	    <link href="css/user.css" rel="stylesheet">
		

		<!--  js -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<script src="js/login.js"></script>
		
		<script type="text/javascript">
		
		function paidCheck(i,userNo,gmNo){
			var th = "paidCheckTh";
			var num = i;
			var thNuM = th.concat(num);
			document.getElementById(thNuM).innerHTML = "수납완료";
			var userNo =userNo;
			var gmNo =gmNo;
					
		

 			$.ajax({
				type : "POST",
				url : "./paidCheck.do",
				data : { userNo : userNo, gmNo : gmNo}
			});
			
		}
		</script>
		
	</head>
	
	<body>

 		<jsp:include page="header.jsp"/>
    
  		<div id="content">
  	  	<jsp:include page="leftMenu.jsp"/>
    
    	
    	<div id="main">
    	

        <div class="panel panel-primary" style="margin-top: 40px;">
    				
            <div class="panel-heading">
                <h3 class="panel-title">${groupMoney.gmName} ( ${groupMoney.gmDate} / ${groupMoney.gmPrice} )</h3> 
            </div>			
				<div class="panel panel-default" style="margin-bottom: 0px;">
					
					<table class="table table-striped table-bordered" align="center">
						<thead>
						
							
							<tr>
								<th>No.</th>
								<th>이름</th>
								<th>연락처</th>
								<th>이메일</th>
								<th>수납확인</th>								
							</tr>
							
						</thead>
						<tbody>
							<c:set var="i" value="0"/>
							
							<c:forEach var="gmPaid" items="${gmPaidList}">
								<c:set var="i" value="${i+1}"/>
								<tr>
									<td>${i}</td>
									<td>${gmPaid.user.userName}</td>
									<td>${gmPaid.user.tel}</td>
									<td>${gmPaid.user.email}</td>
									<c:if test="${gmPaid.paid eq 'Y'}">
										<td>수납완료</td>
									</c:if>
									<c:if test="${gmPaid.paid eq 'N'}">
										<td id="paidCheckTh${i}">
										<button id="paidCheck${i}" class="btn btn-default" onClick="paidCheck(${i},${gmPaid.user.userNo},${gmPaid.groupMoney.gmNo})">
											수납확인
										</button>
										</td>
									
									</c:if>									
								</tr>
							
							</c:forEach>
							
							</tbody>
						</table>
					
				</div> <!-- /widget-content -->
			
			</div> <!-- /widget -->
    		
    
		    <div class="row">
		    	<div align="center">
		    			<a href="groupMoneyView.do"><button class="btn btn-primary btn-pressure btn-sensitive">확인</button></a>
		                <button class="btn btn-default btn-pressure btn-sensitive">취소</button>
		        </div>
		    </div>
    	
    	
    	</div>
	
		<jsp:include page="rightMenu.jsp"></jsp:include>
    
    </div>
    
             
	    
	<jsp:include page="footer.jsp"/>
	
	</body>

</html>
