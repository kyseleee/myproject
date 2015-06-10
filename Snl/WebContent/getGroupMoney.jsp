<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:if test="${! empty param.sendMail}">
	<script type="text/javascript">
		alert("메일이 성공적으로 되었습니다.");	
	</script>	
</c:if>

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

		function sendTel(tel){
			alert(tel+"번호로로 회비 납부 안내 문자를 보내겠습니까?");
			location.href="gmSendTel.do?tel="+tel;
		}	
		
		function sendEmail(email){
			alert(email+"주소로 회비 납부 안내 메일을 보내겠습니까?");
			location.href="gmSendMail.do?email="+email;
		}		
				
		function paidCheck(userName, gmPrice, userNo, gmNo){
			alert("되라잉");
			alert(userName+"님이 회비 "+gmPrice+"원을 수납하였습니까?");
			location.href="updateGmPaid.do?gmNo="+gmNo+"&userNo="+ userNo;
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
                <h3 class="panel-title">${groupMoney.gmName} ( ${groupMoney.gmDate.substring(0,10)} / ${groupMoney.gmPrice}원)</h3> 
            </div>			
				<div class="panel panel-default" style="margin-bottom: 0px;">
					
					<table class="table table-striped table-bordered" align="center">
						<thead>
						
							
							<tr align="center">
								<td><b>No.</td>
								<td><b>이름</td>
								<td><b>연락처</td>
								<td><b>이메일</td>
								<td><b>수납확인</td>								
							</tr>
							
						</thead>
						<tbody >
							<c:set var="i" value="0"/>
							
							<c:forEach var="gmPaid" items="${gmPaidList}">
								<c:set var="i" value="${i+1}"/>
								<tr align="center">
									<td vertical-align="middle">${i}</td>
									<td>${gmPaid.user.userName}</td>
									<td>${gmPaid.user.tel}
										<c:if test="${gmPaid.paid eq 'N'}">
										<button type="button" class="btn btn-default btn-sm" onclick="sendTel('${gmPaid.user.tel}')">
  										<span class="glyphicon glyphicon-send" aria-hidden="true"></span>
										</button>										
										</c:if>
									</td>
									<td>${gmPaid.user.email}
										<c:if test="${gmPaid.paid eq 'N'}">
										<button type="button" class="btn btn-default btn-sm" onclick="sendEmail('${gmPaid.user.email}')">
  										<span class="glyphicon glyphicon-envelope" aria-hidden="true"></span>
										</button>										
										</c:if>
										
									</td>
									<c:if test="${gmPaid.paid eq 'Y'}">
										<td>수납완료</td>
									</c:if>
									<c:if test="${gmPaid.paid eq 'N'}">
										<td id="paidCheckTh${i}">										
 											<button id="paidCheck${i}" class="btn btn-info btn-sm" onclick="paidCheck('${gmPaid.user.userName}',${groupMoney.gmPrice},${gmPaid.user.userNo},${gmPaid.groupMoney.gmNo})">
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
