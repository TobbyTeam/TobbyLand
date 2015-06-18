<%--
  Created by IntelliJ IDEA.
  User: happy
  Date: 2015-06-18
  Time: 오후 9:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>

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

</table></br>


</body>
</html>
