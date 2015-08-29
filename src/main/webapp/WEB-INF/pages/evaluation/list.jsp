<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>\
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>

	<link rel="stylesheet" href="<c:url value="${ctx}/resources/css/evlview.css" />">

	<script src="<c:url value="${ctx}/resources/js/scripts.js" />"></script>
	<script src="<c:url value="${ctx}/resources/js/evaluation.js" />"></script>
	<script src="<c:url value="/resources/js/ajaxSesstion.js" />"></script>
	<script src="<c:url value="/resources/js/sessionTimeout.js" />"></script>

	<title>토비랜드</title>

</head>

<body>

<jsp:include page="/top" flush="true"/>

<jsp:include page="/lecture/search_form" flush="true"/>

<jsp:include page="/evaluation/lecture?lecture_id=${lecture_id}" flush="true"/>

<jsp:include page="/evaluation/search" flush="true"/>
<br />


<%--<div class="container-fluid">

	<form action="/evaluation/searchPrefer" method="get">

		수업방식:
		<c:choose>
			<c:when test="${search.method eq '1'}">
				전체<input type="radio" name="method" value="all">
				독고다이형<input type="radio" name="method" value="1" checked>
				토론형<input type="radio" name="method" value="2">
				실습형<input type="radio" name="method" value="3"><br>
			</c:when>
			<c:when test="${search.method eq '2'}">
				전체<input type="radio" name="method" value="all">
				독고다이형<input type="radio" name="method" value="1" >
				토론형<input type="radio" name="method" value="2" checked>
				실습형<input type="radio" name="method" value="3"><br>
			</c:when>
			<c:when test="${search.method eq '3'}">
				전체<input type="radio" name="method" value="all">
				독고다이형<input type="radio" name="method" value="1" >
				토론형<input type="radio" name="method" value="2">
				실습형<input type="radio" name="method" value="3" checked><br>
			</c:when>
			<c:otherwise>
				전체<input type="radio" name="method" value="all" checked>
				독고다이형<input type="radio" name="method" value="1">
				토론형<input type="radio" name="method" value="2">
				실습형<input type="radio" name="method" value="3"><br>
			</c:otherwise>
		</c:choose>

		과제방식:
		<c:choose>
			<c:when test="${search.task eq '4'}">
				전체<input type="radio" name="task" value="all">
				텀프로젝트<input type="radio" name="task" value="4" checked>
				팀과제<input type="radio" name="task" value="5">
				개인과제<input type="radio" name="task" value="6"><br>
			</c:when>
			<c:when test="${search.task eq '5'}">
				전체<input type="radio" name="task" value="all">
				텀프로젝트<input type="radio" name="task" value="4">
				팀과제<input type="radio" name="task" value="5" checked>
				개인과제<input type="radio" name="task" value="6"><br>
			</c:when>
			<c:when test="${search.task eq '6'}">
				전체<input type="radio" name="task" value="all">
				텀프로젝트<input type="radio" name="task" value="4">
				팀과제<input type="radio" name="task" value="5">
				개인과제<input type="radio" name="task" value="6" checked><br>
			</c:when>
			<c:otherwise>
				전체<input type="radio" name="task" value="all" checked>
				텀프로젝트<input type="radio" name="task" value="4">
				팀과제<input type="radio" name="task" value="5">
				개인과제<input type="radio" name="task" value="6"><br>
			</c:otherwise>
		</c:choose>

		시험방식:
		<c:choose>
			<c:when test="${search.exam eq '7'}">
				전체<input type="radio" name="exam" value="all">
				서술형<input type="radio" name="exam" value="7" checked>
				혼합형<input type="radio" name="exam" value="8">
				오픈북<input type="radio" name="exam" value="9">
				실습<input type="radio" name="exam" value="10"><br>
			</c:when>
			<c:when test="${search.exam eq '8'}">
				전체<input type="radio" name="exam" value="all">
				서술형<input type="radio" name="exam" value="7">
				혼합형<input type="radio" name="exam" value="8" checked>
				오픈북<input type="radio" name="exam" value="9">
				실습<input type="radio" name="exam" value="10"><br>
			</c:when>
			<c:when test="${search.exam eq '9'}">
				전체<input type="radio" name="exam" value="all">
				서술형<input type="radio" name="exam" value="7">
				혼합형<input type="radio" name="exam" value="8">
				오픈북<input type="radio" name="exam" value="9" checked>
				실습<input type="radio" name="exam" value="10"><br>
			</c:when>
			<c:when test="${search.exam eq '10'}">
				전체<input type="radio" name="exam" value="all">
				서술형<input type="radio" name="exam" value="7">
				혼합형<input type="radio" name="exam" value="8">
				오픈북<input type="radio" name="exam" value="9">
				실습<input type="radio" name="exam" value="10" checked><br>
			</c:when>
			<c:otherwise>
				전체<input type="radio" name="exam" value="all" checked>
				서술형<input type="radio" name="exam" value="7">
				혼합형<input type="radio" name="exam" value="8">
				오픈북<input type="radio" name="exam" value="9">
				실습<input type="radio" name="exam" value="10"><br>
			</c:otherwise>
		</c:choose>

		<input type="hidden" id="lecture_id" name="lecture_id" value="${lecture_id}">
		<input type="submit" value="검색">
	</form>
	<br/>
