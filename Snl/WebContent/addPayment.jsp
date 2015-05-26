<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %> --%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <!-- This file has been downloaded from Bootsnipp.com. Enjoy! -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="css/bootstrap.min.css" rel="stylesheet">
  
    <script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
    <!-- <script src="js/addPayment.js"></script> -->
    <script src="jquery.json-2.4.min.js"></script>
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
  
  <div class="row">
        <div class="col-sm-12">
        
            <legend><b>지출 추가</b></legend>
        </div>
  
        <!-- panel preview -->
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
        <div class="col-sm-3"></div>
        
         <!-- / panel preview -->
        <!-- <div class="col-sm-7">
            <h4>Preview:</h4>
            <div class="row">
                <div class="col-xs-12">
                    <div class="table-responsive">
                        <table class="table preview-table" id="preview">
                            <thead>
                                <tr>
                                    <th>결제수단</th>
                                    <th>영  수  증</th>
                                    <th>날        짜</th>
                                    <th>상  호  명</th>
                                    <th>금        액</th>
                                </tr>
                            </thead>
                            <tbody>
              
              </tbody> preview content goes here
                        </table>
                    </div>                            
                </div>
            </div>
            
            <div class="row text-right">
                <div class="col-xs-12">
                    <h4>Total: <strong><span class="preview-total"></span></strong></h4>
                </div>
            </div>
            <div class="row">
                <div class="col-xs-4"></div>
                <div class="col-xs-4">
                    <hr style="border:1px dashed #dddddd;">
                    <button type="button" class="btn btn-primary btn-block" onclick="getValue()">입력 완료</button>
                </div>
                <div class="col-xs-4"></div>                
            </div>
            <form id="add-pay-form" action="addPayment.do" method="POST">
              
              <div id="adddd">
              
              </div>
            </form>
        </div> -->
  </div>
</body>
</html>
