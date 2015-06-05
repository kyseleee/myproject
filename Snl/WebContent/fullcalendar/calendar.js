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
						center: 'title',
						right: 'month,basicWeek,basicDay'
					},
					dayClick: function(date, allDay, jsEvent, view){
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
						 $( "#addPayment" ).dialog( "open" );
						 return false;
					},
					eventClick: function(event) {
						$( "#event" ).dialog({
							autoOpen: false,
							height: 600,
							width: 500,
							buttons: {
                                "수정": function(){
                                	location.href="/addPayment.do";
                                },
                                "Close": function() {
                                    $( this ).dialog( "close" );
                                }
                            },
	                            
						});
						
						$("#eventContent").html('<div>결제수단 : '+'신용카드'+'</div> <div>날짜 : '+event.payDate.substring(0,10)+'</div> <div> 상 호 명 : '+event.payName+'</div> <div>금  액 : '+event.amount+'</div> <div>영 수 증 : <img src="http://192.168.200.122:8080/Snl/'+event.receit+'"/>');
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
					events: function(start, end, timezone,callback){
							$.ajax({
								url : './listPaymentByDay.do',
								data : {groupNo : 10021},
								dataType : 'json',
								method : 'POST',
								success : function(data){
									for(var i=0;i<data.length;i++){
										data[i].title=decodeURIComponent(data[i].title);
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