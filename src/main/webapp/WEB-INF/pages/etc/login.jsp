<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
	<%-- css경로	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">	--%>

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>

	<link rel="stylesheet" href="<c:url value="${ctx}/resources/css/login.css" />">
	<script src="<c:url value="${ctx}/resources/js/member.js" />"></script>

	<title>토비랜드</title>

</head>

<body onload='document.loginfrm.loginid.focus();'>

<jsp:include page="/top" flush="true"/>

<div class="container">
	<div class="row" id="pwd-container">
		<div class="col-md-4"></div>
		<div class="col-md-4">
			<section class="frame" id="id">
				<form role="login" id="loginfrm" name="loginfrm" action="<c:url value='${ctx}/j_spring_security_check'/>" method='POST'>
					<input type="text" id="loginid" name="loginid" value="${loginid}" placeholder="ID" class="form-control input-lg">
					<input type="password" id="loginpwd" name="loginpwd" value="${loginpwd}" placeholder="Password" class="form-control input-lg">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
					<input type="hidden" name="loginRedirect" value="${loginRedirect}" />
					<button type="button" id="loginbtn" name="login" class="btn btn-lg btn-primary btn-block">로그인</button>
					      				<c:if test="${not empty securityexceptionmsg}">
					<div>
						<font color="red">
			                <p>로그인에 실패했습니다. 다시 시도 해주세요.</p>
			                <p>${securityexceptionmsg}</p>
						</font>
					</div>
				</c:if>
					<div>
						<p><a href="/member/regForm">회원가입</a></p>
						<p><a href="/member/searchForm">아이디/비밀번호 찾기</a></p>
					</div>

				</form>
			</section>
		</div>
	</div>
</div>

<jsp:include page="/bottom" flush="true"/>

</body>

</html>
