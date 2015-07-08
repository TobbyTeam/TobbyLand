<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: happy
  Date: 2015-05-31
  Time: 오전 3:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>

<c:if test="${not empty error}">
    ${error}
</c:if>

<form action="/member/modView" method="post">
    패스워드:<input type="password" name="password"><br>
    <input type="submit" value="확인">
</form>

</body>
</html>
