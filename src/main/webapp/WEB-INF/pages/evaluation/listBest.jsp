<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>


	<script src="<c:url value="/resources/js/evaluation.js" />"></script>

<title>헬로 월드</title></head>
<body>

베스트 강의평가
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
		<td>댓글수</td>
		<td>추천수</td>
		<td>비공감수</td>
		<td>신고수</td>

	</tr>
	<c:forEach var="best" items="${best}" varStatus="status">
		<tr>
			<td><a href="/evaluation/replyList?lecture_id=${best.lecture_id}&evaluation_id=${best.evaluation_id}">${best.evaluation_id}</a></td>
			<td>${best.member_id}</td>
			<td>${best.lecture_id}</td>
			<td>${best.semester_title}</td>
			<td>${best.method}</td>
			<td>${best.task}</td>
			<td>${best.exam}</td>
			<td>${best.comment}</td>
			<td>${best.score}</td>
			<td>${best.write_date}</td>
			<td>${best.count}</td>
			<td><input type="button" value="추천(${best.likes})" onclick="evalLikeAjax(${best.evaluation_id})"></td>
			<td><input type="button" value="비공감(${best.dislike})" onclick="evalDislikeAjax(${best.evaluation_id})"></td>
			<td><input type="button" value="신고(${best.report})" onclick="evalReportAjax(${best.evaluation_id})"></td>
			<td><input type="button" value="수정" onclick="evalModAjax(${best.evaluation_id})"></td>
			<td><input type="button" value="삭제" onclick="evalDeleteAjax(${best.evaluation_id})"></td>
		</tr>
	</c:forEach>
</table>
</br><br/>

</body>
</html>