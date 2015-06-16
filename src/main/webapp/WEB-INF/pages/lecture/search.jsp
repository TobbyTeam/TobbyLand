<%--
  Created by IntelliJ IDEA.
  User: happy
  Date: 2015-05-31
  Time: 오전 4:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>
<form action="/lecture/search" method="get">
      검색 : <input type="text" name="lecture_name"><br>
  <input type="submit" value="전송">

    <br/>

    <a href="${pageContext.request.contextPath}/j_spring_security_logout">Log Out</a> <br />

    <br/>
    <a href="/lecture/list">강의생성</a>
</form>
</body>
</html>
