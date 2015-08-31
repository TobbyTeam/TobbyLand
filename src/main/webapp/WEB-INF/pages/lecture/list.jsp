<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>


	<link rel="stylesheet" href="<c:url value="${ctx}/resources/css/leclist.css" />">
	<link rel="stylesheet" href="<c:url value="${ctx}/resources/css/searchbar.css" />">

	<script src="<c:url value="/resources/js/updownScroll.js" />"></script>

	<script src="<c:url value="/resources/js/lecture.js" />"></script>

	<title>토비랜드</title>

</head>

<body>

<jsp:include page="/top" flush="true"/>

<jsp:include page="/lecture/search_form" flush="true"/>

<div class="container">
	<div class="row">
		<div class="col-md-1"></div>
		<div class="col-md-10">
			<span id="boardname">강의생성 게시판</span>
			<hr />
			<table class="table table-striped">
				<thead>
				<tr>
					<th width="45%">과목명</th>
					<th width="20%">학과명</th>
					<th width="10%">교수명</th>
					<th width="10%">작성일</th>
					<th width="8%"></th>
					<th width="7%"></th>
				</tr>
				</thead>
				<tbody>

				<c:forEach var="lecture" items="${lectures}" varStatus="status">
					<tr>
						<td>${lecture.lecture_name}</td>
						<td>${lecture.department_name}</td>
						<td>${lecture.prof}</td>
						<td>${lecture.write_date}</td>
						<td><input type="button" value="추천(${lecture.likes})" onclick="likeAjax(${lecture.lecture_id})" class="btn btn-primary"></td>
<%--						<td><input type="button" value="수정" onclick="modAjax(${lecture.lecture_id})" class="btn btn-default"></td>--%>
						<td><input type="button" value="삭제" onclick="deleteAjax(${lecture.lecture_id})" class="btn btn-danger"></td>
					</tr>
				</c:forEach>

				</tbody>
			</table>
			<div class="col-lg-0">
				<button type="button" onclick="location.href='/lecture/regForm'" class="btn btn-primary">강의생성</button>
			</div>
			<br />
		</div>
	</div>
</div>

<br />
<jsp:include page="/bottom" flush="true"/>

</body>
</html>