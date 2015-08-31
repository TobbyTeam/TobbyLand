<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css">
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>

	<link rel="stylesheet" href="<c:url value="${ctx}/resources/css/evlview.css" />">
	<link rel="stylesheet" href="<c:url value="${ctx}/resources/css/detailsearch.css" />">

	<script src="<c:url value="/resources/js/updownScroll.js" />"></script>

	<script src="<c:url value="${ctx}/resources/js/evaluation.js" />"></script>
	<script src="<c:url value="/resources/js/ajaxSesstion.js" />"></script>
	<script src="<c:url value="/resources/js/sessionTimeout.js" />"></script>

	<title>토비랜드</title>

</head>

<body>

<div class="container">

	<div class="row">
		<div class="col-md-1"></div>
		<div class="col-md-10" align="left">
			<table>
				<tr>
					<td>
						<div class="dropdown" align="right">
							<button type="button" class="btn btn-success dropdown-toggle littlebtn" data-toggle="dropdown">
								상세검색
							</button>
							<div class="dropdown-menu dropdown-menu-right">
								<form action="/evaluation/searchPrefer" method="get" class="form-horiontal">
									<div class="form-group">
										<label for="filter">수업방식</label>
										<select name="method" class="form-control">
											<option value="all" selected="selected">전체</option>
											<option value="1">독고다이</option>
											<option value="2">토론형</option>
											<option value="3">실습형</option>
										</select>
									</div>
									<div class="form-group">
										<label for="filter">과제방식</label>
										<select name="task" class="form-control">
											<option value="all" selected="selected">전체</option>
											<option value="4">텀프로젝트</option>
											<option value="5">팀과제</option>
											<option value="6">개인과제</option>
										</select>
									</div>
									<div class="form-group">
										<label for="filter">시험방식</label>
										<select name="exam" class="form-control">
											<option value="all"selected="selected">전체</option>
											<option value="7">서술형</option>
											<option value="8">혼합형</option>
											<option value="9">오픈북</option>
											<option value="10">실습</option>
										</select>
									</div>
									<div class="form-group" align="center">
										<button type="submit" class="littlebtn">검색</button>
									</div>
									<input type="hidden" id="lecture_id" name="lecture_id" value="${lecture_id}">
								</form>
							</div>
						</div>
					</td>
				<tr>
			</table>
		</div>
		<div class="col-md-1"></div>
	</div>

	<br />

	<div class="col-xs-offset-1">
		<table>
			<td><img src="<c:url value="${ctx}/resources/image/best.jpg" />" class="img-responsive"/></td>
		</table>
	</div>
	<br />

	<c:forEach var="best" items="${best}" varStatus="status">

		<div class="row">
			<div class="col-md-1"></div>
			<div class="col-md-8 bigframe" align="right">
					${best.write_date}
				<hr />
				<table class="col-md-12 table-condensed tablemargin">
					<tr class="reframe">
						<td width="15%" class="title" align="center">수강학기</td>
						<td width="82%">${best.semester_title}</td>
						<td width="3%"></td>
					</tr>
					<tr class="reframe">
						<td width="15%" class="title" align="center">수업방식</td>
						<td width="82%">${best.method}</td>
						<td width="3%"></td>
					</tr>
					<tr class="reframe">
						<td width="15%" class="title" align="center">과제방식</td>
						<td width="82%">${best.task}</td>
						<td width="3%"></td>
					</tr>
					<tr class="reframe">
						<td width="15%" class="title" align="center">시험방식</td>
						<td width="82%">${best.exam}</td>
						<td width="3%"></td>
					</tr>
					<tr class="reframe">
						<td width="15%" class="title" align="center">총평</td>
						<td width="82%">${best.comment}</td>
						<td width="3%"></td>
					</tr>
					<tr class="reframe">
						<td width="15%" class="title" align="center">평점</td>
						<td width="82%" class="score">${best.score}</td>
						<td width="3%"></td>
					</tr>
				</table>
				<div class="row" align="center">
					<button onclick="evalLikeAjax(${best.evaluation_id})" class="btn btn-primary"><span class="glyphicon glyphicon-thumbs-up"></span><br />추천<br />${best.likes}</button>
					<button onclick="evalDislikeAjax(${best.evaluation_id})" class="btn"><span class="glyphicon glyphicon-thumbs-down"></span><br />비추천<br />${best.dislike}</button>
				</div>
				<div class="col-xs-offset-8">
					<%--<button onclick="evalModAjax(${best.evaluation_id})" class="btn btn-default littlebtn">수정</button>--%>
					<button onclick="evalDeleteAjax(${best.evaluation_id})" class="btn btn-default littlebtn">삭제</button>
					<button onclick="evalReportAjax(${best.evaluation_id})" class="btn btn-danger littlebtn">신고</button>
				</div>
				<hr />
			</div>
			<div class="col-md-2">
			</div>
		</div>
		<br />
	</c:forEach>

</div>

</body>
</html>