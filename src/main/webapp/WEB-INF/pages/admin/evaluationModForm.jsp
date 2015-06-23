<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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

<form action="/admin/evaluation/mod" method="post">

  수업: <input type="text" name="method" value="${evaluation.method}"><br>
  과제: <input type="text" name="task" value="${evaluation.task}"><br>
  시험: <input type="text" name="exam" value="${evaluation.exam}"><br>
  총평: <input type="text" name="comment" value="${evaluation.comment}"><br>
  점수: <input type="text" name="score" value="${evaluation.score}"><br>
  신고수: <input type="text" name="report" value="${evaluation.report}"><br>
        <input type="hidden" name="evaluation_id" value="${evaluation.evaluation_id}">
        <input type="hidden" name="lecture_id" value="${evaluation.lecture_id}">
        <input type="submit" value="전송">

</form>

<br/><br/>

<a href="${pageContext.request.contextPath}/j_spring_security_logout">Log Out</a> <br/><br/>
<a href="/lecture/list">강의생성게시판</a> <br/><br/>
<a href="/member/view">회원정보</a> <br/>
</body>
</html>

