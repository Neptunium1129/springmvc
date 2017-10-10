<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

상품번호<input type="text" id="txt상품번호" size="10"/>
<input type="button" id="btn상품조회" value="..."/>
상품명<input type="text" id="txt상품명" size="10"/>
단가<input type="text" id="txt상품단가" size="10"/>
수량<input type="text" id="txt수량" size="10"/>
<input type="button" id="btn추가" value="추가"/>
<ul id="list판매내역">
	
</ul>

<script type="text/javascript">
var 판매={total:0, salelineitems:[]};
var 찾은상품;
$(document).ready(function(){
	$("#btn상품조회").click(function(){		
		 $.post("searchitem.jsp",
		        {id: $("#txt상품번호").val()},
			    function(data, status){
		        	찾은상품=JSON.parse(data);
		        	$("#txt상품명").val(찾은상품.name);
		        	$("#txt상품단가").val(찾은상품.price);
		        	$("#txt수량").focus();
			    }
		 );				
	});	
	
	$("#btn추가").click(function(){	
		var n수량=new Number($("#txt수량").val());
		var 판매내역={item:찾은상품, quantity:n수량, amount:n수량*찾은상품.price };
		판매.salelineitems.push(판매내역);
		판매내역출력하다();
	});
});

function 판매내역출력하다(){
	var list판매내역=$("#list판매내역");
	list판매내역.empty();
	
	for(var i=0, len=판매.salelineitems.length; i<len; i++){
		var 한판매내역=판매.salelineitems[i];
		var 취소버튼=$("<input type='button' value='취소' />");
		취소버튼[0].my_target=한판매내역;
		취소버튼.click(function(){
			var 삭제할판매내역= this.my_target;
			var 위치 = 판매.salelineitems.indexOf(삭제할판매내역);
			//delete 판매.salelineitems[위치];
			판매.salelineitems.splice(위치, 1);
			판매내역출력하다();
			
		});		
		
		var liText=(i+1).toString()+" "+한판매내역.item.id.toString()+" "+
		한판매내역.item.name+" "+한판매내역.item.price.toString()+" ";
		한판매내역.quantity.toString()+" "+한판매내역.amount.toString();
		var li= $("<li></li>");
		li.html(liText).append(취소버튼);
		
		list판매내역.append(li);
	}
}

</script>
</body>
</html>