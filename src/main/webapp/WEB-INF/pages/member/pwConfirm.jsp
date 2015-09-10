<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>

    <link rel="stylesheet" href="<c:url value="${ctx}/resources/css/pwConfirm.css" />">

    <script src="<c:url value="/resources/js/updownScroll.js" />"></script>

    <script src="<c:url value="${ctx}/resources/js/member.js" />"></script>
    <script src="<c:url value="/resources/js/ajaxSesstion.js" />"></script>
    <script src="<c:url value="/resources/js/sessionTimeout.js" />"></script>

    <title>토비랜드</title>

</head>
<body>

<jsp:include page="/top" flush="true"/>

<div class="container">
    <div class="row" id="pwd-container">
        <div class="col-md-4"></div>
        <div class="col-md-4">
            <section class="frame" id="pw_confirm">
                <div role="pw_confirm">
                    <input type="password" id="password" name="password" placeholder="Password" class="form-control input-lg">
                    <button type="button" id="pw_btn" class="btn btn-lg btn-primary btn-block">확인</button>
                    <button type="reset" onclick="history.back()" class="btn btn-lg btn-danger btn-block">취소</button>
                </div>
            </section>
        </div>
    </div>

</div>

<br />
<jsp:include page="/bottom" flush="true"/>

</body>
</html>
