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
		

		
	</head>
	
	<body>
	

 		<jsp:include page="header.jsp"/>
    
  		<div id="content">
  	  	<jsp:include page="leftMenu.jsp"/>
    
    	
    	<div id="main">
    	

		<h3 align="center">< 회비내역 리스트 ></h3><h3 align="right"><a href="addGroupMoney.jsp"><button class="btn btn-default">add</button></a></h3>
        <div class="panel panel-primary">
            <table class="table" align="center">
                <tr>
                    <th>회비명</th>
                    <th>날짜</th>
                    <th>회비금액</th>
                    <th>현재금액</th>
                    <th>상태</th>
                    <th>미납자</th>
                </tr>
                <tbody>
                 <c:forEach var="groupMoney" items="${groupMoneyList}">
			   
                    <tr>
                    	<td><a href="#">${groupMoney.gmName}</a></td>
                        <td>${groupMoney.gmDate}</td>
                        <td>${groupMoney.gmPrice}</td>
                        <td>1,000,000</td>
                        <td>수납완료</td>
                        <th>0</th>         
                    </tr>
                    
               	  </c:forEach>	
                    <tr>
                        <td><a href="#">회비2</a></td>
                        <td>2015.06.01</td>
                        <td>50,000</td>
                        <td>250,000</td>
                        <td>수납중</td>
                        <th>15</th>
                        
                    </tr>
                </tbody>
            </table>
        </div>


        <div class="panel panel-primary">
    				
            <div class="panel-heading">
                <h3 class="panel-title">회비 1 ( 2015.05.01 / 50,000 )</h3> 
            </div>			
				<div class="panel panel-default">
					
					<table class="table table-striped table-bordered">
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
							<tr>
								<td>1</td>
								<td>user01</td>
								<td>010-1111-1111</td>
								<td>user01@snl.com</td>
								<td>수납완료</td>	
							</tr>
							<tr>
								<td>2</td>
								<td>user02</td>
								<td>010-1111-1111</td>
								<td>user01@snl.com</td>
								<th><button class="btn btn-default">수납확인</button></th>	
	
							</tr>
							<tr>
								<td>3</td>
								<td>user01</td>
								<td>010-1111-1111</td>
								<td>user01@snl.com</td>
								<td>수납완료</td>	
							</tr>
							<tr>
								<td colspan="3">총 합계</td>
								<td colspan="2">100,000</td>
								
							</tr>
							</tbody>
						</table>
					
				</div> <!-- /widget-content -->
			
			</div> <!-- /widget -->


    	
    	
    	</div>
	
		<jsp:include page="rightMenu.jsp"></jsp:include>
    
    </div>
    
             
	    
	<jsp:include page="footer.jsp"/>
	
	</body>

</html>
