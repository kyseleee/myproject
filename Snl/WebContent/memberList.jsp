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
	    <link href="css/memberList.css" rel="stylesheet">
	    <link href="css/user.css" rel="stylesheet">
		<link rel='stylesheet prefetch' href='http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css'>
	
		

		<!--  js -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<script src="js/login.js"></script>
		<script src="js/memberList.js"></script>
		
		
<style>
.fab {
  cursor: pointer;
}
.fab-backdrop {
  color: rgba(255, 255, 255, 0);
}
.fab-primary, .fab-secondary {
  transition: all 0.35s ease-in-out;
}
.fab.active .fab-primary {
  opacity: 0;
  transform: rotate(225deg);
}
.fab-secondary {
  opacity: 0;
  transform: rotate(-225deg);
}
.fab.active .fab-secondary {
  opacity: 1;
  transform: rotate(0);
  margin-top: -2px;
}

#inbox .show-on-hover:hover > ul.dropdown-menu {
    display: block;    
    
}
#inbox .show-on-hover {
    bottom: 80px;
    right: 80px;
}

#inbox .btn-io{
    border-radius: 50%;
    height: 54px;
    width: 54px;
    padding: 0 !important;
    box-shadow: 0px 3px 7px 0px rgba(202, 124, 124, 0.72);
}

.btn-io{
    border-radius: 50%;
    height: 54px;
    width: 54px;
    padding: 0 !important;
    box-shadow: 0px 3px 7px 0px rgba(202, 124, 124, 0.72);
}
</style>
		
	</head>
	
	<body>
	

 		<jsp:include page="header.jsp"/>
    
  		<div id="content">
  	  	<jsp:include page="leftMenu.jsp"/>
    
    	
<div id="main">
    	<div style="width:100%;">
	      <h2 align="left">그룹리스트</h2>
          	 <div style="float:right" class="fab btn-group show-on-hover dropup">
            <div data-toggle="tooltip" data-placement="left" title="회원초대하기">
          
         <a href="addGroup2.jsp?groupName=${group.groupName}"><button type="button" class="btn btn-danger btn-io dropdown-toggle">
            <span class="fa-stack fa-2x">
                <i class="fa fa-circle fa-stack-2x fab-backdrop"></i>
                <i class="fa fa-plus fa-stack-1x fa-inverse fab-primary"></i>
                <i class="fa fa-pencil fa-stack-1x fa-inverse fab-secondary"></i>
           </span>
       </button></a></div>
		</div>
</div>
	  <div style="width:100%;" class="fab btn-group show-on-hover dropup">
	              
	 
	
			<div class="table-responsive">
			
				<table id="mytable" class="table table-bordred table-striped">
				          
					<thead>
					    <th>이름</th>
					    <th>이메일</th>
					    <th>전화번호</th>
					    <th>삭제</th>
					</thead>
					<c:forEach items="${list}" var="groupArr">
					<tbody>
				   		<tr>
						   <td>${groupArr.user.userName}</td>
						   <td>${groupArr.user.email}</td>
						   <td>${groupArr.user.tel}</td>
						   <td><a data-placement="top" data-toggle="tooltip" title="Delete" href="deleteGroupArr.do?suserNo=${groupArr.user.userNo}"><button class="btn btn-danger btn-xs" data-title="Delete" data-toggle="modal" data-target="#delete" ><span class="glyphicon glyphicon-trash"></span></button></a></td>
						</tr>
				    </tbody>
				    </c:forEach>
				</table>
			     
			</div>    
	</div>
</div> <!-- main end div -->
	
	<jsp:include page="rightMenu.jsp"></jsp:include>>
    
</div><!-- content div -->
	    
	<jsp:include page="footer.jsp"/>
<script type="text/javascript">
$('.fab').hover(function () {
    $(this).toggleClass('active');
});
$(function () {
  $('[data-toggle="tooltip"]').tooltip()
})
</script>
</body>
</html>
