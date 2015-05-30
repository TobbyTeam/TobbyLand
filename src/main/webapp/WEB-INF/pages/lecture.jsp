<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head><title>헬로 월드</title></head>
<body>

	<table border="1">
		<tr>
			<td>강의명</td>
			<td>학과명</td>
			<td>교수명</td>
		</tr>
		<c:forEach var="lecture" items="${lectures}" varStatus="status">
		<tr>
			<td>${lecture.lecture_name}</td>
			<td>${lecture.dept}</td>
			<td>${lecture.prof}</td>
			<td><a href="/modify?id=${lecture.lecture_id}">수정</a></td>
		</tr>
		</c:forEach>
	</table></br>
	<a href="/lecture_list">강의생성

</body>
</html>