<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

	<div id="bar">
		<div class="navbar-header">
		    	<c:if test="${! empty user}">
		     	<a id="home" class="navbar-brand" href="/Snl/calendar.jsp" style="color:white;">SNL</a> 
		     	</c:if>
		     	<c:if test="${empty user}">
		     	<a id="home" class="navbar-brand" href="/Snl/login.jsp" style="color:white;">SNL</a> 
		     	</c:if>
		</div>     
	</div>
	<div id="header">
   	<nav class="navbar navbar-inverse">
			<ul class="nav navbar-nav navbar-center navbar-user groupName"> 
			<li>Group Name</li>
			</ul>
				<c:if test="${! empty group}">		
							
				<ul class="nav navbar-nav navbar-center navbar-user">
					<li class="dropdown active">
						
						<a class="dropdown-toggle" data-toggle="dropdown">${group.groupName}
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
				</ul>
				</c:if>		
			
			<ul class="nav navbar-nav navbar-right navbar-user">
				
				  
				<c:if test="${! empty user}">		
					<li class="active"><a href='addGroup.jsp'>+ Add Group</a></li>
				</c:if>
				  
            </ul>
	</nav>
	</div>