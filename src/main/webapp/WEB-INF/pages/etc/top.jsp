<%@ taglib uri="http://www.springframework.org/security/tags" prefix="s" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<html>
<head>
    <title></title>
</head>
<body>

<a href="/main">메인페이지</a>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

<a href="${pageContext.request.contextPath}/j_spring_security_logout">Log Out</a>

&nbsp;&nbsp;

<a href="/member/view">회원정보</a> <br />

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

<a href="/lecture/list">강의생성게시판</a> <br /><br />

<form action="/lecture/search" method="get">

    <select name="searchType">
    <option value="lecture_name">강의명</option>
    <option value="dept">학과명</option>
    <option value="prof">교수명</option>
    </select>

    <input type="text" name="searchWord">
    <input type="submit" value="검색">

</form>


</body>
</html>