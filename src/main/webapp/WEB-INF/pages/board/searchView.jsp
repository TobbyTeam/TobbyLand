<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags" %>
<html>
<head>

  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>

  <link rel="stylesheet" href="<c:url value="${ctx}/resources/css/boardlist.css" />">
  <link rel="stylesheet" href="<c:url value="${ctx}/resources/css/boardview.css" />">
  <link rel="stylesheet" href="<c:url value="${ctx}/resources/css/textCut.css" />">

  <script src="<c:url value="/resources/js/board.js" />"></script>
  <script src="<c:url value="/resources/js/ajaxSesstion.js" />"></script>
  <script src="<c:url value="/resources/js/sessionTimeout.js" />"></script>
  <script src="<c:url value="/resources/js/nickname.js" />"></script>
  <script src="<c:url value="/resources/js/updownScroll.js" />"></script>

  <title>토비랜드</title>

</head>

<body>

<jsp:include page="/top" flush="true"/>

<jsp:include page="/board/top?department_id=${board.department_id}" flush="true"/>

<c:set var="board_id" value="${board.board_id}" scope="page" />
<c:set var="department_id" value="${board.department_id}" scope="page" />

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
          <td width="71%" class="fixtable">
            <c:choose>
              <c:when test="${board.is_anonymity ne 1}">
                <span class="title">*${board.writer}</span>
              </c:when>
              <c:otherwise>
                ${board.writer}
              </c:otherwise>
            </c:choose>
          </td>
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
      <s:authorize access="isAuthenticated()">
        <button id="like_btn" class="btn btn-primary"><span class="glyphicon glyphicon-thumbs-up"></span><br />추천<br /><span id="board_like">${board.likes}</span></button>
        <button id="dislike_btn"class="btn"><span class="glyphicon glyphicon-thumbs-down"></span><br />비추천<br /><span id="board_dislike">${board.dislike}</span></button>
      </s:authorize>
      <br />
      <br />
      <br />
      <div class="col-xs-offset-8" align="right">
        <s:authorize access="isAuthenticated()">
          <button id="mod_btn" class="btn btn-default littlebtn">수정</button>
          <button id="del_btn" class="btn btn-default littlebtn">삭제</button>
          <button id="report_btn" class="btn btn-danger littlebtn">신고</button>
        </s:authorize>
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
            <td width="15%" align="center">
              <c:choose>
                <c:when test="${reply.is_anonymity ne 1}">
                  <span class="title">${reply.writer}*</span>
                </c:when>
                <c:otherwise>
                  ${reply.writer}
                </c:otherwise>
              </c:choose>
            </td>
            <td width="65%">${reply.contents}</td>
            <s:authorize access="isAuthenticated()">
              <td width="10%" align="right" class="littlebtn">${reply.write_date}</td>
              <td width="5%" align="right" class="littlebtn"><button onclick="reDeleteAjax(${reply.board_id})" class="btn btn-default littlebtn">삭제</button></td>
              <td width="5%" align="right" class="littlebtn"> <button onclick="reReportAjax(${reply.board_id})" class="btn btn-danger littlebtn">신고</button></td>
            </s:authorize>
            <s:authorize access="isAnonymous()">
              <td width="9%" align="right"></td>
              <td width="10%" align="right" class="littlebtn">${reply.write_date}</td>
              <td width="1%" align="right"></td>
            </s:authorize>
          </tr>
        </c:forEach>
      </table>

      <s:authorize access="isAuthenticated()">

        <form id="reReg_frm" name="reReg_frm" method="post">
          <table class="col-md-12 table-condensed writecomment">
            <tr>
              <td width="15%" valign="top">
                <input type="text" id="writer" name="writer" class="form-control" disabled="disabled" />
                <input type="checkbox" id="is_anonymity" name="is_anonymity" value="1" onclick="check(this.form)"/>
                <span class="littlebtn">익명으로 달기</span>
              </td>
              <td width="80%" valign="top"><textarea id="contents" name="contents" class="form-control"></textarea></td>
              <td width="5%" align="right" valign="top"><input type="button" id="reReg_btn" class="btn-block form-control" value="등록"/></td>
            </tr>
            <input type="hidden" id="department_id" name="department_id" value="${department_id}"/>
            <input type="hidden" id="board_id" name="upper_id" value="${board_id}" />
          </table>
        </form>

      </s:authorize>

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
          <th width="53%">제목</th>
          <th width="15%">작성자</th>
          <th width="10%">작성일</th>
          <th width="7%">조회수</th>
          <th width="7%">추천수</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="board" items="${boards}" varStatus="status">
          <tr>
            <td>
              <c:choose>
                <c:when test="${board.board_id eq board_id}">
                  <strong>></strong>
                </c:when>
                <c:otherwise>
                  ${board.rnum}
                </c:otherwise>
              </c:choose>
            </td>
            <td width="53%" class="textCutE">
            <a href="/board/view/${board.department_id}/?board_id=${board.board_id}&page=${paging.pageNo}&searchType=${search.searchType}&searchWord=${search.searchWord}">${board.title}</a>
              <c:if test="${board.count != 0}">
                [${board.count}]
              </c:if>
            </td>
            <td width="15%" class="textCutE">
            <c:choose>
                <c:when test="${board.is_anonymity ne 1}">
                  <span class="title">*${board.writer}</span>
                </c:when>
                <c:otherwise>
                  ${board.writer}
                </c:otherwise>
              </c:choose>
            </td>
            <td>${board.write_date}</td>
            <td align="center">${board.hit}</td>
            <td align="center">${board.likes}</td>
          </tr>
        </c:forEach>
        </tbody>
      </table>
      <div class="col-lg-0">
        <button type="button" onclick="location.href='/board/list/${department_id}/'" class="btn btn-default">전체목록</button>
        <s:authorize access="isAuthenticated()">
          <c:choose>
            <c:when test="${department.kind eq 'notice'}">
              <s:authorize access="hasRole('ROLE_ADMIN')">
                <button type="button" onclick="location.href='/board/regForm?department_id=${department_id}'" class="btn btn-primary">글작성</button>
              </s:authorize>
            </c:when>
            <c:otherwise>
              <button type="button" onclick="location.href='/board/regForm?department_id=${department_id}'" class="btn btn-primary">글작성</button>
            </c:otherwise>
          </c:choose>
        </s:authorize>
      </div>
    </div>
    <div class="col-md-1"></div>
  </div>

</div>

<%--페이징--%>
<jsp:include page="/paging" flush="true">
  <jsp:param name="url" value="/board/list/${board.department_id}/?page=" />
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
  <jsp:param name="url" value="/board/list/${department_id}/" />
  <jsp:param name="searchType" value="${search.searchType}" />
  <jsp:param name="searchWord" value="${search.searchWord}" />
</jsp:include>

<jsp:include page="/bottom" flush="true"/>

</body>
</html>
