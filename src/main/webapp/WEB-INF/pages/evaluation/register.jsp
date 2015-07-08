<%@ taglib uri="http://www.springframework.org/security/tags" prefix="s" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <script src="//code.jquery.com/jquery-1.11.3.min.js"></script>

    <title></title>
</head>
<body>

<jsp:include page="/top" flush="true"/> <br />

<form action="/evaluation/reg" method="post">

    학기:
    <select name="semester">
        <c:forEach var="semester" items="${semesters}" varStatus="status">
            <c:choose>
                <c:when test="${semester.semester eq current}">
                    <option value="${semester.semester}" selected="selected">${semester.semester}</option>
                </c:when>
                <c:otherwise>
                    <option value="${semester.semester}">${semester.semester}</option>
                </c:otherwise>
            </c:choose>
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

</body>
</html>
