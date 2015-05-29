<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head><title>헬로 월드</title></head>
<body>

	<table border="1">
		<tr>
			<td>아이디</td>
			<td>비밀번호</td>
		</tr>
		<c:forEach var="member" items="${members}" varStatus="status">
		<tr>
			<td>${member.member_id}</td>
			<td>${member.password}</td>
			<td><a href="/modify?id=${member.member_id}">수정</a></td>
		</tr>
		</c:forEach>
	</table>

</body>
</html>