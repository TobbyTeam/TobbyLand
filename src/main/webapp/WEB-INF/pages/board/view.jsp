<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

  <script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
  <script src="<c:url value="/resources/js/board.js" />"></script>

  <title></title>
</head>
<body>

<jsp:include page="/top" flush="true"/>

<br /><br />

  제목 : <text>${board.title}</text> <br /> &nbsp; 조회수 : <text>${board.hit}</text>
  작성자 :
    <text>${board.writer}
      <c:if test="${board.is_anonymity == 1}">
        (익명)
      </c:if>
    </text>&nbsp;
  작성일 : <text>${board.write_date}</text>
  <br />
  <br />

  <textarea name="contents" rows="20" cols="50" wrap="hard" readonly="readonly">${board.contents}</textarea><br/>

  <br/>

  <input type="hidden" id="board_id" value="${board.board_id}" />
  <input type="hidden" id="department_id" value="${board.department_id}" />

  <input type="button" id="mod_btn" value="수정" /> &nbsp;&nbsp;
  <input type="button" id="del_btn" value="삭제" /> &nbsp;&nbsp;
  <input type="button" id="like_btn" value="추천(${board.likes})" /> &nbsp;&nbsp;
  <input type="button" id="dislike_btn" value="비추천(${board.dislike})" /> &nbsp;&nbsp;
  <input type="button" id="report_btn" value="신고(${board.report})" /> &nbsp;&nbsp;

  <br /><br />

  --------------------------------------------------------<br />

  <c:forEach var="reply" items="${replys}" varStatus="status">

    ${reply.writer}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <input type="button" value="삭제" onclick="reDeleteAjax(${reply.board_id})"> &nbsp;&nbsp;
    <input type="button" value="신고(${reply.report})" onclick="reReportAjax(${reply.board_id})">
    <br />
    ${reply.write_date}
    <br />
    <textarea name="contents" rows="3" cols="50" readonly="readonly">${reply.contents}</textarea><br/><br/>
  </c:forEach>

  <br />

  --------------------------------------------------------<br />

  <form id="re_frm" method="post">

    댓글입력 <br />

    <textarea name="contents" id="re_con" rows="3" cols="50" wrap="hard" placeholder="내용을 입력해주세요"></textarea><br/>

    <input type="hidden" name="department_id" value="${board.department_id}"/>
    <input type="hidden" name="upper_id" value="${board.board_id}" />
    <input type="button" id="reReg_btn" value="등록">

  </form>

<br /><br />


<table border="1">
  <tr>
    <td>글번호</td>
    <td>제목</td>
    <td>작성자</td>
    <td>작성일</td>
    <td>조회수</td>
    <td>추천수</td>
  </tr>
  <c:forEach var="board" items="${boards}" varStatus="status">
    <tr>
      <td>${board.rnum}</td>
      <td>
        <a href="/board/view/${board.department_id}/?board_id=${board.board_id}&page=${paging.pageNo}">${board.title}
          <c:if test="${board.count != 0}">
            [${board.count}]
          </c:if>
        </a>
      </td>
      <td>${board.writer}
        <c:if test="${board.is_anonymity == 1}">
          (익명)
        </c:if>
      </td>
      <td>${board.write_date}</td>
      <td>${board.hit}</td>
      <td>${board.likes}</td>
    </tr>
  </c:forEach>
</table><br /><br />

<a href="/board/list/${department_id}/">전체목록</a>&nbsp;&nbsp;<a href="/board/regForm?department_id=${department_id}">글작성</a> &nbsp;&nbsp;

<br /><br />

<jsp:include page="/paging" flush="true">
  <jsp:param name="url" value="/board/list/${department_id}/?page=" />
  <jsp:param name="totalCount" value="${paging.totalCount}" />
  <jsp:param name="firstPageNo" value="${paging.firstPageNo}" />
  <jsp:param name="prevPageNo" value="${paging.prevPageNo}" />
  <jsp:param name="startPageNo" value="${paging.startPageNo}" />
  <jsp:param name="pageNo" value="${paging.pageNo}" />
  <jsp:param name="endPageNo" value="${paging.endPageNo}" />
  <jsp:param name="nextPageNo" value="${paging.nextPageNo}" />
  <jsp:param name="finalPageNo" value="${paging.finalPageNo}" />
</jsp:include>

<form action="/board/list/${department_id}/" method="get" name="search_frm">

  <select name="searchType">
    <option value="title" selected="selected">제목</option>
    <option value="contents">내용</option>
    <option value="title_contents">제목+내용</option>
    <option value="writer">글쓴이</option>
    <option value="all">전체</option>
  </select>

  <input type="text" name="searchWord">
  <input type="button" value="검색" onclick="search()">

</form>

현재 페이지 : <c:out value="${paging.pageNo}"/><br />
전체게시글수 : <c:out value="${paging.totalCount}"/><br />
전체시작페이지 : <c:out value="${paging.firstPageNo}"/><br />
페이징시작페이지 : <c:out value="${paging.startPageNo}"/><br />
페이징끝페이지 : <c:out value="${paging.endPageNo}"/><br />
전체끝페이지 : <c:out value="${paging.finalPageNo}"/><br />

</body>
</html>
