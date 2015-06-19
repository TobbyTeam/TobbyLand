<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head><title>헬로 월드</title></head>
<body>

<c:if test="${not empty error}">
	${error}
</c:if>
</br>
<c:set var="noResult" value="@org.springframework.util.StringUtils@hasLength(${lectures})"/>
<c:if test="${ false == noResult}"> ${error} </c:if>

	<table border="1">
		<tr>
			<td>강의명</td>
			<td>학과명</td>
			<td>교수명</td>
		</tr>
		<c:forEach var="lecture" items="${lectures}" varStatus="status">
		<tr>
			<td><a href="/evaluation/list?lecture_id=${lecture.lecture_id}">${lecture.lecture_name}</a></td>
			<td>${lecture.dept}</td>
			<td>${lecture.prof}</td>
		</tr>
		</c:forEach>
	</table></br>

<a href="${pageContext.request.contextPath}/j_spring_security_logout">Log Out</a> <br />

</body>
</html>