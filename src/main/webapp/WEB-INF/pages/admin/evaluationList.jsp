<%@ page import="org.springframework.web.util.UrlPathHelper" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head><title>헬로 월드</title></head>
<body>

<c:if test="${not empty error}">
	${error}
</c:if>

<jsp:include page="/top" flush="true"/> <br />

<table border="1">
	<tr>
		<td>강의평가아이디</td>
		<td>멤버아이디</td>
		<td>강의아이디</td>
		<td>강의이름</td>
		<td>수업방식</td>
		<td>과제</td>
		<td>시험</td>
		<td>총평</td>
		<td>점수</td>
		<td>작성일</td>
		<td>추천수</td>
		<td>비공감수</td>
		<td>신고수</td>
		<td>상태</td>
	</tr>
	<c:forEach var="evaluation" items="${evaluations}" varStatus="status">
	<tr>
		<td>${evaluation.evaluation_id}</td>
		<td>${evaluation.member_id}</td>
		<td>${evaluation.lecture_id}</td>
		<td>${evaluation.lecture_name}</td>
		<td>${evaluation.method}</td>
		<td>${evaluation.task}</td>
		<td>${evaluation.exam}</td>
		<td>${evaluation.comment}</td>
		<td>${evaluation.score}</td>
		<td>${evaluation.write_date}</td>
		<td>${evaluation.likes}</td>
		<td>${evaluation.dislike}</td>
		<td>${evaluation.report}</td>
		<td>${evaluation.is_delete}</td>
		<td><a href="/admin/evaluation/view?evaluation_id=${evaluation.evaluation_id}">수정</a></td>
		<td><a href="/admin/evaluation/isDelete?evaluation_id=${evaluation.evaluation_id}">삭제</a></td>
		<td><a href="/admin/evaluation/isUndelete?evaluation_id=${evaluation.evaluation_id}">복구</a></td>
		<td><a href="/admin/evaluation/delete?evaluation_id=${evaluation.evaluation_id}">완전삭제</a></td>
	</tr>
	</c:forEach>
</table>
</br></br>

<form action="/admin/evaluation/Search" method="get">

	검색
	<select name="searchType">
		<option value="lecture_name">강의명</option>
		<option value="content">내용</option>
		<option value="member_id">작성자</option>
	</select>

	<input type="text" name="searchWord">
	<input type="submit" value="검색">

</form>
</br></br>

<c:choose>
	<c:when test="${requestScope['javax.servlet.forward.request_uri'] eq '/admin/evaluation/list'}">
		<a href="/admin/evaluation/reportList">신고강의평가관리</a>
	</c:when>
	<c:otherwise>
		<a href="/admin/evaluation/list">모든강의평가관리</a>
	</c:otherwise>
</c:choose>

</body>
</html>