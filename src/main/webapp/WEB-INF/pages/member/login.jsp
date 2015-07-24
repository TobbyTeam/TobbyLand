<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="s" %>
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
<h1>login.jsp</h1>

<%-- <c:if test="${not empty pageContext.request.userPrincipal }">
<p> is Log-In</p>
</c:if>

<c:if test="${empty pageContext.request.userPrincipal }">
<p> is Log-Out</p>
</c:if> --%>



<s:authorize ifAnyGranted="ROLE_USER">
  <p> is Log-In</p>
</s:authorize>

<s:authorize ifNotGranted="ROLE_USER">
  <p> is Log-Out</p>
</s:authorize>

<%-- USER ID : ${pageContext.request.userPrincipal.name}<br/> --%>
USER ID : <s:authentication property="name"/><br/>
<a href="${pageContext.request.contextPath}/j_spring_security_logout">Log Out</a> <br />

</body>
</html>
