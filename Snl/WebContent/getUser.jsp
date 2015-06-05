<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
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
	    <link href="css/user.css" rel="stylesheet">


		<!--  js -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<script src="js/login.js"></script>

<style type="text/css">
	#div {
		padding:30px 0 0 0
	}
</style>

</head>
<body>

<jsp:include page="header.jsp"/>
    
  		<div id="content">
  	  	<jsp:include page="leftMenu.jsp"/>
    
    	
    	<div id="main">


<div class="col-sm-5">
            <h2 align="left">회원정보조회</h2>
            <div id="div">
                <div class="form-horizontal payment-form" style="border-radius:4px">
                    <div class="form-group">
                        <label for="concept" class="col-sm-3 control-label">아이디</label>
                        <div class="col-sm-5">
                        	<p style="font-size: 18px; font:bold;">${user.id}</p>
                        </div>
                    </div> <br />
                    <div class="form-group">
                        <label for="description" class="col-sm-3 control-label">이름</label>
                        <div class="col-sm-5">
                        	<p style="font-size: 18px; font:bold;">${user.userName}</p>
                        </div>
                    </div> <br /> 
                    <div class="form-group">
                        <label for="amount" class="col-sm-3 control-label">이메일</label>
                        <div class="col-sm-7">
                            <p style="font-size: 18px; font:bold;">${user.email}</p>
                        </div>
                    </div> <br />
                    <div class="form-group">
                        <label for="status" class="col-sm-3 control-label">전화번호</label>
                        <div class="col-sm-7">
                        	<p style="font-size: 18px; font:bold;">${user.tel}</p>
                        </div>
                    </div> <br />
                    <div class="form-group">
                        <div class="col-sm-12 text-right">
                           <a href="index.jsp"><button type="button" class="btn btn-default preview-add-button">확인</button></a>
                           <a href="updateUserView.do?id=${user.id}"><button type="button" class="btn btn-default preview-add-button">수정</button></a>                               
                           <a href="deleteGroupArr.do?suserNo=${user.userNo}"><button type="button" class="btn btn-default preview-add-button">삭제</button></a> 
                        </div>
                    </div>
                </div>
            </div>            
        </div> 
      </div>
    </div>
</body>
</html>