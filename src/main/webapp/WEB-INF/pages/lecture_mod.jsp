<%--
  Created by IntelliJ IDEA.
  User: happy
  Date: 2015-05-31
  Time: 오전 6:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>
<form action="lecture_modify" method="get">
  강의명: <input type="text" name="lecture_name" value="${lecture.lecture_name}"><br>
  학과명:<input type="text" name="dept" value="${lecture.dept}"><br>
  교수명: <input type="text" name="prof" value="${lecture.prof}"><br>
  <input type="hidden" name="lecture_id" value="${lecture.lecture_id}">
  <input type="submit" value="전송">
</form>
</body>
</html>
