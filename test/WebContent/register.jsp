<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>


상품번호 : <input type="text" id="item_num" value=""/>
<input type="button" id="item_search" value="..."/>
상품명 : <input type="text" id="item_name" value=""/>
단가 : <input type="text" id="item_price" value=""/>
수량 : <input type="text" id="item_quantity" value=""/>
 <input type="button" id="btn추가" value="추가"/>
 <input type="button" id="btn등록" value="등록"/>
 <ul id="list판매내역">
 
 </ul>
<script type="text/javascript">
var 판매 ={총액:0,salelineitems:[]};
var json;
$(document).ready(function() {
	
	$("#item_search").click(function() {
		
		 $.post("searchitem.jsp",
				    {
				        id: $('#item_num').val()
				    },
				    function(data, status){
				    	alert(data);
				    	 json = $.parseJSON(data);
				    	
				    	$('#item_name').val(json.name);
				      $('#item_price').val(json.price);
				    });
		 
		 
		 $('#item_quantity').focus();
	});
$("#btn추가").click(function() {
	var n수량=new Number( $("#item_quantity").val() );
	var 판매내역 = {item:json, quantity:n수량,amount:n수량*json.price};
	판매.salelineitems.push(판매내역);
	판매내역출력();
});
$("#btn등록").click(function(){	
	$.post("reg.jsp",
			{sale:JSON.stringify(판매)},
		    function(data, status){
	        	alert("판매등록됨");
	        	console.log(data);
		    }
	 );
	판매={total:0, salelineitems:[]};
});

});
function 판매내역출력() {
	var list판매내역=$("#list판매내역");
	list판매내역.empty();

		for(var i=0, len=판매.salelineitems.length; i<len; i++){
		var 한판매내역 = 판매.salelineitems[i];
		var 취소버튼 = $("<input type='button' value='취소'/>");
		취소버튼[0].my_target=한판매내역;
		취소버튼.click(function() {
			
			
			var 삭제할판매내역 = this.my_target;
			var 위치 = 판매.salelineitems.indexOf(삭제할판매내역);
			//delete 판매.salelineitems[위치];
			판매.salelineitems.splice(위치, 1);
			//판매.판매내역들
			판매내역출력();
			
			
		});
		var liText =(i+1).toString()+"&nbsp;"+한판매내역.item.id.toString()+"&nbsp;"+한판매내역.item.name+"&nbsp;"+한판매내역.item.price.toString()+"&nbsp;"+한판매내역.quantity.toString()+"&nbsp;"+한판매내역.amount.toString();
		var li= $("<li></li>");
		li.html(liText).append(취소버튼);
		list판매내역.append(li);
	}

	
}	
</script>
</body> 
</html>