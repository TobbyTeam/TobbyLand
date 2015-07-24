<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>

    <script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
    <script src="<c:url value="/resources/js/member.js" />"></script>

</head>
<body>

<c:if test="${not empty error}">
    ${error}
</c:if>

<jsp:include page="/evaluation/top" flush="true"/> <br />

<table border="1">

  <tr>
    <td>멤버아이디</td>
    <td>유저아이디</td>
    <td>닉네임</td>
    <td>이메일</td>
    <td>수업방식</td>
    <td>과제방식</td>
    <td>시험방식</td>
    <td>가입일</td>

  </tr>

  <tr>
      <td>${member.member_id}</td>
      <td>${member.user_id}</td>
      <td>${member.nickname}</td>
      <td>${member.email}</td>
      <td>
          <c:forEach var="tendency" items="${tendencys}" varStatus="status" >
              <c:if test="${tendency.tendency_id eq member.method}">
                  ${tendency.tendency_title}
              </c:if>
          </c:forEach>
      </td>
      <td>
          <c:forEach var="tendency" items="${tendencys}" varStatus="status" >
              <c:if test="${tendency.tendency_id eq member.task}">
                  ${tendency.tendency_title}
              </c:if>
          </c:forEach>
      </td>
      <td>
          <c:forEach var="tendency" items="${tendencys}" varStatus="status" >
              <c:if test="${tendency.tendency_id eq member.exam}">
                  ${tendency.tendency_title}
              </c:if>
          </c:forEach>
      </td>
      <td>
          ${member.reg_date}
      </td>
  </tr>

</table>

<br/><br/>

    <a href="/member/pwConfirm">정보수정</a><br/><br/>

    <a href="/member/pwChange">비밀번호수정</a><br/><br/>

    <a id="withdrawal" href="">회원탈퇴</a> <br /><br/>

</body>
</html>
