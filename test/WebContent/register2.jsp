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

��ǰ��ȣ<input type="text" id="txt��ǰ��ȣ" size="10"/>
<input type="button" id="btn��ǰ��ȸ" value="..."/>
��ǰ��<input type="text" id="txt��ǰ��" size="10"/>
�ܰ�<input type="text" id="txt��ǰ�ܰ�" size="10"/>
����<input type="text" id="txt����" size="10"/>
<input type="button" id="btn�߰�" value="�߰�"/>
<ul id="list�Ǹų���">
	
</ul>

<script type="text/javascript">
var �Ǹ�={total:0, salelineitems:[]};
var ã����ǰ;
$(document).ready(function(){
	$("#btn��ǰ��ȸ").click(function(){		
		 $.post("searchitem.jsp",
		        {id: $("#txt��ǰ��ȣ").val()},
			    function(data, status){
		        	ã����ǰ=JSON.parse(data);
		        	$("#txt��ǰ��").val(ã����ǰ.name);
		        	$("#txt��ǰ�ܰ�").val(ã����ǰ.price);
		        	$("#txt����").focus();
			    }
		 );				
	});	
	
	$("#btn�߰�").click(function(){	
		var n����=new Number($("#txt����").val());
		var �Ǹų���={item:ã����ǰ, quantity:n����, amount:n����*ã����ǰ.price };
		�Ǹ�.salelineitems.push(�Ǹų���);
		�Ǹų�������ϴ�();
	});
});

function �Ǹų�������ϴ�(){
	var list�Ǹų���=$("#list�Ǹų���");
	list�Ǹų���.empty();
	
	for(var i=0, len=�Ǹ�.salelineitems.length; i<len; i++){
		var ���Ǹų���=�Ǹ�.salelineitems[i];
		var ��ҹ�ư=$("<input type='button' value='���' />");
		��ҹ�ư[0].my_target=���Ǹų���;
		��ҹ�ư.click(function(){
			var �������Ǹų���= this.my_target;
			var ��ġ = �Ǹ�.salelineitems.indexOf(�������Ǹų���);
			//delete �Ǹ�.salelineitems[��ġ];
			�Ǹ�.salelineitems.splice(��ġ, 1);
			�Ǹų�������ϴ�();
			
		});		
		
		var liText=(i+1).toString()+" "+���Ǹų���.item.id.toString()+" "+
		���Ǹų���.item.name+" "+���Ǹų���.item.price.toString()+" ";
		���Ǹų���.quantity.toString()+" "+���Ǹų���.amount.toString();
		var li= $("<li></li>");
		li.html(liText).append(��ҹ�ư);
		
		list�Ǹų���.append(li);
	}
}

</script>
</body>
</html>