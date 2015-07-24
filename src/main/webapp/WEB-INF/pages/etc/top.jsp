<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>

  <title></title>

  <script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

</head>
<body>

<nav class="navbar navbar-default">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="/main">메인페이지</a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">공지사항 <span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <c:forEach var="dept" items="${depts}" varStatus="status">
              <c:if test="${dept.kind eq 'notice'}">
            <li><a href="/board/list/${dept.department_id}/">${dept.department_name}</a></li>
              </c:if>
            </c:forEach>
          </ul>
        </li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">학과게시판 <span class="caret"></span></a>
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
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">기타게시판 <span class="caret"></span></a>
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
          <s:authorize access="isAnonymous()">
            <a href="/login">로그인</a>
          </s:authorize>
          <s:authorize access="isAuthenticated()">
            <a href="${ctx}/j_spring_security_logout">로그아웃</a>
          </s:authorize>
        </li>
        <li>
          <s:authorize access="isAnonymous()">
            <a href="/member/regForm">회원가입</a>
          </s:authorize>
          <s:authorize access="isAuthenticated()">
            <a href="/member/view">회원정보</a>
          </s:authorize>
        </li>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>

<c:forEach var="board" items="${boards}" varStatus="status">

        <c:choose>
          <c:when test="${board.count == 0}">
          </c:when>
          <c:otherwise>
            [${board.count}]
          </c:otherwise>
        </c:choose>
      </a>
</c:forEach>

</body>
</html>