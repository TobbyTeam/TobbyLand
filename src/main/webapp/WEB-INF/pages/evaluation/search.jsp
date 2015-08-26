<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css">
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>

	<link rel="stylesheet" href="<c:url value="${ctx}/resources/css/detailsearch.css" />">
	<script src="<c:url value="/resources/js/ajaxSesstion.js" />"></script>
	<script src="<c:url value="/resources/js/sessionTimeout.js" />"></script>

</head>

<body>
<div class="row">
	<div class="col-md-2"></div>
	<div class="col-md-1">
		<table>
			<tr>
				<td>
					<div class="dropdown">
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
	<div class="col-md-9"></div>
</div>
</body>
</html>