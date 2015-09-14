<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>

  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>

  <link rel="stylesheet" href="<c:url value="${ctx}/resources/css/boardlist.css" />">
  <link rel="stylesheet" href="<c:url value="${ctx}/resources/css/boardview.css" />">
  <link rel="stylesheet" href="<c:url value="${ctx}/resources/css/textCut.css" />">

  <script src="<c:url value="/resources/js/updownScroll.js" />"></script>

  <script src="<c:url value="${ctx}/resources/js/lecture_board.js" />"></script>
  <script src="<c:url value="/resources/js/ajaxSesstion.js" />"></script>
  <script src="<c:url value="/resources/js/sessionTimeout.js" />"></script>

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
      <table class="table titleframe">
        <tr>
          <td width="8%" align="left" class="fixtable">제목</td>
          <td width="71%" align="left" class="fixtable"><span class="title">${board.title}</span></td>
          <td width="3%" align="left" class="fixtable"></td>
          <td width="16%" align="left" class="fixtable date" valign="middle">${board.write_date}</td>
        </tr>
        <tr>
          <td width="8%" class="fixtable">작성자</td>
          <td width="71%" class="fixtable">${board.writer}</td>
          <td width="3%" class="fixtable"></td>
          <td width="16%" class="fixtable">조회 ${board.hit}</td>
        </tr>
      </table>
      <br />
      <br />
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


      <table id="reply" class="col-md-12 table-striped table-condensed comment">
        <c:forEach var="reply" items="${replys}" varStatus="status">
          <tr class="reframe">
            <td width="15%" align="center">${reply.writer}</td>
            <td width="65%">${reply.contents}</td>
            <td width="10%" align="right" class="littlebtn">${reply.write_date}</td>
            <td width="5%" align="right" class="littlebtn"><button onclick="boardReDeleteAjax(${reply.lb_id})" class="btn btn-default littlebtn">삭제</button></td>
            <td width="5%" align="right" class="littlebtn"><button onclick="boardReReportAjax(${reply.lb_id})" class="btn btn-danger littlebtn">신고</button></td>
          </tr>
        </c:forEach>
      </table>

      <form id="reReg_frm" name="reReg_frm" method="post">
        <table class="col-md-12 table-condensed writecomment">
          <tr>
            <td width="15%" valign="top">
              <input type="text" id="writer" name="writer" class="form-control" />
            </td>
            <td width="80%" valign="top"><textarea id="contents" name="contents" rows="3" class="form-control"></textarea></td>
            <td width="5%" align="right" valign="top"><input type="button" id="reReg_btn" class="btn-block form-control" value="등록"/></td>
          </tr>
          <input type="hidden" id="lecture_id" name="lecture_id" value="${lecture_id}"/>
          <input type="hidden" id="lb_id" name="upper_id" value="${lb_id}" />
        </table>
      </form>

    </div>
    <div class="col-md-1"></div>
  </div>
  <br />

  <div class="row">
    <div class="col-md-1"></div>
    <div class="col-md-10">
      <hr />
      <table class="table table-hover" style="TABLE-layout:fixed">
      <thead>
        <tr>
          <th width="8%">번호</th>
          <th width="58%">제목</th>
          <th width="18%">작성자</th>
          <th width="9%">작성일</th>
          <th width="7%">조회수</th>
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
            <td width="58%" class="textCutE">
              <a href="/lecture/boardView/${board.lecture_id}/?lb_id=${board.lb_id}&page=${paging.pageNo}">${board.title}</a>
                <c:if test="${board.count != 0}">
                  [${board.count}]
                </c:if>
            </td>
            <td width="20%" class="textCutE">${board.writer}</td>
            <td>${board.write_date}</td>
            <td align="center">${board.hit}</td>
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

</div>

<%--페이징--%>
<jsp:include page="/paging" flush="true">
  <jsp:param name="url" value="/lecture/boardList/${lecture_id}/?page=" />
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
</jsp:include>

<jsp:include page="/bottom" flush="true"/>

</body>
</html>
