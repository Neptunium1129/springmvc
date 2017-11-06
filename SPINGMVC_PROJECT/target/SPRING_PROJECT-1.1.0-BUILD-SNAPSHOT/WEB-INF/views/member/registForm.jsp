<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="../include/header.jsp" %>
<h1>
	회원가입폼 <a href="/">돌아가기</a>
</h1>

		<form action="/member/regist" method="post" enctype="multipart/form-data">
			<input type="file" id="take-picture" name="file" accept="image/*"><br>
			
			<img style="border-radius:50%;width:200px;hegiht:200px" src="/resources/images/no_img.jpg" alt="" id="show-picture"><br>
	
				<input type="text" name="name" placeholder="이름"><br>
				<input type="text" name="age" placeholder="나이"><br>
				
				
				<input type="radio" name="gender" value="M">남성<br>
				<input type="radio" name="gender" value="F" >여성<br>
		
		  
		<input type="submit" value="확인">

</form>

</body>
</html>
