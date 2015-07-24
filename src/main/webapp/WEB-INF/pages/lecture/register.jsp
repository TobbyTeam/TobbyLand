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

    <form id="reg_frm" name="reg_frm" method="post">

      강의명: <input type="text" id="lecture_name" name="lecture_name"/><br/>
      학과명:
              <select id="dept" name="dept">
                  <c:forEach var="department" items="${departments}" varStatus="status">
                    <option value="${department.department_id}">${department.department_name}</option>
                  </c:forEach>
              </select>  <br/>
      교수명: <input type="text" id="prof" name="prof"/><br/>
              <input type="button" value="강의생성" onclick="$(this.form).submit()"/>&nbsp;&nbsp;&nbsp; <input type="reset" value="취소" onclick="history.back()"/>

    </form>

</body>
</html>
