<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>

    <script type="text/javascript" src="http://code.jquery.com/jquery-latest.js" charset="utf-8"></script>
    <script src="<c:url value="/resources/js/jquery.validate.min.js" />"></script>
    <script src="<c:url value="/resources/js/members.js" />"></script>

</head>
<body>


<jsp:include page="/top" flush="true"/> <br />

<form id="pw_mod_frm" action="/member/pwMod">

    기존 비밀번호 : <input type="password" id="exPassword" name="exPassword" ><br>
    새 비밀번호: <input type="password" id="password" name="password" ><br>
    새 비밀번호 확인: <input type="password" id="password_check" name="password_check" ><br /><br />

    <button type="button" onclick="$(this.form).submit()">수정</button>&nbsp;&nbsp;&nbsp; <input type="reset" value="취소" onclick="javascript:window.location='/member/view'">

</form>

</body>
</html>

