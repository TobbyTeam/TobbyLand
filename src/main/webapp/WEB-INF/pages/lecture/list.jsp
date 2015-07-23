<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>

<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="<c:url value="/resources/js/lecture.js" />"></script>

<title>헬로 월드</title></head>
<body>


<jsp:include page="/top" flush="true"/> <br />

<br /><br />

	<table border="1">
		<tr>
			<td>강의명</td>
			<td>학과명</td>
			<td>교수명</td>
			<td>추천수</td>
			<td>작성일</td>
		</tr>
		<c:forEach var="lecture" items="${lectures}" varStatus="status">
		<tr>
			<td>${lecture.lecture_name}</td>
			<td>${lecture.department_name}</td>
			<td>${lecture.prof}</td>
			<td><input type="button" value="추천(${lecture.likes})" onclick="likeAjax(${lecture.lecture_id})"></td>
			<td>${lecture.write_date}</td>
			<td><input type="button" value="수정" onclick="modAjax(${lecture.lecture_id})"></td>
			<td><input type="button" value="삭제" onclick="deleteAjax(${lecture.lecture_id})"></td>
		</tr>
		</c:forEach>
	</table><br /><br />

	<a href="/lecture/regForm">강의생성</a><br/><br/>

</body>
</html>