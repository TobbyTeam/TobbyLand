<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>

  <script src="<c:url value="/resources/js/top.js" />"></script>
  <link rel="stylesheet" href="<c:url value="/resources/css/top.css" />">

  <title></title>
</head>
<body>

<div class="navbar navbar-default">
  <div class="container">
    <ul class="nav navbar-nav navbar-left">
      <li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown">공지사항<span class="caret"></span></a>
        <ul class="dropdown-menu" role="menu">
          <c:forEach var="dept" items="${depts}" varStatus="status">
            <c:if test="${dept.kind eq 'notice'}">
              <li><a href="/board/list/${dept.department_id}/">${dept.department_name}</a></li>
            </c:if>
          </c:forEach>
        </ul>
      </li>
      <li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown">학과게시판<span class="caret"></span></a>
        <ul class="dropdown-menu" role="menu">
          <c:forEach var="dept" items="${depts}" varStatus="status">
            <c:if test="${dept.kind eq 'dept'}">
              <li><a href="/board/list/${dept.department_id}/">${dept.department_name}</a></li>
            </c:if>
          </c:forEach>
          <%--            <li><a href="#">One more separated link</a></li>--%>
        </ul>
      </li>
      <li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown">기타게시판<span class="caret"></span></a>
        <ul class="dropdown-menu" role="menu">
          <c:forEach var="dept" items="${depts}" varStatus="status">
            <c:if test="${dept.kind eq 'etc'}">
              <li><a href="/board/list/${dept.department_id}/">${dept.department_name}</a></li>
            </c:if>
          </c:forEach>
        </ul>
      </li>
      <li><a href="/evaluation/main">강의평가</a></li>
    </ul>
    <ul class="nav navbar-nav navbar-right">
      <li>
        <s:authorize access="hasRole('ROLE_ADMIN')">
          <a href="/admin/">사이트관리</a>
        </s:authorize>
      </li>
      <li>
        <s:authorize access="isAnonymous()">
          <a href="/login">로그인</a>
        </s:authorize>
        <s:authorize access="isAuthenticated()">
        <a href="${ctx}/j_spring_security_logout">로그아웃</a>
        </s:authorize>
      </li>
      <li>
        <s:authorize access="isAnonymous()">
          <a href="/member/regExpln">회원가입</a>
        </s:authorize>
        <s:authorize access="isAuthenticated()">
          <a href="/member/view">회원정보</a>
        </s:authorize>
      </li>
    </ul>
  </div>
</div>

<br />

<p>
  <a href="/main"><img src="<c:url value="/resources/image/mainlogo.png" />" width="306" height="89"/></a>
</p>

<br />

<hr/>

<br />

</body>
</html>