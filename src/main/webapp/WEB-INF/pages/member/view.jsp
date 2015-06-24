<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>

<c:if test="${not empty error}">
    ${error}
</c:if>

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

<table border="1">

  <tr>
    <td>아이디</td>
    <td>닉네임</td>
    <td>이메일</td>
    <td>수업방식</td>
    <td>과제방식</td>
    <td>시험방식</td>
  </tr>

  <tr>
      <td>${member.member_id}</td>
      <td>${member.nickname}</td>
      <td>${member.email}</td>
      <td>${member.method}</td>
      <td>${member.task}</td>
      <td>${member.exam}</td>
  </tr>

</table>

<br/><br/>

    <a href="/member/password">정보수정</a><br/><br/>

    <a href="/member/deleteEnabled">회원탈퇴</a> <br /><br/>

    <a href="${pageContext.request.contextPath}/j_spring_security_logout">Log Out</a> <br/><br/>

    <a href="/lecture/list">강의생성게시판</a><br/><br/>

    <a href="/member/view">회원정보</a><br/>

</body>
</html>
