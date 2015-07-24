<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>헬로 월드</title>
</head>

<body>

강의명 : ${lecture.lecture_name}<br />
학과명 : ${lecture.department_name}<br />
교수명 : ${lecture.prof}<br />
강의평가 수: ${lecture.count}<br />
평점: ${lecture.avg}<br />

<br />

<a href="/evaluation/list?lecture_id=${lecture.lecture_id}">강의평가</a>&nbsp;&nbsp;<a href="/lecture/boardList/${lecture.lecture_id}/">강의게시판</a>

</body>
</html>