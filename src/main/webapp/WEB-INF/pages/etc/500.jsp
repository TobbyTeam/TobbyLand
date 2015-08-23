<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css">
	<title></title>
</head>
<body>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-2">
		</div>
		<div class="col-md-8">
			<br />
			<p align="center"><img src="<c:url value="/resources/image/error.png" />" /><br /></p>
			<h2 align="center">잘못된 접근입니다.</h2>
			<hr />
			<c:choose>
				<c:when test="${not empty message}">
					<h4 align="center">${message}</h4>
				</c:when>
				<c:otherwise>
					<h4 align="center">페이지가 없거나 오류가 발생하였습니다.</h4>
				</c:otherwise>
			</c:choose>
			<br />
			<br />
			<br />
			<br />
			<br />
			<div align="center">
				<button type="button" onclick="history.back()"  class="btn btn-default">이전 페이지</button>
				<a href="/main"><button type="submit" class="btn btn-default">메인 페이지</button></a>
			</div>
			<br />
		</div>
		<div class="col-md-2">
		</div>
	</div>
</div>
<br />
</body>
</html>

</body>
</html>