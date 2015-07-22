<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>
<form action="/test1" method="post">
테스트 : <input type="text" name="test"/>
  <input type="submit" value="전송"/>


윈도우 로케이션
    <input type="reset" value="취소" onclick="javascript:window.location='/login'">

admin 이전 페이지
    <a href="#" onClick="history.go(-2);">이전페이지로</a>


</form>
</body>
</html>
