<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="s" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>

  <script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
  <script src="<c:url value="/resources/js/jquery.validate.min.js" />"></script>
  <script src="<c:url value="/resources/js/board_validate.js" />"></script>

  <title></title>
</head>
<body>

<jsp:include page="/top" flush="true"/>

<br /><br />

<form id="mod_frm" name="mod_frm" method="post">

  제목:
  <input type="text" id="title" name="title" value="${board.title} "/><br/>

  내용:<br/>
  <textarea name="contents" rows="20" cols="40" wrap="hard">${board.contents}</textarea><br/>

  <input type="hidden" id="board_id" name="board_id" value="${board.board_id}" />

  <input type="button" value="수정" onclick="$(this.form).submit()"/>&nbsp;&nbsp;&nbsp;
  <input type="reset" value="취소" onclick="history.back()"/>
</form>

<input type="hidden" id="department_id" value="${board.department_id}"/>


</body>
</html>