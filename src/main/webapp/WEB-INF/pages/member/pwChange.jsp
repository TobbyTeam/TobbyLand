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


    <title>토비랜드</title>

</head>
<body>

<jsp:include page="/top" flush="true"/>

<div class="container-fluid">
    <div class="row">
        <div class="col-md-2">
        </div>
        <div class="col-md-8 rgframe">
            <br />
            <h3>비밀번호변경</h3>
            <hr />
            <form id="pw_mod_frm" name="pw_mod_frm" class="form-horizontal">
                <div class="form-group">
                    <label class="col-sm-3 control-label">
                        기존비밀번호
                    </label>
                    <div class="col-sm-6">
                        <input type="password" id="exPassword" name="exPassword" class="form-control"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label">
                        새비밀번호
                    </label>
                    <div class="col-sm-6">
                        <input type="password" id="password" name="password" class="form-control"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label">
                        새비밀번호확인
                    </label>
                    <div class="col-sm-6">
                        <input type="password" id="password_check" name="password_check" class="form-control"/>
                    </div>
                </div>
                <div class="form-group">
                    <div align="center">
                        <button type="button" onclick="$(this.form).submit()"class="btn btn-primary">수정</button>
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
<br />
<jsp:include page="/bottom" flush="true"/>
</body>
</html>

