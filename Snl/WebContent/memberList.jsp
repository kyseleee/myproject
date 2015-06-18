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
		
		

		<!--  js -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<script src="js/login.js"></script>
		<script src="js/memberList.js"></script>
		<script type="text/javascript">
		
		
	
			
			$(function() {
				
				$('.fab').hover(function () {
				    $(this).toggleClass('active');
				});
				$(function () {
				  $('[data-toggle="tooltip"]').tooltip()
				})
				
			    $('#deleteBtn').click(function(e) {
					
					var result = confirm("이 그룹의 총무이므로, 그룹이 삭제됩니다.\n진행하시겠습니까?");
					if(result){
						alert("삭제삭제");
						location.href="deleteGroup.do?";
					}else{
						
					}
				});
			});
	
	
		</script>
		
	</head>
	
	<body>
	

 		<jsp:include page="header.jsp"/>
    
  		<div id="content">
  	  	<jsp:include page="leftMenu.jsp"/>
    
    	
	<div id="main">
	<div style="width:100%;">
	<h2 align="left">회원리스트</h2>
	<div style="float:right" class="fab btn-group show-on-hover dropup">
		<div data-toggle="tooltip" data-placement="left" title="회원초대하기">
 			<a href="addMember.jsp?groupName=${group.groupName}">
 			<button type="button" class="btn btn-danger btn-io dropdown-toggle">
            <span class="fa-stack fa-2x">
                <i class="fa fa-circle fa-stack-2x fab-backdrop"></i>
                <i class="fa fa-plus fa-stack-1x fa-inverse fab-primary"></i>
                <i class="fa fa-pencil fa-stack-1x fa-inverse fab-secondary"></i>
           </span>
           </button>
           </a>
       	</div>
	</div>
	</div>
	
	<div style="width:100%;" class="fab btn-group show-on-hover dropup">
		<div class="table-responsive">
			
		<table id="mytable" class="table table-bordred table-striped">
          
		<thead>
		    <th style="text-align: center"></th>				
			<th style="text-align: center">이름</th>
			<th style="text-align: center">이메일</th>
			<th style="text-align: center">전화번호</th>
			<c:if test="${group.user.userNo == user.userNo}">			
				<th style="text-align: center">비고</th>
			</c:if>				
		</thead>
		
		<c:forEach items="${list}" var="groupArr">
		<tbody>
		<tr style="text-align: center">
			<td>
				<c:if test="${groupArr.role eq 'L'}">
				<b>총무</b>	 
				</c:if> 
			</td>				   						   			
			<td>${groupArr.user.userName}</td>
			<td>${groupArr.user.email}</td>
			<td>${groupArr.user.tel}</td>
			<c:if test="${group.user.userNo == user.userNo}">			
				<td>
				<c:choose>
					<c:when test="${groupArr.role eq 'L'}">
					<button id="deleteBtn" class="btn btn-danger btn-xs" onclick="deleteFunction();">
					<span class="glyphicon glyphicon-trash"></span>
					</button>
					</c:when>
					
					<c:when test="${groupArr.role eq 'M'}">
					<a data-placement="top" data-toggle="tooltip" title="Delete" href="deleteGroupArrByGroupUser.do?delUserNo=${groupArr.user.userNo}"><button class="btn btn-danger btn-xs" data-title="Delete" data-toggle="modal" data-target="#delete" ><span class="glyphicon glyphicon-trash"></span></button></a>
					</c:when>
				</c:choose>
				</td>
			</c:if>
		</tr>
		</tbody>
		</c:forEach>
		</table>
		     
		</div>    
	</div>
</div> <!-- main end div -->
	
    
</div><!-- content div -->
	    

</body>
</html>
