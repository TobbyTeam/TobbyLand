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
      <td>
          <c:choose>
              <c:when test="${member.method eq 'a1'}">
                  독고다이형
              </c:when>
              <c:when test="${member.method eq 'a2'}">
                  토론형
              </c:when>
              <c:otherwise>
                  실습형
              </c:otherwise>
          </c:choose>
      </td>
      <td>
          <c:choose>
              <c:when test="${member.task eq 'b1'}">
                  텀프로젝트
              </c:when>
              <c:when test="${member.task eq 'b2'}">
                  팀과제
              </c:when>
              <c:otherwise>
                  개인과제
              </c:otherwise>
          </c:choose>
      </td>
      <td>
          <c:choose>
              <c:when test="${member.exam eq 'c1'}">
                  서술형
              </c:when>
              <c:when test="${member.exam eq 'c2'}">
                  혼합형
              </c:when>
              <c:when test="${member.exam eq 'c3'}">
                  오픈북
              </c:when>
              <c:otherwise>
                  실습
              </c:otherwise>
          </c:choose>
      </td>
  </tr>

</table>

<br/><br/>

    <a href="/member/pwConfirm">정보수정</a><br/><br/>

    <a href="/member/pwChange">비밀번호수정</a><br/><br/>

    <a href="/member/deleteEnabled">회원탈퇴</a> <br /><br/>

</body>
</html>
