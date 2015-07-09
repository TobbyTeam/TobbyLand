<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags" %>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ page import="org.springframework.security.core.Authentication" %>
<%@ page import="kr.ac.kpu.ebiz.spring.tobbyproject.security.MemberInfo" %>
<html>
<head>
    <title></title>
    <script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
    <script src="<c:url value="/resources/js/lecture.js" />"></script>
</head>
<body>

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

    </s:authorize>

<br /><br />

<form action="/lecture/search" method="get" name="search_frm">

    검색
    <select name="searchType">
        <option value="lecture_name">강의명</option>
        <option value="dept">학과명</option>
        <option value="prof">교수명</option>
    </select>

    <input type="text" name="searchWord">
    <input type="button" value="검색" onclick="searchLecture()">

</form>

<br/><br/>

<a href="${pageContext.request.contextPath}/j_spring_security_logout">Log Out</a> <br/><br/>

<br/>
<a href="/lecture/list">강의생성게시판</a><br/><br/>
<a href="/member/view">회원정보</a><br/>

<s:authorize access="hasRole('ROLE_ADMIN')">
<a href="/admin/lecture/list">강의관리</a><br/><br/>
</s:authorize>

<s:authorize access="hasRole('ROLE_ADMIN')">
    <a href="/admin/evaluation/reportList">강의평가관리</a><br/><br/>
</s:authorize>


USER ID : <s:authentication property="name"/><br/>
</body>
</html>