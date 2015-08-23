<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>

    <script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
    <script src="<c:url value="/resources/js/jquery.validate.min.js" />"></script>
    <script src="<c:url value="/resources/js/member_validate.js" />"></script>

</head>
<body>

<form id="mod_frm" action="/member/mod">

    아이디: <text>${member.member_id}</text><br>
    별명: <input type="text" id="nickname" name="nickname" value="${member.nickname}"><br>
    이메일: <text>${member.email}</text><br>
    비밀번호 찾기 질문:
    <select name="question">
    <c:forEach var="question" items="${questions}" varStatus="status">
        <c:choose>
            <c:when test="${member.question eq question.id}">
                <option value="${question.id}" selected="selected">${question.title}</option>
            </c:when>
            <c:otherwise>
                <option value="${question.id}">${question.title}</option>
            </c:otherwise>
        </c:choose>
        <option value="${question.id}">${question.title}</option>
    </c:forEach>
    </select>
    <br />
    비밀번호 찾기 답변: <input type="text" id="answer" name="answer" value="${member.answer}"><br />
    수업방식:
    <c:forEach var="tendency" items="${tendencys}" varStatus="status" begin="0" end="2">
        <c:choose>
            <c:when test="${tendency.tendency_id eq member.method}">
                ${tendency.tendency_title}<input type="radio" name="method" value="${tendency.tendency_id}" checked>
            </c:when>
            <c:otherwise>
                ${tendency.tendency_title}<input type="radio" name="method" value="${tendency.tendency_id}">
            </c:otherwise>
        </c:choose>
    </c:forEach><br />
    과제방식:
    <c:forEach var="tendency" items="${tendencys}" varStatus="status" begin="3" end="5">
        <c:choose>
            <c:when test="${tendency.tendency_id eq member.task}">
                ${tendency.tendency_title}<input type="radio" name="task" value="${tendency.tendency_id}" checked>
            </c:when>
            <c:otherwise>
                ${tendency.tendency_title}<input type="radio" name="task" value="${tendency.tendency_id}">
            </c:otherwise>
        </c:choose>
    </c:forEach><br />
    시험방식:
    <c:forEach var="tendency" items="${tendencys}" varStatus="status" begin="6" end="9">
        <c:choose>
            <c:when test="${tendency.tendency_id eq member.exam}">
                ${tendency.tendency_title}<input type="radio" name="exam" value="${tendency.tendency_id}" checked>
            </c:when>
            <c:otherwise>
                ${tendency.tendency_title}<input type="radio" name="exam" value="${tendency.tendency_id}" >
            </c:otherwise>
        </c:choose>
    </c:forEach><br />

    <button type="button" onclick="$(this.form).submit()">수정</button>&nbsp;&nbsp;&nbsp; <input type="reset" value="취소" onclick="history.back()"/>

</form>

</body>
</html>

