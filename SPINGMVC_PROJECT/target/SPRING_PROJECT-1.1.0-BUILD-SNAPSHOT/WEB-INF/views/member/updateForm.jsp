<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="../include/header.jsp" %>
<h1>
	회원가입폼 <a href="/">돌아가기</a>
</h1>

		<form action="/member/update" method="post">
				<input type="hidden" name="seq" value="${member.seq}">
				<input type="text" name="name" placeholder="이름" value="${member.name}"><br>
				<input type="text" name="age" placeholder="나이" value="${member.age}"><br>
				<input type="radio" name="gender" value="M" <c:if test="${'M'== member.gender}"> checked</c:if>>남성<br>
				<input type="radio" name="gender" value="F" <c:if test="${'F'== member.gender}"> checked</c:if>>여성<br>
		
		  
		<input type="submit" value="수정하기">

</form>

</body>
</html>
