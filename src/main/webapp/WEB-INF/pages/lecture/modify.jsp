<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>

<jsp:include page="/top" flush="true"/> <br />

<form action="/lecture/mod" method="post" name="lecture_frm">
  강의명: <input type="text" name="lecture_name" value="${lecture.lecture_name}"><br>
  학과명:

          <select name="dept">
            <c:forEach var="department" items="${departments}" varStatus="status">
              <c:choose>
              <c:when test="${department.department_name eq lecture.dept}">
              <option value="${department.department_name}" selected="selected">${department.department_name}</option>
              </c:when>
              <c:otherwise>
              <option value="${department.department_name}">${department.department_name}</option>
              </c:otherwise>
              </c:choose>
            </c:forEach>
          </select>  <br/>

  교수명: <input type="text" name="prof" value="${lecture.prof}"><br>
  <input type="hidden" name="lecture_id" value="${lecture.lecture_id}">
  <input type="button" value="강의생성" onclick="infoConfirm()">&nbsp;&nbsp;&nbsp; <input type="reset" value="취소" onclick="javascript:window.location='/lecture/list'">
</form>

<br/><br/>

</body>
</html>
