<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>

    <script src="<c:url value="/resources/js/members.js" />"></script>

</head>
<body>


<jsp:include page="/top" flush="true"/> <br />

<form action="/member/mod" method="post" name="mod_frm">

  아이디: <text>${member.member_id}</text><br>
  패스워드:<input type="password" name="password" value="${member.password}"><br>
  패스워드확인:<input type="password" name="password_check" value="${member.password}"><br/>
  별명: <input type="text" name="nickname" value="${member.nickname}"><br>
  이메일: <text>${member.email}</text><br>
  수업방식:
    <c:choose>
        <c:when test="${member.method eq 'A1'}">
            독고다이형<input type="radio" name="method" value="a1" checked>
            토론형<input type="radio" name="method" value="a2">
            실습형<input type="radio" name="method" value="a3"><br>
        </c:when>
        <c:when test="${member.method eq 'A2'}">
            독고다이형<input type="radio" name="method" value="a1" >
            토론형<input type="radio" name="method" value="a2" checked>
            실습형<input type="radio" name="method" value="a3"><br>
        </c:when>
        <c:otherwise>
            독고다이형<input type="radio" name="method" value="a1" >
            토론형<input type="radio" name="method" value="a2">
            실습형<input type="radio" name="method" value="a3" checked><br>
        </c:otherwise>
    </c:choose>

  과제방식:
    <c:choose>
        <c:when test="${member.task eq 'B1'}">
            텀프로젝트<input type="radio" name="task" value="b1" checked>
            팀과제<input type="radio" name="task" value="b2">
            개인과제<input type="radio" name="task" value="b3"><br>
        </c:when>
        <c:when test="${member.task eq 'B2'}">
            텀프로젝트<input type="radio" name="task" value="b1">
            팀과제<input type="radio" name="task" value="b2" checked>
            개인과제<input type="radio" name="task" value="b3"><br>
        </c:when>
        <c:otherwise>
            텀프로젝트<input type="radio" name="task" value="b1">
            팀과제<input type="radio" name="task" value="b2">
            개인과제<input type="radio" name="task" value="b3" checked><br>
        </c:otherwise>
    </c:choose>

  시험방식:
    <c:choose>
        <c:when test="${member.exam eq 'c1'}">
            서술형<input type="radio" name="exam" value="c1" checked>
            혼합형<input type="radio" name="exam" value="c2">
            오픈북<input type="radio" name="exam" value="c3">
            실습<input type="radio" name="exam" value="c4"><br>
        </c:when>
        <c:when test="${member.exam eq 'c2'}">
            서술형<input type="radio" name="exam" value="c1">
            혼합형<input type="radio" name="exam" value="c2" checked>
            오픈북<input type="radio" name="exam" value="c3">
            실습<input type="radio" name="exam" value="c4"><br>
        </c:when>
        <c:when test="${member.exam eq 'c3'}">
            서술형<input type="radio" name="exam" value="c1">
            혼합형<input type="radio" name="exam" value="c2">
            오픈북<input type="radio" name="exam" value="c3" checked>
            실습<input type="radio" name="exam" value="c4"><br>
        </c:when>
        <c:otherwise>
            서술형<input type="radio" name="exam" value="c1">
            혼합형<input type="radio" name="exam" value="c2">
            오픈북<input type="radio" name="exam" value="c3">
            실습<input type="radio" name="exam" value="c4" checked><br>
        </c:otherwise>
    </c:choose>

    <br />

    <input type="button" value="수정" onclick="updateInfoConfirm()">&nbsp;&nbsp;&nbsp; <input type="reset" value="취소" onclick="javascript:window.location='/member/view'">

</form>

</body>
</html>

