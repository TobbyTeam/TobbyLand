<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>

<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="<c:url value="/resources/js/lecture.js" />"></script>

<title>헬로 월드</title></head>
<body>


<jsp:include page="/top" flush="true"/>

<br /> <br />

<jsp:include page="/evaluation/lecture" flush="true"/>

<br />


<a href="/evaluation/list?lecture_id=${lecture_id}">강의평가</a>&nbsp;&nbsp;<a href="/lecture/boardList?lecture_id=${lecture_id}">강의게시판</a>

<br /><br />

	<table border="1">
		<tr>
			<td>제목</td>
			<td>작성일</td>
		</tr>
		<c:forEach var="board" items="${boards}" varStatus="status">
		<tr>
			<td><a href="/lecture/boardView?ls_id=${board.ls_id}">${board.title}</a></td>
			<td>${board.write_date}</td>
		</tr>
		</c:forEach>
	</table><br /><br />

<jsp:include page="/lecture/paging" flush="true">
	<jsp:param name="firstPageNo" value="${paging.firstPageNo}" />
	<jsp:param name="prevPageNo" value="${paging.prevPageNo}" />
	<jsp:param name="startPageNo" value="${paging.startPageNo}" />
	<jsp:param name="pageNo" value="${paging.pageNo}" />
	<jsp:param name="endPageNo" value="${paging.endPageNo}" />
	<jsp:param name="nextPageNo" value="${paging.nextPageNo}" />
	<jsp:param name="finalPageNo" value="${paging.finalPageNo}" />
</jsp:include>

	<a href="/lecture/boardRegForm?lecture_id=${lecture_id}">글작성</a><br/><br/>

</body>
</html>