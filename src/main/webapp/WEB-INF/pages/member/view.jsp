<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>

<form action="/lecture/search" method="get">
    검색 : <input type="text" name="lecture_name"><br>
    <input type="submit" value="검색">
</form><br>

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

    <a href="/member/modView">정보수정</a><br/>

    <a href="/member/deleteEnabled">회원탈퇴</a> <br />

    <br/>

    <a href="${pageContext.request.contextPath}/j_spring_security_logout">Log Out</a> <br />
    <a href="/lecture/list">강의생성</a><br/>
    <a href="/member/view">회원정보</a><br/>

    <br/>


</table></br>


</body>
</html>
