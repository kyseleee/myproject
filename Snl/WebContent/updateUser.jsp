<%@ page contentType="text/html; charset=euc-kr" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<html>
<head>
<title>회원 정보 수정</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">
<!--  css -->

		<link href="css/bootstrap.min.css" rel="stylesheet">
 		<link href="css/index.css" rel="stylesheet">
	    <link href="css/leftmenu.css" rel="stylesheet">
	    <link href="css/user.css" rel="stylesheet">


		<!--  js -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<script src="js/login.js"></script>

<script type="text/javascript">

</script>
</head>


<jsp:include page="header.jsp"/>
    
  		<div id="content">
  	  	<jsp:include page="leftMenu.jsp"/>
    
    	
    	<div id="main">

<form action="updateUser.do" method="post" >

<input type="hidden" name="id" value="${user.id}">

	<h2 align="left">회원정보수정</h2> <hr />

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:13px;">
	
	<tr >
		<td width="104" class="ct_write">
			이름 <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle" />
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<input 	type="text" name="userName" value="${user.userName}" class="ct_input_g" 
							style="width:150px; height:30px; font:bold;"  maxLength="50" >
		</td>
	</tr>
	
	<tr style="padding:30px;">
		<td width="104" class="ct_write">전화번호</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<input 	type="text" name="tel" value="${user.tel}" class="ct_input_g" 
							style="width:150px; height:30px; font:bold;"  maxLength="50" >
		</td>
	</tr> 
	
	<tr style="margin:30px;">
		<td width="104" class="ct_write">이메일 </td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<input 	type="text" name="email" value="${user.email}" class="ct_input_g" 
							style="width:200px; height:30px; font:bold;" onChange="check_email(this.form);">
		</td>
	</tr>
	
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td align="right">
				<button type="submit" class="btn btn-default preview-add-button">확인</button></a>
				<a href="index.jsp"><button type="button" class="btn btn-default preview-add-button">취소</button></a>
		</td>
	</tr>
</table>

</form>
</div>
</div>

</body>
</html>
