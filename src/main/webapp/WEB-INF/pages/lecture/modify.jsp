<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>

<form action="/lecture/search" method="get">

  검색
  <select name="searchType">
    <option value="lecture_name">강의명</option>
    <option value="dept">학과명</option>
    <option value="prof">교수명</option>
  </select>

  <input type="text" name="searchWord">
  <input type="submit" value="검색">

</form>

<br/><br/>

<form action="/lecture/mod" method="post">
  강의명: <input type="text" name="lecture_name" value="${lecture.lecture_name}"><br>
  학과명:

          <select name="dept">
            <c:forEach var="department" items="${departments}" varStatus="status">
              <c:choose>
              <c:when test="${department.department_name eq lecture.dept}">
              <option value="${department.department_name}" selected="selected">${department.department_name}</option>
              </c:when>
              <c:otherwise>
              <option value="${department.department_name}">${department.department_name}</option>
              </c:otherwise>
              </c:choose>
            </c:forEach>
          </select>  <br/>

  교수명: <input type="text" name="prof" value="${lecture.prof}"><br>
  <input type="hidden" name="lecture_id" value="${lecture.lecture_id}">
  <input type="submit" value="전송">
</form>

<br/><br/>

<a href="${pageContext.request.contextPath}/j_spring_security_logout">Log Out</a> <br/><br/>

<a href="/lecture/list">강의생성게시판</a><br/><br/>

<a href="/member/view">회원정보</a><br/>

</body>
</html>
