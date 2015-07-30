<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>

<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="<c:url value="/resources/js/board.js" />"></script>

<title>헬로 월드</title></head>
<body>

<jsp:include page="/top" flush="true"/>

<br /><br />

	<table border="1">
		<tr>
			<td>글번호</td>
			<td>제목</td>
			<td>작성자</td>
			<td>작성일</td>
			<td>조회수</td>
			<td>추천</td>
		</tr>
		<c:forEach var="board" items="${boards}" varStatus="status">
		<tr>
			<td>${board.rnum}</td>
			<td>
				<a href="/board/view/${board.department_id}/?board_id=${board.board_id}&page=${paging.pageNo}&searchType=${search.searchType}&searchWord=${search.searchWord}">${board.title}
					<c:if test="${board.count != 0}">
						[${board.count}]
					</c:if>
				</a>
			</td>
			<td>${board.writer}
				<c:if test="${board.is_anonymity == 1}">
					(익명)
				</c:if>
			</td>
			<td>${board.write_date}</td>
			<td>${board.hit}</td>
			<td>${board.likes}</td>
		</tr>
		</c:forEach>
	</table><br /><br />

<a href="/board/list/${department_id}/">전체목록</a>&nbsp;&nbsp;<a href="/board/regForm?department_id=${department_id}">글작성</a>

<br/><br/>

<jsp:include page="/paging" flush="true">
	<jsp:param name="url" value="/board/list/${department_id}/?page=" />
	<jsp:param name="search" value="&searchType=${search.searchType}&searchWord=${search.searchWord}" />
	<jsp:param name="totalCount" value="${paging.totalCount}" />
	<jsp:param name="firstPageNo" value="${paging.firstPageNo}" />
	<jsp:param name="prevPageNo" value="${paging.prevPageNo}" />
	<jsp:param name="startPageNo" value="${paging.startPageNo}" />
	<jsp:param name="pageNo" value="${paging.pageNo}" />
	<jsp:param name="endPageNo" value="${paging.endPageNo}" />
	<jsp:param name="nextPageNo" value="${paging.nextPageNo}" />
	<jsp:param name="finalPageNo" value="${paging.finalPageNo}" />
</jsp:include>

<form action="/board/list/${department_id}/" method="get" name="search_frm">

	<select name="searchType">
		<c:choose>
			<c:when test="${search.searchType eq 'contents'}">
					<option value="title">제목</option>
					<option value="contents" selected="selected">내용</option>
					<option value="title_contents">제목+내용</option>
					<option value="writer">글쓴이</option>
					<option value="all">전체</option>
			</c:when>
			<c:when test="${search.searchType eq 'title_contents'}">
					<option value="title">제목</option>
					<option value="contents">내용</option>
					<option value="title_contents" selected="selected">제목+내용</option>
					<option value="writer">글쓴이</option>
					<option value="all">전체</option>
			</c:when>
			<c:when test="${search.searchType eq 'writer'}">
				<option value="title">제목</option>
				<option value="contents">내용</option>
				<option value="title_contents">제목+내용</option>
				<option value="writer" selected="selected">글쓴이</option>
				<option value="all">전체</option>
			</c:when>
			<c:when test="${search.searchType eq 'all'}">
				<option value="title">제목</option>
				<option value="contents">내용</option>
				<option value="title_contents">제목+내용</option>
				<option value="writer">글쓴이</option>
				<option value="all" selected="selected">전체</option>
			</c:when>
			<c:otherwise>
					<option value="title" selected="selected">제목</option>
					<option value="contents">내용</option>
					<option value="title_contents">제목+내용</option>
					<option value="writer">글쓴이</option>
					<option value="all">전체</option>
			</c:otherwise>
		</c:choose>
	</select>

	<input type="text" name="searchWord" value="${search.searchWord}">
	<input type="button" value="검색" onclick="search()">

</form>

현재 페이지 : <c:out value="${paging.pageNo}"/><br />
전체게시글수 : <c:out value="${paging.totalCount}"/><br />
전체시작페이지 : <c:out value="${paging.firstPageNo}"/><br />
페이징시작페이지 : <c:out value="${paging.startPageNo}"/><br />
페이징끝페이지 : <c:out value="${paging.endPageNo}"/><br />
전체끝페이지 : <c:out value="${paging.finalPageNo}"/><br />

</body>
</html>