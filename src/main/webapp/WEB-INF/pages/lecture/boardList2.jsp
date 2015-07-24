<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>

<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="<c:url value="/resources/js/lecture.js" />"></script>

<title>헬로 월드</title></head>
<body>

	<table border="1">
		<tr>
			<td>글번호</td>
			<td>제목</td>
			<td>작성일</td>
			<td>조회수</td>
		</tr>
		<c:forEach var="board" items="${boards}" varStatus="status">
		<tr>
			<td>${board.rnum}</td>
			<td>
				<a href="/lecture/boardView?lb_id=${board.lb_id}&page=${current}">${board.title}
				<c:choose>
					<c:when test="${board.count == 0}">
					</c:when>
					<c:otherwise>
						[${board.count}]
					</c:otherwise>
				</c:choose>
				</a>
			</td>
			<td>${board.write_date}</td>
			<td>${board.hit}</td>
		</tr>
		</c:forEach>
	</table><br /><br />

<a href="/lecture/boardList/${lecture_id}/">전체목록</a>&nbsp;&nbsp;<a href="/lecture/boardRegForm?lecture_id=${lecture_id}">글작성</a><br/><br/>

현재 페이지 : <c:out value="${current}"/><br />

	<div class="paginate">

		<c:if test="${not empty boards}">

			<!-- 전체 페이지가 10페이지 이하면 맨처음로 이동 표시 안함-->

			<c:if test="${pageNum-10 <= 0}">

			</c:if>

			<!-- 전체 페이지가 10페이지 초과고 시작페이지가 1이 아니면 맨처음로 이동 표시 -->

			<c:if test="${pageNum-10 > 0 && start-1 !=0}">
				<a href="/lecture/boardList/${lecture_id}/?page=1" class="first">맨처음&nbsp;</a>
			</c:if>

			<!-- 시작페이지가 1부터면 이전 표시("<<") ​ 안함 -->

			<c:if test="${start-1 ==0 }">

			</c:if>

			<!-- 시작페이지가 1이 아니면 << 이전 표시.  링크는 시작페이지가 6부터 10까지일 경우 5페이지를 가르킴 -->​

			<c:if test="${start-1!=0 }">

				<a href="/lecture/boardList/${lecture_id}/?page=${start-1}" class="prev">&laquo;&nbsp;</a>

			</c:if>

			<!-- 현재 페이지가 1페이지면 이전페이지 표시("<") ​ 안함 -->

			<c:if test="${current == 1}">

			</c:if>

			<!-- 현재 페이지가 1페이지가 아니면 이전페이지 표시("<") ​ -->

			<c:if test="${current != 1}">

				<a href="/lecture/boardList/${lecture_id}/?page=${current-1}" class="prevPage">&lt;&nbsp;</a>

			</c:if>

			<!-- 10개씩 페이지 표시-->​
			<span>
				<c:forEach var="i" begin="${start}" end="${end}" step="1">
					<c:choose>
						<c:when test="${i eq current}">
							<a href="/lecture/boardList/${lecture_id}/?page=${i}" style="color:#00FF00">${i}&nbsp;</a>
						</c:when>
						<c:otherwise>
							<a href="/lecture/boardList/${lecture_id}/?page=${i}">${i}&nbsp;</a>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</span>

			<!-- 현재 페이지가 마지막페이지면 다음페이지 표시(">") ​ 안함 -->

			<c:if test="${current == pageNum}">

			</c:if>

			<!-- 현재 페이지가 마지막페이지가 아니면 아니면 다음페이지 표시(">") ​ -->

			<c:if test="${current != pageNum}">

				<a href="/lecture/boardList/${lecture_id}/?page=${current+1}" class="prevPage">&nbsp;&gt;</a>

			</c:if>

			<!-- 마지막 페이지 번호와 전체 페이지 번호가 같으면서 10개 단위가 아니면 다음바로가기 표시 않함 -->​​

			<c:if test="${end % 10 != 0 && end == pageNum }">

			</c:if>

			<!-- 마지막 페이지 번호가 10, 20 인데 전체 페이지 갯수가 end페이지 보다 크면 다음 페이징 바로가기 표시  (">>")​ .-->​

			<c:if test="${end % 10 == 0 && pageNum > end}">

				<a href="/lecture/boardList/${lecture_id}/?page=${end+1}" class="next">&nbsp;&raquo;</a>

			</c:if>

			<!-- 전체 페이지가 10페이지 이하면 맨뒤로 이동 표시 안함 -->

			<c:if test="${pageNum-10 <= 0}">

			</c:if>

			<!-- 전체 페이지가 10페이지 초과고 마지막 페이지 번호와 전체 페이지 번호가 같지 않으면 맨뒤 이동 표시 -->

			<c:if test="${pageNum-10 > 0 && end != pageNum}">

				<a href="/lecture/boardList/${lecture_id}/?page=${pageNum}" class="last">&nbsp;맨뒤</a>

			</c:if>

		</c:if>
	</div>
<br />

<form action="/lecture/boardList/${lecture_id}/" method="get" name="board_search_frm">

	<select name="searchType">
		<c:choose>
			<c:when test="${search.searchWord eq 'contents'}">
					<option value="title">제목</option>
					<option value="contents" selected="selected">내용</option>
					<option value="title_contents">제목+내용</option>
			</c:when>
			<c:when test="${search.searchWord eq 'title_contents'}">
					<option value="title">제목</option>
					<option value="contents">내용</option>
					<option value="title_contents" selected="selected">제목+내용</option>
			</c:when>
			<c:otherwise>
					<option value="title" selected="selected">제목</option>
					<option value="contents">내용</option>
					<option value="title_contents">제목+내용</option>
			</c:otherwise>
		</c:choose>
	</select>

	<input type="text" name="searchWord" value="${search.searchWord}">
	<input type="button" value="검색" onclick="boardSearchLecture()">

</form>


</body>
</html>