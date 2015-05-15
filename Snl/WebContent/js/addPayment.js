function calc_total(){
    var sum = 0;
    $('.input-amount').each(function(){
        sum += parseFloat($(this).text());
    });
    $(".preview-total").text(sum+"원");    
}
$(document).on('click', '.input-remove-row', function(){ 
    var tr = $(this).closest('tr');
    tr.fadeOut(200, function(){
    	tr.remove();
	   	calc_total()
	});
});

$(function(){
    $('.preview-add-button').click(function(){
        var form_data = {};
        form_data["payCat"] = $('.payment-form #payCat option:selected').text();
        form_data["payMethod"] = $('.payment-form #payMethod option:selected').text();
        form_data["receit"] = $('.payment-form input[name="receit"]').val();
        form_data["date"] = $('.payment-form input[name="date"]').val();
        form_data["place"] = $('.payment-form input[name="place"]').val();
        form_data["amount"] = parseFloat($('.payment-form input[name="amount"]').val()).toFixed(2);
        
        
        form_data["remove-row"] = '<span class="glyphicon glyphicon-remove"></span>';
        var row = $('<tr></tr>');
        $.each(form_data, function( type, value ) {
            $('<td class="input-'+type+'"></td>').html(value).appendTo(row);
        });
        $('.preview-table > tbody:last').append(row); 
        calc_total();
    });  
});