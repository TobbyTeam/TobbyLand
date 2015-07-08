<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <script src="//code.jquery.com/jquery-1.11.3.min.js"></script>

    <title></title>
</head>
<body>

<table border="1">
    <tr>
        <td>내용</td>
    </tr>
    <c:forEach var="reply" items="${replys}" varStatus="status">
        <tr>
            <td>${reply.contents}</td>
        </tr>
    </c:forEach>
</table>

<form action="/evaluation/replyReg" method="post">

    내용: <input type="text" name="contents"><br/>
    <input type="hidden" name="evaluation_id" value="${evaluation_id}"/>
    <input type="submit" value="등록">

</form>



</body>
</html>
