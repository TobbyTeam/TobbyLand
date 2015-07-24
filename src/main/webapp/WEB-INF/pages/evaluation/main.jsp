<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <title></title>
    <script src="<c:url value="/resources/js/lecture.js" />"></script>
</head>
<body>
<jsp:include page="/top" flush="true"/>


<br /><br />

<a href="/lecture/list">강의생성게시판</a><br /><br /><br />


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

</body>
</html>