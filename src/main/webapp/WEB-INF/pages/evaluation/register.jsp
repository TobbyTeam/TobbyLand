<%@ taglib uri="http://www.springframework.org/security/tags" prefix="s" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

<form action="/evaluation/reg" method="post">

    학기:
    <select name="semester">
        <c:forEach var="semester" items="${semesters}" varStatus="status">
            <option value="${semester.semester}">${semester.semester}</option>
        </c:forEach>
    </select>  <br/>

    수업: <input type="text" name="method"><br/>
    과제: <input type="text" name="task"><br/>
    시험: <input type="text" name="exam"><br/>
    총평: <input type="text" name="comment"><br/>
    점수: <input type="text" name="score"><br/>
          <input type="hidden" name="lecture_id" value="${evaluation.lecture_id}"/>
          <input type="submit" value="등록">

</form>

<br/><br/>

<a href="${pageContext.request.contextPath}/j_spring_security_logout">Log Out</a> <br/><br/>

<a href="/lecture/list">강의생성게시판</a><br/><br/>

<a href="/member/view">회원정보</a><br/>
</body>
</html>
