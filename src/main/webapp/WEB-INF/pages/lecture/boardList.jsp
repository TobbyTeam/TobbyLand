<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>

<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="<c:url value="/resources/js/lecture.js" />"></script>

<title>헬로 월드</title></head>
<body>


<jsp:include page="/top" flush="true"/>

<br /> <br />

<jsp:include page="/evaluation/lecture" flush="true"/>

<br />


<a href="/evaluation/list?lecture_id=${lecture_id}">강의평가</a>&nbsp;&nbsp;<a href="/lecture/boardList/${lecture_id}/1">강의게시판</a>

<br /><br />

	<table border="1">
		<tr>
			<td>제목</td>
			<td>작성일</td>
		</tr>
		<c:forEach var="board" items="${boards}" varStatus="status">
		<tr>
			<td><a href="/lecture/boardView?ls_id=${board.ls_id}">${board.title}</a></td>
			<td>${board.write_date}</td>
		</tr>
		</c:forEach>
	</table><br /><br />

	<a href="/lecture/boardRegForm?lecture_id=${lecture_id}">글작성</a><br/><br/>

<div class="col-xs-8">

	<c:if test="${not empty boards}">

	<ul class="pagination pagination-sm" style="margin-top:0px;">


		<li style="float: left"><a href="/lecture/boardList/${lecture_id}/1">처음&nbsp;</a></li>


		<!-- 시작페이지가 1부터면 이전 표시("<<") ​ 안함 -->

		<c:if test="${start-1 ==0 }">



		</c:if>

		<!-- 시작페이지가 1이 아니면 << 이전 표시.  링크는 시작페이지가 6부터 10까지일 경우 5페이지를 가르킴 -->​



		<c:if test="${start-1!=0 }">

			<li style="float: left"><a href="/lecture/boardList/${lecture_id}/${start-1}">&laquo;&nbsp;</a></li>

		</c:if>

		<!-- 5개씩 페이지 표시-->​



		<c:forEach var="i" begin="${start }" end="${end }">

			<li style="float: left" id="page${i }"><a href="/lecture/boardList/${lecture_id}/${i}">${i}&nbsp;</a> </li>

		</c:forEach>

		<!-- end페이지 번호가 5, 10 인데 전체 페이지 갯수가 end페이지 보다 크면 다음 페이징 바로가기 표시  (">>")​ .-->​



		<c:if test="${end % 5 == 0 && pageNum > end}">

			<li style="float: left"><a href="/lecture/boardList/${lecture_id}/${end+1}">&nbsp;&raquo;</a></li>

		</c:if>

		<!-- 마지막 페이지 번호와 전체 페이지 번호가 같으면서 5개 단위가 아니면 다음바로가기 표시 않함 -->​​



		<c:if test="${end % 5 != 0 && end == pageNum }">



		</c:if>

		<li style="float: left"><a href="/lecture/boardList/${lecture_id}/${finalEnd}">&nbsp;마지막</a></li>

	</ul>

	</c:if>

</div>

</body>
</html>