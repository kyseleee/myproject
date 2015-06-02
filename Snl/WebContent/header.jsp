<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

	<div id="header">
   	<nav class="navbar navbar-inverse">
		    <div class="navbar-header">
		     	<a id="home" class="navbar-brand" href="/Snl/index.jsp">SNL</a> 
			</div>        
			
			<ul class="nav navbar-nav navbar-right navbar-user">		
			   <li class="active"><a href='addGroup.jsp'>+ Add Group</a></li>
			  
			  <c:forEach var="groupArr" items="${groupArrList}">
			  	 <li><a href="list.html">${groupArr.group.groupName}</a></li>
			  </c:forEach>	   
			  
				<li><a id="login" class="navbar-brand" href='login.jsp'  onclick='login(this); return false;'><i class="fa fa-globe"></i> Login</a></li>
            </ul>
	</nav>
	</div>