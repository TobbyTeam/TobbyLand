<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css">
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>

    <link rel="stylesheet" href="<c:url value="${ctx}/resources/css/evlinfo.css" />">
    <link rel="stylesheet" href="<c:url value="${ctx}/resources/css/searchbar.css" />">

    <script src="<c:url value="${ctx}/resources/js/evaluation.js" />"></script>

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
                <button type="button" onclick="location.href='/lecture/list'" class="btn btn-primary littlebtn2" type="button">강의생성<br />게시판</button>
            </div>
        </div>
        <div class="col-md-1"></div>

    </div>

    <div class="row">
        <div class="col-md-1"></div>
        <div class="col-md-10">
            <table>
                <tr>
                    <td id="marname">${lecture.department_name}</td>
                </tr>
                <tr>
                    <td id="subname">${lecture.lecture_name}</td>
                    <td>&nbsp;(</td>
                    <td id="proname">${lecture.prof}</td>
                    <td>&nbsp;교수님</td>
                    <td>)</td>
                </tr>
            </table>
            <table>
                <tr>
                    <td>[평균&nbsp;</td>
                    <td id="avgscore">${lecture.avg}</td>
                    <td class="avgscore">점</td>
                    <td>]&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;[총 &nbsp;</td>
                    <td id="number">${lecture.count}</td>
                    <td class="number">건</td>
                    <td>]</td>
                </tr>
            </table>
            <table class="table">
                <tr>
                    <td>
                        <button type="button" onclick="location.href='/evaluation/list?lecture_id=${lecture.lecture_id}'" class="btn btn-default">강의평가</button>
                    </td>
                    <td>
                        <button type="button" onclick="location.href='/lecture/boardList/${lecture.lecture_id}/'" class="btn btn-default">강의게시판</button>
                    </td>
                    <td width="90%"></td>
                    <td><button type="button" onclick="evalRegAjax(${lecture.lecture_id})" class="btn btn-primary">평가작성</button></td>
                <tr>
            </table>
        </div>
        <div class="col-md-10"></div>
    </div>
</div>

</body>

</html>