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


��ǰ��ȣ : <input type="text" id="item_num" value=""/>
<input type="button" id="item_search" value="..."/>
��ǰ�� : <input type="text" id="item_name" value=""/>
�ܰ� : <input type="text" id="item_price" value=""/>
���� : <input type="text" id="item_quantity" value=""/>
 <input type="button" id="btn�߰�" value="�߰�"/>
 <input type="button" id="btn���" value="���"/>
 <ul id="list�Ǹų���">
 
 </ul>
<script type="text/javascript">
var �Ǹ� ={�Ѿ�:0,salelineitems:[]};
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
$("#btn�߰�").click(function() {
	var n����=new Number( $("#item_quantity").val() );
	var �Ǹų��� = {item:json, quantity:n����,amount:n����*json.price};
	�Ǹ�.salelineitems.push(�Ǹų���);
	�Ǹų������();
});
$("#btn���").click(function(){	
	$.post("reg.jsp",
			{sale:JSON.stringify(�Ǹ�)},
		    function(data, status){
	        	alert("�Ǹŵ�ϵ�");
	        	console.log(data);
		    }
	 );
	�Ǹ�={total:0, salelineitems:[]};
});

});
function �Ǹų������() {
	var list�Ǹų���=$("#list�Ǹų���");
	list�Ǹų���.empty();

		for(var i=0, len=�Ǹ�.salelineitems.length; i<len; i++){
		var ���Ǹų��� = �Ǹ�.salelineitems[i];
		var ��ҹ�ư = $("<input type='button' value='���'/>");
		��ҹ�ư[0].my_target=���Ǹų���;
		��ҹ�ư.click(function() {
			
			
			var �������Ǹų��� = this.my_target;
			var ��ġ = �Ǹ�.salelineitems.indexOf(�������Ǹų���);
			//delete �Ǹ�.salelineitems[��ġ];
			�Ǹ�.salelineitems.splice(��ġ, 1);
			//�Ǹ�.�Ǹų�����
			�Ǹų������();
			
			
		});
		var liText =(i+1).toString()+"&nbsp;"+���Ǹų���.item.id.toString()+"&nbsp;"+���Ǹų���.item.name+"&nbsp;"+���Ǹų���.item.price.toString()+"&nbsp;"+���Ǹų���.quantity.toString()+"&nbsp;"+���Ǹų���.amount.toString();
		var li= $("<li></li>");
		li.html(liText).append(��ҹ�ư);
		list�Ǹų���.append(li);
	}

	
}	
</script>
</body> 
</html>