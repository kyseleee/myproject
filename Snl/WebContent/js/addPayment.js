	$(document).ready(function(){
		$("#payDate").blur(function(){
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