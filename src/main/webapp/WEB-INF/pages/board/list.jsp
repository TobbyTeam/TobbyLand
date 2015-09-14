<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags" %>
<html>
<head>

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>

	<link rel="stylesheet" href="<c:url value="${ctx}/resources/css/boardlist.css" />">
	<link rel="stylesheet" href="<c:url value="${ctx}/resources/css/textCut.css" />">

	<script src="<c:url value="${ctx}/resources/js/board.js" />"></script>
	<script src="<c:url value="/resources/js/updownScroll.js" />"></script>

	<title>토비랜드</title>

</head>

<body>

<jsp:include page="/top" flush="true"/>

<jsp:include page="/board/top?department_id=${department_id}" flush="true"/>

<div class="container">
	<div class="row">
		<div class="col-md-1"></div>
		<div class="col-md-10">
			<table class="table table-hover" style="TABLE-layout:fixed">
				<thead>
				<tr>
					<th width="8%">번호</th>
					<th width="53%">제목</th>
					<th width="15%">작성자</th>
					<th width="10%">작성일</th>
					<th width="7%">조회수</th>
					<th width="7%">추천수</th>
				</tr>
				</thead>
				<tbody>
				<c:forEach var="board" items="${boards}" varStatus="status">
					<tr>
						<td >${board.rnum}</td>
						<td width="53%" class="textCutE">
							<a href="/board/view/${board.department_id}/?board_id=${board.board_id}&page=${paging.pageNo}" >${board.title}</a>
							<c:if test="${board.count != 0}">
								[${board.count}]
							</c:if>
						</td>
						<td width="15%" class="textCutE">
						<c:choose>
							<c:when test="${board.is_anonymity ne 1}">
								<span class="title">*${board.writer}</span>
							</c:when>
							<c:otherwise>
								${board.writer}
							</c:otherwise>
						</c:choose>
						</td>
						<td>${board.write_date}</td>
						<td align="center">${board.hit}</td>
						<td align="center">${board.likes}</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
			<div class="col-lg-0">
				<button type="button" onclick="location.href='/board/list/${department_id}/'" class="btn btn-default">전체목록</button>
				<s:authorize access="isAuthenticated()">
					<c:choose>
						<c:when test="${department.kind eq 'notice'}">
							<s:authorize access="hasRole('ROLE_ADMIN')">
								<button type="button" onclick="location.href='/board/regForm?department_id=${department_id}'" class="btn btn-primary">글작성</button>
							</s:authorize>
						</c:when>
						<c:otherwise>
							<button type="button" onclick="location.href='/board/regForm?department_id=${department_id}'" class="btn btn-primary">글작성</button>
						</c:otherwise>
					</c:choose>
				</s:authorize>
			</div>
		</div>
		<div class="col-md-1"></div>
	</div>

</div>

<%--페이징--%>
<jsp:include page="/paging" flush="true">
	<jsp:param name="url" value="/board/list/${department_id}/?page=" />
	<jsp:param name="totalCount" value="${paging.totalCount}" />
	<jsp:param name="firstPageNo" value="${paging.firstPageNo}" />
	<jsp:param name="startPageNo" value="${paging.startPageNo}" />
	<jsp:param name="pageNo" value="${paging.pageNo}" />
	<jsp:param name="endPageNo" value="${paging.endPageNo}" />
	<jsp:param name="finalPageNo" value="${paging.finalPageNo}" />
</jsp:include>

<%--서치--%>
<jsp:include page="/search" flush="true">
	<jsp:param name="url" value="/board/list/${department_id}/" />
</jsp:include>

<jsp:include page="/bottom" flush="true"/>

</body>
</html>