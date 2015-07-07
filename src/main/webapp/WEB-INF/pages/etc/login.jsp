<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
<%-- css경로	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">	--%>

<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js" charset="utf-8"></script>

<script type="text/javascript">
	$(document).ready(function (){

		$("#loginbtn").click(function(){
			if($("#member_id").val() == ""){
				alert("로그인 아이디를 입력해주세요");
				$("#member_id").focus();
			}else if($("#password").val() == ""){
				alert("로그인 비밀번호를 입력해주세요");
				$("#password").focus();
			}else{
				$("#loginfrm").attr("action", "<c:url value='/j_spring_security_check' />");
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
<body onload='document.loginfrm.member_id.focus();'>

	<img src="/resources/image/mainlogo.png"/>

	<div id="login-box">

		<h3>Login with Username and Password</h3>

<%--		<c:if test="${not empty error}">
			<div class="error">${error}</div>
		</c:if>
		<c:if test="${not empty msg}">
			<div class="msg">${msg}</div>
		</c:if>--%>

		<form id="loginfrm" name="loginfrm" action="<c:url value='/j_spring_security_check' />" method='POST'>

			<table>
				<tr>
					<td>아이디</td>
					<td><input type="text" id="member_id" name="member_id" value="${member_id}"></td>
				</tr>
				<tr>
					<td>Password:</td>
					<td><input type="password" id="password" name="password" /></td>
				</tr>
				<tr>
					<td colspan='2'><input type="button" id="loginbtn" name="loginbtn" value="로그인" /></td>
				</tr>
		        <c:if test="${not empty param.fail}">
		        <tr>
		            <td colspan="2">
		                <font color="red">
		                <p>Your login attempt was not successful, try again.</p>
		                <p>Reason: ${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}</p>
		                </font>
		                <c:remove scope="session" var="SPRING_SECURITY_LAST_EXCEPTION"/>
		            </td>
		        </tr>
		        </c:if>
			</table>

			<input type="hidden" name="${_csrf.parameterName}"
				   value="${_csrf.token}" />

		</form>

		<a href="/member/regForm">sign up</a>
	</div>

</body>
</html>
