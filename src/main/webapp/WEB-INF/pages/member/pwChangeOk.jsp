<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>

${message}

<% response.setHeader("Refresh","3;URL=/login");%>
3초후에 로그인 페이지로 이동합니다.

</body>
</html>
