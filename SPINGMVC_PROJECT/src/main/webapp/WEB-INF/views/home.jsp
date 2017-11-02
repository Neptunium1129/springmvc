<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="./include/header.jsp" %>
<script>

function delete_(seq) {
	console.log(seq)
	if(confirm('삭제하겠습니까?')){
	
	$.ajax({
		url : '/member/delete'
		,method : 'post'
		,data : {
			
			seq : seq
			
		}

		
	}).done(function(msg) {
		console.log(msg);
		if('1'==msg){
			
		
			$('#m_'+seq).hide('slow');
		}else{
			
			alert("실패했습니다.\r\n나중에 다시 시도하세요");
			
		}
	});
	
		
	}else{
		
		
	}
	
}

</script>
<h1>

</h1>
<table border="1">
	<tr>
		<th>번호</th>
		<th>이름</th>
		<th>나이</th>
		<th>성별</th>
		<th>등록시간</th>
			<th>삭제</th>
	</tr>
	<c:forEach var="members" items="${member}" >
	<tr id="m_${members.seq}">
		<td>${members.seq}</td>
		<td><a href="/member/ ?seq=${members.seq}">${members.name}</a></td>
		<td>${members.age}</td>
		<td>${members.gender}</td>
		<td>${members.reg_date}</td>
		<td><input type="button" onclick="delete_(${members.seq})" value="삭제"/></td>
		
	</tr>
	</c:forEach>
</table>

<a href="member/registForm">회원가입</a>
</body>
</html>
