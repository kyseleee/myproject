<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>   
<%@ page import="java.util.*" %>

	<div id="header">
   	<nav class="navbar navbar-inverse"  style="background-color: #2b3340 !important; min-height: 50px; ">
   	<div class="center">
		    <div class="navbar-header">
		    	<c:if test="${! empty user}">
		     	<a id="home" class="navbar-brand" href="/Snl/calendar.jsp">SNL</a> 
		     	</c:if>
		     	<c:if test="${empty user}">
		     	<a id="home" class="navbar-brand" href="/Snl/calendar.jsp">SNL</a> 
		     	</c:if>
			</div>        

				
			
			<ul class="nav navbar-nav navbar-right navbar-user">
				
				<c:if test="${! empty group}">		
							
				<li class="dropdown">
						<a class="dropdown-toggle" data-toggle="dropdown">내 그룹
						<b class="caret"></b></a>
						<ul class="dropdown-menu">
						
							<c:forEach var="groupArr" items="${groupArrListByUser}">
								<li>
									<a id="name" href="setGroupNo.do?groupNo=${groupArr.group.groupNo}&currentPage=${pageContext.request.servletPath}">
									${groupArr.group.groupName}</a>
								</li>
							
							</c:forEach>
							
						</ul>
						
						
						
					</li>
				</c:if>		
				
				
				  
				<c:if test="${! empty user}">		
					<li ><a href='addGroup.jsp'>Add Group</a></li>
				</c:if>
				  
			  <%if (session.getAttribute("user") != null) {%>
					<li class="dropdown">						
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">
							<span style="font-size:20px;" class="glyphicon glyphicon-user"></span><b class="caret"></b></a>
							
						
						
			<ul id="user" class="dropdown-menu">
				<li>
					<div class="profile-userpic" align="center">
						<img src="http://www.localcrimenews.com/wp-content/uploads/2013/07/default-user-icon-profile.png" 
						style="width:120px;height:90px;" class="img-circle img-responsive" alt="">
					</div>
					
					<div class="profile-usertitle" style="text-align:center;">
						<div class="profile-usertitle-id">
							${user.id}
						</div>
						<div class="profile-usertitle-name">
							${user.userName}
						</div>
					</div>
	
					<div class="profile-userbuttons">
						<button type="button" class="btn btn-success btn-sm">reLogin</button>
					<a href="logout.do">	<button type="button" class="btn btn-danger btn-sm">Logout</button></a>
					</div>
					
					<div class="profile-usermenu">
						<ul class="nav">
							<li>
								<a href="getUser.do?userNo=${user.userNo}"><i class="glyphicon glyphicon-user "></i>나의정보보기 </a>
							</li>
						</ul>
					</div>
				</li>
			</ul>
				</li>
					<%}else{%>	
					
					<li><p class="navbar-text">Already have an account?</p></li>
					
					<li>
			          <a id="login" class="nabar-brand" href='login.jsp' onclick='login(this); return false;'>
			          <b>Login</b></a>
			        </li>
					<%}%>
            </ul>
            </div>
	</nav>

	
	</div>
	<div id="headernav">
		<div class="center">
		<span class="headernavTitle">
		 ${group.groupName}
		 </span>
		 <span class="headernavMent">
		현재까지 총 누적   회비 :<fmt:formatNumber value="${totalGm}" groupingUsed="true"/>  원,  
		
		지출:  <fmt:formatNumber value="${totalPayment}" groupingUsed="true"/>  원, 
		
		 잔액 :  <fmt:formatNumber value="${totalGm - totalPayment}" groupingUsed="true"/>   원
		</span>
		</div>
		
	</div>
