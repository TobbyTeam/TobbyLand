<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>

    <link rel="stylesheet" href="<c:url value="${ctx}/resources/css/memberregister.css" />">

    <script src="<c:url value="${ctx}/resources/js/jquery.validate.min.js" />"></script>
    <script src="<c:url value="${ctx}/resources/js/member_validate.js" />"></script>

    <title>토비랜드</title>

</head>

<body>

<jsp:include page="/top" flush="true"/>

<div class="container-fluid">
    <div class="row">
        <div class="col-md-2">
        </div>
        <div class="col-md-8 rgframe">
            <br />
            <h3>기본입력사항</h3>
            <hr />
            <form id="reg_frm" name="reg_frm" class="form-horizontal">
                <div class="form-group">
                    <label class="col-sm-3 control-label">
                        아이디
                    </label>
                    <div class="col-sm-3">
                        <input type="text" id="user_id" name="user_id" class="form-control"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label">
                        비밀번호
                    </label>
                    <div class="col-sm-3">
                        <input type="password" id = "password" name="password" class="form-control"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label">
                        비밀번호확인
                    </label>
                    <div class="col-sm-3">
                        <input type="password" id = "password_check" name="password_check" class="form-control"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label">
                        닉네임
                    </label>
                    <div class="col-sm-3">
                        <input type="text" id= "nickname" name="nickname" class="form-control"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label">
                        이메일
                    </label>
                    <div class="col-sm-5">
                        <input type="text" id="email" name="email" class="form-control"/>
                    </div>
                </div>
                <br />
                <h3>선호방식</h3>
                <hr />
                <div class="form-group">
                    <label class="col-sm-3 control-label">
                        수업 방식
                    </label>

                    <c:forEach var="tendency" items="${tendencys}" varStatus="status" begin="0" end="2">
                        <c:choose>
                            <c:when test="${tendency.tendency_id eq 1}">
                                <label class="col-sm-2 control-label">
                                        ${tendency.tendency_title}<input type="radio" name="method" value="${tendency.tendency_id}" checked>
                                </label>
                            </c:when>
                            <c:otherwise>
                                <label class="col-sm-2 control-label">
                                        ${tendency.tendency_title}<input type="radio" name="method" value="${tendency.tendency_id}">
                                </label>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label">
                        과제 방식
                    </label>
                    <c:forEach var="tendency" items="${tendencys}" varStatus="status" begin="3" end="5">
                        <c:choose>
                            <c:when test="${tendency.tendency_id eq 4}">
                                <label class="col-sm-2 control-label">
                                        ${tendency.tendency_title}<input type="radio" name="task" value="${tendency.tendency_id}" checked>
                                </label>
                            </c:when>
                            <c:otherwise>
                                <label class="col-sm-2 control-label">
                                        ${tendency.tendency_title}<input type="radio" name="task" value="${tendency.tendency_id}">
                                </label>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label">
                        시험 방식
                    </label>
                    <c:forEach var="tendency" items="${tendencys}" varStatus="status" begin="6" end="9">
                        <c:choose>
                            <c:when test="${tendency.tendency_id eq 7}">
                                <label class="col-sm-2 control-label">
                                        ${tendency.tendency_title}<input type="radio" name="exam" value="${tendency.tendency_id}" checked>
                                </label>
                            </c:when>
                            <c:otherwise>
                                <label class="col-sm-2 control-label">
                                        ${tendency.tendency_title}<input type="radio" name="exam" value="${tendency.tendency_id}" >
                                </label>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                    <br />
                    <br />
                </div>
                <div class="form-group">
                    <div align="center">
                        <button type="button" onclick="$(this.form).submit()" class="btn btn-primary">회원가입</button>
                        <button type="reset" onclick="history.back()" class="btn btn-default">취소</button>
                    </div>
                </div>
            </form>
            <br />
            <a href="http://mail.kpu.ac.kr/login" target="_blank">kpu메일</a>
        </div>
    </div>
</div>
<br />
<br />
<jsp:include page="/bottom" flush="true"/>
</body>
</html>

