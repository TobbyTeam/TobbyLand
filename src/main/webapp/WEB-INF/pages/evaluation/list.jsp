<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>

<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js" charset="utf-8"></script>
<script src="<c:url value="/resources/js/evaluation.js" />"></script>

<title>헬로 월드</title></head>
<body>

<jsp:include page="/top" flush="true"/> <br />

</br>
강의명 : ${lecture.lecture_name}</br>
학과명 : ${lecture.dept}</br>
교수명 : ${lecture.prof}</br>
강의평가 수: ${lecture.count}</br>
</br></br>

<form action="/evaluation/searchPrefer" method="get">

	수업방식:
	전체<input type="radio" name="method" value="all" checked>
	독고다이형<input type="radio" name="method" value="a1">
	토론형<input type="radio" name="method" value="a2">
	실습형<input type="radio" name="method" value="a3"><br/>

	과제방식:
	전체<input type="radio" name="task" value="all"checked>
	텀프로젝트<input type="radio" name="task" value="b1">
	팀과제<input type="radio" name="task" value="b2">
	개인과제<input type="radio" name="task" value="b3"><br/>

	시험방식:
	전체<input type="radio" name="exam" value="all" checked>
	서술형<input type="radio" name="exam" value="c1">
	혼합형<input type="radio" name="exam" value="c2">
	오픈북<input type="radio" name="exam" value="c3">
	실습<input type="radio" name="exam" value="c4"><br/>
	<input type="hidden" name="lecture_id" value="${lecture.lecture_id}">
	<input type="submit" value="검색">
</form>
<br/>

<jsp:include page="/evaluation/listBest" flush="true"/> <br />

모든 강의평가
<table border="1">
	<tr>
		<td>강의평가아이디</td>
		<td>멤버아이디</td>
		<td>강의아이디</td>
		<td>수강학기</td>
		<td>수업방식</td>
		<td>과제</td>
		<td>시험</td>
		<td>총평</td>
		<td>점수</td>
		<td>작성일</td>
		<td>추천수</td>
		<td>비공감수</td>
		<td>신고수</td>

	</tr>
	<c:forEach var="evaluation" items="${evaluations}" varStatus="status">
	<tr>
		<td><a href="/evaluation/replyList?evaluation_id=${evaluation.evaluation_id}">${evaluation.evaluation_id}</a></td>
		<td>${evaluation.member_id}</td>
		<td>${evaluation.lecture_id}</td>
		<td>${evaluation.semester}</td>
		<td>${evaluation.method}</td>
		<td>${evaluation.task}</td>
		<td>${evaluation.exam}</td>
		<td>${evaluation.comment}</td>
		<td>${evaluation.score}</td>
		<td>${evaluation.write_date}</td>
		<td><input type="button" value="추천(${evaluation.likes})" onclick="evalLikeAjax(${evaluation.evaluation_id})"></td>
		<td><input type="button" value="비공감(${evaluation.dislike})" onclick="evalDislikeAjax(${evaluation.evaluation_id})"></td>
		<td><input type="button" value="신고(${evaluation.report})" onclick="evalReportAjax(${evaluation.evaluation_id})"></td>
		<td><input type="button" value="수정" onclick="evalModAjax(${evaluation.evaluation_id})"></td>
		<td><a href="/evaluation/isDelete?evaluation_id=${evaluation.evaluation_id}&lecture_id=${evaluation.lecture_id}">삭제</a></td>
	</tr>
	</c:forEach>
</table>

<br />
<c:if test="${not empty error}">
	${error}
</c:if>
<br />

</br><br/>
	<a href="/evaluation/regForm?lecture_id=${lecture.lecture_id}">강의평가 작성</a> <br/><br/>

</body>
</html>