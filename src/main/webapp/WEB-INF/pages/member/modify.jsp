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
        A1<input type="radio" name="method" value="A1" checked>
        A2<input type="radio" name="method" value="A2">
        A3<input type="radio" name="method" value="A3"><br>
    </c:when>
    <c:when test="${member.method eq 'A2'}">
        A1<input type="radio" name="method" value="A1" >
        A2<input type="radio" name="method" value="A2" checked>
        A3<input type="radio" name="method" value="A3"><br>
    </c:when>
    <c:otherwise>
        A1<input type="radio" name="method" value="A1" >
        A2<input type="radio" name="method" value="A2">
        A3<input type="radio" name="method" value="A3" checked><br>
    </c:otherwise>
</c:choose>

  과제방식:
<c:choose>
    <c:when test="${member.task eq 'B1'}">
        B1<input type="radio" name="task" value="B1" checked>
        B2<input type="radio" name="task" value="B2">
        B3<input type="radio" name="task" value="B3"><br>
    </c:when>
    <c:when test="${member.task eq 'B2'}">
        B1<input type="radio" name="task" value="B1">
        B2<input type="radio" name="task" value="B2" checked>
        B3<input type="radio" name="task" value="B3"><br>
    </c:when>
    <c:otherwise>
        B1<input type="radio" name="task" value="B1">
        B2<input type="radio" name="task" value="B2">
        B3<input type="radio" name="task" value="B3" checked><br>
    </c:otherwise>
</c:choose>

  시험방식:
    <c:choose>
        <c:when test="${member.exam eq 'C1'}">
            C1<input type="radio" name="exam" value="C1" checked>
            C2<input type="radio" name="exam" value="C2">
            C3<input type="radio" name="exam" value="C3"><br>
        </c:when>
        <c:when test="${member.exam eq 'C2'}">
            C1<input type="radio" name="exam" value="C1">
            C2<input type="radio" name="exam" value="C2" checked>
            C3<input type="radio" name="exam" value="C3"><br>
        </c:when>
        <c:otherwise>
            C1<input type="radio" name="exam" value="C1">
            C2<input type="radio" name="exam" value="C2">
            C3<input type="radio" name="exam" value="C3" checked><br>
        </c:otherwise>
    </c:choose>

    <br />

    <input type="button" value="수정" onclick="updateInfoConfirm()">&nbsp;&nbsp;&nbsp; <input type="reset" value="취소" onclick="javascript:window.location='/member/view'">

</form>

</body>
</html>

