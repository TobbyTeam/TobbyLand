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

      <form action="<c:url value = "/j_spring_security_check"/>" method="get">
              아이디: <input type="text" name="j_username"><br>
              패스워드:<input type="text" name="j_password"><br>
        <input type="submit" value="전송">
      </form></br>
      <a href="/member/reg_form">회원가입


</body>
</html>
