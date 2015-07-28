<%@ page import="kr.ac.kpu.ebiz.spring.tobbyproject.security.MemberInfo" %>
<%@ page import="org.springframework.security.core.Authentication" %>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>
<form action="/test1" method="post">
테스트 : <input type="text" name="test"/>
  <input type="submit" value="전송"/>


윈도우 로케이션
    <input type="reset" value="취소" onclick="javascript:window.location='/login'">


admin 이전 페이지
    <a href="#" onClick="history.go(-2);">이전페이지로</a>


관리자
<s:authorize access="hasRole('ROLE_ADMIN')">
    <a href="/admin/lecture/list">강의관리</a><br/><br/>
</s:authorize>

<s:authorize access="hasRole('ROLE_ADMIN')">
    <a href="/admin/evaluation/reportList">강의평가관리</a><br/><br/>
</s:authorize>


메인에 있던거
    <%
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();

        Object principal = auth.getPrincipal();
        String nickname = "";
        if(principal != null && principal instanceof MemberInfo){
            nickname = ((MemberInfo)principal).getNickname();
        }
    %>

    <s:authorize access="isAuthenticated()">

    <%=nickname%>님 반갑습니다
 
    <a href="${ctx}/j_spring_security_logout">로그아웃</a>

    <a href="${pageContext.request.contextPath}/j_spring_security_logout">Log Out</a> <br/><br/>

    </s:authorize>

    MEMBER_ID : <s:authentication property="name"/><br/>

</form>
</body>
</html>
