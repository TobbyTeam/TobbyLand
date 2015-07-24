<%@ taglib uri="http://www.springframework.org/security/tags" prefix="s" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title></title>
    <script src="<c:url value="/resources/js/lecture.js" />"></script>
    <script src="<c:url value="/resources/js/jquery.validate.min.js" />"></script>
    <script src="<c:url value="/resources/js/lecture_validate.js" />"></script>
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

</body>
</html>