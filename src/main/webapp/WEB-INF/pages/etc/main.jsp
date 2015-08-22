<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>

    <style type="text/css">
        .boardname {
            color: #666;
            font-size: 220%;
        }
    </style>

    <title>토비랜드</title>
</head>

<body>

<jsp:include page="/top" flush="true"/>

<div class="container-fluid">
    <div class="row">
        <div class="col-md-1">
        </div>
        <div class="col-md-5">
            <span class="boardname">사이트 공지사항</span>
            <table class="table">
                <thead align="center">
                <tr>
                    <th width="80%">제목</th>
                    <th width="20%">등록일</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="site" items="${sites}" varStatus="status">
                    <tr>
                        <td>
                            <a href="/board/view/${site.department_id}/?board_id=${site.board_id}">${site.title}</a>
                        </td>
                        <td>${site.write_date}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <br />
            <span class="boardname">최신글</span>
            <table class="table">
                <thead>
                <tr>
                    <th width="20%">게시판</th>
                    <th width="50%">제목</th>
                    <th width="15%">작성자</th>
                    <th width="15%">작성일</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="latest" items="${latests}" varStatus="status">
                    <tr>
                        <td>${latest.department_name}</td>
                        <td>
                            <a href="/board/view/${latest.department_id}/?board_id=${latest.board_id}">${latest.title}</a>
                        </td>
                        <td>${latest.writer}
                            <c:if test="${latest.is_anonymity == 1}">
                                (익명)
                            </c:if>
                        </td>
                        <td>${latest.write_date}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <br />
        </div>
        <div class="col-md-5">
            <span class="boardname">학교 공지사항</span>
            <table class="table">
                <thead align="center">
                <tr>
                    <th width="80%">제목</th>
                    <th width="20%">등록일</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="kpu" items="${kpus}" varStatus="status">
                    <tr>
                        <td>
                            <a href="/board/view/${kpu.department_id}/?board_id=${kpu.board_id}">${kpu.title}</a>
                        </td>
                        <td>${kpu.write_date}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <br />
            <span class="boardname">핫 게시글</span>
            <table class="table">
                <thead>
                <tr>
                    <th width="20%">게시판</th>
                    <th width="45%">제목</th>
                    <th width="15%">작성자</th>
                    <th width="10%">조회</th>
                    <th width="10%">추천</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="hot" items="${hots}" varStatus="status">
                    <tr>
                        <td>${hot.department_name}</td>
                        <td>
                            <a href="/board/view/${hot.department_id}/?board_id=${hot.board_id}">${hot.title}</a>
                            <c:if test="${hot.count != 0}">
                                [${hot.count}]
                            </c:if>
                        </td>
                        <td>${hot.writer}
                            <c:if test="${hot.is_anonymity == 1}">
                                (익명)
                            </c:if>
                        </td>
                        <td>${hot.hit}</td>
                        <td>${hot.likes}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>

<jsp:include page="/bottom" flush="true"/>

</body>
</html>
