var update=0;
var groupNoHid=document.getElementById("groupNoHidden").value;
var leaderNo=document.getElementById("leaderNo").value;
var userNo=document.getElementById("userNo").value;
function updatePayment(event){
	if(update==0){
		var method = event.method;
		var select1="";
		var select2="";
		if (method==1) {
			select1="selected";
		}
		else {
			select2="selected";
		}
		alert(method+"="+select1+"="+select2+"="+event.receit);
		$("#eventContent").html('<form id="addPay-form" action="updatePayment.do?payNo='+event.payNo+'" method="POST" enctype="multipart/form-data">	<div class="form-group"><label for="payMethod" class="col-sm-3 control-label">결제수단</label><div class="col-sm-9" style="vertical-align:middle;"><select class="form-control" id="method" name="method"><option '+select1+'>신용카드</option><option '+select2+'>현    금</option></select></div></div>    <div class="form-group"><label for="date" class="col-sm-3 control-label">날     짜</label><div class="col-sm-9"><input type="date" class="form-control" id="payDate" name="payDate" value='+event.payDate+'><div id="dateErr"></div></div></div><div class="form-group"><label for="amount" class="col-sm-3 control-label">상  호  명</label><div class="col-sm-9"><input type="text" class="form-control" id="payName" name="payName" value='+event.payName+'><div id="payNameErr"></div></div></div><div class="form-group"><label for="description" class="col-sm-3 control-label">금      액</label><div class="col-sm-9"><input type="text" class="form-control" id="amount" name="amount" value='+event.amount+'><div id="amountErr"></div></div></div><div class="form-group"><label for="concept" class="col-sm-3 control-label">영  수  증</label><div class="col-sm-9"><input type="file" id="file" name="file" /></div></div></form>');
		update++;
	}
	else{
		update=0;
		document.getElementById("addPay-form").submit();
	}
}
function updateCancel() {
	update=0;
}
function deletePayment(event) {
	if(confirm("정말 삭제하시겠습니다?")){
		location.href="./deletePayment.do?payNo="+event.payNo;
	}
	
}


	$(document).ready(function() {
		
				$('#calendar').fullCalendar({
					theme: true,
//					eventClick: function(calEvent, jsEvent, view) {
//
//				        alert('Event: ' + calEvent.title);
//				        alert('Coordinates: ' + jsEvent.pageX + ',' + jsEvent.pageY);
//				        alert('View: ' + view.name);
//
//				        // change the border color just for fun
//				        $(this).css('border-color', 'red');
//
//				    },
					header: {
						left: 'prev,next today',
						center: 'title'
						/*right: 'month,basicWeek,basicDay'*/
					},
					eventAfterAllRender: function(event, element) {
						$.ajax({
							url:"./getMonthlyPayment.do",
							data: {date : $('#calendar').fullCalendar('getDate').format() },
							method: 'POST',
							success: function(data){
								$('.fc-right').html("총 지출액 : "+parseInt(data).toLocaleString()+"원");
							}
						});
						
						
						
					},
					dayClick: function(date, allDay, jsEvent, view) {
						$("#addPayment").dialog({
							autoOpen: false,
							height: 400,
							width: 500,
							buttons: {
								"추가" : function(){
									getFile();
								},
								"닫기": function(){
									$(this).dialog("close");
								}
							}
						});
						$("#addPaymentContent").html('<form id="addPay-form" action="addPayment.do" method="POST" enctype="multipart/form-data"><div class="form-group"><label for="payMethod" class="col-sm-3 control-label">결제수단</label><div class="col-sm-9" style="vertical-align:middle;"><select class="form-control" id="method" name="method"><option>신용카드</option><option>현    금</option></select></div></div><div class="form-group"><label for="date" class="col-sm-3 control-label">날     짜</label><div class="col-sm-9"><input type="date" class="form-control" id="payDate" name="payDate" value="'+date.format()+'"><div id="dateErr"></div></div></div><div class="form-group">                        <label for="amount" class="col-sm-3 control-label">상  호  명</label><div class="col-sm-9"><input type="text" class="form-control" id="payName" name="payName"><div id="payNameErr"></div></div></div><div class="form-group"><label for="description" class="col-sm-3 control-label">금      액</label><div class="col-sm-9"><input type="text" class="form-control" id="amount" name="amount"><div id="amountErr"></div><!-- <input type="hidden" value="" id="receit" name="receit"/> --></div></div><div class="form-group"><label for="concept" class="col-sm-3 control-label">영  수  증</label><div class="col-sm-9"><input type="file" id="file" name="file"/></div></div><div class="form-group"><div class="form-group text-center"><label for="txtMsg"> 지출내역 문자발송  </label><input type="checkbox" tabindex="3" class="" name="txtMsg" id="txtMsg" value="y"></div></div></form>');
//						$( "#addPayment" ).dialog( "open" );
						$( "#addPayment" ).dialog({
							open: function() {
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
										amountEr = "";
									}
									else{
										amountEr = "<font color='red'>올바른 숫자 포맷을 입력해 주세요.</font>";
									}
									document.getElementById("amountErr").innerHTML=amountEr;
								});
								
							}
						});
						if(userNo==leaderNo) {
							$( "#addPayment" ).dialog( "open" );
						}
						return false;
					},
					eventClick: function(event) {
						var select="";
						if (event.method==1) {
							select="신용카드";
						}
						else {
							select="현금";
						}
						
						if(userNo==leaderNo) {
							$( "#event" ).dialog({
								autoOpen: false,
								height: 600,
								width: 500,
								buttons: {
	                                "수정": function(){
	//                                	location.href="/addPayment.do";
	                                	updatePayment(event);
	                                },
	                                "삭제": function(){
	//                                	location.href="/addPayment.do";
	                                	deletePayment(event);
	                                },
	                                "닫기": function() {
	                                	updateCancel();
	                                    $( this ).dialog( "close" );
	                                }
	                            },
                            create: function() {
                            	$(this).closest('div.ui-dialog').find('.ui-dialog-titlebar-close').click(function(e) {
                                    updateCancel();
                                    e.preventDefault();
                                });
                            }
	                            
							});
						} else {
							$( "#event" ).dialog({
								autoOpen: false,
								height: 600,
								width: 500,
								buttons: {
										"닫기": function() {
	                                	updateCancel();
	                                    $( this ).dialog( "close" );
	                                }
	                            },
                            create: function() {
                            	$(this).closest('div.ui-dialog').find('.ui-dialog-titlebar-close').click(function(e) {
                                    updateCancel();
                                    e.preventDefault();
                                });
                            }
	                            
							});
						}	
//						$(".ui-dialog-titlebar-close").remove();
						var receiptLink='';
						var receiptName='';
						if(event.receit=='-') {
							receiptName='없음';
						}
						else {
							receiptLink='<img src="http://192.168.200.122:8080/Snl/'+event.receit+'" width="460"/>';
						}
					$("#eventContent").html('<div>결제수단 : '+select+'</div> <div>날짜 : '+event.payDate.substring(0,10)+'</div> <div> 상 호 명 : '+event.payName+'</div> <div>금  액 : '+parseInt(event.amount).toLocaleString()+'원</div> <div>영 수 증 : '+receiptName+'</div><div>'+receiptLink+'</div>');
						$( "#event" ).dialog( 
	                            { title:  event.payName }
	                        );
	                        
	                    $( "#event" ).dialog( "open" );
	                        return false;
						
						
					},
					editable: false,
					eventLimit: true, // allow "more" link when too many events
//					events: {
//						url : './listPaymentByDay.do?groupNo=10021',
//						error : function(){
//							alert("FAIL");
//						}
//					}
					events: function(start, end, timezone, callback){
							$.ajax({
								url : './listPaymentByDay.do',
//								data : {groupNo : groupNoHid},
								dataType : 'json',
								method : 'POST',
								success : function(data){
									for(var i=0;i<data.length;i++){
										data[i].title=parseInt(data[i].title).toLocaleString()+"원";
										data[i].method=decodeURIComponent(data[i].method);
										data[i].receit=decodeURIComponent(data[i].receit);
										data[i].payName=decodeURIComponent(data[i].payName);
									}
//									$.each(data, function(key, val){
//										alert(key+"=="+val.start);
//									});
									
									
										
										//var events = eval(data.data);
										//alert(events.start);
										callback(data);
//										var dataObj=JSON.parse(data);
//										alert(dataObj);
//										alert(dataObj.jsonTxt);
//										callback(dataObj.jsonTxt);
								},
								error : function(){
									alert("FAIL");
								}
								
							});
					}
				});
				
				
				
				
			});