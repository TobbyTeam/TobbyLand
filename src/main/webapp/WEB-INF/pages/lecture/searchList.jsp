<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

	<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>

<head><title>헬로 월드</title></head>
<body>

	<jsp:include page="/top" flush="true"/>

	<br /><br />

	<jsp:include page="/lecture/search_form" flush="true"/>

	<br /><br />

	<c:choose>
		<c:when test="${not empty error}">
			${error}
		</c:when>
		<c:otherwise>
			<table border="1">
				<tr>
					<td>강의명</td>
					<td>학과명</td>
					<td>교수명</td>
					<td>강의평가수</td>
					<td>평점</td>
				</tr>
				<c:forEach var="lecture" items="${lectures}" varStatus="status">
					<tr>
						<td><a href="/evaluation/list?lecture_id=${lecture.lecture_id}">${lecture.lecture_name}</a></td>
						<td>${lecture.department_name}</td>
						<td>${lecture.prof}</td>
						<td>${lecture.count}</td>
						<td>${lecture.avg}</td>
					</tr>
				</c:forEach>
			</table></br><br/>
		</c:otherwise>
	</c:choose>

</body>
</html>