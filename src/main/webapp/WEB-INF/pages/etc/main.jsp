<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title></title>

    <script src="//code.jquery.com/jquery-1.11.3.min.js"></script>

</head>
<body>

<jsp:include page="/top" flush="true"/>

<h2>사이트 공지사항</h2>
<table border="1">
    <tr>
        <td>제목</td>
        <td>작성일</td>
    </tr>
    <c:forEach var="site" items="${sites}" varStatus="status">
        <tr>
            <td>
                <a href="/board/view/${site.department_id}/?board_id=${site.board_id}">${site.title}</a>
            </td>
            <td>${site.write_date}</td>
        </tr>
    </c:forEach>
</table><br /><br />


<h2>학교 공지사항</h2>
<table border="1">
    <tr>
        <td>제목</td>
        <td>작성일</td>
    </tr>
    <c:forEach var="kpu" items="${kpus}" varStatus="status">
        <tr>
            <td>
                <a href="/board/view/${kpu.department_id}/?board_id=${kpu.board_id}">${kpu.title}</a>
            </td>
            <td>${kpu.write_date}</td>
        </tr>
    </c:forEach>
</table><br /><br />

<h2>최신글</h2>
<table border="1">
    <tr>
        <td>게시판</td>
        <td>제목</td>
        <td>작성자</td>
        <td>작성일</td>
    </tr>
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
</table><br /><br />

<h2>핫게시글</h2>
<table border="1">
    <tr>
        <td>게시판</td>
        <td>제목</td>
        <td>작성자</td>
        <td>조회수</td>
        <td>추천수</td>

    </tr>
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
</table><br /><br />

</body>
</html>
