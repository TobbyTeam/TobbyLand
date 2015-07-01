<%@ taglib uri="http://www.springframework.org/security/tags" prefix="s" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title></title>
    <script src="<c:url value="/resources/js/lectures.js" />"></script>
</head>
<body>

<form action="/lecture/search" method="get" name="search_frm">

    검색
    <select name="searchType">
        <option value="lecture_name">강의명</option>
        <option value="dept">학과명</option>
        <option value="prof">교수명</option>
    </select>

    <input type="text" name="searchWord">
    <input type="button" value="검색" onclick="searchLecture()">

</form>

<br/><br/>

<a href="${pageContext.request.contextPath}/j_spring_security_logout">Log Out</a> <br/><br/>

<br/>
<a href="/lecture/list">강의생성게시판</a><br/><br/>
<a href="/member/view">회원정보</a><br/>

<s:authorize access="hasRole('ROLE_ADMIN')">
<a href="/admin/lecture/list">강의관리</a><br/><br/>
</s:authorize>

<s:authorize access="hasRole('ROLE_ADMIN')">
    <a href="/admin/evaluation/reportList">강의평가관리</a><br/><br/>
</s:authorize>


USER ID : <s:authentication property="name"/><br/>
</body>
</html>