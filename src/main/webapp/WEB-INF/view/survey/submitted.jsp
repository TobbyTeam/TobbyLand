<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<title>응답 내용</title>
</head>
<body>
	<p>응답 내용:</p>
	<ul>
		<c:forEach var="response" 
		           items="${ansData.responses}" varStatus="status">
		<li>${status.index + 1}번 문항: ${response}</li>
		</c:forEach>
	</ul>
	<p>응답자 학과: ${ansData.res.major}</p>
	<p>응답자 학년: ${ansData.res.grade}</p>
</body>
</html>