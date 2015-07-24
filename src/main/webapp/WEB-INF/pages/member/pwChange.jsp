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

<form id="pw_mod_frm" name="pw_mod_frm">

    기존 비밀번호 : <input type="password" id="exPassword" name="exPassword" ><br />
    새 비밀번호: <input type="password" id="password" name="password" ><br />
    새 비밀번호 확인: <input type="password" id="password_check" name="password_check" ><br /><br />

    <button type="button" onclick="$(this.form).submit()">수정</button>&nbsp;&nbsp;&nbsp; <input type="reset" value="취소" onclick="history.back()"/>

</form>

</body>
</html>

