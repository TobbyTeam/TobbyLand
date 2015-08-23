<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css">
    <title></title>
</head>
<body>

<% response.setHeader("Refresh","3;URL=/login");%>

<div class="container-fluid">
    <div class="row">
        <div class="col-md-2">
        </div>
        <div class="col-md-8">
            <br />
            <h2 align="center">${message}</h2>
            <hr />
            <h4 align="center">3초후에 로그인 페이지로 이동합니다.</h4>
        </div>
    </div>
</div>
<br />
</body>
</html>

</body>
</html>