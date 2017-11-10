<%@ page contentType="text/html;charset=UTF-8" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
	<title>SPRING_PROJECT</title>
</head>
<body>
	<a href="/">HOME</a>
	<br>
	<a href="/member/form">FORM</a>
	<br>
	<c:if test="${ !empty members }">
		전체 : ${fn:length(members)} 명 (성인 : ${fn:length(adults)} 명)
	</c:if>
	<br>
	<table style="border-style: dotted">
		<tr style="background-color: red; text-align: center">
			<td>No.</td>
			<td>name</td>
			<td>id</td>
			<td>password</td>
			<td>phone</td>
			<td>age</td>
			<td>reg_date</td>
		</tr>
		<c:if test="${ !empty members }">
			<c:forEach var="member" items="${members}" varStatus="status">
				<tr style="background-color: <c:if test="${status.count%2 == 1 }">yellow</c:if><c:if test="${status.count%2 == 0 }">skyblue</c:if>">
					<td><c:out value="${status.count }"/></td>
					<td><a href="/member/detail?seq=${member.seq }"><c:out value="${member.name }"/></a></td>
					<td><c:out value="${member.id }"/></td>
					<td><c:out value="${member.password }"/></td>
					<td style="text-align: center"><c:out value="${member.phone }"/></td>
					<td style="text-align: center"><c:out value="${member.age }"/></td>
					<td style="text-align: center"><c:out value="${member.reg_date }"/></td>
				</tr>
			</c:forEach>
		</c:if>
	</table>
</body>
</html>
