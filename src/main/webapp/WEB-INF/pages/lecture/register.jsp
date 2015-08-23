<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="s" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>

    <link rel="stylesheet" href="<c:url value="${ctx}/resources/css/evlregister.css" />">

    <script src="<c:url value="/resources/js/jquery.validate.min.js" />"></script>
    <script src="<c:url value="/resources/js/lecture_validate.js" />"></script>

    <title>토비랜드</title>

</head>
<body>

<jsp:include page="/top" flush="true"/>

<jsp:include page="/lecture/search_form" flush="true"/>

<br />
<div class="container-fluid">
    <div class="row">
        <div class="col-md-2">
        </div>
        <div class="col-md-8 rgframe">
            <br />
            <h3>강의생성 신청</h3>
            <hr />
            <form id="reg_frm" name="reg_frm" method="post" class="form-horizontal">
                <div class="form-group">
                    <label class="col-sm-3 control-label">
                        과목명
                    </label>
                    <div class="col-sm-7">
                        <input input type="text" id="lecture_name" name="lecture_name" class="form-control"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label">
                        학과
                    </label>
                    <div class="col-sm-4">
                        <select type="text" id="dept" name="dept" class="form-control">
                            <c:forEach var="department" items="${departments}" varStatus="status">
                                <option value="${department.department_id}">${department.department_name}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label">
                        교수명
                    </label>
                    <div class="col-sm-7">
                        <input type="text" id="prof" name="prof" class="form-control"/>
                    </div>
                </div>
                <div class="form-group">
                    <div align="center">
                        <button type="button" onclick="$(this.form).submit()" class="btn btn-primary">강의생성</button>
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
<br />

<jsp:include page="/bottom" flush="true"/>

</body>
</html>
