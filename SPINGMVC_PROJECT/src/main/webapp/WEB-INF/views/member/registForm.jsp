<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="../include/header.jsp" %>
<h1>
	회원가입폼 <a href="/">돌아가기</a>
</h1>

		<form action="/member/regist" method="post">
		
				<input type="text" name="name" placeholder="이름"><br>
				<input type="text" name="age" placeholder="나이"><br>
				
				
				<input type="radio" name="gender" value="M">남성<br>
				<input type="radio" name="gender" value="F" >여성<br>
		
		  
		<input type="submit" value="확인">

</form>

</body>
</html>
