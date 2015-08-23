<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css">

    <link rel="stylesheet" href="<c:url value="${ctx}/resources/css/evlinfo.css" />">

    <title></title>

</head>

<body>
<div class="row">
    <div class="col-md-2"></div>
    <div class="col-md-8">
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
                    <a href="/evaluation/list?lecture_id=${lecture.lecture_id}">
                        <button type="button" class="btn btn-default littlebtn">강의평가</button>
                    </a>
                </td>
                <td>
                    <a href="/lecture/boardList/${lecture.lecture_id}/">
                        <button type="button" class="btn btn-default littlebtn">강의게시판</button>
                    </a>
                </td>
                <td width="90%"></td>
                <td><button type="button" onclick="evalRegAjax(${lecture.lecture_id})" class="btn btn-primary">평가작성</button></td>
            <tr>
        </table>
    </div>
</div>

</body>

</html>