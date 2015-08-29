<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>

	<script src="<c:url value="/resources/js/ajaxSesstion.js" />"></script>
	<script src="<c:url value="/resources/js/sessionTimeout.js" />"></script>

	<title>토비랜드</title>
</head>

<script>

	function next(){
		window.open("/board/list/"+$("#department_id").val()+"/", "_self");
	}

</script>

<body onLoad="setTimeout('next()', 3000)">

<jsp:include page="/top" flush="true"/>

<jsp:include page="/board/top?department_id=${department_id}" flush="true"/>

<div class="container">
	<div class="row">
		<div class="col-md-2">
		</div>
		<div class="col-md-8">
			<br />
			<p align="center"><img src="<c:url value="/resources/image/error.png" />" /><br /></p>
					<h2 align="center">삭제된 글입니다.</h2>
					<hr />
					<h4 align="center">3초 후 해당 게시판으로 이동합니다.</h4>
			<br />
			<br />
			<br />
			<br />
			<br />
			<div align="center">
				<button type="button" onclick="history.back()"  class="btn btn-default">이전 페이지</button>
				<button type="submit" onclick="location.href='/main'" class="btn btn-default">메인 페이지</button>
			</div>
			<br />
		</div>
		<div class="col-md-2">
		</div>
	</div>
</div>
<br />

<input type="hidden" id="department_id" value="${department_id}"/>

<jsp:include page="/bottom" flush="true"/>

</body>
</html>

</body>
</html>