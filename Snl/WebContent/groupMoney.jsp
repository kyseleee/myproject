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
    	

		<h3 align="center">< 회비내역 리스트 ></h3><h3 align="right"><a href="addGroupMoney.jsp"><button class="btn btn-primary">add</button></a></h3>
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
                <c:set var="i" value="0"/>
                 <c:forEach var="groupMoney" items="${groupMoneyList}">
			   		
                    <tr>
                    	<td><a href="getGmPaid.do?gmNo=${groupMoney.gmNo}">${groupMoney.gmName}</a></td>
                        <td>${groupMoney.gmDate}</td>
                        <td>${groupMoney.gmPrice}</td>
                        <td>${groupMoney.gmPrice*paid[i]}</td>
                        <td>수납완료</td>
                        <th>${groupSize-paid[i]}</th>         
                    	<c:set var = "i" value="${i+1}"/>
                    </tr>
                    
               	  </c:forEach>	

                </tbody>
            </table>
        </div>
    	</div>
	
		<jsp:include page="rightMenu.jsp"></jsp:include>
    
    </div>
    
             
	    
	<jsp:include page="footer.jsp"/>
	
	</body>

</html>
