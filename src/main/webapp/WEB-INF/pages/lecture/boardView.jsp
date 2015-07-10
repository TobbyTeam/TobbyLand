<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

  <script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
  <script src="<c:url value="/resources/js/lecture.js" />"></script>

  <title></title>
</head>
<body>

<jsp:include page="/top" flush="true"/> <br />

제목 : <text>${board.title}</text> &nbsp;&nbsp; 작성일 : <text>${board.write_date}</text>
<br />
내용 : <br />

<textarea name="contents" rows="20" cols="40" wrap="hard" readonly="readonly">${board.contents}</textarea><br/>


<br/>
<input type="hidden" id="ls_id" value="${board.ls_id}" />
<input type="hidden" id="lecture_id" value="${board.lecture_id}" />

<input type="button" id="boardMod_btn" value="수정" /> &nbsp;&nbsp;
<input type="button" id="boardDel_btn" value="삭제" /> &nbsp;&nbsp;
<a href="/lecture/boardList?lecture_id=${board.lecture_id}">목록</a>

</body>
</html>
