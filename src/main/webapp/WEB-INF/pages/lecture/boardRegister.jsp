<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="s" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>

    <link rel="stylesheet" href="<c:url value="${ctx}/resources/css/boardregister.css" />">

    <script src="<c:url value="${ctx}/resources/js/jquery.validate.min.js" />"></script>
    <script src="<c:url value="${ctx}/resources/js/lecture_validate.js" />"></script>
    <script src="<c:url value="${ctx}/resources/js/evaluation.js" />"></script>
    <script src="<c:url value="/resources/js/ajaxSesstion.js" />"></script>
    <script src="<c:url value="/resources/js/sessionTimeout.js" />"></script>


    <title>토비랜드</title>

</head>

<body>

<jsp:include page="/top" flush="true"/>

<jsp:include page="/lecture/search_form" flush="true"/>

<jsp:include page="/evaluation/lecture?lecture_id=${lecture_id}" flush="true"/>

<div class="container-fluid">
    <div class="row">
        <div class="col-md-1">
        </div>
        <div class="col-md-9">
            <form id="reg_board_frm" name="reg_board_frm" method="post" class="form-horizontal" role="form">
                <div class="form-group">
                    <label class="col-sm-2 control-label">
                        제목
                    </label>
                    <div class="col-sm-10">
                        <input type="text" id="title" name="title" class="form-control"/>
                    </div>
                </div>
                <br />

                <div class="form-group">
                    <label class="col-sm-2 control-label">
                        내용
                    </label>
                    <div class="col-sm-10">
                        <textarea name="contents" rows="20" placeholder="내용을 입력해주세요" class="form-control"></textarea>
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-2"></div>
                    <div class="col-sm-10" align="right">
                        <button type="button" onclick="$(this.form).submit()" class="btn btn-primary">작성</button>
                        <button type="reset" onclick="history.back()" class="btn btn-default">취소 </button>
                    </div>
                </div>

                <input type="hidden" id="lecture_id" name="lecture_id" value="${lecture_id}"/>

            </form>
        </div>
        <div class="col-md-2">
        </div>
    </div>
</div>

<jsp:include page="/bottom" flush="true"/>

</body>
</html>
