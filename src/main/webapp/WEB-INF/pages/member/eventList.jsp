<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css">

    <link rel="stylesheet" href="<c:url value="${ctx}/resources/css/leclist.css" />">

    <title>토비랜드</title>

</head>
<body>

<jsp:include page="/top" flush="true"/>

<div class="container">
    <div class="row">
        <div class="col-md-1"></div>
        <div class="col-md-10">
            <span id="boardname">이벤트 리스트</span>
            <hr />
            <table class="table table-striped">
                <thead>
                <tr>
                    <th width="25%">아이디</th>
                    <th width="30%">닉네임</th>
                    <th width="20%">강의평가수</th>
                    <th width="25%">4개작성일</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="member" items="${members}" varStatus="status">
                    <tr>
                        <td>${member.user_id}</td>
                        <td>${member.nickname}</td>
                        <td>${member.evaluation_count}</td>
                        <td>${member.eval_date}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <br />
        </div>
    </div>
</div>

<jsp:include page="/bottom" flush="true"/>

</body>
</html>
