<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>

<jsp:include page="/top" flush="true"/> <br />

<form action="/admin/lecture/mod" method="post">
  강의명: <input type="text" name="lecture_name" value="${lecture.lecture_name}"><br>
  학과명:<input type="text" name="dept" value="${lecture.dept}"><br>
  교수명: <input type="text" name="prof" value="${lecture.prof}"><br>
  <input type="hidden" name="lecture_id" value="${lecture.lecture_id}">
  <input type="submit" value="전송">
</form>

<br/><br/>

</body>
</html>
