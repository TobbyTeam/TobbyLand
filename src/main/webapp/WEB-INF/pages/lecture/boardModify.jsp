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

  <form id="mod_board_frm" name="mod_board_frm" method="post">

    제목:
    <input type="text" id="title" name="title" value="${board.title} "/><br/>

    내용:<br/>
    <textarea name="contents" rows="20" cols="40" wrap="hard">${board.contents}</textarea><br/>

    <input type="hidden" id="ls_id" name="ls_id" value="${board.ls_id}" />

    <input type="button" value="수정" onclick="$(this.form).submit()"/>&nbsp;&nbsp;&nbsp;
    <input type="reset" value="취소" onclick="javascript:window.location='/lecture/boardView?ls_id=${board.ls_id}'"/>
  </form>


</body>
</html>