<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

	<div id="header">
   	<nav class="navbar navbar-inverse">
		    <div class="navbar-header">
		     	<a id="home" class="navbar-brand" href="/Snl/index.jsp">SNL</a> 
			</div>        
			
			<ul class="nav navbar-nav navbar-center navbar-user">
				<c:forEach var="groupArr" items="${groupArrList}">
					<li><a href="setGroupNo.do?groupNo=${groupArr.group.groupNo}">${groupArr.group.groupName}</a></li>
				</c:forEach>	 
			
			</ul>
			
			<ul class="nav navbar-nav navbar-right navbar-user">
				
				  
				<c:if test="${! empty user}">		
					<li class="active"><a href='addGroup.jsp'>+ Add Group</a></li>
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
								<a href="#"><i class="glyphicon glyphicon-user "></i>나의정보보기 </a>
							</li>
							<li>
								<a href="#"><i class="glyphicon glyphicon-home"></i>개인정보수정 </a>
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
	</nav>
	</div>