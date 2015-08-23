<%@ taglib uri="http://www.springframework.org/security/tags" prefix="s" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>

    <link rel="stylesheet" href="<c:url value="${ctx}/resources/css/leclist.css" />">
    <link rel="stylesheet" href="<c:url value="${ctx}/resources/css/searchbar.css" />">

    <script src="<c:url value="${ctx}/resources/js/lecture.js" />"></script>
    <script src="<c:url value="${ctx}/resources/js/jquery.validate.min.js" />"></script>
    <script src="<c:url value="${ctx}/resources/js/lecture_validate.js" />"></script>

    <title>토비랜드</title>
</head>

<body>

<div class="container">
    <div class="row">
        <div class="col-md-1"></div>
        <div class="col-md-10">
            <div class="col-md-3"></div>
            <form action="/lecture/search" method="get" name="search_frm">
                <div class="col-md-2">
                    <div id="select">
                        <select type="text" name="searchType" class="form-control">
                            <option value="lecture_name" selected="selected">강의명</option>
                            <option value="dept">학과명</option>
                            <option value="prof">교수명</option>
                        </select>
                    </div>
                </div>
                <div class="col-md-3">
                    <div id="search">
                        <div class="input-group col-md-12">
                            <input type="text" name="searchWord" class="form-control"/>
                            <span class="input-group-btn">
                            <button type="button" onclick="searchLecture()" class="btn btn-info btn-lg">
                                <i class="glyphicon glyphicon-search"></i>
                            </button>
                            </span>
                        </div>
                    </div>
                </div>
            </form>
            <div class="col-md-2"></div>
            <div class="col-md-2">
                <a href="/lecture/list"><button class="btn btn-primary littlebtn2" type="button">강의생성<br />게시판</button></a>
            </div>
        </div>
        <div class="col-md-1"></div>

    </div>
</div>

</body>
</html>