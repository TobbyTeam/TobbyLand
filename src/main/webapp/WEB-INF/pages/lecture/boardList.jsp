<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>

<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="<c:url value="/resources/js/lecture.js" />"></script>

<title>헬로 월드</title></head>
<body>

<jsp:include page="/top" flush="true"/>

<br /><br />

<jsp:include page="/lecture/search_form" flush="true"/>

<br /><br />

<jsp:include page="/evaluation/lecture?lecture_id=${lecture_id}" flush="true"/>

<br /><br />

	<table border="1">
		<tr>
			<td>글번호</td>
			<td>제목</td>
			<td>작성일</td>
			<td>조회수</td>
		</tr>
		<c:forEach var="board" items="${boards}" varStatus="status">
		<tr>
			<td>${board.rnum}</td>
			<td>
				<a href="/lecture/boardView/${board.lecture_id}/?lb_id=${board.lb_id}&page=${paging.pageNo}">${board.title}
				<c:choose>
					<c:when test="${board.count == 0}">
					</c:when>
					<c:otherwise>
						[${board.count}]
					</c:otherwise>
				</c:choose>
				</a>
			</td>
			<td>${board.write_date}</td>
			<td>${board.hit}</td>
		</tr>
		</c:forEach>
	</table><br /><br />

<a href="/lecture/boardList/${lecture_id}/">전체목록</a>&nbsp;&nbsp;<a href="/lecture/boardRegForm?lecture_id=${lecture_id}">글작성</a> &nbsp;&nbsp;<a href="/lecture/boardRegTest?lecture_id=${lecture_id}">테스트</a>

<br /><br />

<jsp:include page="/paging" flush="true">
	<jsp:param name="url" value="/lecture/boardList/${lecture_id}/?page=" />
	<jsp:param name="totalCount" value="${paging.totalCount}" />
	<jsp:param name="firstPageNo" value="${paging.firstPageNo}" />
	<jsp:param name="prevPageNo" value="${paging.prevPageNo}" />
	<jsp:param name="startPageNo" value="${paging.startPageNo}" />
	<jsp:param name="pageNo" value="${paging.pageNo}" />
	<jsp:param name="endPageNo" value="${paging.endPageNo}" />
	<jsp:param name="nextPageNo" value="${paging.nextPageNo}" />
	<jsp:param name="finalPageNo" value="${paging.finalPageNo}" />
</jsp:include>

<form action="/lecture/boardList/${lecture_id}/" method="get" name="board_search_frm">

	<select name="searchType">
		<option value="title" selected="selected">제목</option>
		<option value="contents">내용</option>
		<option value="title_contents">제목+내용</option>
	</select>

	<input type="text" name="searchWord">
	<input type="button" value="검색" onclick="boardSearchLecture()">

</form>

현재 페이지 : <c:out value="${paging.pageNo}"/><br />
전체게시글수 : <c:out value="${paging.totalCount}"/><br />
전체시작페이지 : <c:out value="${paging.firstPageNo}"/><br />
페이징시작페이지 : <c:out value="${paging.startPageNo}"/><br />
페이징끝페이지 : <c:out value="${paging.endPageNo}"/><br />
전체끝페이지 : <c:out value="${paging.finalPageNo}"/><br />

</body>
</html>