<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>

	<link rel="stylesheet" href="<c:url value="${ctx}/resources/css/evllist.css" />">

	<script src="<c:url value="/resources/js/updownScroll.js" />"></script>

	<script src="<c:url value="/resources/js/ajaxSesstion.js" />"></script>
	<script src="<c:url value="/resources/js/sessionTimeout.js" />"></script>

	<title>토비랜드</title>

</head>

<body>

<jsp:include page="/top" flush="true"/>

<jsp:include page="/lecture/search_form" flush="true"/>

<div class="container" id="minHeight">

	<div class="row">
		<div class="col-md-1"></div>
		<div class="col-md-10" align="center">
			<br />
			<hr />
			<br />
			<c:choose>
				<c:when test="${not empty error}">
					<h2>${error}</h2>
				</c:when>
				<c:otherwise>
					<h2>${message}</h2>
					<br />
					<table class="table table-striped">
						<thead>
						<tr>
							<th width="50%">강의명</th>
							<th width="20%">학과명</th>
							<th width="10%">교수명</th>
							<th width="10%">평가수</th>
							<th width="10%">평점</th>
						</tr>
						</thead>
						<tbody>
						<c:forEach var="lecture" items="${lectures}" varStatus="status">
							<tr>
								<td><a href="/evaluation/list?lecture_id=${lecture.lecture_id}">${lecture.lecture_name}</a></td>
								<td>${lecture.department_name}</td>
								<td>${lecture.prof}</td>
								<td>${lecture.count}</td>
								<td class="score">${lecture.avg}</td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
				</c:otherwise>
			</c:choose>
		</div>
		<div class="col-md-1"></div>
	</div>
	<div align="center">
		<br />
		<a href="/lecture/list">원하시는 과목이 없습니까?</a>
	</div>
</div>

<br />
<br />
<jsp:include page="/bottom" flush="true"/>


</body>
</html>