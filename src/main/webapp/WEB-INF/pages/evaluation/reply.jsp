<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
    <script src="<c:url value="/resources/js/evaluation.js" />"></script>

    <title></title>
</head>
<body>

<table border="1">
    <tr>
        <td>내용</td>
        <td>작성일</td>
        <td>삭제</td>
    </tr>
    <c:forEach var="reply" items="${replys}" varStatus="status">
        <tr>
            <td>${reply.contents}</td>
            <td>${reply.write_date}</td>
            <td><input type="button" value="삭제" onclick="reDeleteAjax(${reply.es_id})"></td>
        </tr>
    </c:forEach>
</table>

<form id="re_frm" method="post">

    내용: <input type="text" id="re_con" name="contents"><br/>
    <input type="hidden" name="evaluation_id" value="${evaluation_id}"/>
    <input type="button" id="re_btn" value="등록">

</form>

<script>
    $("#re_btn").click(function(){

        if($("#re_con").val().length===0){
            alert("내용을 입력해주세요");
            $("#re_con").focus();
        } else {

            $.ajax({
                type: "POST",
                url: "/evaluation/replyReg",
                data: $("#re_frm").serialize(),
                dataType: "json",
                success: function (result) {
                    if (result) {
                        location.reload();
                    } else {
                        alert("죄송합니다 다시 시도해주세요.")
                    }
                }
            });

        }

    })
</script>


</body>
</html>
