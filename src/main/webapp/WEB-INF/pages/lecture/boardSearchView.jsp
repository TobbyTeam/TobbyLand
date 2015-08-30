<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>

  <link rel="stylesheet" href="<c:url value="${ctx}/resources/css/boardlist.css" />">
  <link rel="stylesheet" href="<c:url value="${ctx}/resources/css/boardview.css" />">

  <script src="<c:url value="/resources/js/updownScroll.js" />"></script>

  <script src="<c:url value="${ctx}/resources/js/lecture_board.js" />"></script>
  <script src="<c:url value="${ctx}/resources/js/evaluation.js" />"></script>
  <script src="<c:url value="/resources/js/ajaxSesstion.js" />"></script>
  <script src="<c:url value="/resources/js/sessionTimeout.js" />"></script>

  <script src="<c:url value="${ctx}/resources/js/jquery.validate.min.js" />"></script>
  <script src="<c:url value="${ctx}/resources/js/lecture_validate.js" />"></script>

  <title>토비랜드</title>
</head>

<body>

<jsp:include page="/top" flush="true"/>

<jsp:include page="/lecture/evaluationTop?lecture_id=${lecture_id}" flush="true"/>

<c:set var="lb_id" value="${board.lb_id}" scope="page" />
<c:set var="lecture_id" value="${board.lecture_id}" scope="page" />

<div class="container">
  <div class="row">
    <div class="col-md-1">
    </div>
    <div class="col-md-10">
      <table class="table">
        <tr class="titleframe">
          <td width="5%">제목</td>
          <td width="50%"><span class="title">${board.title}</span></td>
          <td width="25%"></td>
          <td width="10%">작성일</td>
          <td width="10%">${board.write_date}</td>
        </tr>
        <tr class="titleframe">
          <td width="10%">작성자</td>
          <td width="45%">
            ${board.writer}
          </td>
          <td width="25%"></td>
          <td width="10%">조회수</td>
          <td width="10%">${board.hit}</td>
        </tr>
        <tr>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
        </tr>
      </table>
      ${board.contents}
      <br />
      <br />
      <br />
      <br />
      <br />
    </div>
    <div class="col-md-1">
    </div>
  </div>


  <div class="row">
    <div class="col-md-1">
    </div>
    <div class="col-md-10" align="center">
      <div class="col-xs-offset-8" align="right">
        <button id="boardMod_btn" class="btn btn-default littlebtn">수정</button>
        <button id="boardDel_btn" class="btn btn-default littlebtn">삭제</button>
        <button id="boardRep_btn" class="btn btn-danger littlebtn">신고</button>
      </div>
      <hr />
      <br />
    </div>
    <div class="col-md-1">
    </div>
  </div>

  <div class="row">
    <div class="col-md-1"></div>
    <div class="col-md-10">
      <br />
      <form id="reReg_frm" name="reReg_frm" method="post">
        <table class="col-md-12 table-condensed comment">
          <tr>
            <td width="20%"><input type="text" id="writer" name="writer" class="form-control"/></td>
            <td width="70%"><input type="text" id="contents" name="contents" class="form-control"/></td>
            <td width="10%" align="right"><input type="button" onclick="$(this.form).submit()" class="form-control" value="등록하기"/></td>
          </tr>
          <input type="hidden" id="lecture_id" name="lecture_id" value="${lecture_id}"/>
          <input type="hidden" id="lb_id" name="upper_id" value="${lb_id}" />
        </table>
      </form>

      <table class="col-md-12 table-striped table-condensed">
        <c:forEach var="reply" items="${replys}" varStatus="status">
          <tr class="reframe">
            <td width="15%" align="center">${reply.writer}</td>
            <td width="65%">${reply.contents}</td>
            <td width="10%" align="right" class="littlebtn">${reply.write_date}</td>
            <td width="5%" align="right" class="littlebtn"><button onclick="boardReDeleteAjax(${reply.lb_id})" class="btn btn-default littlebtn">삭제</button></td>
            <td width="5%" align="right" class="littlebtn"><button onclick="reReportAjax(${reply.lb_id})" class="btn btn-danger littlebtn">신고</button></td>
          </tr>
        </c:forEach>
      </table>

    </div>
    <div class="col-md-1"></div>
  </div>
  <br />

  <div class="row">
    <div class="col-md-1"></div>
    <div class="col-md-10">
      <table class="table table-striped">
        <thead>
        <tr>
          <th width="8%">번호</th>
          <th width="58%">제목</th>
          <th width="18%">작성자</th>
          <th width="8%">작성일</th>
          <th width="8%">조회수</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="board" items="${boards}" varStatus="status">
          <tr>
            <td>
              <c:choose>
                <c:when test="${board.lb_id eq lb_id}">
                  <strong>></strong>
                </c:when>
                <c:otherwise>
                  ${board.rnum}
                </c:otherwise>
              </c:choose>
            </td>
            <td>
              <a href="/lecture/boardView/${board.lecture_id}/?lb_id=${board.lb_id}&page=${paging.pageNo}&searchType=${search.searchType}&searchWord=${search.searchWord}" >${board.title}
                <c:if test="${board.count != 0}">
                  [${board.count}]
                </c:if>
              </a>
            </td>
            <td>${board.writer}</td>
            <td>${board.write_date}</td>
            <td >${board.hit}</td>
          </tr>
        </c:forEach>
        </tbody>
      </table>
      <div class="col-lg-0">
        <button type="button" onclick="location.href='/lecture/boardList/${lecture_id}/'" class="btn btn-default">전체목록</button>
        <button type="button" onclick="location.href='/lecture/boardRegForm?lecture_id=${lecture_id}'" class="btn btn-primary">글작성</button>
        <%--				<a href="/lecture/boardRegTest?lecture_id=${lecture_id}">테스트</a>--%>
      </div>
    </div>
    <div class="col-md-1"></div>
  </div>

  <%--페이징--%>
  <jsp:include page="/paging" flush="true">
    <jsp:param name="url" value="/lecture/boardList/${lecture_id}/?page=" />
    <jsp:param name="search" value="&searchType=${search.searchType}&searchWord=${search.searchWord}" />
    <jsp:param name="totalCount" value="${paging.totalCount}" />
    <jsp:param name="firstPageNo" value="${paging.firstPageNo}" />
    <jsp:param name="startPageNo" value="${paging.startPageNo}" />
    <jsp:param name="pageNo" value="${paging.pageNo}" />
    <jsp:param name="endPageNo" value="${paging.endPageNo}" />
    <jsp:param name="finalPageNo" value="${paging.finalPageNo}" />
  </jsp:include>

  <%--서치--%>
  <jsp:include page="/search" flush="true">
    <jsp:param name="url" value="/lecture/boardList/${lecture_id}/" />
    <jsp:param name="searchType" value="${search.searchType}" />
    <jsp:param name="searchWord" value="${search.searchWord}" />
  </jsp:include>

</div>

<jsp:include page="/bottom" flush="true"/>

</body>
</html>
