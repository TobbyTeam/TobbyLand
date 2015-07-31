<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>

    <script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
    <script src="<c:url value="/resources/js/member.js" />"></script>

    <title></title>
</head>
<body>


패스워드:<input type="password" id="password" name="password"/><br>
         <input type="button" id ="pw_btn" value="확인"/>&nbsp;&nbsp;&nbsp; <input type="reset" value="취소" onclick="history.back()"/>

</body>
</html>
