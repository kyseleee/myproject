<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>   
<%@ page import="java.util.*" %>



<%-- 
<c:if test="${empty group}">
	<script type="text/javascript">
		alert("group을 먼저 생성해주세요.");
		location.href="addGroup.jsp";
	</script>	
</c:if>
--%>

<script type="text/javascript">

	function check(){
		if("${group}" != ""){
			return true;
		}else{
			alert("group을 먼저 생성해주세요.");
			location.href="addGroup.jsp";
			return false;
		}		
	}

</script>


<div id="leftMenu">
<nav class="navbar navbar-inverse sidebar" role="navigation" style="background:black;">
    	<div class="container-fluid">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">		
			<div class="media">
			<div class="" align="center">
						<img src="http://www.localcrimenews.com/wp-content/uploads/2013/07/default-user-icon-profile.png" 
						style="width:80px;height:80px; float:left; padding:5px;" class="img-circle img-responsive" alt="">
			</div>
			<div style="margin-top:10px;">	
						<div>Welcome To Snl</div>
						<div class="profile-usertitle-id">
							${user.id}
						</div>
						<div class="profile-usertitle-name">
							${user.userName}
						</div>
					</div>
			</div>
					<div class="profile-userbuttons">
						<a href="getUser.do?userNo=${user.userNo}"><button type="button" class="btn btn-success btn-sm"> Edit</button></a>
						<a href="logout.do"><button type="button" class="btn btn-danger btn-sm">Logout</button></a>
					</div>
		</div>
		
		<div class="collapse navbar-collapse" id="bs-sidebar-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li ><a href='calendar.jsp' onclick="return check();">지출현황<span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-calendar"></span></a></li>
				<li ><a href='addPayment.jsp' onclick="return check();">지출추가<span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-usd"></span></a></li>
				<li ><a href='graph.jsp' onclick="return check();">통    계<span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-stats"></span></a></li>
				<li ><a href='groupMoneyView.do' onclick="return check();">회비관리<span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-list-alt"></span></a></li>
				<li ><a href="getListGroupArr.do" onclick="return check();">회원리스트<span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-user"></span></a></li>
				<li>
				   	<a><h2 class="text-warning">Total</h2></a>
					<a style="color:white">총 회비 : <fmt:formatNumber value="${totalGm}" groupingUsed="true"/> 원</a>
					<a style="color:white">총 지출 :  <fmt:formatNumber value="${totalPayment}" groupingUsed="true"/>원</a>
					<a style="color:white">----------------------</a>
					<a style="color:white">총 잔액 :  <fmt:formatNumber value="${totalGm - totalPayment}" groupingUsed="true"/>원</a>

				</li>
			</ul>	
		</div>
	</div>
</nav>
</div>