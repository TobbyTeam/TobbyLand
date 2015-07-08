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

<jsp:include page="/top" flush="true"/> <br />

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

    <a href="/member/pwConfirm">정보수정</a><br/><br/>

    <a href="/member/pwChange">비밀번호수정</a><br/><br/>

    <a href="/member/deleteEnabled">회원탈퇴</a> <br /><br/>

</body>
</html>
