var groupNoHid=document.getElementById("groupNoHidden").value;
function popup(url) {
	window.open(url,'','width=460, height=460, scrollbars=no, status=no;');
}
$(document).ready(function(){
    $('.filterable .btn-filter').click(function(){
        var $panel = $(this).parents('.filterable'),
        $filters = $panel.find('.filters input'),
        $tbody = $panel.find('.table tbody');
        if ($filters.prop('disabled') == true) {
            $filters.prop('disabled', false);
            $filters.first().focus();
        } else {
            $filters.val('').prop('disabled', true);
            $tbody.find('.no-result').remove();
            $tbody.find('tr').show();
        }
    });

    $('.filterable .filters input').keyup(function(e){
        /* Ignore tab key */
        var code = e.keyCode || e.which;
        if (code == '9') return;
        /* Useful DOM data and selectors */
        var $input = $(this),
        inputContent = $input.val().toLowerCase(),
        $panel = $input.parents('.filterable'),
        column = $panel.find('.filters th').index($input.parents('th')),
        $table = $panel.find('.table'),
        $rows = $table.find('tbody tr');
        /* Dirtiest filter function ever ;) */
        var $filteredRows = $rows.filter(function(){
            var value = $(this).find('td').eq(column).text().toLowerCase();
            return value.indexOf(inputContent) === -1;
        });
        /* Clean previous no-result if exist */
        $table.find('tbody .no-result').remove();
        /* Show all rows, hide filtered ones (never do that outside of a demo ! xD) */
        $rows.show();
        $filteredRows.hide();
        /* Prepend no-result row if all rows are filtered */
        if ($filteredRows.length === $rows.length) {
            $table.find('tbody').prepend($('<tr class="no-result text-center"><td colspan="'+ $table.find('.filters th').length +'">No result found</td></tr>'));
        }
    });
    
    $.ajax({
		url : './listPaymentByDay.do',
		data : {groupNo : groupNoHid},
		dataType : 'json',
		method : 'POST',
		success : function(data){
			alert(decodeURIComponent(data[0].payName));
			
			for(var i=0;i<data.length;i++){
				var row = $('<tr></tr>');
				var content='';
				data[i].title=decodeURIComponent(data[i].title);
				data[i].method=decodeURIComponent(data[i].method);
				data[i].receit=decodeURIComponent(data[i].receit);
				data[i].payName=decodeURIComponent(data[i].payName);
				
				if(data[i].method=='1') {
					data[i].method='신용카드';
				} else {
					data[i].method='현    금';
				}
				
				
				
				content+='<td>'+(i+1)+'</td><td>'+data[i].method+'</td><td>'+data[i].payDate+'</td><td>'+data[i].payName+'</td><td>'+data[i].amount+'</td><td><a href="http://192.168.200.122:8080/Snl/'+data[i].receit+'" onclick="popup(this.href); return false;">'+data[i].receit+'</a></td>';
				$(content).appendTo(row);
				$('.table > tbody:last').append(row); 
			}
		}
		
	});
    
    
});