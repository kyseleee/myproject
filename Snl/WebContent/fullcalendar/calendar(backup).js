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
						
						$("#eventContent").html('<div>결제수단 : '+event.method+'</div> <div>날짜 : '+event.start+'</div> <div> 상 호 명 : '+event.description+'</div> <div>금  액 : '+event.amount+'</div> <div>영 수 증 : <img src="http://localhost:8080/Snl/Chrysanthemum_1.jpg"/>');
						$( "#event" ).dialog( 
	                            { title:  "제목이다" }
	                        );
	                        
	                    $( "#event" ).dialog( "open" );
	                        return false;
						
						
					},
					editable: false,
					eventLimit: true, // allow "more" link when too many events
					events: [
						{
							title: '회식	21000원',
							start: '2015-04-1T20:00:00'
						},
						{
							title: '삼겹살	32000원',
							start: '2015-04-3T19:00:00'
						},
						{
							title: '순두부	20000원',
							start: '2015-04-06T19:00:00'
						},
						{
							title: '순대국	25000원',
							start: '2015-04-09T16:00:00'
						},
						{
							title: '부대찌게	33000원',
							start: '2015-04-13T22:00:00'
						},
						{
							title: '삼겹살	40000원',
							start: '2015-04-017T21:00:00'
						},
						{
							title: '치맥	43000원',
							start: '2015-04-26T23:30:00'
						},
						{
							title: '감차짜개	21000원',
							start: '2015-04-28T15:00:00'
						},
						{
							title: '삼겹살	32000원',
							start: '2015-04-28T15:00:00'
						},
						{
							title: '순두부	43000원',
							start: '2015-04-28T12:00:00'
						},
						{
							title: '김치찌개	21000원',
							start: '2015-04-28T16:00:00'
						},
						{
							title: '꽃등심	60000원',
							start: '2015-04-28T19:00:00'
						},
						{
							title: '양념치킨	35000원',
							start: '2015-04-29T22:00:00',
							method: '현금',
							receit: 'ssss.jpg',
							description: '안신난다'
						},
						{
							title: '분식	23000원',
							start: '2015-04-30T15:00:00',
							method: '신용카드',
							receit: 'ss.jpg',
							amount: '23000',
							description: '신난다'
						},
					]
				});
				
			});