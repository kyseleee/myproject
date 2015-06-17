var groupNoHid=document.getElementById("groupNoHidden").value;
function popup(url) {
	window.open(url,'','width=460, height=460, scrollbars=no, status=no;');
}
$(document).ready(function(){
    
    
    $.ajax({
		url : './listPaymentByDay.do',
		data : {groupNo : groupNoHid},
		dataType : 'json',
		method : 'POST',
		success : function(data){
			alert(decodeURIComponent(data[0].payName));
			var receiptLink;
			for(var i=0;i<data.length;i++){
				var row = $('<tr></tr>');
				var content='';
				data[i].method=decodeURIComponent(data[i].method);
				data[i].receit=decodeURIComponent(data[i].receit);
				data[i].payName=decodeURIComponent(data[i].payName);
				
				if(data[i].method=='1') {
					data[i].method='신용카드';
				} else {
					data[i].method='현    금';
				}
				
				if(data[i].receit=='-') {				
					receiptLink=data[i].receit;
				}
				else {
					receiptLink='<a href="http://192.168.200.122:8080/Snl/'+data[i].receit+'" onclick="popup(this.href); return false;">'+data[i].receit+'</a>';
				}
				
				content+='<td>'+(i+1)+'</td><td>'+data[i].method+'</td><td>'+data[i].payDate+'</td><td>'+data[i].payName+'</td><td>'+parseInt(data[i].amount).toLocaleString()+'원'+'</td><td>'+receiptLink+'</td>';
				$(content).appendTo(row);
				$('.table > tbody:last').append(row); 
			}
		}
		
	});
    
    
});