<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags" %>
<html>
<head>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>

    <link rel="stylesheet" href="<c:url value="${ctx}/resources/css/evlmain.css" />">

    <script src="<c:url value="/resources/js/updownScroll.js" />"></script>

    <script src="<c:url value="${ctx}/resources/js/lectureSearch.js" />"></script>
    <script src="<c:url value="/resources/js/ajaxSesstion.js" />"></script>
    <script src="<c:url value="/resources/js/sessionTimeout.js" />"></script>

    <title>토비랜드</title>

</head>

<jsp:include page="/top" flush="true"/>

<body>

<br />

<div class="container" id="minHeight">
    <div class="row">
        <div class="col-md-4"></div>
        <div class="col-md-4" align="center" id="main">
            <img src="<c:url value="${ctx}/resources/image/main5.png" />" class="img-responsive"/>
            <br />
            <form action="/lecture/search" id="search_frm" name="search_frm" method="get">
                <div>
                    <select type="text" name="searchType" class="form-control">
                        <option value="lecture_name">강의명</option>
                        <option value="prof">교수명</option>
                        <option value="dept">학과명</option>
                    </select>
                </div>
                <div id="search">
                    <div class="input-group col-md-12">
                        <input type="text" id="searchWord" name="searchWord" class="form-control"/>
                	<span class="input-group-btn">
                    	<button type="button" id="search_lecture_btn" class="btn btn-info btn-lg">
                            <i class="glyphicon glyphicon-search"></i>
                        </button>
                    </span>
                    </div>
                </div>
            </form>
        </div>
        <div class="col-md-4"></div>
    </div>
    <br />
</div>

<br />
<br />
<jsp:include page="/bottom" flush="true"/>

</body>
</html>