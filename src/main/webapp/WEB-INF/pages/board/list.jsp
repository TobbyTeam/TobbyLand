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
	<link rel="stylesheet" href="<c:url value="${ctx}/resources/css/searchbar.css" />">

	<script src="<c:url value="${ctx}/resources/js/board.js" />"></script>

	<title>토비랜드</title>

</head>

<body>

<jsp:include page="/top" flush="true"/>

<jsp:include page="/board/top?department_id=${department_id}" flush="true"/>

<div class="container">
	<div class="row">
		<div class="col-md-1"></div>
		<div class="col-md-10">
			<table class="table table-striped">
				<thead>
				<tr>
					<th width="8%">번호</th>
					<th width="50%">제목</th>
					<th width="18%">작성자</th>
					<th width="8%">작성일</th>
					<th width="8%">조회수</th>
					<th width="8%">추천</th>
				</tr>
				</thead>
				<tbody>
				<c:forEach var="board" items="${boards}" varStatus="status">
					<tr>
						<td>
							<c:choose>
								<c:when test="${board.board_id eq board_id}">
									<strong>></strong>
								</c:when>
								<c:otherwise>
									${board.rnum}
								</c:otherwise>
							</c:choose>
						</td>
						<td>
							<a href="/board/view/${board.department_id}/?board_id=${board.board_id}&page=${paging.pageNo}" >${board.title}</a>
							<c:if test="${board.count != 0}">
								[${board.count}]
							</c:if>
						</td>
						<td>
						<c:choose>
							<c:when test="${board.is_anonymity ne 1}">
								<span class="title">${board.writer}*</span>
							</c:when>
							<c:otherwise>
								${board.writer}
							</c:otherwise>
						</c:choose>
						</td>
						<td>${board.write_date}</td>
						<td>${board.hit}</td>
						<td>${board.likes}</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
			<div class="col-lg-0">
				<button type="button" onclick="location.href='/board/list/${department_id}/'" class="btn btn-default">전체목록</button>
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
			</div>
		</div>
		<div class="col-md-1"></div>
	</div>

	<%--페이징--%>
	<jsp:include page="/paging" flush="true">
		<jsp:param name="url" value="/board/list/${department_id}/?page=" />
		<jsp:param name="totalCount" value="${paging.totalCount}" />
		<jsp:param name="firstPageNo" value="${paging.firstPageNo}" />
		<jsp:param name="prevPageNo" value="${paging.prevPageNo}" />
		<jsp:param name="startPageNo" value="${paging.startPageNo}" />
		<jsp:param name="pageNo" value="${paging.pageNo}" />
		<jsp:param name="endPageNo" value="${paging.endPageNo}" />
		<jsp:param name="nextPageNo" value="${paging.nextPageNo}" />
		<jsp:param name="finalPageNo" value="${paging.finalPageNo}" />
	</jsp:include>

	<div class="row">
		<div class="col-md-4"></div>
		<div class="col-md-4" align="center">
			<form action="/board/list/${department_id}/" method="get" name="search_frm">
				<table>
					<tr>
						<td>
							<div id="select">
								<select type="text" name="searchType">
									<option value="title" selected="selected">제목</option>
									<option value="contents">내용</option>
									<option value="title_contents">제목+내용</option>
									<option value="writer">글쓴이</option>
									<option value="all">전체</option>
								</select>
							</div>
						</td>
						<td>
							<div id="search">
								<div class="input-group col-md-12">
									<input type="text" name="searchWord" class="form-control"/>
									<span class="input-group-btn">
										<button type="button" onclick="search()" class="btn btn-info btn-lg" >
											<i class="glyphicon glyphicon-search"></i>
										</button>
									 </span>
								</div>
							</div>
						</td>
					</tr>
				</table>
			</form>
		</div>
		<div class="col-md-4"></div>
	</div>

</div>

<jsp:include page="/bottom" flush="true"/>

</body>
</html>