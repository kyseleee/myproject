var chart;
		$(document).ready(function () {
			alert("graph");
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
	        series: []
	    });
	});
	
	function requestData(){
		alert("requestData");
		$.ajax({
				url:'./listPaymentByMonth.do',
				type: "GET",
				data: {groupNo : 10080},
				success: function(data){
						data=JSON.parse(data); 
						chart.addSeries({
								name: "group1",
								data: data.Group
						});
				},
				cache: false
			});
	}
	
	function updateChart(){
		var chart = $('#container').highcharts();
		alert($('#startDate').val()+"++"+$('#endDate').val());
		$.ajax({
			url:'./listPaymentByMonth.do',
			type: "POST",
			data: {groupNo : 10080, startDate : $('#startDate').val(), endDate : $('#endDate').val()},
			success: function(data){
				alert(data);
				var chart = $('#container').highcharts();
					data=JSON.parse(data);
					alert(data);
					chart.series[0].setdata("[0,0,0,1000,63500,50000,7000,0,0,30000]");
			},
			cache: false
		});
	}
	
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
				$.ajax({
					url:'./listPaymentByMonth.do',
					type: "POST",
					data: {groupNo : 10080, startDate : $('#startDate').val(), endDate : $('#endDate').val()},
					success: function(data){
						alert(data);
						var chart = $('#container').highcharts();
							data=JSON.parse(data);
							chart.series[0].setData(data.Group);
					},
					cache: false
				});
	    });
		
	   
		
	});