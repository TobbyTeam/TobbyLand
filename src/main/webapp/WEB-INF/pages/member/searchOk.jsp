<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css">

    <title>토비랜드</title>

</head>

<body>

<jsp:include page="/top" flush="true"/>

<div class="container-fluid">
    <div class="row">
        <div class="col-md-2">
        </div>
        <div class="col-md-8">
            <br />
            <p align="center"><img src="<c:url value="/resources/image/check.png" />" /></p>\
            <br />
            <h2 align="center">메일이 발송되었습니다.</h2>
            <hr />
            <h4 align="center">KPU 웹메일로 임시 비밀번호를 포함한 회원정보가 발급되었습니다.</h4><br />
            <p align="center"><a href="http://mail.kpu.ac.kr/login" target="_blank">KPU 메일 확인하기</a></p>
            <p align="center"><a href="/login">로그인 페이지</a></p>
        </div>
        <div class="col-md-2">
        </div>
    </div>
</div>

<br />

<jsp:include page="/bottom" flush="true"/>

</body>
</html>
