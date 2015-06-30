<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>

<%--    <script src="${pageContext.request.contextPath}/resources/js/members.js"></script>--%>
    <script src="<c:url value="/resources/js/members.js" />"></script>
<%--    <spring:url value="/resources/js/members.js" var="membersJs" />--%>
</head>

<body>

<form:errors path="member_id" />

<form action="/member/reg" method="post" name="reg_frm">

    아이디: <input type="text" name="member_id"><br/>
    패스워드:<input type="password" name="password"><br/>
    패스워드확인:<input type="password" name="password_check"><br/>
    별명: <input type="text" name="nickname"><br/>
    이메일: <input type="text" name="email"><br/>
    수업방식:독고다이형<input type="radio" name="method" value="a1" checked>
             토론형<input type="radio" name="method" value="a2">
             실습형<input type="radio" name="method" value="a3"><br/>
    과제방식:텀프로젝트<input type="radio" name="task" value="b1"checked>
             팀과제<input type="radio" name="task" value="b2">
             개인과제<input type="radio" name="task" value="b3"><br/>
    시험방식:서술형<input type="radio" name="exam" value="c1" checked>
             혼합형<input type="radio" name="exam" value="c2">
             오픈북<input type="radio" name="exam" value="c3">
             실습<input type="radio" name="exam" value="c4"><br/>
    <br/>
    <input type="button" value="회원가입" onclick="infoConfirm()">&nbsp;&nbsp;&nbsp; <input type="reset" value="취소" onclick="javascript:window.location='/login'">
</form>

</body>
</html>
