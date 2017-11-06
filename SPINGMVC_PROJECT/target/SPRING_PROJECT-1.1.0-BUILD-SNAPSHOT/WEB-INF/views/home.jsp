<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="./include/header.jsp" %>
<script>
function search() {
	document.location.href='/?name='+$('#name').val();
	$('#name').focus();
	
	
}

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
		<th>사진</th>
		<th>이름</th>
		<th>나이</th>
		<th>성별</th>
		<th>등록시간</th>
			<th>삭제</th>
	</tr>
	<c:forEach var="members" items="${member}" >
	<tr id="m_${members.seq}">
		<td>${members.seq}</td>
		<c:choose>
		<c:when test="${members.n_file_name eq null}">
		<td><img width="50px" height="50px" src="/resources/images/no_img.jpg"></td>
		</c:when>
		<c:otherwise>
		<td><img width="50px" height="50px" src="/resources/upload/${members.n_file_name}"></td>
		</c:otherwise>
		</c:choose>
		
		<td><a href="/member/updateForm?seq=${members.seq}">${members.name}</a></td>
		<td>${members.age}</td>
		<td>${members.gender}</td>
		<td>${members.reg_date}</td>
		<td><input type="button" onclick="delete_(${members.seq})" value="삭제"/></td>
		
	</tr>
	</c:forEach>

</table>
	<c:forEach begin="1" end="${tPage}" varStatus="p">
	<span><a href="/?pno=${p.count}">${p.count}</a></span>
	</c:forEach>
	

<a href="member/registForm">회원가입</a>

<p>
<input type="text" id="name" name="name" placeholder="이름" value="${name}">
<input type="button" value="검색" onclick="search();">

</p>
</body>
</html>
