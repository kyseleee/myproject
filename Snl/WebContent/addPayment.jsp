<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		
		<!--  css -->
		<link href="css/bootstrap.min.css" rel="stylesheet">
		<link href="index.css" rel="stylesheet">

		<!--  js -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<script src="login.js"></script>
		
	</head>
<script type="text/javascript">
	$(document).ready(function(){
		$("#payDate").blur(function(){
			alert("11");
			var payDate = $("input[name=payDate]").val();
			var dateErr="";
			
			if(payDate==""){
				dateErr="<font color='red'> 날짜를 입력해 주세요.</font>";
			}
			else{
				dateErr="";
			}
			document.getElementById("dateErr").innerHTML=dateErr;
		});
		
		$("#payName").blur(function(){
			alert("22");
			var payName = $("input[name=payName]").val();
			var payErr="";
			
			if(payName==""){
				payErr="<font color='red'> 상호명을 입력해 주세요.</font>";
			}
			else{
				payErr="";
			}
			document.getElementById("payNameErr").innerHTML=payErr;
		});
			
		$("#amount").blur(function(){
			alert("33");
			var amount = $("input[name=amount]").val();
			var amountEr = "";
			if($.isNumeric(amount)==true && amount>0 && amount%1==0){
				alert("GOOD");
				amountEr = "";
			}
			else{
				alert("BAD");
				amountEr = "<font color='red'>올바른 수자 포맷을 입력해 주세요.</font>";
			}
			document.getElementById("amountErr").innerHTML=amountEr;
		});


		
	});
	
	
	function submitForm(){
		var formData = new FormData();
        /* $.each($('#file')[0].files, function(i, file) {          
            data.append('file-' + i, file);
        }); */
   	var file=document.getElementById('file').files[0];
        alert(file);
    formData.append('file',file);
    	alert(formData);
    
            $.ajax({
               url: '/fileUpload.do',
               data: formData,
               type: 'POST',
               processData: false,
               contentType: false,
               success: function(result){
                   alert("업로드 성공!!");
                   $('input[name=receit]').attr('value',result); 
               },
               error : function(){
            	   alert("실패");
               }
           });
		document.getElementById("addPay-form").submit();
	}
	function getFile(){
		//document.getElementById("uploadFile").submit();
		
			document.getElementById("addPay-form").submit();
			
	}
</script>
	<body>
  
  
  		<div id="headernav">
		
			<nav class="navbar navbar-default">
			  <div class="container-fluid">
			    <div class="navbar-header" style="margin-left: 150px;">
			      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
			        <span class="sr-only">Toggle navigation</span>
			        <span class="icon-bar"></span>
			        <span class="icon-bar"></span>
			        <span class="icon-bar"></span>
			      </button>
			      <a class="navbar-brand" href="/Snl/index.jsp"><font color="#5FB0E4">SNL</font></a>
			    </div>
			
			    <!-- Collect the nav links, forms, and other content for toggling -->
			    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			     
			      <ul class="nav navbar-nav navbar-right" style="margin-right: 150px;">
			      	<li class="active">
			            	<a href='calendar.html'>지출현황</a> 
					</li>
					<li>
			            	<a href='addPayment.jsp'>지출추가</a> 
					</li>
			        <li>
			            	<a href='jqGridSimple.jsp'>통계</a> 
			        </li>
			       								        
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">
							그룹관리<b class="caret"></b>
						</a>
						<ul class="dropdown-menu">
							<li><a href='paymentManager.jsp' >회비관리</a></li>
							<li><a href="list.html" >회원리스트</a></li>
						</ul>
					</li>
			        <li>
			        	<a href="#">설정</a>
			        </li>
			        <li>
			        	<a href='login.jsp'>로그인</a>
			        </li>
			        
			        
			        
			      </ul>
			    </div><!-- /.navbar-collapse -->
			  </div><!-- /.container-fluid -->
			</nav>
		</div>
		
		<div id="header" align="center">
			<br/><br/>
				<font size="9" face ="sans-serif"><b>SNL</b></font><br/>
				<font size="5">Social Network Ledger</font>
		</div>
	
		<div id="article">
			<div id="leftmenu">
				<ul class="nav nav-pills nav-stacked">
				   <li class="active"><a href="list.html">Group1</a></li>
				   <li><a href="#">Group2</a></li>
				   <li><a href="#">Group3</a></li>
				   <li><a href='addGroup.html'>+ Add Group</a></li>
				</ul>
			</div>
			
			<div id="main">
			  <div class="row">
        <div class="col-sm-12">
        
            <legend><b>지출 추가</b></legend>
        </div>
  
        <div class="col-sm-3"></div>
        <div class="col-sm-6">
            <div class="panel-default">
                <div class="panel-body form-horizontal payment-form">
                
             <form id="addPay-form" action="addPayment.do" method="POST" enctype="multipart/form-data"> 
             <div class="form-group">
                        <label for="payMethod" class="col-sm-3 control-label">결제수단</label>
                        <div class="col-sm-9">
                            <select class="form-control" id="method" name="method">
                                <option>신용카드</option>
                                <option>현    금</option>
                            </select>
                        </div>
                    </div> 
                    
                    <div class="form-group">
                        <label for="date" class="col-sm-3 control-label">날     짜</label>
                        <div class="col-sm-9">
                            <input type="date" class="form-control" id="payDate" name="payDate">
                            <div id="dateErr"></div>
                        </div>
                    </div>   
                    
                    <div class="form-group">
                        <label for="amount" class="col-sm-3 control-label">상  호  명</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="payName" name="payName">
                            <div id="payNameErr"></div>
                        </div>
                    </div>
                  <div class="form-group">
                        <label for="description" class="col-sm-3 control-label">금      액</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="amount" name="amount">
                            <div id="amountErr"></div>
                            <!-- <input type="hidden" value="" id="receit" name="receit"/> -->
                        </div>
                    </div>
									<div class="form-group">
                        <label for="concept" class="col-sm-3 control-label">영  수  증</label>
                        <div class="col-sm-9">
                        		<input type="file" id="file" name="file"/>
                        </div>
                    </div>
                  </form>
                  
                  <!-- <form id="uploadFile" action="fileUpload.do" method="POST" enctype="multipart/form-data">  
                    <div class="form-group">
                        <label for="concept" class="col-sm-3 control-label">영  수  증</label>
                        
                        <div class="col-sm-9">
                        		
                        		<input type="file" id="file" name="file"/>
                        		
                            <input type="submit" class="btn btn-default preview-add-button" value="영수증 찾기">
                        </div>
                    </div>
								</form> -->
								
                    <div class="form-group">
                        <div class="col-sm-12 text-right">
                            <input type="button" onclick="getFile()" class="btn btn-default preview-add-button" value="입력완료">
                                
                        </div>
                    </div>
                
                </div>
            </div>            
        </div>
        
			
			
			</div>
		</div>
		
		<div id="footer">footer</div>
  
  	

        
         
         
         
     
  </div>
</body>
</html>
