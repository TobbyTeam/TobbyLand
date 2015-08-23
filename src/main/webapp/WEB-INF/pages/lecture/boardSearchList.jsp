<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>

	<link rel="stylesheet" href="<c:url value="${ctx}/resources/css/boardlist.css" />">
	<link rel="stylesheet" href="<c:url value="${ctx}/resources/css/searchbar.css" />">

	<script src="<c:url value="${ctx}/resources/js/lecture.js" />"></script>
	<script src="<c:url value="${ctx}/resources/js/evaluation.js" />"></script>

	<title>토비랜드</title>

</head>

<body>

<jsp:include page="/top" flush="true"/>

<jsp:include page="/lecture/search_form" flush="true"/>

<jsp:include page="/evaluation/lecture?lecture_id=${lecture_id}" flush="true"/>

<div class="container">
	<div class="row">
		<div class="col-md-1"></div>
		<div class="col-md-10">
			<table class="table table-striped">
				<thead>
				<tr>
					<th width="10%">번호</th>
					<th width="70%">제목</th>
					<th width="10%">작성일</th>
					<th width="10%">조회수</th>
				</tr>
				</thead>
				<tbody>
				<c:forEach var="board" items="${boards}" varStatus="status">
					<tr>
						<td>${board.rnum}</td>
						<td>
							<a href="/lecture/boardView/${board.lecture_id}/?lb_id=${board.lb_id}&page=${paging.pageNo}&searchType=${search.searchType}&searchWord=${search.searchWord}">${board.title}
								<c:if test="${board.count != 0}">
									[${board.count}]
								</c:if>
							</a>
						</td>
						<td>${board.write_date}</td>
						<td>${board.hit}</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
			<div class="col-lg-0">
				<a href="/lecture/boardList/${lecture_id}/"><button class="btn btn-default">전체목록</button></a>
				<a href="/lecture/boardRegForm?lecture_id=${lecture_id}"><button class="btn btn-primary">글작성</button></a>
				<a href="/lecture/boardRegTest?lecture_id=${lecture_id}">테스트</a>
			</div>
			<br />

			<%--페이징--%>
			<jsp:include page="/paging" flush="true">
				<jsp:param name="url" value="/lecture/boardList/${lecture_id}/?page=" />
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

			<div class="col-md-3"></div>

			<form action="/lecture/boardList/${lecture_id}/" method="get" name="board_search_frm">
				<div class="col-md-2">
					<div id="select">
						<select type="text" name="searchType" class="form-control">
							<c:choose>
								<c:when test="${search.searchType eq 'contents'}">
									<option value="title">제목</option>
									<option value="contents" selected="selected">내용</option>
									<option value="title_contents">제목+내용</option>
								</c:when>
								<c:when test="${search.searchType eq 'title_contents'}">
									<option value="title">제목</option>
									<option value="contents">내용</option>
									<option value="title_contents" selected="selected">제목+내용</option>
								</c:when>
								<c:otherwise>
									<option value="title" selected="selected">제목</option>
									<option value="contents">내용</option>
									<option value="title_contents">제목+내용</option>
								</c:otherwise>
							</c:choose>
						</select>
					</div>
				</div>
				<div class="col-md-3">
					<div id="search">
						<div class="input-group col-md-12">
							<input type="text" name="searchWord"  value="${search.searchWord}" class="form-control"/>
                	    <span class="input-group-btn">
                        <button type="button" onclick="boardSearchLecture()" class="btn btn-info btn-lg" >
							<i class="glyphicon glyphicon-search"></i>
						</button>
                   		</span>
						</div>
					</div>
				</div>
			</form>
			<div class="col-md-4"></div>
		</div>
		<div class="col-md-1"></div>

	</div>
</div>

<jsp:include page="/bottom" flush="true"/>

</body>
</html>