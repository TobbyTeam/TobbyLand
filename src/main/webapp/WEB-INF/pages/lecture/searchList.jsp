<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head><title>헬로 월드</title></head>
<body>

</br>
<%--<c:set var="noResult" value="@org.springframework.util.StringUtils@hasLength(${lectures})"/>

<c:if test="${ false == noResult}"> ${error} </c:if>--%>

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

	<input type="text" name="searchWord">
	<input type="submit" value="검색">

</form>

<br/><br/>


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
	</table></br><br/>

<a href="${pageContext.request.contextPath}/j_spring_security_logout">Log Out</a> <br/><br/>
<a href="/lecture/list">강의생성게시판</a><br/><br/>
<a href="/member/view">회원정보</a><br/>

</body>
</html>