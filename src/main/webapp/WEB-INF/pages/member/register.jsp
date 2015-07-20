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
            독고다이형<input type="radio" name="method" value="a1" checked>
            토론형<input type="radio" name="method" value="a2">
            실습형<input type="radio" name="method" value="a3"><br>

    과제방식:
            텀프로젝트<input type="radio" name="task" value="b1" checked>
            팀과제<input type="radio" name="task" value="b2">
            개인과제<input type="radio" name="task" value="b3"><br>

    시험방식:
            서술형<input type="radio" name="exam" value="c1" checked>
            혼합형<input type="radio" name="exam" value="c2">
            오픈북<input type="radio" name="exam" value="c3">
            실습<input type="radio" name="exam" value="c4"><br>
    <br />
    <button type="button" onclick="$(this.form).submit()">회원가입</button>&nbsp;&nbsp;&nbsp; <input type="reset" value="취소" onclick="javascript:window.location='/login'">
</form>

<br />

<a href="http://mail.kpu.ac.kr/login" target="_blank">kpu메일</a>

</body>
</html>
