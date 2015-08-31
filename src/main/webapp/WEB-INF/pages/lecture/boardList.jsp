<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>

	<link rel="stylesheet" href="<c:url value="${ctx}/resources/css/boardlist.css" />">
	<link rel="stylesheet" href="<c:url value="${ctx}/resources/css/textCut.css" />">

	<script src="<c:url value="${ctx}/resources/js/lecture_board.js" />"></script>

	<script src="<c:url value="/resources/js/updownScroll.js" />"></script>

	<title>토비랜드</title>

</head>

<body>

<jsp:include page="/top" flush="true"/>

<jsp:include page="/lecture/evaluationTop?lecture_id=${lecture_id}" flush="true"/>

<div class="container">
	<div class="row">
		<div class="col-md-1"></div>
		<div class="col-md-10">
			<table class="table table-hover" style="TABLE-layout:fixed">
			<thead>
				<tr>
					<th width="8%">번호</th>
					<th width="58%">제목</th>
					<th width="18%">작성자</th>
					<th width="9%">작성일</th>
					<th width="7%">조회수</th>
				</tr>
				</thead>
				<tbody>
				<c:forEach var="board" items="${boards}" varStatus="status">
					<tr>
						<td>${board.rnum}</td>
						<td width="58%" class="textCutE">
							<a href="/lecture/boardView/${board.lecture_id}/?lb_id=${board.lb_id}&page=${paging.pageNo}">${board.title}</a>
								<c:if test="${board.count != 0}">
									[${board.count}]
								</c:if>
						</td>
						<td width="20%" class="textCutE">${board.writer}</td>
						<td>${board.write_date}</td>
						<td align="center">${board.hit}</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
			<div class="col-lg-0">
				<button type="button" onclick="location.href='/lecture/boardList/${lecture_id}/'" class="btn btn-default">전체목록</button>
				<button type="button" onclick="location.href='/lecture/boardRegForm?lecture_id=${lecture_id}'" class="btn btn-primary">글작성</button>
			</div>
		</div>
		<div class="col-md-1"></div>
	</div>

</div>

<%--페이징--%>
<jsp:include page="/paging" flush="true">
	<jsp:param name="url" value="/lecture/boardList/${lecture_id}/?page=" />
	<jsp:param name="totalCount" value="${paging.totalCount}" />
	<jsp:param name="firstPageNo" value="${paging.firstPageNo}" />
	<jsp:param name="startPageNo" value="${paging.startPageNo}" />
	<jsp:param name="pageNo" value="${paging.pageNo}" />
	<jsp:param name="endPageNo" value="${paging.endPageNo}" />
	<jsp:param name="finalPageNo" value="${paging.finalPageNo}" />
</jsp:include>

<%--서치--%>
<jsp:include page="/search" flush="true">
	<jsp:param name="url" value="/lecture/boardList/${lecture_id}/" />
</jsp:include>

<jsp:include page="/bottom" flush="true"/>

</body>
</html>