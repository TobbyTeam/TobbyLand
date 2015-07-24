<%@ taglib uri="http://www.springframework.org/security/tags" prefix="s" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
    <script src="<c:url value="/resources/js/jquery.validate.min.js" />"></script>
    <script src="<c:url value="/resources/js/evaluation_validate.js" />"></script>

    <title></title>
</head>
<body>

<jsp:include page="/top" flush="true"/>

<br /><br />

<jsp:include page="/lecture/search_form" flush="true"/>

<br /><br />

<form id="reg_frm" method="post">

    학기:
    <select name="semester">
        <c:forEach var="semester" items="${semesters}" varStatus="status">
            <c:choose>
                <c:when test="${semester.semester_title eq current}">
                    <option value="${semester.semester_id}" selected="selected">${semester.semester_title}</option>
                </c:when>
                <c:otherwise>
                    <option value="${semester.semester_id}">${semester.semester_title}</option>
                </c:otherwise>
            </c:choose>
        </c:forEach>
    </select>  <br/>

    수업: <input type="text" name="method"><br/>
    과제: <input type="text" name="task"><br/>
    시험: <input type="text" name="exam"><br/>
    총평: <input type="text" name="comment"><br/>
    점수: <input type="text" name="score"><br/>
          <input type="hidden" id="lecture_id" name="lecture_id" value="${lecture_id}"/>
          <input type="submit" value="등록">&nbsp;&nbsp;&nbsp; <input type="reset" value="취소" onclick="history.back()"/>

</form>

<br/><br/>

</body>
</html>
