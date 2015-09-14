<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="s" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>

  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>

  <link rel="stylesheet" href="<c:url value="${ctx}/resources/css/boardregister.css" />">

  <script src="<c:url value="/resources/js/updownScroll.js" />"></script>

  <script src="<c:url value="/resources/js/ajaxSesstion.js" />"></script>
  <script src="<c:url value="/resources/js/sessionTimeout.js" />"></script>

  <script src="<c:url value="/resources/js/htmlRemove.js" />"></script>
  <script src="<c:url value="/resources/editor/js/HuskyEZCreator.js" />"></script>
  <script src="<c:url value="/resources/js/editor.js" />"></script>

  <script src="<c:url value="${ctx}/resources/js/jquery.blockUI.js" />"></script>
  <script src="<c:url value="${ctx}/resources/js/blockUI.js" />"></script>

  <title>토비랜드</title>

</head>
<body>

<jsp:include page="/top" flush="true"/>

<jsp:include page="/board/top?department_id=${board.department_id}" flush="true"/>

<div class="container">
  <div class="row">
    <div class="col-md-1">
    </div>
    <div class="col-md-9">
      <form id="mod_frm" name="mod_frm" method="post" class="form-horizontal" role="form">

        <div class="form-group">
          <label class="col-sm-1 control-label" style="text-align:left">
            제목
          </label>
          <div class="col-sm-11">
            <input type="text" id="title" name="title" value="${board.title}" class="form-control"/>
          </div>
        </div>
        <br />

        <div class="form-group">
          <div class="col-sm-12">
            <textarea id="contents" name="contents" rows="20" class="form-control" style="width:100%">${board.contents}</textarea>
          </div>
        </div>

        <input type="hidden" id="board_id" name="board_id" value="${board.board_id}" />

        <div class="form-group">
          <div class="col-sm-2"></div>
          <div class="col-sm-10" align="right">
            <button type="button" id="mod_btn" class="btn btn-primary">수정</button>
            <button type="reset" onclick="history.back()" class="btn btn-default">취소</button>
          </div>
        </div>
      </form>
    </div>
    <div class="col-md-2">
    </div>
  </div>
</div>

<input type="hidden" id="department_id" value="${board.department_id}"/>

<jsp:include page="/bottom" flush="true"/>

</body>
</html>
