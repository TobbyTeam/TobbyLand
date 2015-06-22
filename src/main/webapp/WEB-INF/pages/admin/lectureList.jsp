<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head><title>헬로 월드</title></head>
<body>

<c:if test="${not empty error}">
	${error}
</c:if>

<form action="/lecture/search" method="get">

	검색
	<select name="searchType">
		<option value="lecture_name">강의명</option>
		<option value="dept">학과명</option>
		<option value="prof">교수명</option>
	</select>

	<input type="text" name="searchWord"><br>
	<input type="submit" value="검색">

</form>
<br/>


	<table border="1">
		<tr>
			<td>작성자</td>
			<td>강의명</td>
			<td>학과명</td>
			<td>교수명</td>
			<td>추천수</td>
			<td>작성일자</td>
			<td>상태</td>
		</tr>
		<c:forEach var="lecture" items="${lectures}" varStatus="status">
		<tr>
			<td>${lecture.member_id}</td>
			<td>${lecture.lecture_name}</td>
			<td>${lecture.dept}</td>
			<td>${lecture.prof}</td>
			<td>${lecture.likes}</td>
			<td>${lecture.write_date}</td>
			<td>${lecture.is_delete}</td>
			<td><a href="/admin/lecture/view?lecture_id=${lecture.lecture_id}">수정</a></td>
			<td><a href="/admin/lecture/isDelete?lecture_id=${lecture.lecture_id}">삭제</a></td>
			<td><a href="/admin/lecture/isUndelete?lecture_id=${lecture.lecture_id}">복구</a></td>
			<td><a href="/admin/lecture/delete?lecture_id=${lecture.lecture_id}">완전삭제</a></td>
		</tr>
		</c:forEach>
	</table></br>


	<a href="/lecture/reg_form">강의생성</a>

	<a href="${pageContext.request.contextPath}/j_spring_security_logout">Log Out</a> <br />
<a href="/member/view">회원정보</a><br/>


</body>
</html>