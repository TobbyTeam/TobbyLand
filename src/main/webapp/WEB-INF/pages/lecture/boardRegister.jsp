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

    <form id="reg_board_frm" name="reg_board_frm" method="post">

      제목: <input type="text" id="title" name="title"/><br/>
      내용: <input type="text" id="contents" name="contents"/><br/>
              <input type="hidden" id="lecture_id" name="lecture_id" value="${lecture_id}"/>
              <input type="button" value="강의생성" onclick="$(this.form).submit()"/>&nbsp;&nbsp;&nbsp; <input type="reset" value="취소" onclick="javascript:window.location='/lecture/list'"/>
    </form>

</body>
</html>
