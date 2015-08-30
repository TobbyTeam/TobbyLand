<%@ taglib uri="http://www.springframework.org/security/tags" prefix="s" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>

    <link rel="stylesheet" href="<c:url value="${ctx}/resources/css/evlregister.css" />">

    <script src="<c:url value="/resources/js/updownScroll.js" />"></script>

    <script src="<c:url value="/resources/js/jquery.validate.min.js" />"></script>
    <script src="<c:url value="/resources/js/evaluation_validate.js" />"></script>
    <script src="<c:url value="/resources/js/ajaxSesstion.js" />"></script>
    <script src="<c:url value="/resources/js/sessionTimeout.js" />"></script>

    <title>토비랜드</title>

</head>

<body>

<jsp:include page="/top" flush="true"/>

<jsp:include page="/lecture/evaluationTop?lecture_id=${lecture_id}" flush="true"/>

<br />

<div class="container">
    <div class="row">
        <div class="col-md-2">
        </div>
        <div class="col-md-8 rgframe">
            <br />
            <h3>과목명</h3>
            <hr />
            <form id="mod_frm" method="post" class="form-horizontal">
                <div class="form-group">
                    <label class="col-sm-2 control-label">
                        수강학기
                    </label>
                    <div class="col-sm-2">
                        <select type="text" name="semester" class="form-control">
                            <c:forEach var="semester" items="${semesters}" varStatus="status">
                                <c:choose>
                                    <c:when test="${semester.semester_id eq evaluation.semester}">
                                        <option value="${semester.semester_id}" selected="selected">${semester.semester_title}</option>
                                    </c:when>
                                    <c:otherwise>
                                        <option value="${semester.semester_id}">${semester.semester_title}</option>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">
                        수업
                    </label>
                    <div class="col-sm-9">
                        <input type="text" name="method" value="${evaluation.method}" class="form-control"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">
                        과제
                    </label>
                    <div class="col-sm-9">
                        <input type="text" name="task" value="${evaluation.task}" class="form-control"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">
                        시험
                    </label>
                    <div class="col-sm-9">
                        <input type="text" name="exam" value="${evaluation.exam}" class="form-control"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">
                        총평
                    </label>
                    <div class="col-sm-9">
                        <textarea name="comment" class="form-control" rows="5">${evaluation.comment}</textarea>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">
                        평점
                    </label>
                    <div class="col-sm-2">
                        <select type="text" name="score" class="form-control">
                            <c:choose>
                                <c:when test="${evaluation.score eq 2}">
                                    <option value="2" selected="selected">★</option>
                                    <option value="4">★★</option>
                                    <option value="6">★★★</option>
                                    <option value="8">★★★★</option>
                                    <option value="10">★★★★★</option>
                                </c:when>
                                <c:when test="${evaluation.score eq 4}">
                                    <option value="2">★</option>
                                    <option value="4" selected="selected">★★</option>
                                    <option value="6">★★★</option>
                                    <option value="8">★★★★</option>
                                    <option value="10">★★★★★</option>
                                </c:when>
                                <c:when test="${evaluation.score eq 6}">
                                    <option value="2">★</option>
                                    <option value="4">★★</option>
                                    <option value="6" selected="selected">★★★</option>
                                    <option value="8">★★★★</option>
                                    <option value="10">★★★★★</option>
                                </c:when>
                                <c:when test="${evaluation.score eq 8}">
                                    <option value="2">★</option>
                                    <option value="4">★★</option>
                                    <option value="6">★★★</option>
                                    <option value="8" selected="selected">★★★★</option>
                                    <option value="10">★★★★★</option>
                                </c:when>
                                <c:otherwise>
                                    <option value="2">★</option>
                                    <option value="4">★★</option>
                                    <option value="6">★★★</option>
                                    <option value="8">★★★★</option>
                                    <option value="10" selected="selected">★★★★★</option>
                                </c:otherwise>
                            </c:choose>

                        </select>
                    </div>
                </div>

                <input type="hidden" name="evaluation_id" id="evaluation_id" value="${evaluation.evaluation_id}">
                <input type="hidden" id="lecture_id" name="lecture_id" value="${evaluation.lecture_id}">

                <div class="form-group">
                    <div align="center">
                        <button type="submit" class="btn btn-success">등록</button>
                        <button type="reset" onclick="history.back()" class="btn btn-default">취소</button>
                    </div>
                </div>
            </form>
            <br />
        </div>
        <div class="col-md-2">
        </div>
    </div>
</div>

<br />
<br />

<jsp:include page="/bottom" flush="true"/>

</body>

</html>
