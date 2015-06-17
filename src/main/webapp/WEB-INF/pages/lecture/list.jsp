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
			<td>추천수</td>
		</tr>
		<c:forEach var="lecture" items="${lectures}" varStatus="status">
		<tr>
			<td>${lecture.lecture_name}</td>
			<td>${lecture.dept}</td>
			<td>${lecture.prof}</td>
			<td>${lecture.likes}</td>
			<td><a href="/lecture/likes?lecture_id=${lecture.lecture_id}">추천</a></td>
			<td><a href="/lecture/view?lecture_id=${lecture.lecture_id}">수정</a></td>
		</tr>
		</c:forEach>
	</table></br>
	<a href="/lecture/reg_form">강의생성</a>

	<a href="${pageContext.request.contextPath}/j_spring_security_logout">Log Out</a> <br />

</body>
</html>