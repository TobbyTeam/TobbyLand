<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="s" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>

    <script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
    <script src="<c:url value="/resources/js/jquery.validate.min.js" />"></script>
    <script src="<c:url value="/resources/js/lecture_validate.js" />"></script>

    <title></title>
</head>
<body>

    <jsp:include page="/top" flush="true"/> <br />

    <form id="reg_board_frm" name="reg_board_frm" method="post">

      제목:
        <input type="text" id="title" name="title"/><br/>

      내용:<br/>
        <textarea name="contents" rows="20" cols="40" wrap="hard" placeholder="내용을 입력해주세요"></textarea><br/>

        <input type="hidden" id="lecture_id" name="lecture_id" value="${lecture_id}"/>
        <input type="button" value="작성" onclick="$(this.form).submit()"/>&nbsp;&nbsp;&nbsp;
        <input type="reset" value="취소" onclick="history.back()"/>
    </form>

</body>
</html>
