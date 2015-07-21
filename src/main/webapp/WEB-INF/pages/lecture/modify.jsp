<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="s" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>

  <script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
  <script src="<c:url value="/resources/js/jquery.validate.min.js" />"></script>
  <script src="<c:url value="/resources/js/lecture_validate.js" />"></script>

  <title></title>
</head>
<body>

  <jsp:include page="/top" flush="true"/> <br />

  <form id="mod_frm" name="mod_frm" method="post">

    강의명: <input type="text" id="lecture_name" name="lecture_name" value="${lecture.lecture_name}"/><br>
    학과명:
            <select id="dept" name="dept">
              <c:forEach var="department" items="${departments}" varStatus="status">
                <c:choose>
                <c:when test="${department.department_id eq lecture.dept}">
                <option value="${department.department_id}" selected="selected">${department.department_name}</option>
                </c:when>
                <c:otherwise>
                <option value="${department.department_id}">${department.department_name}</option>
                </c:otherwise>
                </c:choose>
              </c:forEach>
            </select>  <br/>

    교수명: <input type="text" id="prof" name="prof" value="${lecture.prof}"/><br>
            <input type="hidden" name="lecture_id" value="${lecture.lecture_id}"/>
            <input type="button" value="수정" onclick="$(this.form).submit()"/>&nbsp;&nbsp;&nbsp; <input type="reset" value="취소" onclick="javascript:window.location='/lecture/list'"/>
  </form>

</body>
</html>
