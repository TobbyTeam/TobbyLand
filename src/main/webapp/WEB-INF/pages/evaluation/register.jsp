<%@ taglib uri="http://www.springframework.org/security/tags" prefix="s" %>
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
<form action="/evaluation/reg" method="post">

    수업: <input type="text" name="method"><br>
    과제: <input type="text" name="task"><br>
    시험: <input type="text" name="exam"><br>
    총평: <input type="text" name="comment"><br>
    점수: <input type="text" name="score"><br>
          <input type="hidden" name="lecture_id" value="${evaluation.lecture_id}"/>
          <input type="submit" value="등록">

</form>

<a href="${pageContext.request.contextPath}/j_spring_security_logout">Log Out</a> <br />
</body>
</html>
