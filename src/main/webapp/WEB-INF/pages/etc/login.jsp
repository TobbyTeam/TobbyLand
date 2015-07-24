<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags" %>

<html>
<head>
<%-- css경로	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">	--%>

	<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>

<script type="text/javascript">
	$(document).ready(function (){

		$("#loginbtn").click(function(){
			if($("#loginid").val() == ""){
				alert("로그인 아이디를 입력해주세요");
				$("#loginid").focus();
			}else if($("#loginpwd").val() == ""){
				alert("로그인 비밀번호를 입력해주세요");
				$("#loginpwd").focus();
			}else{
				$("#loginfrm").attr("action", "<c:url value='${pageContext.request.contextPath}/j_spring_security_check' />");
				$("#loginfrm").submit();
			}
		});

	});
</script>   

<title>Login Page</title>
<style>
.error {
	padding: 15px;
	margin-bottom: 20px;
	border: 1px solid transparent;
	border-radius: 4px;
	color: #a94442;
	background-color: #f2dede;
	border-color: #ebccd1;
}

.msg {
	padding: 15px;
	margin-bottom: 20px;
	border: 1px solid transparent;
	border-radius: 4px;
	color: #31708f;
	background-color: #d9edf7;
	border-color: #bce8f1;
}

#login-box {
	width: 300px;
	padding: 20px;
	margin: 100px auto;
	background: #fff;
	-webkit-border-radius: 2px;
	-moz-border-radius: 2px;
	border: 1px solid #000;
}
</style>



</head>
<body onload='document.loginfrm.loginid.focus();'>

	<jsp:include page="/top" flush="true"/>

	<br /><br />

	<img src="/resources/image/mainlogo.png"/>

	<div id="login-box">

		<h3>Login with Username and loginpwd</h3>

		<form id="loginfrm" name="loginfrm" action="<c:url value='${pageContext.request.contextPath}/j_spring_security_check'/>" method='POST'>

			<table>
				<tr>
					<td>아이디</td>
					<td><input type="text" id="loginid" name="loginid" value="${loginid}" /></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" id="loginpwd" name="loginpwd" value="${loginpwd}" /></td>
				</tr>
				<tr>
					<td colspan='2'><input type="button" id="loginbtn" name="loginbtn" value="로그인" /></td>
				</tr>
		        <c:if test="${not empty securityexceptionmsg}">
		        <tr>
		            <td colspan="2">
		                <font color="red">
		                <p>로그인에 실패했습니다. 다시 시도 해주세요.</p>
		                <p>${securityexceptionmsg}</p>
		                </font>
		            </td>
		        </tr>
		        </c:if>
			</table>

			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

			<input type="hidden" name="loginRedirect" value="${loginRedirect}" />

		</form>

		<a href="/member/regForm">sign up</a>
	</div>

</body>
</html>
