<%@ taglib uri="http://www.springframework.org/security/tags" prefix="s" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>

<jsp:include page="/top" flush="true"/> <br />

<form action="/lecture/reg" method="post">

  강의명: <input type="text" name="lecture_name"><br/>
  학과명:
          <select name="dept">
              <c:forEach var="department" items="${departments}" varStatus="status">
                <option value="${department.department_name}">${department.department_name}</option>
              </c:forEach>
          </select>  <br/>
  교수명: <input type="text" name="prof"><br/>
          <input type="submit" value="등록">

</form>
<br/><br/>

</body>
</html>
