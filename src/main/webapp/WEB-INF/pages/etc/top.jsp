<%@ taglib uri="http://www.springframework.org/security/tags" prefix="s" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title></title>
    <script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
    <script src="<c:url value="/resources/js/lectures.js" />"></script>
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

<form action="/lecture/search" method="get" name="search_frm">

    <select name="searchType">
    <option value="lecture_name">강의명</option>
    <option value="dept">학과명</option>
    <option value="prof">교수명</option>
    </select>

    <input type="text" name="searchWord">
    <input type="button" value="검색" onclick="searchLecture()">

</form>


</body>
</html>