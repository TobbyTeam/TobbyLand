<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<title>수업 선호성향</title>
</head>
<body>
	<h2>수업 선호성향</h2>
	<form method="post">
	<c:forEach var="q" items="${questions}" varStatus="status">
	<p>
		${status.index + 1}. ${q.title}<br/>
		<c:if test="${q.choice}">
			<c:forEach var="option" items="${q.options}">
			<label><input type="radio" 
			              name="responses[${status.index}]" value="${option}">
				${option}</label>
			</c:forEach>
		</c:if>
		<c:if test="${! q.choice }">
		<input type="text" name="responses[${status.index}]">
		</c:if>
	</p>
	</c:forEach>

	<p>
		<label>응답자 학과:<br>
		<input type="text" name="res.major">
		</label>
	</p>
	<p>
		<label>응답자 학년:<br>
		<input type="text" name="res.grade">
		</label>
	</p>
	<input type="submit" value="전송">
	</form>
	
	<%-- 
	<form method="post">
	<p>
		1. 당신의 선호하는 수업방식은?<br/>
		<label><input type="radio" name="responses[0]" value="독고다이">
			독고다이형</label>
		<label><input type="radio" name="responses[0]" value="토론">
			토론형</label>
		<label><input type="radio" name="responses[0]" value="실습">
			실습형</label>
	</p>
	<p>
		2. 당신의 선호하는 과제방식은?<br/>
		<label><input type="radio" name="responses[1]" value="텀프로젝트">
			텀프로젝트(Term Project)</label>
		<label><input type="radio" name="responses[1]" value="팀프로젝트">
			팀프로젝트(Team Project)</label>
		<label><input type="radio" name="responses[1]" value="개인과제">
			개인과제</label>
	</p>
	<p>
		3. 당신의 선호하는 시험방식은?<br/>
		<label><input type="radio" name="responses[2]" value="서술">
			서술형</label>
		<label><input type="radio" name="responses[2]" value="혼합">
			혼합형</label>
		<label><input type="radio" name="responses[2]" value="오픈북">
			오픈북</label>
	</p>
	<p>
		4. 하고싶은 말<br/>
		<input type="text" name="responses[3]">
	</p>
	<p>
		<label>응답자 학과:<br>
		<input type="text" name="res.location">
		</label>
	</p>
	<p>
		<label>응답자 학년:<br>
		<input type="text" name="res.age">
		</label>
	</p>
	<input type="submit" value="전송">
	</form>
	--%>
</body>
</html>