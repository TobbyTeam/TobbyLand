<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="s" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>

    <script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
    <script src="<c:url value="/resources/js/jquery.validate.min.js" />"></script>
    <script src="<c:url value="/resources/js/board_validate.js" />"></script>

    <title></title>



</head>
<body>

<jsp:include page="/top" flush="true"/>

<br /><br />

    <form id="reg_frm" name="reg_frm" method="post">

      익명으로 작성 <input type="checkbox" id="anonymity" name="is_anonymity" value="1"><br/>

      제목:
        <input type="text" id="title" name="title"/><br/>

      내용:<br/>
        <textarea name="contents" rows="20" cols="40" wrap="hard" placeholder="내용을 입력해주세요"></textarea><br/>

        <input type="hidden" id="department_id" name="department_id" value="${department_id}"/>
        <input type="button" value="작성" onclick="$(this.form).submit()"/>&nbsp;&nbsp;&nbsp;
        <input type="reset" value="취소" onclick="history.back()"/>
    </form>

<script>

    $("#anonymity").click(function(){

        var ischecked = $(this).is(":checked");

        if(ischecked){
            $('#anonymity').after('<br id="ss"/><text id="nickname">닉네임:<text><input type="text" name="writer" id="writer"/>');
        }else{
            $('#ss').remove();
            $('#writer').remove();
            $('#nickname').remove();
        }

    })

</script>


</body>
</html>
