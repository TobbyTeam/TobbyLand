<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>

	<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
	<script src="<c:url value="/resources/js/evaluation.js" />"></script>

	<title>헬로 월드</title></head>
<body>

<jsp:include page="/top" flush="true"/>

<br /> <br />

<jsp:include page="/evaluation/lecture?lecture_id=${lecture_id}" flush="true"/> <br />

<a href="/evaluation/list?lecture_id=${lecture_id}">강의평가</a>&nbsp;&nbsp;<a href="/lecture/boardList/${lecture_id}/">강의게시판</a>
<br /> <br />

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

<jsp:include page="/evaluation/listBest" flush="true"/> <br />

모든 강의평가
<table border="1">
	<tr>
		<td>수강학기</td>
		<td>수업방식</td>
		<td>과제</td>
		<td>시험</td>
		<td>총평</td>
		<td>점수</td>
		<td>작성일</td>
		<td>댓글수</td>
		<td>추천수</td>
		<td>비공감수</td>
		<td>신고수</td>
	</tr>
	<c:forEach var="evaluation" items="${evaluations}" varStatus="status">
		<tr>
			<td>${evaluation.semester_title}</td>
			<td>${evaluation.method}</td>
			<td>${evaluation.task}</td>
			<td>${evaluation.exam}</td>
			<td>${evaluation.comment}</td>
			<td>${evaluation.score}</td>
			<td>${evaluation.write_date}</td>
			<td><a href="/evaluation/replyList?lecture_id=${evaluation.lecture_id}&evaluation_id=${evaluation.evaluation_id}">${evaluation.count}</a></td>
			<td><input type="button" value="추천(${evaluation.likes})" onclick="evalLikeAjax(${evaluation.evaluation_id})"></td>
			<td><input type="button" value="비공감(${evaluation.dislike})" onclick="evalDislikeAjax(${evaluation.evaluation_id})"></td>
			<td><input type="button" value="신고(${evaluation.report})" onclick="evalReportAjax(${evaluation.evaluation_id})"></td>
			<td><input type="button" value="수정" onclick="evalModAjax(${evaluation.evaluation_id})"></td>
			<td><input type="button" value="삭제" onclick="evalDeleteAjax(${evaluation.evaluation_id})"></td>
		</tr>
	</c:forEach>
</table>

<br />
<c:if test="${not empty error}">
	${error}
</c:if>
<br />

</br><br/>

<input type="button" value="강의평가작성" onclick="evalRegAjax()"><br/><br/>

</body>
</html>