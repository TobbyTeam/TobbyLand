<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>

	<script src="<c:url value="/resources/js/updownScroll.js" />"></script>

	<link rel="stylesheet" href="<c:url value="${ctx}/resources/css/explanation.css" />">

	<title>토비랜드</title>

</head>

<body>

<c:if test="${not empty refresh}">
	<% response.setHeader("Refresh","3;URL=/login");%>
</c:if>

<jsp:include page="/top" flush="true"/>

<div class="container">
	<div class="row">
		<div class="col-md-2">
		</div>
		<div class="col-md-8">
			<br />
			<p align="center"><img src="<c:url value="/resources/image/check.png" />" /></p>
			<br />
			<h2 align="center">${message1}</h2>
			<hr />

			<c:choose>
				<c:when test="${empty message3}">
					<h4 align="center">${message2}</h4>
				</c:when>
				<c:otherwise>
					<h4 align="center" class="warn">${message3}</h4>
					<br />
					<h4 align="center">${message2}</h4>
				</c:otherwise>
			</c:choose>
			<br />
			<p align="center"><a href="http://mail.kpu.ac.kr/login" target="_blank">KPU 메일 확인하기</a></p>
			<p align="center"><a href="/login">로그인 페이지</a></p>
		</div>
		<div class="col-md-2">
		</div>
	</div>
</div>

<jsp:include page="/bottom" flush="true"/>

</body>
</html>
