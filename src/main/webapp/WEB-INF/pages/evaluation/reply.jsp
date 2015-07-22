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
        <td>신고수</td>
        <td>삭제</td>
    </tr>
    <c:forEach var="reply" items="${replys}" varStatus="status">
        <tr>
            <td>${reply.comment}</td>
            <td>${reply.write_date}</td>
            <td><input type="button" value="신고(${reply.report})" onclick="evalReportAjax(${reply.evaluation_id})"></td>
            <td><input type="button" value="삭제" onclick="reDeleteAjax(${reply.evaluation_id})"></td>
        </tr>
    </c:forEach>
</table>

<form id="re_frm">

    내용: <br />

    <textarea name="comment" id="re_con" rows="3" cols="40" wrap="hard" placeholder="내용을 입력해주세요"></textarea><br/>
    <input type="hidden" name="lecture_id" value="${lecture_id}"/>
    <input type="hidden" name="upper_id" value="${evaluation_id}"/>
    <input type="button" id="reReg_btn" value="등록">

</form>

<script>
    $("#reReg_btn").click(function(){

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
