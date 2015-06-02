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

		

		<!--  js -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<script src="js/login.js"></script>
		<script src="js/memberList.js"></script>
		

		
	</head>
	
	<body>
	

 		<jsp:include page="header.jsp"/>
    
  		<div id="content">
  	  	<jsp:include page="leftMenu.jsp"/>
    
    	
    	<div id="main">
    	
    	
<h3 align="center">|Group1|</h3>
<br><br><h>

<div class="row">
       
<div class="col-md-12">

<div class="table-responsive">

<table id="mytable" class="table table-bordred table-striped">
          
	<thead>
	    <th>이름</th>
	    <th>주소</th>
	    <th>이메일</th>
	    <th>연락처</th>
	    <th>수정</th>
	    <th>삭제</th>
	</thead>
	<tbody>
   		<tr>
		   <td>user01</td>
		   
		   <td>CB 106/107 Street # 11 Wah Cantt Islamabad Pakistan</td>
		   <td>isometric.mohsin@gmail.com</td>
		   <td>01021314532</td>
		   <td><p data-placement="top" data-toggle="tooltip" title="Edit"><button class="btn btn-primary btn-xs" data-title="Edit" data-toggle="modal" data-target="#edit" ><span class="glyphicon glyphicon-pencil"></span></button></p></td>
		   <td><p data-placement="top" data-toggle="tooltip" title="Delete"><button class="btn btn-danger btn-xs" data-title="Delete" data-toggle="modal" data-target="#delete" ><span class="glyphicon glyphicon-trash"></span></button></p></td>
		</tr>

		<tr>
		    <td>user02</td>
		    
		    <td>CB 106/107 Street # 11 Wah Cantt Islamabad Pakistan</td>
		    <td>isometric.mohsin@gmail.com</td>
		    <td>01056238282</td>
		    <td><p data-placement="top" data-toggle="tooltip" title="Edit"><button class="btn btn-primary btn-xs" data-title="Edit" data-toggle="modal" data-target="#edit" ><span class="glyphicon glyphicon-pencil"></span></button></p></td>
		    <td><p data-placement="top" data-toggle="tooltip" title="Delete"><button class="btn btn-danger btn-xs" data-title="Delete" data-toggle="modal" data-target="#delete" ><span class="glyphicon glyphicon-trash"></span></button></p></td>
	    </tr>
    </tbody>
</table>
     
           </div>    
        </div>
	</div>


    


    
    <div class="row">
    	<div align="center">
    			<button class="btn btn-info btn-pressure btn-sensitive">확인</button>
                <button class="btn btn-info btn-pressure btn-sensitive">취소</button>
        </div>
    </div>
    	
    	</div>
	
		<jsp:include page="rightMenu.jsp"></jsp:include>>
    
    </div>
    
             
	    
	<jsp:include page="footer.jsp"/>
	
	</body>

</html>
