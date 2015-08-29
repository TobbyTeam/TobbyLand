<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>

    <link rel="stylesheet" href="<c:url value="${ctx}/resources/css/memberregister.css" />">

    <script src="<c:url value="${ctx}/resources/js/jquery.validate.min.js" />"></script>
    <script src="<c:url value="${ctx}/resources/js/member_validate.js" />"></script>
    <script src="<c:url value="${ctx}/resources/js/jquery.blockUI.js" />"></script>
    <script src="<c:url value="${ctx}/resources/js/blockUI.js" />"></script>

    <title>토비랜드</title>

</head>

<body>

<jsp:include page="/top" flush="true"/>

<div class="container">
    <div class="row">
        <div class="col-md-2">
        </div>
        <div class="col-md-8 rgframe">
            <br />
            <h3>아이디/비밀번호 찾기</h3>
            <br />
            <h5>회원가입시 입력한 KPU 메일 주소를 입력해주세요.</h5>
            <hr />
            <form id=search_frm class="form-horizontal">
                <div class="form-group">
                    <label class="col-sm-3 control-label">
                        KPU 메일 주소
                    </label>
                    <div class="col-sm-6">
                        <input type="text" id="email" name="email" class="form-control"/>
                    </div>
                </div>
                <div class="form-group">
                    <div align="center">
                        <button type="button" onclick="$(this.form).submit()" class="btn btn-primary">찾기</button>
                        <button type="reset" onclick="history.back()" class="btn btn-default">취소</button>
                    </div>
                </div>
            </form>
            <br />
        </div>
        <div class="col-md-2">
        </div>
    </div>
</div>

<jsp:include page="/bottom" flush="true"/>

</body>
</html>
