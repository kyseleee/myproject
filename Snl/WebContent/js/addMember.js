$(function() {
			$('#register-submit').click(function(e) {
				var table = document.getElementById('preview');
		    	var rowLength = table.rows.length;
				var toEmail="";
		    	for(var i=0; i<rowLength-1; i++){
		    		toEmail =  toEmail + $("td[class=input-description]").eq(i).html() + ";";
		    	}
		    	console.log(toEmail);
	    		document.getElementById("sendMsg").value= toEmail;
			});
		});


function calc_total(){
    var sum = 0;
//    $('.input-num').each(function(){
//        sum += parseFloat($(this).text());
//    });
    sum=document.getElementById("preview").rows.length-1;
    $(".preview-total").text(sum);
  
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
//    	var count = $('.input-num').text();
//    	alert(count=='');
    	var form_data = {};
//        var i=0;
//        if(count==''){
//        	i=1;
//        }
//        else{
//        	 $('.input-num').each(function(){
//        	        i += parseInt($(this).text());
//        	    });
//        }
    	
    	
    	//var a=$("preview").length;
    	var a=document.getElementById("preview").rows.length;
    	
        form_data["num"] = a;
        form_data["description"] = $('.payment-form2 input[name="description"]').val();
        
        form_data["remove-row"] = '<span class="glyphicon glyphicon-remove"></span>';
        
        var row = $("<tr align='center'></tr>");
        $.each(form_data, function( type, value ) {
        	
            $('<td id=va class="input-'+type+'"></td>').html(value).appendTo(row);

        	
        });
        $('.preview-table > tbody:last').append(row);
        calc_total();
    });  
});