var chart;
var groupNoHid=document.getElementById("groupNoHidden").value;
		$(document).ready(function () {
			chart = new Highcharts.Chart({
					chart: {
						renderTo: 'container',
						type: 'line',
						backgroundColor: 'transparent',
						dataType: "json",
						events:{
							load: requestData
						}
					},
					
					credits: {
			          enabled: false
			    },
	        title: {
	            text: 'Monthly Payment',
	            x: -20 //center
	        },
	        xAxis: {
	            categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
	                'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
	        },
	        yAxis: {
	            title: {
	                text: 'Amount (원)'
	            },
	            plotLines: [{
	                value: 0,
	                width: 1,
	                color: '#808080'
	            }]
	        },
	        tooltip: {
	            valueSuffix: '원',
	            formatter : function(){
	            		return '<b>Group</b> <br>날짜 : '+this.x+'<br>금액 : '+this.y;
	            },
	            shared : true
	        },
	        legend: {
	            layout: 'vertical',
	            align: 'right',
	            verticalAlign: 'middle',
	            borderWidth: 0
	        },
	        noData: {
	        	style: {"fontSize": "22px", "fontWeight": "bold", "color": "#60606a"}
	        },
	        series: []
	    });
			
//		Highcharts.setOptions({
//	        lang: {
//	            noData: "데이터가 없습니다"
//	        }
//	    });
	});
	
	function requestData() {
		$.ajax({
				url:'./listPaymentByMonth.do',
				type: "GET",
				data: {groupNo : groupNoHid},
				success: function(data){
						alert(data);
						data=JSON.parse(data);
						alert(data.Group);
						if(data.Group=="nodata") {
							alert("111");
							chart.hideNoData();
							chart.showNoData("데이터가 없습니다");
						}
						else {
							alert("222");
							chart.addSeries({
									name: data.name,
									data: data.Group
							});
						}
				},
				cache: false
			});
	}
	
//	function updateChart() {
//		var chart = $('#container').highcharts();
//		alert($('#startDate').val()+"++"+$('#endDate').val());
//		$.ajax({
//			url:'./listPaymentByMonth.do',
//			type: "POST",
//			data: {groupNo : groupNoHid, startDate : $('#startDate').val(), endDate : $('#endDate').val()},
//			success: function(data){
//				alert(data);
//				var chart = $('#container').highcharts();
//					data=JSON.parse(data);
//					alert(data);
//					chart.series[0].setdata("[0,0,0,1000,63500,50000,7000,0,0,30000]");
//			},
//			cache: false
//		});
//	}
	
	$(function () {
		$.each(['line', 'column', 'area'], function (i, type) {
	        $('#' + type).click(function () {
	            chart.series[0].update({
	                type: type
	            });
	        });
	    });
		
		$('#duration').click(function () {
				alert($('#startDate').val()+"++"+$('#endDate').val());
				startYear=parseInt($('#startDate').val().substring(0,4));
				startMonth=parseInt($('#startDate').val().substring(5));
				endYear=parseInt($('#endDate').val().substring(0,4));
				endMonth=parseInt($('#endDate').val().substring(5));
				alert(endYear-startYear);
				
				
				if(startYear<=endYear) {
					if(startYear<endYear) {
						if(((endMonth+(12*(endYear-startYear)))-startMonth+1) >12) {
							alert((endMonth+(12*(endYear-startYear)))-startMonth+1);
							$('#errMsg').html("<font color='red'>검색기간은 12개월이 넘으면 안됩니다!</font>");
						}
						else {
							$('#errMsg').html("");
							$.ajax({
								url:'./listPaymentByMonth.do',
								type: "POST",
								data: {groupNo : groupNoHid, startDate : $('#startDate').val(), endDate : $('#endDate').val()},
								success: function(data){
									alert(data);
									var chart = $('#container').highcharts();
										data=JSON.parse(data);
										if(data.Group=="nodata") {
											chart.hideNoData();
											chart.showNoData("데이터가 없습니다");
										}
										else {
											chart.series[0].setData(data.Group);
										}
								},
								cache: false
							});
							
						}
					}
					else {
						if(startMonth>endMonth) {
							$('#errMsg').html("<font color='red'>시작일이 종료일보다 빠릅니다!</font>");
						}
						else {
							$('#errMsg').html("");
							$.ajax({
								url:'./listPaymentByMonth.do',
								type: "POST",
								data: {groupNo : groupNoHid, startDate : $('#startDate').val(), endDate : $('#endDate').val()},
								success: function(data){
									alert(data);
									var chart = $('#container').highcharts();
										data=JSON.parse(data);
										if(data.Group=="nodata") {
											chart.hideNoData();
											chart.showNoData("데이터가 없습니다");
										}
										else {
											chart.series[0].setData(data.Group);
										}
								},
								cache: false
							});
						}
					}
				}
				else {
					$('#errMsg').html("<font color='red'>시작일이 종료일보다 빠릅니다!</font>");
				}
				
				
	    });
		
	   
		
	});