<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head><title>헬로 월드</title></head>
<body>

<%--<c:set var="noResult" value="@org.springframework.util.StringUtils@hasLength(${lectures})"/>

<c:if test="${ false == noResult}"> ${error} </c:if>--%>

<jsp:include page="/top" flush="true"/> <br />

<c:if test="${not empty error}">
	${error}
</c:if>
<br /><br />

	<table border="1">
		<tr>
			<td>강의명</td>
			<td>학과명</td>
			<td>교수명</td>
			<td>강의평가수</td>
		</tr>
		<c:forEach var="lecture" items="${lectures}" varStatus="status">
		<tr>
			<td><a href="/evaluation/list?lecture_id=${lecture.lecture_id}">${lecture.lecture_name}</a></td>
			<td>${lecture.dept}</td>
			<td>${lecture.prof}</td>
			<td>${lecture.count}</td>
		</tr>
		</c:forEach>
	</table></br><br/>

</body>
</html>