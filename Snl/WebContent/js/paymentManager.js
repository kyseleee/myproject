//==> 화면전환 slideToggle 사용
$(document).ready(function(){
    $("#flip").click(function(){
        $("#panel").slideToggle("slow");
    });
   
});

//==> number 천단위로 식별하기 
var rgx1 = /\D/g;  // /[^0-9]/g 와 같은 표현
var rgx2 = /(\d+)(\d{3})/; 

function getNumber(obj){
	
    var num01;
    var num02;
    num01 = obj.value;
    num02 = num01.replace(rgx1,"");
    num01 = setComma(num02);
    obj.value =  num01;

}

function setComma(inNum){
    
    var outNum;
    outNum = inNum; 
    while (rgx2.test(outNum)) {
         outNum = outNum.replace(rgx2, '$1' + ',' + '$2');
     }
    return outNum;

}

//==>테이블에 값 넣어주기
$(function(){
    $('.preview-add-button').click(function(){
        var form_data = {};
        
        form_data["list"] = $('.payment-form input[name="list"]').val();
        form_data["paylist"] = $('.payment-form input[name="paylist"]').val();
        form_data["check"] = '<input class="form-check"></input>';
        form_data["remove-row"] = '<span class="glyphicon glyphicon-remove"></span>';
        
        var row = $('<tr></tr>');
        $.each(form_data, function( type, value ) {
            $('<td class="input-'+type+'"></td>').html(value).appendTo(row);
        });
        $('.preview-table > tbody:last').append(row); 
    });  
});

$(document).on('click', '.input-remove-row', function(){ 
    var tr = $(this).closest('tr');
    tr.fadeOut(200, function(){
    	tr.remove();
	});
});

//==>처음 input tag 에서 받은 value를 다음화면에 비활성화로 뿌려주기
$(function(){
    $('.preview-add-button2').click(function(){
    	var a = $("input[id=concept]").val();
        $('#concept1').val(a);
    	
        var b = $("input[id=date]").val();
        $('#date1').val(b);
        
        var c = $("input[id=pay]").val();
        $('#pay1').val(c);
        
        var d = $("input[id=paylist]").val();
        $('#paylist1').val(d);
        
        alert('저장이 완료 되었습니다');
    });
});
$(function(){
	$("#sumbit").click(function() {
		alert('저장이 완료 되었습니다');
	});

});