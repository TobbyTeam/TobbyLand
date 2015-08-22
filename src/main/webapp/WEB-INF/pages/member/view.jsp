<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>

    <link rel="stylesheet" href="<c:url value="${ctx}/resources/css/memberregister.css" />">

    <script src="<c:url value="${ctx}/resources/js/member.js" />"></script>

    <title>토비랜드</title>

</head>
<body>

<jsp:include page="/top" flush="true"/>

<div class="container-fluid">
    <div class="row">
        <div class="col-md-2">
        </div>
        <div class="col-md-8" id="rgframe">
            <br /><div class="form-group">
            <div align="right">
                <a href="/member/pwConfirm"><button type="button" class="btn btn-default" >정보변경</button></a>
                <a href="/member/pwChange"><button type="button" class="btn btn-default" >비밀번호변경</button></a>
                <a id="withdrawal" href=""><button type="button" class="btn btn-danger" >회원탈퇴</button></a>
            </div>
        </div>
            <h3>회원정보</h3>
            <hr />
            <form class="form-horizontal">
                <div class="form-group">
                    <label class="col-sm-3 control-label">
                        아이디
                    </label>
                    <div class="col-sm-3">
                        <input type="text" class="form-control" value="${member.user_id}" disabled/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label">
                        닉네임
                    </label>
                    <div class="col-sm-3">
                        <input type="text" class="form-control" value="${member.nickname}" disabled/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label">
                        이메일
                    </label>
                    <div class="col-sm-3">
                        <input type="text" class="form-control" value="${member.email}" disabled/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label">
                        작성한 강의평가 수
                    </label>
                    <div class="col-sm-3">
                        <input type="text" class="form-control" value="${member.evaluation_count}" disabled/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label">
                        가입일
                    </label>
                    <div class="col-sm-3">
                        <input type="text" class="form-control" value="${member.reg_date}" disabled/>
                    </div>
                </div>
                <br />
                <div class="form-group">
                    <label class="col-sm-3 control-label">
                        수업 방식
                    </label>
                    <div class="col-sm-3">
                    <c:forEach var="tendency" items="${tendencys}" varStatus="status" >
                            <c:if test="${tendency.tendency_id eq member.method}">
                                <input type="text" class="form-control" value="${tendency.tendency_title}" disabled/>
                            </c:if>
                        </c:forEach>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label">
                        과제 방식
                    </label>
                    <div class="col-sm-3">
                    <c:forEach var="tendency" items="${tendencys}" varStatus="status" >
                            <c:if test="${tendency.tendency_id eq member.task}">
                                <input type="text" class="form-control" value="${tendency.tendency_title}" disabled/>
                            </c:if>
                        </c:forEach>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label">
                        시험 방식
                    </label>
                    <div class="col-sm-3">
                    <c:forEach var="tendency" items="${tendencys}" varStatus="status" >
                            <c:if test="${tendency.tendency_id eq member.exam}">
                                <input type="text" class="form-control" value="${tendency.tendency_title}" disabled/>
                            </c:if>
                        </c:forEach>
                    </div>
                    <br />
                    <br />
                </div>

            </form>
            <br />
        </div>
        <div class="col-md-2">
        </div>
    </div>
</div>

<br /><br />


<jsp:include page="/bottom" flush="true"/>

</body>
</html>
