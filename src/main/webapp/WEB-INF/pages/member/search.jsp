<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>

    <script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
    <script src="<c:url value="/resources/js/member.js" />"></script>
</head>
<body>

<h2>아이디/비밀번호 찾기</h2> <br />

회원가입시 입력한 KPU 메일 주소를 입력해주세요. <br />

이메일:<input type="text" id="email" name="email"/><br>
<input type="button" id ="research_btn" value="이메일 보내기"/>&nbsp;&nbsp;&nbsp; <input type="reset" value="취소" onclick="history.back()"/>

</body>
</html>
