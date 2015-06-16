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
<c:url value="/j_spring_security_check" var="loginUrl"/>
  <form action="${loginUrl}" method="post">
    <c:if test="${param.ng != null}">
    <p>
        LogIn NG! <br />
        <c:if test="${SPRING_SECURITY_LAST_EXCEPTION != NULL}">
            message : <c:out value="${SPRING_SECURITY_LAST_EXCEPTION.message}" />
        </c:if>
    </p>
    </c:if>

      아이디: <input type="text" name="j_username"><br>
      패스워드:<input type="text" name="j_password"><br>
      <input type="submit" value="로그인">
  </form>

      </br>
      <a href="/member/reg_form">회원가입

</body>
</html>
