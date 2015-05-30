<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head><title>헬로 월드</title></head>
<body>

	<table border="1">
		<tr>
			<td>작성자</td>
			<td>강의아이디</td>
		</tr>
		<c:forEach var="evaluation" items="${evaluations}" varStatus="status">
		<tr>
			<td>${evaluation.member_id}</td>
			<td>${evaluation.lecture_id}</td>
			<td><a href="/modify?id=${evaluation.member_id}">수정</a></td>
		</tr>
		</c:forEach>
	</table>

</body>
</html>