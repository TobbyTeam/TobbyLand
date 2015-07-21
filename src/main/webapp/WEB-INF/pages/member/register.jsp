<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>

<%--    <script src="${pageContext.request.contextPath}/resources/js/member.js"></script>--%>
<%--    <spring:url value="/resources/js/member.js" var="membersJs" />--%>

    <script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
    <script src="<c:url value="/resources/js/jquery.validate.min.js" />"></script>
    <script src="<c:url value="/resources/js/member_validate.js" />"></script>

</head>

<body>


<form id="reg_frm" name="reg_frm">

    아이디: <input type="text" id="user_id" name="user_id"><br/>
    패스워드:<input type="password" id = "password" name="password"><br/>
    패스워드확인:<input type="password" id = "password_check" name="password_check"><br/>
    별명: <input type="text" id= "nickname" name="nickname"><br/>
    이메일: <input type="text" id="email" name="email"><br />
    비밀번호 찾기 질문:
    <select name="question">
        <c:forEach var="question" items="${questions}" varStatus="status">
            <option value="${question.id}">${question.title}</option>
        </c:forEach>
    </select>
    <br />
    비밀번호 찾기 답변: <input type="text" id="answer" name="answer"><br />
    수업방식:
        <c:forEach var="tendency" items="${tendencys}" varStatus="status" begin="0" end="2">
            <c:choose>
                <c:when test="${tendency.tendency_id eq 1}">
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
                <c:when test="${tendency.tendency_id eq 4}">
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
                <c:when test="${tendency.tendency_id eq 7}">
                    ${tendency.tendency_title}<input type="radio" name="exam" value="${tendency.tendency_id}" checked>
                </c:when>
                <c:otherwise>
                    ${tendency.tendency_title}<input type="radio" name="exam" value="${tendency.tendency_id}" >
                </c:otherwise>
            </c:choose>
        </c:forEach><br />
    <br />
    <button type="button" onclick="$(this.form).submit()">회원가입</button>&nbsp;&nbsp;&nbsp; <input type="reset" value="취소" onclick="javascript:window.location='/login'">
</form>

<br />

<a href="http://mail.kpu.ac.kr/login" target="_blank">kpu메일</a>

</body>
</html>
