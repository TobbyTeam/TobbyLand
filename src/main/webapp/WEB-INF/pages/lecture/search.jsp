<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="s" %>
<html>
<head>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css">
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>

    <link rel="stylesheet" href="<c:url value="${ctx}/resources/css/leclist.css" />">
    <link rel="stylesheet" href="<c:url value="${ctx}/resources/css/searchbar.css" />">

    <script src="<c:url value="${ctx}/resources/js/lectureSearch.js" />"></script>

    <title>토비랜드</title>

</head>

<body>

<div class="container">
    <div class="row">
        <div class="col-md-1"></div>
        <div class="col-md-10">
            <div class="col-md-3"></div>
            <form action="/lecture/search" id="search_frm" name="search_frm" method="get">
                <div class="col-md-2">
                    <div id="select">
                        <select type="text" name="searchType" class="form-control">
                            <c:choose>
                                <c:when test="${empty search}">
                                    <option value="lecture_name" selected="selected">강의명</option>
                                    <option value="prof">교수명</option>
                                    <option value="dept">학과명</option>
                                </c:when>
                                <c:otherwise>
                                    <c:choose>
                                        <c:when test="${search.searchType eq 'prof'}">
                                            <option value="lecture_name">강의명</option>
                                            <option value="prof" selected="selected">교수명</option>
                                            <option value="dept">학과명</option>
                                        </c:when>
                                        <c:when test="${search.searchType eq 'dept'}">
                                            <option value="lecture_name">강의명</option>
                                            <option value="prof">교수명</option>
                                            <option value="dept" selected="selected">학과명</option>
                                        </c:when>
                                        <c:otherwise>
                                            <option value="lecture_name" selected="selected">강의명</option>
                                            <option value="prof">교수명</option>
                                            <option value="dept">학과명</option>
                                        </c:otherwise>
                                    </c:choose>
                                </c:otherwise>
                            </c:choose>
                        </select>
                    </div>
                </div>
                <div class="col-md-3">
                    <div id="search">
                        <div class="input-group col-md-12">
                            <c:choose>
                                <c:when test="${empty search}">
                                    <input type="text" id="searchWord" name="searchWord" class="form-control"/>
                                </c:when>
                                <c:otherwise>
                                    <input type="text" id="searchWord" name="searchWord" value="${search.searchWord}" class="form-control"/>
                                </c:otherwise>
                            </c:choose>
                            <span class="input-group-btn">
                            <button type="button" id="search_lecture_btn" class="btn btn-info btn-lg">
                                <i class="glyphicon glyphicon-search"></i>
                            </button>
                            </span>
                        </div>
                    </div>
                </div>
            </form>
            <div class="col-md-2"></div>
            <div class="col-md-2">
                <button type="button" onclick="location.href='/lecture/list'" class="btn btn-primary" type="button">강의생성<br />게시판</button>
            </div>
        </div>
        <div class="col-md-1"></div>

    </div>
</div>

</body>
</html>