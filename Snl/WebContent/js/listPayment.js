
function popup(url) {
	window.open(url,'','width=460, height=460, scrollbars=no, status=no;');
}
$(document).ready(function(){
	$.ajax({
		url : './listPaymentByDayDuration.do',
		data : {startDate : "2015-01-01", endDate : "2015-07-01"},
		dataType : 'json',
		method : 'POST',
		success : function(data){
			var receiptLink;
			for(var i=0;i<data.length;i++){
				data[i].amount=parseInt(data[i].amount).toLocaleString();
				data[i].method=decodeURIComponent(data[i].method);
				data[i].payName=decodeURIComponent(data[i].payName);
	
				
				if(data[i].receipt=='-') {				
					receiptLink=data[i].receipt;
				}
				else {
					receiptLink='<a href="http://192.168.200.122:8080/Snl/'+data[i].receipt+'" onclick="popup(this.href); return false;">'+data[i].receipt+'</a>';
					data[i].receipt=receiptLink;
				}
				
			}
			
			/* lll */
		jui.ready([ "uix.table" ], function(table) {
			table_7 = table("#table_7", {
	        fields: [ "payDate", "payName", "amount", "method", "receipt" ],
	        data: data,
	        resize: true,
	        sort: [ 0, 1, 2 ],
	        scroll: true,
	        scrollHeight: 500,
	        event: {
	            sort: function(column, e) {
	                var className = {
	                    "desc": "icon-arrow1 icon-white",
	                    "asc": "icon-arrow3 icon-white"
	                }[column.order];

	                $(column.element).children("i").remove();
	                $(column.element).append("<i class='" + className + "'></i>");
	            }
	        }
	    });
	});
			
			/* 111 */
		}
		
	});
	
	$('#duration').click(function () {
		var result='no';
		var searchKey=$('#search').val();
		startYear=parseInt($('#startDate').val().substring(0,4));
		startMonth=parseInt($('#startDate').val().substring(5,7));
		startDay=parseInt($('#startDate').val().substring(8));
		endYear=parseInt($('#endDate').val().substring(0,4));
		endMonth=parseInt($('#endDate').val().substring(5,7));
		endDay=parseInt($('#endDate').val().substring(8));
		
		searchKey=$.trim(searchKey);
		
		if(startYear<=endYear) {
			if(startYear<endYear) {
					result='date';
			}
			else {
				if(startMonth>endMonth) {
					$('#errMsg').html("<font color='red'>시작일이 종료일보다 빠릅니다!</font>");
				}
				else if(startMonth==endMonth){
					if(startDay>endDay) {
						$('#errMsg').html("<font color='red'>시작일이 종료일보다 빠릅니다!</font>");
					}
					else {
						result='date';
					}
				}
				else {
					result='date';
				}
			}
		}
		else {
			if(startYear>endYear) {
				$('#errMsg').html("<font color='red'>시작일이 종료일보다 빠릅니다!</font>");
			}
			else {
				$('#errMsg').html("<font color='red'>검색기간을 다시 입력해주세요</font>");
			}
		}
		
		if(searchKey!='') {
			result='dateName';
		}
		
		if(result=='date') {
			$('#errMsg').html("");
			$.ajax({
				url : './listPaymentByDayDuration.do',
				data : {startDate : $('#startDate').val(), endDate : $('#endDate').val()},
				dataType : 'json',
				method : 'POST',
				success : function(data){
					var receiptLink;
					for(var i=0;i<data.length;i++){
						data[i].amount=parseInt(data[i].amount).toLocaleString();
						data[i].method=decodeURIComponent(data[i].method);
						data[i].payName=decodeURIComponent(data[i].payName);
			
						
						if(data[i].receipt=='-') {				
							receiptLink=data[i].receipt;
						}
						else {
							receiptLink='<a href="http://192.168.200.122:8080/Snl/'+data[i].receipt+'" onclick="popup(this.href); return false;">'+data[i].receipt+'</a>';
							data[i].receipt=receiptLink;
						}
						
					}
					
					
					/* lll */
				jui.ready([ "uix.table" ], function(table) {
					table_7 = table("#table_7", {
			        fields: [ "payDate", "payName", "amount", "method", "receipt" ],
			        data: data,
			        resize: true,
			        sort: [ 0, 1, 2 ],
			        scroll: true,
			        scrollHeight: 500,
			        event: {
			            sort: function(column, e) {
			                var className = {
			                    "desc": "icon-arrow1 icon-white",
			                    "asc": "icon-arrow3 icon-white"
			                }[column.order];

			                $(column.element).children("i").remove();
			                $(column.element).append("<i class='" + className + "'></i>");
			            }
			        }
			    });
			});
					
					/* 111 */
				}
				
			});
		}
		else if(result=='dateName') {
			$('#errMsg').html("");
			$.ajax({
				url : './listPaymentByDayDurationName.do',
				data : {startDate : $('#startDate').val(), endDate : $('#endDate').val(), name: '%'+searchKey+'%'},
				dataType : 'json',
				method : 'POST',
				success : function(data){
					var receiptLink;
					for(var i=0;i<data.length;i++){
						data[i].amount=parseInt(data[i].amount).toLocaleString();
						data[i].method=decodeURIComponent(data[i].method);
						data[i].payName=decodeURIComponent(data[i].payName);
			
						
						if(data[i].receipt=='-') {				
							receiptLink=data[i].receipt;
						}
						else {
							receiptLink='<a href="http://192.168.200.122:8080/Snl/'+data[i].receipt+'" onclick="popup(this.href); return false;">'+data[i].receipt+'</a>';
							data[i].receipt=receiptLink;
						}
						
					}
					
					
					/* lll */
				jui.ready([ "uix.table" ], function(table) {
					table_7 = table("#table_7", {
			        fields: [ "payDate", "payName", "amount", "method", "receipt" ],
			        data: data,
			        resize: true,
			        sort: [ 0, 1, 2 ],
			        scroll: true,
			        scrollHeight: 500,
			        event: {
			            sort: function(column, e) {
			                var className = {
			                    "desc": "icon-arrow1 icon-white",
			                    "asc": "icon-arrow3 icon-white"
			                }[column.order];

			                $(column.element).children("i").remove();
			                $(column.element).append("<i class='" + className + "'></i>");
			            }
			        }
			    });
			});
					
					/* 111 */
				}
				
			});
		}
		
	
		
	});
	
	jui.ready([ "uix.window" ], function(win) {
	    win_1 = win("#win_1", {
	        width: 500,
	        height: 300,
	        left: "30%",
	        top: 200,
	        resize: true,
	        move: true
	    });
	});
	
});