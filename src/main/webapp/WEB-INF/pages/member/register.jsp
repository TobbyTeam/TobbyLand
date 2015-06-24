<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>

<%--    <script src="${pageContext.request.contextPath}/resources/js/members.js"></script>--%>
    <script src="<c:url value="/resources/js/members.js" />"></script>
<%--    <spring:url value="/resources/js/members.js" var="membersJs" />--%>
</head>

<body>

<form action="/member/reg" method="post" name="reg_frm">

    아이디: <input type="text" name="member_id"><br>
    패스워드:<input type="text" name="password"><br>
    패스워드:<input type="text" name="password_check"><br>
    별명: <input type="text" name="nickname"><br>
    이메일: <input type="text" name="email"><br>
    수업방식:A1<input type="radio" name="method" value="A1" checked>
             A2<input type="radio" name="method" value="A2">
             A3<input type="radio" name="method" value="A3"><br>
    과제방식:B1<input type="radio" name="task" value="B1"checked>
             B2<input type="radio" name="task" value="B2">
             B3<input type="radio" name="task" value="B3"><br>
    시험방식:C1<input type="radio" name="exam" value="C1" checked>
             C2<input type="radio" name="exam" value="C2">
             C3<input type="radio" name="exam" value="C3"><br>
<br>
    <input type="button" value="회원가입" onclick="infoConfirm()">&nbsp;&nbsp;&nbsp; <input type="reset" value="취소" onclick="javascript:window.location='/login'">
</form>

</body>
</html>
