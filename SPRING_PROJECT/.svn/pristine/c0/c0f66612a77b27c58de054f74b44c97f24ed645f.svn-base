<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<title>SPRING_PROJECT</title>
	<script src="/resources/js/jquery-2.1.1.min.js"></script>
	<script>
	
		function updateMember() {
			var form = $('#form');
			form.attr('action','/member/update');
			form.attr('method','post');
			form.submit();
		}
		
		function deleteMember() {
			var result = confirm('정말 삭제하시겠습니까?');
			if(result){
				var form = $('#form');
				form.attr('action','/member/delete');
				form.attr('method','post');
				form.submit();
			}
		}
	
	</script>
</head>
<body>
	<a href="/">HOME</a>
	<br>
	<a href="/member/list">LIST</a>
	<form id="form">
		<input type="hidden" name="seq" id="seq" value="${member.seq}"/>
		<table style="border-style: dotted">
			<tr>
				<td>name</td>
				<td><input type="text" name="name" value="${member.name}"/></td>
			</tr>
			<tr>
				<td>id</td>
				<td><input type="text" name="id" value="${member.id}"/></td>
			</tr>
			<tr>
				<td>password</td>
				<td><input type="text" name="password" value="${member.password}"/></td>
			</tr>
			<tr>
				<td>phone</td>
				<td><input type="text" name="phone" value="${member.phone}"/></td>
			</tr>
			<tr>
				<td>age</td>
				<td><input type="text" name="age" value="${member.age}"/></td>
			</tr>
		</table>
	</form>
	<input type="button" onclick="updateMember()" value="수정"/><input type="button" onclick="deleteMember()" value="삭제"/>
</body>
</html>