</div>--%>

<jsp:include page="/evaluation/listBest" flush="true"/> <br />

<div class="container-fluid">

	<div class="col-xs-offset-2">
		<table>
			<td class="subname">모든 강의평가</td>
		</table>
	</div>
	<br />

	<c:forEach var="evaluation" items="${evaluations}" varStatus="status">

		<div class="row">
			<div class="col-md-2"></div>
			<c:if test="${not empty error}">
				${error}
			</c:if>
			<div class="col-md-8 bigframe" align="right">
					${evaluation.write_date}
				<hr />
				<table class="col-md-12 table-condensed tablemargin">
					<tr class="reframe">
						<td width="30%" class="title" align="center">수강학기</td>
						<td width="70%">${evaluation.semester_title}</td>
					</tr>
					<tr class="reframe">
						<td width="30%" class="title" align="center">수업방식</td>
						<td width="70%">${evaluation.method}</td>
					</tr>
					<tr class="reframe">
						<td width="30%" class="title" align="center">과제방식</td>
						<td width="70%">${evaluation.task}</td>
					</tr>
					<tr class="reframe">
						<td width="30%" class="title" align="center">시험방식</td>
						<td width="70%">${evaluation.exam}</td>
					</tr>
					<tr class="reframe">
						<td width="30%" class="title" align="center">총평</td>
						<td width="70%">${evaluation.comment}</td>
					</tr>
					<tr class="reframe">
						<td width="30%" class="title" align="center">평점</td>
						<td width="70%" class="score">${evaluation.score}</td>
					</tr>
				</table>
				<div class="row" align="center">
					<button onclick="evalLikeAjax(${evaluation.evaluation_id})" class="btn btn-primary"><span class="glyphicon glyphicon-thumbs-up"></span><br />추천<br />${evaluation.likes}</button>
					<button onclick="evalDislikeAjax(${evaluation.evaluation_id})" class="btn"><span class="glyphicon glyphicon-thumbs-down"></span><br />비추천<br />${evaluation.dislike}</button>
				</div>
				<div class="col-xs-offset-8">
<%--					<button onclick="evalModAjax(${evaluation.evaluation_id})" class="btn btn-default littlebtn">수정</button>--%>
					<button onclick="evalDeleteAjax(${evaluation.evaluation_id})" class="btn btn-default littlebtn">삭제</button>
					<button onclick="evalReportAjax(${evaluation.evaluation_id})" class="btn btn-danger littlebtn">신고(${evaluation.report})</button>
				</div>
				<hr />
			</div>
			<div class="col-md-2">
			</div>
		</div>
		<br />
	</c:forEach>

</div>

<br />
<br />

<jsp:include page="/bottom" flush="true"/>

</body>
</html>