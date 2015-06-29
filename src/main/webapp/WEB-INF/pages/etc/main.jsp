<%@ taglib uri="http://www.springframework.org/security/tags" prefix="s" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<html>
<head>
    <title></title>
</head>
<body>

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

<a href="${pageContext.request.contextPath}/j_spring_security_logout">Log Out</a> <br/><br/>

<br/>
<a href="/lecture/list">강의생성게시판</a><br/><br/>
<a href="/member/view">회원정보</a><br/>

<sec:authorize access="hasRole('ROLE_ADMIN')">
<a href="/admin/lecture/list">강의관리</a><br/><br/>
</sec:authorize>

<sec:authorize access="hasRole('ROLE_ADMIN')">
    <a href="/admin/evaluation/reportList">강의평가관리</a><br/><br/>
</sec:authorize>


USER ID : <s:authentication property="name"/><br/>
</body>
</html>