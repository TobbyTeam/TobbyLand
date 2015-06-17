<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head><title>헬로 월드</title></head>
<body>

	<table border="1">
		<tr>
			<td>강의평가아이디</td>
			<td>멤버아이디</td>
			<td>강의아이디</td>
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
			<td>${evaluation.evaluation_id}</td>
			<td>${evaluation.member_id}</td>
			<td>${evaluation.lecture_id}</td>
			<td>${evaluation.method}</td>
			<td>${evaluation.task}</td>
			<td>${evaluation.exam}</td>
			<td>${evaluation.comment}</td>
			<td>${evaluation.score}</td>
			<td>${evaluation.write_date}</td>
			<td>${evaluation.likes}</td>
			<td>${evaluation.dislike}</td>
			<td>${evaluation.report}</td>
			<td><a href="/evaluation/likes?evaluation_id=${evaluation.evaluation_id}&lecture_id=${evaluation.lecture_id}">추천</a></td>
			<td><a href="/evaluation/dislike?evaluation_id=${evaluation.evaluation_id}&lecture_id=${evaluation.lecture_id}">비공감</a></td>
			<td><a href="/evaluation/report?evaluation_id=${evaluation.evaluation_id}&lecture_id=${evaluation.lecture_id}">신고</a></td>
			<td><a href="/evaluation/view?evaluation_id=${evaluation.evaluation_id}">수정</a></td>
		</tr>
		</c:forEach>
	</table></br>
	<a href="/evaluation/reg_form">강의평가 작성</a>

</body>
</html>